package com.trs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.trs.model.Task;
import com.trs.util.DbUtil;

public class TaskDao {

    private DbUtil dbUtil = new DbUtil();
    private Connection con = null;
    private String sql = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    // 关闭上述实例的方法，省的后面每个都要再写
    public void close() throws SQLException {
        con.close();
        pstmt.close();
        rs.close();
    }

    /**
     * 搜索
     *
     * @throws Exception
     * @getTaskById 由任务ID唯一获取
     * @getTaskByName 由任务名获取
     * @getTaskByType 由一级类别获取
     * @getTaskByType2 由二级类别获取
     * @getTaskLast 首页用获取最新的相应类型任务
     * @getTaskIsRent 获取借用任务
     * @getImag 获取任务图片
     * @getTaskByNew 由任务新的程度
     * @getTaskByUser 由用户ID获取任务
     * @getAttention 获取关注的任务
     * @getCount 获取按名搜索相关总数
     * @getPersonCount 获取该用户发布任务总数
     */

    public ResultSet getTaskById(int id) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from task where taskId = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        return rs;
    }

    // 分页从0 开始 每页8
    public ResultSet getTaskByName(String name, int page) throws Exception {
        // 获取可接任务
        con = dbUtil.getCon();
        sql = "select * from task where taskName like ? and taskStatue= 1 limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%" + name + "%");
        rs = pstmt.executeQuery();
        // 还要用到rs不能关闭
        return rs;
    }

    public ResultSet getTaskByType(int type1, int page) throws Exception {
        // 类型获取任务
        con = dbUtil.getCon();
        sql = "select * from task where taskTypeId=? and taskStatue= 1 limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, type1);
        rs = pstmt.executeQuery();
        return rs;
    }

    // 重载

    public ResultSet getTaskByType(int type1, int type2, int page)
            throws Exception {
        // 类型获取任务
        con = dbUtil.getCon();
        sql = "select * from task where taskTypeId=? and taskTypeId2=? and taskStatue= 1 limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, type1);
        pstmt.setInt(2, type2);
        rs = pstmt.executeQuery();
        // 后面还用到 rs 不能关闭
        return rs;
    }

    public ResultSet getTaskIsRent(int isRent, int page) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from task where isRent=? taskStatue= 1 limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, isRent);
        rs = pstmt.executeQuery();
        return rs;
    }

    // 新程度大于x
    public ResultSet getTaskByNew(int x, int page) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from task where taskNew>=? taskStatue= 1 limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, x);
        rs = pstmt.executeQuery();
        return rs;
    }

    // 获取目前任务总数，用来获取任务id
    public int getCount() throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from task";
        pstmt = con.prepareStatement(sql);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 获取特定用户发布任务总数

    public int getPersonCount(String userId) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from task   where ownerId =? ";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 获取指定用户关注任务数

    public int getPersonAtt(String userId) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from attention   where userId =? ";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 获取指定按名查询相关总数
    public int getCount(String taskName) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from task where taskName like ? and taskStatue=1";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, "%" + taskName + "%");
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 获得关注任务的总数
    public int getAttentionCount(String userId) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from attention where userId = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 指定类型的任务数目
    public int getCount(int type) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from task where taskTypeId = ? and taskStatue=1";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, type);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 指定两种类型的任务数目
    public int getCount(int type, int type2) throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT count(*) as count from task where taskTypeId = ? and taskTypeId2 =? and taskStatue=1";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, type);
        pstmt.setInt(2, type2);
        rs = pstmt.executeQuery();
        int res = 0;
        if (rs.next()) {
            res = rs.getInt("count");
        }
        return res;
    }

    // 获取任务图片
    public ResultSet getImag(int taskId) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from image where taskId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, taskId);
        rs = pstmt.executeQuery();
        return rs;
    }

    /**
     * 由任务类型id 来获取任务的类别
     */

    public String getTypeName(int id) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from Type where taskType=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            return rs.getString("TypeName");
        } else {
            close();
            return "error,can't find this type";
        }
    }

    // 重载 , 获取二级任务类别

    public String getTypeName(int id, int id2) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from Type where taskType=? and taskType2=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.setInt(2, id2);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            return rs.getString("TypeName2");
        } else {
            close();
            return "error,can't find this type";
        }
    }

    // getGoodsLast获取最新任务
    public ResultSet getTaskLast() throws Exception {
        con = dbUtil.getCon();
        sql = "SELECT * FROM `task` WHERE 1 order by taskDate desc,taskId desc limit 0,8";
        pstmt = con.prepareStatement(sql);
        // pstmt.setInt(1, id);
        rs = pstmt.executeQuery();
        return rs;
    }

    // getTaskByUser 获取个人发布任务

    public ResultSet getTaskByUser(String userId, int page) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from task where ownerId =? limit " + (page - 1) * 8
                + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        return rs;
    }

    // getAttention 获取关注任务

    public ResultSet getAttention(String userId, int page) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from attention s,task g where userId = ? and s.taskId = g.taskId limit "
                + (page - 1) * 8 + ",8";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        return rs;

    }

    // 查询是否已经关注过

    public boolean findAttention(String userId, int taskId) throws Exception {
        con = dbUtil.getCon();
        sql = "select * from attention where userId = ? and taskId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setInt(2, taskId);
        rs = pstmt.executeQuery();

        if (rs.next())
            return false;
        else
            return true;
    }

    /**
     * 发布任务 addTask 添加任务
     */

    public boolean addTask(Task task) throws Exception {
        con = dbUtil.getCon();
        sql = "INSERT INTO `task`(`taskDiscount`, `taskName`, `taskPrice`, `ownerId`, `isRent`, `taskNew`, `taskDesc`, `taskStatue`, `taskDate`, `taskTypeId`,`taskTypeId2`,`taskImag`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, task.getTaskDiscount());
        pstmt.setString(2, task.getTaskName());
        pstmt.setDouble(3, task.getTaskPrice());
        pstmt.setString(4, task.getOwnerId());
        pstmt.setInt(5, task.getIsRent());
        pstmt.setFloat(6, task.getTaskNew());
        pstmt.setString(7, task.getTaskDesc());
        pstmt.setInt(8, task.getTaskStatue());
        // cast java.util.date to java.sql.date
        pstmt.setDate(9, (Date) task.getTaskDate());
        pstmt.setInt(10, task.getTaskTypeId());
        pstmt.setInt(11, task.getTaskTypeId2());
        pstmt.setString(12, task.getTaskImag());

        int res = pstmt.executeUpdate();
        close();
        if (res == 1)
            return true;
        else
            return false;
    }

    /**
     * 添加任务主图片
     */

    public boolean addTaskPicture(int taskId, String path) throws Exception {
        con = dbUtil.getCon();
        sql = "UPDATE `task` SET `taskImag`=? WHERE taskId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, path);
        pstmt.setInt(2, taskId);

        int res = pstmt.executeUpdate();

        close();
        if (res == 1) {
            return true;
        } else
            return false;

    }

    /**
     *
     * 添加任务第二章、第三章图片
     *
     * 添加任务关注
     */

    public boolean addTaskPicture(int count, int taskId, String path)
            throws Exception {
        con = dbUtil.getCon();
        if (count == 1) {
            sql = "INSERT INTO `image`(`taskId`, `firstIndex`) VALUES (?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, taskId);
            pstmt.setString(2, path);
            int res = pstmt.executeUpdate();
            close();
            if (res == 1) {
                return true;
            } else
                return false;
        }

        else {
            sql = "UPDATE `image` SET `secondIndex`=? WHERE taskId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, path);
            pstmt.setInt(2, taskId);
            int res = pstmt.executeUpdate();
            close();
            if (res == 1)
                return true;
            else
                return false;
        }
    }

    // 添加关注
    public boolean Addattention(String userId, int taskId) throws Exception {
        Connection con = dbUtil.getCon();
        String sql = "INSERT INTO `attention`(`userId`, `taskId`) VALUES (?,?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setInt(2, taskId);
        int res = pstmt.executeUpdate();
        if (res == 1)
            return true;
        else
            return false;
    }


    // 检查是否已经关注过了
    public boolean isAttention(String userId, int taskId) throws Exception {
        Connection con = dbUtil.getCon();
        String sql = "SELECT * FROM `attention` where userId=? and taskId=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setInt(2, taskId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
        {
            return true;
        }
        return false;
    }


    // 取消关注
    public boolean deleteAttention(String userId, int taskId) throws Exception {
        Connection con = dbUtil.getCon();
        String sql = "DELETE FROM `task` WHERE ownerId=? and taskId=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setInt(2, taskId);
        int res = pstmt.executeUpdate();
        if (res == 1)
            return true;
        else
            return false;
    }

    /**
     * 更改任务 changeGoods
     */

    public boolean changeTask(Task task) throws Exception {
        con = dbUtil.getCon();
        sql = "UPDATE `task` SET `taskDiscount`=?,`taskName`=?,`taskPrice`=?,`ownerId`=?,`isRent`=?,"
                + "`taskNew`=?,`taskDesc`=?,`taskStatue`=?,`taskTypeId`=?,`taskTypeId2`=? WHERE taskId=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, task.getTaskDiscount());
        pstmt.setString(2, task.getTaskName());
        pstmt.setDouble(3, task.getTaskPrice());
        pstmt.setString(4, task.getOwnerId());
        pstmt.setInt(5, task.getIsRent());
        pstmt.setFloat(6, task.getTaskNew());
        pstmt.setString(7, task.getTaskDesc());
        pstmt.setInt(8, task.getTaskStatue());
        // cast java.util.date to java.sql.date
        pstmt.setInt(9, task.getTaskTypeId());
        pstmt.setInt(10, task.getTaskTypeId2());
        pstmt.setInt(11, task.getTaskId());

        int res = pstmt.executeUpdate();
        if (res == 1)
            return true;
        else
            return false;
    }

    /**
     * 修改第二章，第三章图片
     */

    public boolean updataTaskPicture(int count, int taskId, String path)
            throws Exception {
        con = dbUtil.getCon();
        if (count == 1) {
            sql = "UPDATE `image` SET `firstIndex`=? WHERE taskId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, path);
            pstmt.setInt(2, taskId);
            int res = pstmt.executeUpdate();
            close();
            if (res == 1) {
                return true;
            } else
                return false;
        }

        else {
            sql = "UPDATE `image` SET `secondIndex`=? WHERE taskId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, path);
            pstmt.setInt(2, taskId);
            int res = pstmt.executeUpdate();
            close();
            if (res == 1)
                return true;
            else
                return false;
        }
    }

    /**
     * 完成交易closeExchange 设置task表statues为0 并且将时间更改为交易完成时间
     */

    // 完成交易，置task表statues为0

    public boolean closeExchange(int taskId) throws Exception {
        con = dbUtil.getCon();
        sql = "UPDATE `task` SET `taskStatue`=?, `endDate`=?  WHERE taskId=?";

        Date date = new Date(System.currentTimeMillis());
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, 0);
        pstmt.setDate(2, date);
        pstmt.setInt(3, taskId);

        int res = pstmt.executeUpdate();
        if (res == 1)
            return true;
        else
            return false;

    }
}
