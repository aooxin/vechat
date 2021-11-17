<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/16
  Time: 下午6:34
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
    <h1 style="color:red"></h1>
    <form id="Delete_form" name="deleteForm" action="DeleteUserSummit.jsp" method="post">
        <table border="0">
            <tr>
                <td>账号：</td>
                <td><input type="text" name="userid"></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="注销" style="color:#BC8F8F">
    </form>
</center>
</body>
</html>
