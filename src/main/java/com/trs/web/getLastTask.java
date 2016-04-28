package com.trs.web;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.model.*;
import com.trs.dao.*;

public class getLastTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
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
        /**
         * //最新的电子产品 Task[] lastTech =
         * (Task[])request.getAttribute("lastTech"); //书籍 Task[] lastBook =
         * (Task[])request.getAttribute("lastBook"); //运动 Task[] lastSpor =
         * (Task[])request.getAttribute("lastSpor"); //家电 Task[] lastElec =
         * (Task[])request.getAttribute("lastElec"); }
         */

        TaskDao taskDao = new TaskDao();

        // 定义为9个因为每页显示9个
        Task[] lastTech = new Task[8];
        // 构造函数初始化
        for (int t = 0; t < 8; t++)
            lastTech[t] = new Task();


        try {

            // 获取电子产品
            ResultSet rs = taskDao.getTaskLast();
            int i = 0;
            while (rs.next() && i<=9) {
                lastTech[i].setTaskId(rs.getInt("taskId"));
                lastTech[i].setTaskName(rs.getString("taskName"));
                lastTech[i].setTaskDiscount(rs.getInt("taskDiscount"));
                lastTech[i].setTaskPrice(rs.getDouble("taskPrice"));
                lastTech[i].setOwnerId(rs.getString("ownerId"));
                lastTech[i].setIsRent(rs.getInt("isRent"));
                lastTech[i].setTaskNew(rs.getFloat("taskNew"));
                lastTech[i].setTaskDesc(rs.getString("taskDesc"));
                lastTech[i].setTaskStatue(rs.getInt("taskStatue"));
                lastTech[i].setTaskDate(rs.getDate("taskDate"));
                lastTech[i].setTaskTypeId(rs.getInt("taskTypeId"));
                lastTech[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
                lastTech[i].setTaskImag(rs.getString("taskImag"));
                i++;
            }



			// 获取图书
//			i = 0;
//			rs = taskDao.getTaskLast(2);
//			while (rs.next() && i<=9) {
//				lastBook[i].setTaskId(rs.getInt("taskId"));
//				lastBook[i].setTaskName(rs.getString("taskName"));
//				lastBook[i].setTaskDiscount(rs.getInt("taskDiscount"));
//				lastBook[i].setTaskPrice(rs.getDouble("taskPrice"));
//				lastBook[i].setOwnerId(rs.getString("ownerId"));
//				lastBook[i].setIsRent(rs.getInt("isRent"));
//				lastBook[i].setTaskNew(rs.getFloat("taskNew"));
//				lastBook[i].setTaskDesc(rs.getString("taskDesc"));
//				lastBook[i].setTaskStatue(rs.getInt("taskStatue"));
//				lastBook[i].setTaskDate(rs.getDate("taskDate"));
//				lastBook[i].setTaskTypeId(rs.getInt("taskTypeId"));
//				lastBook[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
//				lastBook[i].setTaskImag(rs.getString("taskImag"));
//			}
//
//			// 获取运动
//			i = 0;
//			rs = taskDao.getTaskLast(3);
//			while (rs.next() && i<=9) {
//				lastSpor[i].setTaskId(rs.getInt("taskId"));
//				lastSpor[i].setTaskName(rs.getString("taskName"));
//				lastSpor[i].setTaskDiscount(rs.getInt("taskDiscount"));
//				lastSpor[i].setTaskPrice(rs.getDouble("taskPrice"));
//				lastSpor[i].setOwnerId(rs.getString("ownerId"));
//				lastSpor[i].setIsRent(rs.getInt("isRent"));
//				lastSpor[i].setTaskNew(rs.getFloat("taskNew"));
//				lastSpor[i].setTaskDesc(rs.getString("taskDesc"));
//				lastSpor[i].setTaskStatue(rs.getInt("taskStatue"));
//				lastSpor[i].setTaskDate(rs.getDate("taskDate"));
//				lastSpor[i].setTaskTypeId(rs.getInt("taskTypeId"));
//				lastSpor[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
//				lastSpor[i].setTaskImag(rs.getString("taskImag"));
//			}
//
//			// 获取家电
//			i = 0;
//			rs = taskDao.getTaskLast(4);
//			while (rs.next() && i<=9 ) {
//				lastElec[i].setTaskId(rs.getInt("taskId"));
//				lastElec[i].setTaskName(rs.getString("taskName"));
//				lastElec[i].setTaskDiscount(rs.getInt("taskDiscount"));
//				lastElec[i].setTaskPrice(rs.getDouble("taskPrice"));
//				lastElec[i].setOwnerId(rs.getString("ownerId"));
//				lastElec[i].setIsRent(rs.getInt("isRent"));
//				lastElec[i].setTaskNew(rs.getFloat("taskNew"));
//				lastElec[i].setTaskDesc(rs.getString("taskDesc"));
//				lastElec[i].setTaskStatue(rs.getInt("taskStatue"));
//				lastElec[i].setTaskDate(rs.getDate("taskDate"));
//				lastElec[i].setTaskTypeId(rs.getInt("taskTypeId"));
//				lastElec[i].setTaskTypeId2(rs.getInt("taskTypeId2"));
//				lastElec[i].setTaskImag(rs.getString("taskImag"));
//			}

            request.setAttribute("lastTech", lastTech);
//			request.setAttribute("lastBook", lastBook);
//			request.setAttribute("lastSpor", lastSpor);
//			request.setAttribute("lastElec", lastElec);
//
            HttpSession session = request.getSession();
            session.setAttribute("currentTask", lastTech[0]);

            request.getRequestDispatcher("main.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
