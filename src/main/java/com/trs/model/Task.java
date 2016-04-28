package com.trs.model;
import java.sql.Date;
public class Task {
    private int taskId;
    private int taskDiscount;
    private String taskName;
    private double taskPrice;
    private String ownerId;
    private int isRent;
    private float taskNew;
    private String taskDesc;
    private int taskStatue;
    private Date taskDate;
    private int taskTypeId;
    private int taskTypeId2;
    private String taskImag;

    // null constructor
    public Task(){

    }




    public Task(int taskId, int taskDiscount, String taskName,
                double taskPrice, String ownerId, int isRent, float taskNew,
                String taskDesc, int taskStatue, Date taskDate,
                int taskTypeId, int taskTypeId2) {
        super();
        this.taskId = taskId;
        this.taskDiscount = taskDiscount;
        this.taskName = taskName;
        this.taskPrice = taskPrice;
        this.ownerId = ownerId;
        this.isRent = isRent;
        this.taskNew = taskNew;
        this.taskDesc = taskDesc;
        this.taskStatue = taskStatue;
        this.taskDate = taskDate;
        this.taskTypeId = taskTypeId;
        this.taskTypeId2 = taskTypeId2;
        this.taskImag = "noimg.jpg";
    }




    public int getTaskId() {
        return taskId;
    }
    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }
    public int getTaskDiscount() {
        return taskDiscount;
    }
    public void setTaskDiscount(int taskDiscount) {
        this.taskDiscount = taskDiscount;
    }
    public String getTaskName() {
        return taskName;
    }
    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
    public int getTaskStatue() {
        return taskStatue;
    }
    public void setTaskStatue(int taskStatue) {
        this.taskStatue = taskStatue;
    }
    public double getTaskPrice() {
        return taskPrice;
    }
    public void setTaskPrice(double taskPrice) {
        this.taskPrice = taskPrice;
    }
    public String getOwnerId() {
        return ownerId;
    }
    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }
    public int getIsRent() {
        return isRent;
    }
    public void setIsRent(int isRent) {
        this.isRent = isRent;
    }
    public float getTaskNew() {
        return taskNew;
    }
    public void setTaskNew(float taskNew) {
        this.taskNew = taskNew;
    }
    public String getTaskDesc() {
        return taskDesc;
    }
    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }
    public Date getTaskDate() {
        return taskDate;
    }
    public void setTaskDate(Date taskDate) {
        this.taskDate = taskDate;
    }
    public int getTaskTypeId() {
        return taskTypeId;
    }
    public void setTaskTypeId(int taskTypeId) {
        this.taskTypeId = taskTypeId;
    }
    public int getTaskTypeId2() {
        return taskTypeId2;
    }
    public void setTaskTypeId2(int taskTypeId2) {
        this.taskTypeId2 = taskTypeId2;
    }
    public String getTaskImag() {
        return taskImag;
    }
    public void setTaskImag(String taskImag) {
        this.taskImag = taskImag;
    }





}
