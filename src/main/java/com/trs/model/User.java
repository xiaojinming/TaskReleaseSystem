package com.trs.model;

public class User {
    private String userId;
    private String userName;
    private String userPassword;
    private String userNumber;
    private String userIdentity;
    private String userRealName;
    private String userLocation;
    private String userSex;
    private String userTel;
    private String userEmail;
    private String userQQ;


    //空构造函数
    public User()
    {

    }

    public User(String userId, String userPassword) {
        super();
        this.userId = userId;
        this.userPassword = userPassword;
    }


    public User(String userId, String userName, String userPassword,
                String userNumber, String userIdentity, Object userRealName,
                Object userLocation, String userSex, Object userTel,
                String userEmail,String userQQ) {
        super();
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userNumber = userNumber;
        this.userIdentity = userIdentity;
        if(userRealName!=null)
            this.userRealName = (String)userRealName;
        if(userLocation!=null)
            this.userLocation = (String)userLocation;
        this.userSex = userSex;
        if(userTel!=null)
            this.userTel = (String)userTel;
        this.userEmail = userEmail;
        this.userQQ = userQQ;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserPassword() {
        return userPassword;
    }
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public String getUserNumber() {
        return userNumber;
    }
    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }
    public String getUserIdentity() {
        return userIdentity;
    }
    public void setUserIdentity(String userIdentity) {
        this.userIdentity = userIdentity;
    }
    public String getUserRealName() {
        return userRealName;
    }
    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }
    public String getUserLocation() {
        return userLocation;
    }
    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation;
    }
    public String getUserSex() {
        return userSex;
    }
    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserQQ() {
        return userQQ;
    }

    public void setUserQQ(String userQQ) {
        this.userQQ = userQQ;
    }


}
