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
import com.trs.model.Task;
import com.trs.model.User;

public class ResetTask extends HttpServlet {

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws javax.servlet.ServletException if an error occurred
     * @throws java.io.IOException if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws javax.servlet.ServletException if an error occurred
     * @throws java.io.IOException if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TaskDao taskDao = new TaskDao();

        String method = request.getParameter("method");
        if(method.equals("getinfo"))
        {
            try{
                String id = request.getParameter("taskId");
                int taskId = Integer.parseInt(id);
                ResultSet rs = taskDao.getTaskById(taskId);
                if(rs.next())
                {
                    request.setAttribute("taskId", taskId);
                    request.setAttribute("taskName", rs.getString("taskName"));
                    request.setAttribute("taskPrice", rs.getDouble("taskPrice"));
                    request.setAttribute("taskDiscount",rs.getInt("taskDiscount"));
                    request.setAttribute("taskNew", rs.getFloat("taskNew"));
                    request.setAttribute("taskTypeId", rs.getInt("taskTypeId"));
                    request.setAttribute("taskTypeId2", rs.getInt("taskTypeId2"));
                    request.setAttribute("isRent", rs.getInt("isRent"));
                    request.setAttribute("taskDesc", rs.getString("taskDesc"));
                }
                request.getRequestDispatcher("resetTask.jsp").forward(request, response);
            }catch(Exception e)
            {
                e.printStackTrace();
            }
        }

        else if(method.equals("resetInfo"))
        {
            try{
                HttpSession session = request.getSession();
                User currentUser = (User)session.getAttribute("currentUser");
                int taskId = Integer.parseInt(request.getParameter("taskId"));
                String taskName  = request.getParameter("taskName");
                String ownerId = currentUser.getUserId();
                int taskDiscount = Integer.parseInt(request.getParameter("radiovalue"));
                double taskPrice = Double.parseDouble(request.getParameter("taskPrice"));

                //获取是否租借
                int isRent = Integer.parseInt(request.getParameter("radiovalue2"));

                float taskNew = Float.parseFloat(request.getParameter("taskNew"));
                String taskDesc = request.getParameter("taskDesc");
                //状态1 表示在架
                int taskStatue = 1;
                //当前时间
                java.sql.Date taskDate = new java.sql.Date(System.currentTimeMillis());
                int taskTypeId = Integer.parseInt(request.getParameter("taskType"));
                int taskTypeId2 = Integer.parseInt(request.getParameter("taskType2"));

                //获取图片一
                ResultSet rs = taskDao.getTaskById(taskId);
                rs.next();
                String img1 = rs.getString("taskImag");


                Task task = new Task( taskId,  taskDiscount,  taskName,
                        taskPrice,  ownerId,  isRent,  taskNew,
                        taskDesc,  taskStatue,  taskDate,
                        taskTypeId,  taskTypeId2);

                task.setTaskImag(img1);

                boolean res;
                res = taskDao.changeTask(task);
                if(res){

                    //获取另外两张图的链接
                    rs = taskDao.getImag(taskId);
                    rs.next();
                    String index1 = rs.getString("firstIndex");
                    String index2 = rs.getString("secondIndex");

                    HttpSession sessionTask =  request.getSession();
                    sessionTask.setAttribute("index1", index1);
                    sessionTask.setAttribute("index2", index2);
                    sessionTask.setAttribute("currentTask", task);
                    request.getRequestDispatcher("resetPicture.jsp").forward(request, response);
                }
            }catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}
