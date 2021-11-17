<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/11
  Time: 下午6:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Register</title>
</head>
<body>
<center>
    <h1 style="color:red">注册</h1>
    <form id="register_form" name="registerForm" action="RegisterSummit.jsp" method="post">
        <table border="0">
            <tr>
                <td>账号：</td>
                <td><input type="text" name="userid"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password">
                </td>
            </tr>
            <tr>
                <td>用户名：</td>
                <td><input type="text" name="username">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="注册" style="color:#BC8F8F">
    </form>
</center>
</body>
</html>
