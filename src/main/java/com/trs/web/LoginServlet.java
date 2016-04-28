package com.trs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trs.dao.UserDao;
import com.trs.model.User;
import com.trs.util.DbUtil;
import com.trs.util.StringUtil;

public class LoginServlet extends HttpServlet {


    DbUtil dbUtil = new DbUtil();
    UserDao userDao  = new UserDao();

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

        HttpSession session = request.getSession();

        String realvail = (String)session.getAttribute("RANDOMVALIDATECODEKEY");
        String vail = request.getParameter("code");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        //帐号密码输入后必须让值保存
        request.setAttribute("userId", userId);
        request.setAttribute("password", password);
        request.setAttribute("code", vail);

        if(!realvail.equalsIgnoreCase(vail))
        {
            request.setAttribute("error", "验证码错误，请重新输入！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return ;
        }


        if(StringUtil.isEmpty(userId)||StringUtil.isEmpty(password))
        {
            request.setAttribute("error","用户名或密码为空！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = new User(userId,password);
        Connection con=null;


        try {
            con=dbUtil.getCon();
            User currentUser=userDao.login(con, user);
            if(currentUser==null){
                request.setAttribute("error", "用户名或密码错误！");
                // 服务器跳转
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                // 获取Session
                session.setAttribute("currentUser", currentUser);
                // 客户端跳转
                //		response.sendRedirect("main.jsp"); 想想还是用服务器跳转好
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            try {
                dbUtil.closeCon(con);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

    //test
    public static void main(String[] args) throws Exception{
        DbUtil dbUtil = new DbUtil();
        UserDao userDao  = new UserDao();
        Connection con;
        User user = new User("a123456","123456");
        con = dbUtil.getCon();
        User currentUser=userDao.login(con, user);
        if(currentUser==null){
            System.out.println("用户名或密码错误！");
            // 服务器跳转
        }else{
            // 获取Session
            System.out.println("获取成功！");
        }
    }
}
