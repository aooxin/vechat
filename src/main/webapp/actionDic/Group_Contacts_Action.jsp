<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/28
  Time: 下午5:03
  这个页面是对群聊的信息进行处理，存入数据库。
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Title</title>
</head>
<body>

<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>
<jsp:useBean id="md5" class="com.example.webdemo.MD5" scope="page"/>
<%
    //session.removeAttribute("showContent");
    request.setCharacterEncoding("UTF-8");
    String MsgContent = (String) request.getParameter("MessContentInput");
    Date date = new Date();
    Timestamp time = new Timestamp(date.getTime());
    String sql_insert = "insert into group_message (ID,G_ID,message_content,mess_time) values (" + 10000 + "," + 1000 + "," + '"' + MsgContent + '"' + "," + '"' + time + '"' + ")";
    String sql_add = "update wechat_group set mess_num=mess_num+1 where group_id=1000";
    db.execQuery(sql_insert);//运行上面的语句
    db.execQuery(sql_add);
    String showContent = (String) request.getParameter("MessShowContent");
    session.setAttribute("showContent", showContent);
    response.sendRedirect("../Group_Contacts.jsp");
    //request.getRequestDispatcher("../Group_Contacts.jsp");
%>
</body>
</html>
