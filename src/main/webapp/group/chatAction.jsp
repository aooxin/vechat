<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/30
  Time: 下午2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%
    session.removeAttribute("showContent");
    request.setCharacterEncoding("UTF-8");
    String MsgContent = (String) request.getParameter("chatInput");//找到输入的消息
    session.setAttribute("showContent2", MsgContent);//将输入的消息暂时存入session

    String user = (String) session.getAttribute("normalUsername");
    String group = (String) session.getAttribute("goID");
    Date date = new Date();//加时间
    Timestamp time = new Timestamp(date.getTime());
    String sql_insert = "insert into group_message (ID,G_ID,message_content,mess_time) values (" + user + "," + group + "," + '"' + MsgContent + '"' + "," + '"' + time + '"' + ")";
    String sql_add = "update wechat_group set mess_num=mess_num+1 where group_id=1000";
    db.execQuery(sql_insert);//运行上面的语句
    System.out.println(sql_insert);
    db.execQuery(sql_add);
    String showContent = (String) request.getParameter("MessShow_Content");
    session.setAttribute("BeforeShowContent", showContent);
    response.sendRedirect("GoChat.jsp");
    //request.getRequestDispatcher("../Group_Contacts.jsp");
%>
</body>
</html>
