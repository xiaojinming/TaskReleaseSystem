package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.UserDao;
import com.trs.util.DbUtil;
import com.trs.util.MD5Util;
import com.trs.util.SendMail;

public class findPassServlet extends HttpServlet {

    private DbUtil dbUtil = new DbUtil();
    private UserDao userDao = new UserDao();
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

        this.doGet(request, response);
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

        //分割处理
        String method = request.getParameter("method");

        if(method.equals("find")){
            String userId = request.getParameter("userId");
            String userEmail = request.getParameter("userEmail");

            Connection con = null;
            try {
                con = dbUtil.getCon();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            boolean flag = false;
            try {
                flag = userDao.judgeUserEamil(userId, userEmail);
            } catch (Exception e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }

            if(flag){
                long currentTime = System.currentTimeMillis() + 120000;
                Date time = new Date(currentTime);
                Timestamp ts = new Timestamp(time.getTime());
                Random random = new Random();
                String key = userId + "|" + ts + "|" + random.nextInt();
                String signature = MD5Util.MD5(key);

                try {
                    int res = userDao.insertInfor(con, userId, userEmail, ts, signature);
                    if(res==1)
                    {
                        SendMail sendmail = new SendMail();
                        String url = "localhost:8080/HomeSeller/resetPassword.jsp"+"?uid=" + userId + "&amp;validkey=" + signature;
                        sendmail.send(userEmail, url);
                        response.sendRedirect("pleaseLoginEmail.jsp");
                    }
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (AddressException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (MessagingException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            else
            {
                request.setAttribute("error", "用户名和邮箱不匹配，请重新输入！");
                request.getRequestDispatcher("findPassword.jsp").forward(request, response);
            }
        }



        //重置密码
        else if (method.equals("reset")){

            String userId = request.getParameter("userid");
            String password = request.getParameter("password1");
            try {
                HttpSession session = request.getSession();
                Connection con = dbUtil.getCon();
                userDao.updatePassword(con, userId,password);
                request.setAttribute("error", "修改成功，请重新登录！");
                session.removeAttribute("currentUser");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }



        }

    }

}
