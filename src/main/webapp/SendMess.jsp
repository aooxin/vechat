<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/28
  Time: 下午9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%

    Date date = new Date();
    Timestamp time = new Timestamp(date.getTime());

    //insert into normal_message (ID,F_ID,message_content,mess_time) values (10000,1000,"helloWorld","2021-11-28 22:04:45.083")
    String sql_insert = "insert into normal_message (ID,F_ID,message_content,mess_time) values (" + 10000 + "," + 10001 + "," + '"' + "helloWorld" + '"' + "," + '"' + time + '"' + ")";
    System.out.println(sql_insert);
    db.execQuery(sql_insert);//运行上面的语句

%>
</body>
</html>
