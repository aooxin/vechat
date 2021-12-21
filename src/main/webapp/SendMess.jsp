<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/28
  Time: 下午9:45
  用于ab测试并发
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

    //设置主键自增
    //Alter table group_message change group_message_ID group_message_ID int auto_increment;
    //alter table group_message auto_increment=100000;

    //alter table wechat_group add column mess_num int default 0;

    //insert into normal_message (ID,F_ID,message_content,mess_time) values (10000,1000,"helloWorld","2021-11-28 22:04:45.083")
    String sql_insert = "insert into group_message (ID,G_ID,message_content,mess_time) values (" + 10000 + "," + 1000 + "," + '"' + "helloWorld" + '"' + "," + '"' + time + '"' + ")";
    System.out.println(sql_insert);
    String sql_add = "update wechat_group set mess_num=mess_num+1 where group_id=1000";
    db.execQuery(sql_insert);//运行上面的语句
    db.execQuery(sql_add);
%>
</body>
</html>
