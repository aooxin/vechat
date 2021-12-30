package com.example.webdemo;

public class user {
    private String user_name;
    private String password;
    private String USER_REAL_NAME;

    public String getUser_name() {
        return user_name;
    }

    public String getPassword() {
        return password;
    }

    public String getUSER_REAL_NAME() {
        return USER_REAL_NAME;
    }

    public user(String user_name, String password) {
        this.password = password;
        this.user_name = user_name;
        this.USER_REAL_NAME = "";
    }

    public void setUSER_REAL_NAME(String USER_REAL_NAME) {
        this.USER_REAL_NAME = USER_REAL_NAME;
    }
}
