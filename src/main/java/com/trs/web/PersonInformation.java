package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.TaskDao;
import com.trs.dao.UserDao;
import com.trs.model.Task;
import com.trs.model.User;
import com.trs.util.DbUtil;
import com.trs.util.StringUtil;

public class PersonInformation extends HttpServlet {

    DbUtil dbUtil = new DbUtil();
    UserDao userDao = new UserDao();

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws javax.servlet.ServletException
     *             if an error occurred
     * @throws java.io.IOException
     *             if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to
     * post.
     *
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws javax.servlet.ServletException
     *             if an error occurred
     * @throws java.io.IOException
     *             if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");

        if (method.equals("userInfo")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            String userSex = request.getParameter("userSex");
            String userLocation = request.getParameter("userLocation");
            String userTel = request.getParameter("userTel");
            String userQQ = request.getParameter("userQQ");

            // 保值值不丢失

            request.setAttribute("userId", user.getUserId());
            request.setAttribute("userName", user.getUserName());
            request.setAttribute("userRealName", user.getUserRealName());
            request.setAttribute("userLocation", userLocation);
            request.setAttribute("userSex", userSex);
            request.setAttribute("userTel", userTel);
            request.setAttribute("userQQ", userQQ);

            // 设置当前账户

            user.setUserSex(userSex);
            user.setUserLocation(userLocation);
            user.setUserTel(userTel);
            user.setUserQQ(userQQ);

            //qq号码不能为空 
            if(userQQ.equals(""))
            {
                request.setAttribute("result", "qq号不能为空！");
                request.getRequestDispatcher("personPage.jsp").forward(request, response);
            }

            else {
                // 数据库更新
                Connection con = null;
                try {
                    con = dbUtil.getCon();
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                int res;
                try {
                    res = userDao.updataUser(con, user);
                    if (res == 1) {
                        request.setAttribute("result", "修改信息成功！");
                        request.getRequestDispatcher("personPage.jsp").forward(
                                request, response);
                    } else
                        request.setAttribute("result", "修改失败！");
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

        else if (method.equals("passSet")) {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            String userId = user.getUserId();
            String pass = request.getParameter("password1");

            Connection con = null;
            try {
                con = dbUtil.getCon();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            try {
                int res = userDao.updatePassword(con, userId, pass);
                System.out.println(res);
                if (res == 1) {
                    request.setAttribute("result", "修改密码成功！");
                    request.getRequestDispatcher("personMain.jsp").forward(
                            request, response);
                }

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

        else if (method.equals("mytask")) {

            int page = 1;
            if (request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            TaskDao taskDao = new TaskDao();

            // 定义8个因为每页显示8个
            Task[] task = new Task[8];
            // 构造函数初始化
            for (int t = 0; t < 8; t++) {
                task[t] = new Task();
            }

            try {
                HttpSession session = request.getSession();
                User currentUser = (User) session.getAttribute("currentUser");

                ResultSet rs = taskDao.getTaskByUser(currentUser.getUserId(),
                        page);

                int resultNum = taskDao
                        .getPersonCount(currentUser.getUserId());

                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                int i = 0;

                while (rs.next()) {
                    task[i].setTaskId(rs.getInt("taskId"));
                    task[i].setTaskName(rs.getString("taskName"));
                    task[i].setTaskDiscount(rs.getInt("taskDiscount"));
                    task[i].setTaskPrice(rs.getDouble("taskPrice"));
                    task[i].setOwnerId(rs.getString("ownerId"));
                    task[i].setIsRent(rs.getInt("isRent"));
                    task[i].setTaskNew(rs.getFloat("taskNew"));
                    task[i].setTaskDesc(rs.getString("taskDesc"));
                    task[i].setTaskStatue(rs.getInt("taskStatue"));
                    task[i].setTaskDate(rs.getDate("taskDate"));
                    task[i].setTaskTypeId(rs.getInt("taskTypeId"));
                    task[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                    task[i].setTaskImag(rs.getString("taskImag"));
                    i++;
                }

                // 将当前页数页加入session中在jsp访问

                session.setAttribute("searchNum", i);
                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("myTask.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //获取我关注的商品
        else if (method.equals("myattention")) {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            int page = 1;
            if (request.getParameter("page") != null)
                page = Integer.parseInt(request.getParameter("page"));
            TaskDao taskDao = new TaskDao();

            // 定义为8个因为每页显示8个
            Task[] task = new Task[8];
            // 构造函数初始化
            for (int t = 0; t < 8; t++) {
                task[t] = new Task();
            }

            try {
                String userId = user.getUserId();
                ResultSet rs = taskDao.getAttention(userId, page);
                int resultNum = taskDao.getAttentionCount(userId);
                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                int i = 0;

                while (rs.next()) {
                    task[i].setTaskId(rs.getInt("taskId"));
                    task[i].setTaskName(rs.getString("taskName"));
                    task[i].setTaskDiscount(rs.getInt("taskDiscount"));
                    task[i].setTaskPrice(rs.getDouble("taskPrice"));
                    task[i].setOwnerId(rs.getString("ownerId"));
                    task[i].setIsRent(rs.getInt("isRent"));
                    task[i].setTaskNew(rs.getFloat("taskNew"));
                    task[i].setTaskDesc(rs.getString("taskDesc"));
                    task[i].setTaskStatue(rs.getInt("taskStatue"));
                    task[i].setTaskDate(rs.getDate("taskDate"));
                    task[i].setTaskTypeId(rs.getInt("taskTypeId"));
                    task[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                    task[i].setTaskImag(rs.getString("taskImag"));
                    i++;
                }

                // 将当前页数页加入session中在jsp访问

                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("myAttention.jsp").forward(
                        request, response);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        else if (method.equals("laydown")) {
            try {
                int taskId = Integer.parseInt(request.getParameter("taskId"));
                TaskDao taskDao = new TaskDao();
                taskDao.closeExchange(taskId);

                response.sendRedirect("MytaskInformation.jsp?task=" + taskId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }



        // 获取关注的商品,最多只获取4个
        else if (method.equals("getAtt")) {
            try {
                HttpSession session = request.getSession();
                TaskDao taskDao = new TaskDao();
                User user = (User) session.getAttribute("currentUser");
                if(user == null)
                {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert(\"您还未登录无法执行相应操作!\")</script>");
                    out.print("<script>window.location.href=\"login.jsp\";</script>");
                }
                Task[] task = new Task[4];
                // 构造函数初始化
                for (int t = 0; t < 4; t++) {
                    task[t] = new Task();
                }
                ResultSet rs = taskDao.getAttention(user.getUserId(), 1);
                int i = 0;
                while (rs.next()) {
                    task[i].setTaskId(rs.getInt("taskId"));
                    task[i].setTaskName(rs.getString("taskName"));
                    task[i].setTaskDiscount(rs.getInt("taskDiscount"));
                    task[i].setTaskPrice(rs.getDouble("taskPrice"));
                    task[i].setOwnerId(rs.getString("ownerId"));
                    task[i].setIsRent(rs.getInt("isRent"));
                    task[i].setTaskNew(rs.getFloat("taskNew"));
                    task[i].setTaskDesc(rs.getString("taskDesc"));
                    task[i].setTaskStatue(rs.getInt("taskStatue"));
                    task[i].setTaskDate(rs.getDate("taskDate"));
                    task[i].setTaskTypeId(rs.getInt("taskTypeId"));
                    task[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                    task[i].setTaskImag(rs.getString("taskImag"));
                    i++;
                }

                // 将当前页数页加入session中在jsp访问
                session.setAttribute("taskResult", task);
                //number判断是不是连4个关注的都没有
                session.setAttribute("number", i);
                request.getRequestDispatcher("personPage.jsp").forward(
                        request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        //获取最多4个的商品，以及最多8个的我发布的商品，相当于上面两个方法的结合,用于个人中心登录获取数据
        else if(method.equals("gotoPerson"))
        {
            try{

                //获取最多4个关注的商品
                HttpSession session = request.getSession();
                TaskDao taskDao = new TaskDao();
                User user = (User) session.getAttribute("currentUser");
                if(user == null)
                {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert(\"您还未登录无法执行相应操作!\")</script>");
                    out.print("<script>window.location.href=\"login.jsp\";</script>");
                }
                Task[] task = new Task[4];
                // 构造函数初始化
                for (int t = 0; t < 4; t++) {
                    task[t] = new Task();
                }
                ResultSet rs = taskDao.getAttention(user.getUserId(), 1);
                int i = 0;
                while (rs.next() && i<4) {
                    task[i].setTaskId(rs.getInt("taskId"));
                    task[i].setTaskName(rs.getString("taskName"));
                    task[i].setTaskDiscount(rs.getInt("taskDiscount"));
                    task[i].setTaskPrice(rs.getDouble("taskPrice"));
                    task[i].setOwnerId(rs.getString("ownerId"));
                    task[i].setIsRent(rs.getInt("isRent"));
                    task[i].setTaskNew(rs.getFloat("taskNew"));
                    task[i].setTaskDesc(rs.getString("taskDesc"));
                    task[i].setTaskStatue(rs.getInt("taskStatue"));
                    task[i].setTaskDate(rs.getDate("taskDate"));
                    task[i].setTaskTypeId(rs.getInt("taskTypeId"));
                    task[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                    task[i].setTaskImag(rs.getString("taskImag"));
                    i++;
                }


                // 将当前页数页加入session中在jsp访问
                session.setAttribute("taskResult", task);
                //number判断是不是连4个关注的都没有
                session.setAttribute("number", i);


                int page = 1;
                if (request.getParameter("page") != null)
                    page = Integer.parseInt(request.getParameter("page"));
                taskDao = new TaskDao();

                // 定义为8个因为每页显示8个
                Task[] myTask = new Task[8];
                // 构造函数初始化
                for (int t = 0; t < 8; t++) {
                    myTask[t] = new Task();
                }


                //获取我的商品
                User currentUser = (User) session.getAttribute("currentUser");
                rs = taskDao.getTaskByUser(currentUser.getUserId(),page);
                int resultNum = taskDao.getPersonCount(currentUser.getUserId());
                int pageNumber = 0;
                if (resultNum / 8 == 0)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;
                i = 0;
                while (rs.next()) {
                    myTask[i].setTaskId(rs.getInt("taskId"));
                    myTask[i].setTaskName(rs.getString("taskName"));
                    myTask[i].setTaskDiscount(rs.getInt("taskDiscount"));
                    myTask[i].setTaskPrice(rs.getDouble("taskPrice"));
                    myTask[i].setOwnerId(rs.getString("ownerId"));
                    myTask[i].setIsRent(rs.getInt("isRent"));
                    myTask[i].setTaskNew(rs.getFloat("taskNew"));
                    myTask[i].setTaskDesc(rs.getString("taskDesc"));
                    myTask[i].setTaskStatue(rs.getInt("taskStatue"));
                    myTask[i].setTaskDate(rs.getDate("taskDate"));
                    myTask[i].setTaskTypeId(rs.getInt("taskTypeId"));
                    myTask[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                    myTask[i].setTaskImag(rs.getString("taskImag"));
                    i++;
                }

                // 将当前页数页加入session中在jsp访问
                session.setAttribute("page", page);
                session.setAttribute("myNumber", i);
                session.setAttribute("myTask", myTask);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("personPage.jsp").forward(
                        request, response);
            }catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }

}
