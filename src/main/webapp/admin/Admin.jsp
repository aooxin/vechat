<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/29
  Time: 上午8:26
  群主控制界面
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
    <title>Admin controller</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
    <div class="col-2 shadow-sm">
        <a>操作界面</a>
        <form class="row g-3" action="deleteAction.jsp">
            <div class="col-auto">
                <input class="form-control me-1" name="delete_id" placeholder="ID">
                <input class="form-control me-1" name="delete_gid" placeholder="GID">
                <button class="btn btn-outline-success" type="submit">Delete</button>
            </div>
        </form>
        <form class="row g-3" action="addAction.jsp">
            <div class="col-auto">
                <input class="form-control me-1" name="addID" placeholder="ID">
                <input class="form-control me-1" name="addF_ID" placeholder="GID">
                <a>is master?</a><input type="checkbox" name="isMaster">
                <button class="btn btn-outline-success" type="submit">ADD</button>
            </div>
        </form>
        <form class="row g-3" action="createNewGroup.jsp">
            <div class="col-auto">
                <input class="form-control me-1" name="G_ID" placeholder="GroupID">
                <input class="form-control me-1" name="GName" placeholder="GroupName">
                <input class="form-control me-1" name="masterID" placeholder="masterID">
                <button class="btn btn-outline-success" type="submit">Create</button>
            </div>
        </form>
        <div class="col-auto">
            <button class="btn btn-outline-success" type="button" onclick="window.location.href='../loginsuccess.jsp'">
                查询所有用户
            </button>
        </div>
    </div>
    <div class="col-4 shadow-sm">
        <table class="table table-success table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">User ID</th>
                <th scope="col">Group ID</th>
                <th scope="col">is g master?</th>
            </tr>
            </thead>
            <jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>
            <%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
            <%--         pageEncoding="utf-8"%>--%>
            <%--<%@ page import="com.example.webdemo.DbBean" %>--%>

            <%
                request.setCharacterEncoding("UTF-8");
                String username = (String) session.getAttribute("username");
                //TODO:这里的判断暂时还有问题媒介决
                if (("".equals(username))) response.sendRedirect("AdminLogin.jsp");
                //下面是数据库操作 *代表所有值

                //设置主键自增语句
                //Alter table group_user_relationship change g_u_ID g_u_ID int auto_increment;
                //alter table group_user_relationship auto_increment=100000;

                //插入群与成员关系语句
                //insert group_user_relationship(group_ID,ID,is_group_master)  values(1000,10000,1);
                //insert group_user_relationship(group_ID,ID,is_group_master)  values(1001,10000,0);

                //String sql = "select * from group_user_relationship where ID=" + "'" + username + "'";//定义一个查询语句
                String sql = "select * from group_user_relationship";
                ResultSet rs = db.executeQuery(sql);//运行上面的语句
                List<UserInGroup> list = new ArrayList<UserInGroup>();
                while (rs.next()) {
                    try {
                        String use_name = rs.getString("ID");
                        String group_name = rs.getString("group_ID");
                        boolean is_group_master = rs.getBoolean("is_group_master");
                        UserInGroup usr = new UserInGroup(use_name, group_name, is_group_master);
                        list.add(usr);
                    } catch (Exception e) {
                        continue;
                    }
                }
                int x = 1;
                for (UserInGroup tl : list) {%>
            <tbody>
            <tr>
                <th scope="row">
                    <%=x++%>
                </th>
                <th>
                    <%=tl.getUser_name() %>
                </th>
                <th>
                    <%=tl.getGroup_name() %>
                </th>
                <th>
                    <%=tl.getIs_group_master() %>
                </th>
            </tr>
            <br>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
