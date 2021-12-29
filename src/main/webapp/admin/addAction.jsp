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
<%
    request.setCharacterEncoding("UTF-8");

    String addID = (String) request.getParameter("addID");
    String addF_ID = (String) request.getParameter("addF_ID");
    String[] isMaster = request.getParameterValues("isMaster");
    int isGroupMaster = 0;
//    if (isMaster != null || isMaster.length > 0) {
//        isGroupMaster = 1;
//    }
    //String sql="select * from wechat_user where ID="+"'"+id+"'";//定义一个查询语句
    //insert group_user_relationship(group_ID,ID,is_group_master)  values(1001,10000,0);
    String sql_add = "insert group_user_relationship(group_ID,ID,is_group_master)  values(" + "'" + addF_ID + "'" + "," + "'" + addID + "'" + "," + isGroupMaster + ")";
    db.execQuery(sql_add);//运行上面的语句
    //重新回到页面
    response.sendRedirect("Admin.jsp");
%>
</body>
</html>
