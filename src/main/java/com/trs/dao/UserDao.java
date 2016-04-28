package com.trs.dao;
import com.trs.model.User;
import com.trs.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    //返回登录成功的用户
    public User login(Connection con,User user) throws Exception{
        User resultUser=null;
        String sql="select * from user where userId=? and userPassword=?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserId());
        pstmt.setString(2, user.getUserPassword());
        System.out.println(sql);

        ResultSet rs=pstmt.executeQuery();
        System.out.println(sql);
        if(rs.next()){
            resultUser=new User();
            resultUser.setUserId(rs.getString("userId"));
            resultUser.setUserName(rs.getString("userName"));
            resultUser.setUserPassword(rs.getString("userPassword"));
            resultUser.setUserNumber(rs.getString("userNumber"));
            resultUser.setUserIdentity(rs.getString("userIdentity"));
            resultUser.setUserRealName(rs.getString("userRealName"));
            resultUser.setUserLocation(rs.getString("userLocation"));
            resultUser.setUserSex(rs.getString("userSex"));
            resultUser.setUserEmail(rs.getString("userEmail"));
            resultUser.setUserTel(rs.getString("userTel"));
            resultUser.setUserQQ(rs.getString("userQQ"));
        }
        rs.close();
        pstmt.close();
        return resultUser;
    }

    //判断帐号邮箱是否匹配
    public boolean judgeUserEamil(String userId,String email) throws Exception
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getCon();

        String sql = "select * from user where userId = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
        {
            String userEmail  = rs.getString("userEmail");
            if(email.equals(userEmail)){
                pstmt.close();
                rs.close();
                return true;
            }
        }
        pstmt.close();
        rs.close();
        return false;
    }


    //获取当前用户具体信息
    public User getUser(Connection con,User user) throws Exception{
        User resultUser=null;
        String sql="select * from user where userId=? ";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserId());

        ResultSet rs=pstmt.executeQuery();
        System.out.println(sql);
        if(rs.next()){
            resultUser=new User();
            resultUser.setUserId(rs.getString("userId"));
            resultUser.setUserName(rs.getString("userName"));
            resultUser.setUserPassword(rs.getString("userPassword"));
            resultUser.setUserNumber(rs.getString("userNumber"));
            resultUser.setUserIdentity(rs.getString("userIdentity"));
            resultUser.setUserRealName(rs.getString("userRealName"));
            resultUser.setUserLocation(rs.getString("userLocation"));
            resultUser.setUserSex(rs.getString("userSex"));
            resultUser.setUserEmail(rs.getString("userEmail"));
            resultUser.setUserTel(rs.getString("userTel"));
        }
        rs.close();
        pstmt.close();
        return resultUser;
    }


    //注册帐号的检测
    //检查1用户名是否存在,2昵称是否存在，3身份证是否注册过，4邮箱是否用过,5身份证与学号是否匹配
    public ArrayList registerCheck(Connection con,User user) throws Exception{
        ArrayList res = new ArrayList();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;

        //用户名
        sql="select * from user where userId=?";
        pstmt=con.prepareStatement(sql);

        pstmt.setString(1, user.getUserId());
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            res.add(1);
        }


        //昵称
        sql="select * from user where userName=?";
        pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserName());
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            res.add(2);
        }

        //学号

        sql="select * from user where userNumber=?";
        pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserNumber()+"");
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            res.add(3);
        }

        //邮箱
        sql="select * from user where userEmail=?";
        pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserEmail());
        rs = pstmt.executeQuery();
        if(rs.next())
        {
            res.add(4);
        }


        //身份证与学号

        sql = "SELECT * FROM  school where Number = ? and Identity=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getUserNumber());
        pstmt.setString(2, user.getUserIdentity());
        rs = pstmt.executeQuery();
        if(!rs.next())
        {
            res.add(5);
        }


        pstmt.close();
        rs.close();
        return res;
    }



    //注册帐号
    public int register(Connection con,User user) throws Exception
    {
        String sql = "INSERT INTO `user`(`userId`, `userName`, `userPassword`, `userNumber`, `userIdentity`, `userRealName`, `userLocation`, `userSex`, `userEmail`, `userTel`,`userQQ`) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";


        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1, user.getUserId());
        pstmt.setString(2, user.getUserName());
        pstmt.setString(3, user.getUserPassword());
        pstmt.setString(4, user.getUserNumber());
        pstmt.setString(5, user.getUserIdentity());
        pstmt.setString(6, user.getUserRealName());
        pstmt.setString(7, user.getUserLocation());
        pstmt.setString(8, user.getUserSex());
        pstmt.setString(9, user.getUserEmail());
        pstmt.setString(10, user.getUserTel());
        pstmt.setString(11, user.getUserQQ());


        int result=pstmt.executeUpdate();
        pstmt.close();
        return result;
    }


    //更改用户基础信息：地址、性别、电话、qq
    public int updataUser(Connection con,User user) throws SQLException
    {
        String sql = "UPDATE User SET userLocation=?,userRealName=?,userSex=?,userTel=?,userQQ=? WHERE "
                + "userId =?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getUserLocation());
        pstmt.setString(2, user.getUserRealName());
        pstmt.setString(3, user.getUserSex());
        pstmt.setString(4, user.getUserTel());
        pstmt.setString(5, user.getUserQQ());
        pstmt.setString(6, user.getUserId());

        int result = pstmt.executeUpdate();
        pstmt.close();
        return result;
    }




    //更改用户密码
    public int updatePassword(Connection con,String userId,String password) throws SQLException
    {
        String sql = "UPDATE User SET userPassword=? WHERE userId =?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, password);
        pstmt.setString(2, userId);

        int result = pstmt.executeUpdate();
        pstmt.close();
        return result;
    }

    //更改邮箱
    public int updateEmail(Connection con,User user) throws SQLException
    {
        String sql = "UPDATE User SET userEmail=? WHERE userId =?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, user.getUserEmail());
        pstmt.setString(2, user.getUserId());

        int result = pstmt.executeUpdate();
        pstmt.close();
        return result;
    }


    //找回密码,插入信息 ,这里的date是java.sql.Date
    public int insertInfor(Connection con,String userId,String email,Timestamp date,String signature) throws SQLException
    {
        String sql = "insert into findPass(userId,email,outdate,signature) values(?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, email);
        pstmt.setTimestamp(3,date);
        pstmt.setString(4, signature);

        int res = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return res;
    }

    //找回密码，查询是否可以修改密码
    public boolean isChangePass(String userId,String validkey) throws Exception
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getCon();
        String sql = "select * from findPass where userId = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        ResultSet res = pstmt.executeQuery();
        if(res.last())
        {
            String signature = res.getString("signature");
            if(!validkey.equals(signature)){
                pstmt.close();
                con.close();
                return false;
            }
            else{
                long current = System.currentTimeMillis();
                long time = res.getTimestamp("outdate").getTime();
                if(current> time){
                    pstmt.close();
                    con.close();
                    return false;
                }
                else{
                    pstmt.close();
                    con.close();
                    return true;
                }
            }
        }
        else{
            pstmt.close();
            con.close();
            return false;
        }

    }


    //由持有者id 获取持有者昵称

    public String getOwnerName(String ownerId) throws Exception
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getCon();
        String sql = "select * from user where userId=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, ownerId);
        ResultSet rs = pstmt.executeQuery();
        String OwnerName = null;
        if(rs.next()){
            OwnerName = rs.getString("userName");
        }

        rs.close();
        con.close();
        pstmt.close();
        return OwnerName;
    }


    //由持有者id 获取持有者

    public ResultSet getOwner(String ownerId) throws Exception
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getCon();
        String sql = "select * from user where userId=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, ownerId);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }


    //获取当前用户QQ号用户QQ聊天

    public String getQQ (String userId) throws Exception
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getCon();
        String sql = "select * from user where userId = ? ";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1,userId);
        ResultSet rs = pstmt.executeQuery();
        String qq = null;
        if(rs.next())
        {
            qq = rs.getString("userQQ");
        }
        rs.close();
        con.close();
        pstmt.close();
        return qq;
    }




}





