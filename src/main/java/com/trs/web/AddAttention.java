package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.TaskDao;
import com.trs.dao.UserDao;
import com.trs.model.Task;
import com.trs.model.User;

public class AddAttention extends HttpServlet {
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
     *
     *
     *
     *             和 getCurrentTask 基本差不多
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        int taskId = 0;
        if(request.getParameter("taskId")!=null)
            taskId = Integer.parseInt(request.getParameter("taskId"));


        TaskDao taskDao = new TaskDao();
        String method = request.getParameter("method");

        //添加关注
        if(method.equals("add"))
        {
            try {
                //先检查是否已经关注过了
                PrintWriter out = response.getWriter();
                boolean flag = taskDao.isAttention(user.getUserId(), taskId);
                out.flush();
                if(!flag){
                    taskDao.Addattention(user.getUserId(), taskId);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }}

        //删除关注
        else if(method.equals("delete"))
        {
            try{
                taskDao.deleteAttention(user.getUserId(), taskId);
                int page = 1;
                if (request.getParameter("page") != null)
                    page = Integer.parseInt(request.getParameter("page"));
                // 定义为9个因为每页显示8个
                Task[] task = new Task[8];
                // 构造函数初始化
                for (int t = 0; t < 8; t++) {
                    task[t] = new Task();
                }

                ResultSet rs = taskDao.getAttention(user.getUserId(), page);
                int resultNum = taskDao.getAttentionCount(user.getUserId());
                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0 || resultNum == 8)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                int i = 0;
                while (rs.next())
                {
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
                session.setAttribute("attentionNum", i);
                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("myAttention.jsp").forward(request, response);


            }catch(Exception e)
            {
                e.printStackTrace();
            }
        }

        //获取关注
        else if(method.equals("getAtt"))
        {

            try{
                int page = 1;
                if (request.getParameter("page") != null)
                    page = Integer.parseInt(request.getParameter("page"));
                // 定义为8个因为每页显示8个
                Task[] task = new Task[8];
                // 构造函数初始化
                for (int t = 0; t < 8; t++) {
                    task[t] = new Task();
                }

                ResultSet rs = taskDao.getAttention(user.getUserId(), page);
                int resultNum = taskDao.getAttentionCount(user.getUserId());
                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0 || resultNum == 8)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                int i = 0;
                while (rs.next())
                {
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

                session.setAttribute("attentionNum", i);
                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("myAttention.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

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

        this.doGet(request, response);
    }

}
