<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ page import="com.example.webdemo.DbBean" %>--%>
<jsp:useBean id="md5" class="com.example.webdemo.MD5" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");//取出login.jsp的值
    String[] remember = request.getParameterValues("remember");//是否使用cookies
    Cookie[] oldCookies = request.getCookies();
    if (oldCookies != null && oldCookies.length > 0) {
        for (Cookie c : oldCookies) {
            if (c.getName().equalsIgnoreCase("username")) {
                username = c.getValue();
            }
            if (c.getName().equalsIgnoreCase("password")) {
                password = c.getValue();
            }
        }
    }
    String passCookie =password;
    password = md5.getMD5(password, password.length());
    //下面是数据库操作 *代表所有值
    String sql = "select * from wechat_user where ID=" + "'" + username + "'";//定义一个查询语句
    ResultSet rs = db.executeQuery(sql);//运行上面的语句

    if (rs.next()) {
        if (password.equals(rs.getObject("pass"))) {
            if (remember != null && remember.length > 0) {
                Cookie usernameCookie = new Cookie("username", username);
                Cookie passwordCookie = new Cookie("password", passCookie);
                usernameCookie.setMaxAge(86400);
                passwordCookie.setMaxAge(86400);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }

            response.sendRedirect("loginsuccess.jsp");
        } else {
            response.setHeader("refresh", "0;url=login.jsp");
        }
    } else {
        response.setHeader("refresh", "0;url=login.jsp");
    }

%>
</body>
</html>