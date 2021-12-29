package com.example.webdemo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbBean {
    private String driverStr = "com.mysql.cj.jdbc.Driver";

    //private String connStr = "jdbc:mysql://52.148.66.228:3306";
    private String connStr = "jdbc:mysql://52.148.66.228:3306/wechat?useUnicode=true&characterEncoding=UTF-8&userSSL=false&serverTimezone=GMT%2B8";
    private String dbUsername = "root";
    private String dbPassword = "max101312";
    private Connection conn = null;
    private Statement stmt = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;
    List<user> list = new ArrayList<user>();

    public DbBean() {
        try {
            Class.forName(driverStr);
            conn = DriverManager.getConnection(connStr, dbUsername, dbPassword);
            stmt = conn.createStatement();
            if (conn != null) {
                System.out.println("数据库连接成功");
            }
        } catch (Exception ex) {
            System.out.println("--------------");
            System.out.println(ex.getMessage());
            System.out.println("数据连接失败2！");
        }
    }

    public int executeUpdate(String s) {
        int result = 0;
        System.out.println("--更新语句:" + s + "\n");
        try {
            result = stmt.executeUpdate(s);
        } catch (Exception ex) {
            System.out.println("执行更新错误！");
        }
        return result;
    }

    public ResultSet executeQuery(String s) {
        ResultSet rs = null;
        System.out.print("--查询语句:" + s + "\n");
        try {
            rs = stmt.executeQuery(s);
        } catch (Exception ex) {
            System.out.println("ִ执行查询错误！");
        }
        return rs;
    }

    public void ResetPassword(String id, String pass) {
        try {
            conn.prepareCall("{call SetNewPassword(id,pass )}");
            System.out.println("执行设置新密码存储过程成功！");
        } catch (SQLException e) {
            System.out.println("执行设置新密码存储过程错误！");
        }
    }

    public void execQuery(String s) {
        try {
            stmt.executeUpdate(s);
            System.out.println("插入成功！");
        } catch (SQLException e) {
            System.out.println("执行插入错误！");
        }
    }

    public void close() {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
        }
    }


}
