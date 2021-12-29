<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/29
  Time: 下午9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String G_ID = (String) request.getParameter("G_ID");
    String GName = (String) request.getParameter("GName");
    String masterID = (String) request.getParameter("masterID");
    //String sql="select * from wechat_user where ID="+"'"+id+"'";//定义一个查询语句
    //insert group_user_relationship(group_ID,ID,is_group_master)  values(1001,10000,0);
    //insert wechat_group(group_ID,group_name,group_mem_num,master_id)values("1002","CS1902",0,123);
    String sql_add = "insert wechat_group(group_ID,group_name,group_mem_num,master_id)values(" + "'" + G_ID + "'" + "," + "'" + GName + "'" + "," + 0 + "," + "'" + masterID + "'" + ")";
    db.execQuery(sql_add);//运行上面的语句
    //重新回到页面
    response.sendRedirect("Admin.jsp");
%>
</body>
</html>
