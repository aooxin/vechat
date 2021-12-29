<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/29
  Time: 上午8:24
  Admin登录验证
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>
<jsp:useBean id="md5" class="com.example.webdemo.MD5" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String username = (String) request.getParameter("AdminName");
    String password = (String) request.getParameter("AdminPassword");//取出login.jsp的值
    password = md5.getMD5(password, password.length());
    //下面是数据库操作 *代表所有值
    String sql = "select * from wechat_user where ID=" + "'" + username + "'";//定义一个查询语句
    ResultSet rs = db.executeQuery(sql);//运行上面的语句
    session.setAttribute("username", username);
    if (rs.next()) {
        if (password.equals(rs.getObject("pass"))) {
            response.sendRedirect("Admin.jsp");
        } else {
            response.sendRedirect("AdminLogin.jsp");
        }
    } else {
        response.sendRedirect("AdminLogin.jsp");
    }
%>
</body>
</html>
