<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/30
  Time: 下午2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String Group = (String) request.getParameter("goID");
    session.setAttribute("goID", Group);
    response.sendRedirect("GoChat.jsp");
%>
</body>
</html>
