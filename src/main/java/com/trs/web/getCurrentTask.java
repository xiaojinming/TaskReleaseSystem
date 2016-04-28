package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.acl.Owner;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.*;
import com.trs.model.*;

public class getCurrentTask extends HttpServlet {

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

        HttpSession session = request.getSession();
        // 两张图片
        String index1 = null;
        String index2 = null;
        User owner = new User();
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        TaskDao taskDao = new TaskDao();
        Task task = new Task();
        ResultSet rs = null;

        String method = request.getParameter("method");

        try {
            rs = taskDao.getTaskById(taskId);
            if (rs.next()) {
                task.setTaskId(rs.getInt("taskId"));
                task.setTaskName(rs.getString("taskName"));
                task.setTaskDiscount(rs.getInt("taskDiscount"));
                task.setTaskPrice(rs.getDouble("taskPrice"));
                task.setOwnerId(rs.getString("ownerId"));
                task.setIsRent(rs.getInt("isRent"));
                task.setTaskNew(rs.getFloat("taskNew"));
                task.setTaskDesc(rs.getString("taskDesc"));
                task.setTaskStatue(rs.getInt("taskStatue"));
                task.setTaskDate(rs.getDate("taskDate"));
                task.setTaskTypeId(rs.getInt("taskTypeId"));
                task.setTaskTypeId2(rs.getInt("taskTypeId2"));
                task.setTaskImag(rs.getString("taskImag"));
            }

            // 获取另外两张图片
            rs = taskDao.getImag(taskId);
            if (rs.next()) {
                index1 = rs.getString("firstIndex");
                index2 = rs.getString("secondIndex");
            }

            // 获取卖家真实昵称以及真实姓名
            String ownerId = task.getOwnerId();
            UserDao userDao = new UserDao();
            rs = userDao.getOwner(ownerId);

            if (rs.next()) {
                owner.setUserName(rs.getString("userName"));
                owner.setUserRealName(rs.getString("userRealName"));
                owner.setUserTel(rs.getString("userTel"));
                owner.setUserLocation(rs.getString("userLocation"));
                owner.setUserQQ(rs.getString("userQQ"));
            }

            PrintWriter out = response.getWriter();

            out.print(task.getTaskName() + "$");
            out.flush();
            out.print(task.getTaskImag() + "$");
            out.flush();
            out.print(index1 + "$");
            out.flush();
            out.print(index2 + "$");
            out.flush();
            out.print(task.getTaskDesc() + "$");
            out.flush();
            out.print(task.getTaskPrice() + "$");
            out.flush();
            out.print(task.getTaskDiscount() + "$");
            out.flush();
            out.print(task.getIsRent() + "$");
            out.flush();
            out.print(task.getTaskNew() + "$");
            out.flush();
            out.print(task.getTaskDate() + "$");
            out.flush();

            // 打印联系权限
            out.print(owner.getUserName() + "$");
            out.flush();
            out.print(owner.getUserRealName() + "$");
            out.flush();
            out.print(owner.getUserTel() + "$");
            out.flush();
            out.print(owner.getUserLocation() + "$");
            out.flush();
            out.print(owner.getUserQQ() + "$");
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
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
