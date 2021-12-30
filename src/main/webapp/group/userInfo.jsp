<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/30
  Time: 上午8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.example.webdemo.DbBean" %>
<%@ page import="com.example.webdemo.user" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webdemo.UserInGroup" %>
<html>
<head>
    <title>UserInfo</title>
    <title>Group Member</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="col-4 shadow-sm">
    <table class="table table-success table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">User ID</th>
            <th scope="col">PassW0rd</th>
            <th scope="col">Name</th>
        </tr>
        </thead>
        <jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
        <%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
        <%--         pageEncoding="utf-8"%>--%>
        <%--<%@ page import="com.example.webdemo.DbBean" %>--%>

        <%
            request.setCharacterEncoding("UTF-8");
            String username = (String) session.getAttribute("normalUsername");
            //String groupID=(String) session.getAttribute("goID");
            //TODO:这里的判断暂时还有问题媒介决
            if (("".equals(username))) response.sendRedirect("AdminLogin.jsp");
            //下面是数据库操作 *代表所有值

            String sql = "select * from wechat_user where ID=" + "'" + username + "'";//定义一个查询语句
            //String sql = "select * from group_user_relationship";
            ResultSet rs = db.executeQuery(sql);//运行上面的语句
            List<user> list = new ArrayList<user>();
            while (rs.next()) {
                try {
                    String use_name = rs.getString("ID");
                    String pass_w0rd = rs.getString("pass");
                    String USER_REAL_NAME = rs.getString("USER_NAME");
                    user usr = new user(use_name, pass_w0rd);
                    usr.setUSER_REAL_NAME(USER_REAL_NAME);
                    list.add(usr);
                } catch (Exception e) {
                    continue;
                }
            }
            int x = 1;
            for (user tl : list) {%>
        <tbody>
        <tr>
            <th scope="row">
                <%=x++%>
            </th>
            <th>
                <%=tl.getUser_name() %>
            </th>
            <th>
                <%=tl.getPassword() %>
            </th>
            <th>
                <%=tl.getUSER_REAL_NAME() %>
            </th>
        </tr>
        <br>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
