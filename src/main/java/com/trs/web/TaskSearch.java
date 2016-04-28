package com.trs.web;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.TaskDao;
import com.trs.model.Task;

public class TaskSearch extends HttpServlet {

   // private TaskDao taskDao = new TaskDao();

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
        HttpSession session = request.getSession();
        String method = request.getParameter("method");
        int page = 1;
        if (request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        TaskDao taskDao = new TaskDao();

        // 定义为9个因为每页显示8个
        Task[] task = new Task[8];
        // 构造函数初始化
        for (int t = 0; t < 8; t++) {
            task[t] = new Task();
        }

        /**
         * 各种商品查询 simple 简单查询 type 根据一个类型查询 type2 根据两个类型
         */

        // 简单查询方法即只根据商品名查询
        if (method.equals("simple")) {
            try {
                String taskName = null;
                taskName = request.getParameter("taskName");
                session.setAttribute("taskName", taskName);

                request.setAttribute("taskName", taskName);
                ResultSet rs = taskDao.getTaskByName(taskName, page);
                int resultNum = taskDao.getCount(taskName);
                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0 || resultNum == 8 )
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
                session.setAttribute("taskName", taskName);
                session.setAttribute("method", "simple");
                request.getRequestDispatcher("searchResult.jsp").forward(
                        request, response);
            } catch (Exception e) {

                e.printStackTrace();
            }

        }

        // 根据单一类型查询
        else if (method.equals("type")) {
            try {


                int type = Integer.parseInt(request.getParameter("type"));
                int resultNum = taskDao.getCount(type);

                //标记类型
                request.setAttribute("type", type);

                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0 || resultNum == 8)
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                ResultSet rs = taskDao.getTaskByType(type, page);
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
                session.setAttribute("method", "type");
                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("searchResult.jsp").forward(
                        request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 根据多类型查询
        else if (method.equals("type2")) {
            try {
                int type = Integer.parseInt(request.getParameter("type"));
                int type2 = Integer.parseInt(request.getParameter("type2"));

                //标记类型
                request.setAttribute("type", type);
                request.setAttribute("type2", type2);


                int resultNum = taskDao.getCount(type, type2);

                // 每页显示8个 计算总共能有多少页
                int pageNumber = 0;
                if (resultNum / 8 == 0 || resultNum == 8 )
                    pageNumber = 1;
                else
                    pageNumber = resultNum / 8 + 1;

                ResultSet rs = taskDao.getTaskByType(type, type2, page);
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
                session.setAttribute("method", "type2");
                session.setAttribute("page", page);
                session.setAttribute("taskResult", task);
                session.setAttribute("pageNumber", pageNumber);
                request.getRequestDispatcher("searchResult.jsp").forward(
                        request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
