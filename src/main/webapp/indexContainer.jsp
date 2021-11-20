<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/18
  Time: 上午9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 聊天内容部分 -->
<div class="panel-body" data-spy="scroll" data-target="#navbar-example" data-offset="300"
     style="height: 300px; overflow: auto; position: relative;">
    <pre id="talks">${talks}</pre>
</div>
...
<!-- 信息提示部分 -->
<div class="panel-body" data-spy="scroll" data-target="#navbar-example" data-offset="0"
     style="height: 250px; overflow: auto; position: relative;">
    <pre id="message">${message}</pre>
</div>
...
<!-- 发送聊天内容部分 -->
<div class="input-group">
    <input id="talk" type="text" class="form-control">
    <span class="input-group-addon"> <button id="send" type="button" class="btn btn-default">发送</button></span>
</div>
</body>
</html>
