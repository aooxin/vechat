<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/30
  Time: 下午10:05
  Push to MySQL
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webdemo.Msg" %>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String MsgContent = (String) request.getParameter("MessShow_Content");//找到输入的消息

    //System.out.println(MsgContent);
    Date date = new Date();//加时间
    Timestamp time = new Timestamp(date.getTime());
    String[] msgContent = MsgContent.split("\n");
    String group = (String) session.getAttribute("goID");
    for (String ss : msgContent) {
        String[] tmp = ss.split(":");//拿到用户名tmp[0]和消息内容tmp[1]
        //System.out.println(tmp[0]);
        //System.out.println(tmp[1]);
        tmp[1].substring(1);
        //System.out.println(tmp[1].length());
        //String sql_insert = "insert into normal_message (ID,F_ID,message_content,mess_time) values (" + "'" + tmp[0] + "'"+","+group+","+"'"+tmp[1]+"'";
        String sql_insert = "insert into group_message (ID,G_ID,message_content,mess_time) values (" + "'" + tmp[0] + "'" + "," + group + "," + "'" + tmp[1] + "'" + "," + "'" + time + "'" + ")";
        db.execQuery(sql_insert);
        //System.out.println(sql_insert);
    }
    response.sendRedirect("GoChat.jsp");
%>

