package com.example.webdemo;

public class UserInGroup {
    private String user_name;
    private String group_name;
    private boolean is_group_master;

    public String getUser_name() {
        return user_name;
    }

    public String getGroup_name() {
        return group_name;
    }

    public boolean getIs_group_master() {
        return is_group_master;
    }

    public UserInGroup(String user_name, String password, boolean is_group_master) {
        this.group_name = password;
        this.user_name = user_name;
        this.is_group_master = is_group_master;
    }
}
