package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.UserDao;
import com.trs.model.User;
import com.trs.util.DbUtil;
import com.trs.util.StringUtil;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    DbUtil dbUtil = new DbUtil();
    UserDao userDao = new UserDao();

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

        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userSex = request.getParameter("userSex");
        String userPassword = request.getParameter("userPassword");
        String userNumber = request.getParameter("userNumber");
        String userIdentity = request.getParameter("userIdentity");
        String userRealName = request.getParameter("userRealName");
        String userLocation = request.getParameter("userLocation");
        String userTel = request.getParameter("userTel");
        String userEmail = request.getParameter("userEmail");
        String userQQ = request.getParameter("userQQ");
        String vaildata = request.getParameter("code");
        String realdata = (String) session
                .getAttribute("RANDOMVALIDATECODEKEY");

        request.setAttribute("userId", userId);
        request.setAttribute("userName", userName);
        request.setAttribute("userPassword", userPassword);
        request.setAttribute("userNumber", userNumber);
        request.setAttribute("userIdentity", userIdentity);
        request.setAttribute("userRealName", userRealName);
        request.setAttribute("userLocation", userLocation);
        request.setAttribute("userSex", userSex);
        request.setAttribute("userTel", userTel);
        request.setAttribute("userEmail", userEmail);
        request.setAttribute("userQQ", userQQ);
        request.setAttribute("code", vaildata);
        boolean result = true; // 判断最后是否可以写入

        // 先判断验证码

        if (!realdata.equalsIgnoreCase(vaildata)) {
            result = false;
            request.setAttribute("errorVail", "验证码输入错误，请重新输入！");
        }

        Connection con = null;
        try {
            con = dbUtil.getCon();
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        User user = new User(userId, userName, userPassword, userNumber,
                userIdentity, userRealName, userLocation, userSex, userTel,
                userEmail, userQQ);
        // 数据库的检查结果
        ArrayList flag = null;
        try {
            flag = userDao.registerCheck(con, user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // 数据库判断
        for (int i = 0; i < flag.size(); i++) {
            switch ((Integer) flag.get(i)) {
                case 1:
                    // 判断是否存在的用户名
                    request.setAttribute("errorId", "用户名已存在,请重新输入！");
                    result = false;
                    break;

                case 2:
                    // 判断是否存在昵称
                    request.setAttribute("errorName", "昵称已存在,请重新输入！");
                    result = false;
                    break;

                case 3:
                    // 判断是否注册过的学号
                    request.setAttribute("errorNumber", "该学号已注册过,请重新输入！");
                    result = false;
                    break;

                case 4:
                    // 判断邮箱是否注册过
                    request.setAttribute("errorEmail", "该邮箱已被注册过,请重新输入！");
                    result = false;
                    break;

                case 5:
                    // 判断是否为本校学生
                    request.setAttribute("errorIdentity",
                            "未检测到该学生，请核对学号以及身份证,请重新输入！");
                    result = false;
                    break;
                default:
            }
        }

        if (result) {
            try {
                int res = userDao.register(con, user);
                System.out.println(res);

                session.setAttribute("currentUser", user);
                request.getRequestDispatcher("main.jsp").forward(request,
                        response);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("register.jsp").forward(request,
                    response);
        }

        try {
            dbUtil.closeCon(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
