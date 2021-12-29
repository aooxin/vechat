<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/29
  Time: 下午8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<html>
<head>
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>
<jsp:useBean id="md5" class="com.example.webdemo.MD5" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String delete_id = (String) request.getParameter("delete_id");
    String delete_gid = (String) request.getParameter("delete_gid");
    //String sql="select * from wechat_user where ID="+"'"+id+"'";//定义一个查询语句
    String sql_delete = "delete from group_user_relationship where ID=" + "'" + delete_id + "'" + "AND group_ID=" + "'" + delete_gid + "'";
    db.execQuery(sql_delete);//运行上面的语句
    //重新回到页面
    response.sendRedirect("Admin.jsp");
%>
</body>
</html>
