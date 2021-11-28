<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/15
  Time: 下午9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="com.example.webdemo.DbBean" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>
<jsp:useBean id="md5" class="com.example.webdemo.MD5" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id=(String)request.getParameter("userid");
    String password=(String)request.getParameter("password");//取出R.jsp的值
    String pass_md5=md5.getMD5(password,password.length());

    //下面是数据库操作 *代表所有值
    //String sql="select * from wechat_user where ID="+"'"+id+"'";//定义一个查询语句
    //String sql_reset="update wechat_user set pass="+"'"+pass_md5+"'"+"where id="+"'"+id+"'";
    //db.executeUpdate(sql_reset);//运行上面的语句
    db.ResetPassword(id,pass_md5);
    response.sendRedirect("loginsuccess.jsp");
%>
</body>
</html>
