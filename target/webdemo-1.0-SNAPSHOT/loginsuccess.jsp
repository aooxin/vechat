<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<%@ page import="com.example.webdemo.user" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

<table class="table table-striped">
    <thead>
    <tr>
        <th>用户名</th>
        <th>密码</th>
    </tr>
    </thead>
</table>
<tbody>
<!--这里开始循环输出list对象中的信息-->
<%--<:forEach items="${list}" var="clas">
    <tr>
        <th scope="row"><%=++i %></th>
        <td><a  href='classinforlet?hao=${clas.hao} ' >${clas.name}</a>
        <td>${clas.hao}</td>
        <td>${clas.tname}</td>
        <td>${clas.person}</td>
        <td>${clas.chose}</td>
    </tr>
</:forEach>--%>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>

<%
    request.setCharacterEncoding("UTF-8");
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");//取出login.jsp的值
    //下面是数据库操作 *代表所有值
    String sql = "select * from wechat_user";//定义一个查询语句
    ResultSet rs = db.executeQuery(sql);//运行上面的语句
    List<user> list = new ArrayList<user>();
    while (rs.next()) {
        String use_name = rs.getString("ID");
        String pass_w0rd = rs.getString("pass");
        user usr = new user(use_name, pass_w0rd);
        list.add(usr);
    }
    for (user tl : list) {%>
<tr>
    <th>
        <%=tl.getUser_name() %>
    </th>
    <th>
        <%=tl.getPassword() %>
    </th>
    <br>
</tr>
<%
    }
%>
</tbody>
</body>
</html>