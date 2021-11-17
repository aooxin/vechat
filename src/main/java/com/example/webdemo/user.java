package com.example.webdemo;

public class user {
    private String user_name;
    private String password;

    public String getUser_name() {
        return user_name;
    }

    public String getPassword() {
        return password;
    }

    public user(String user_name, String password) {
        this.password=password;
        this.user_name=user_name;
    }
}
