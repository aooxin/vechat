<%@ page import="com.example.webdemo.DbBean" %><%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/29
  Time: 下午11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  <!--窗口宽度是设备宽度，缩放比例是1:1-->
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Home</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="https://cdn.goeasy.io/goeasy-2.2.2.min.js"></script>
    <%--    <script type="text/javascript" src="../js/conn.js"></script>--%>
    <script type="text/javascript">
        var goeasy = GoEasy.getInstance({
            host: "hangzhou.goeasy.io",  //若是新加坡区域：singapore.goeasy.io
            appkey: "BC-8b85b22cbb814784ba4e44521a9b5d12",
            modules: ['pubsub']//根据需要，传入‘pubsub’或'im’，或数组方式同时传入
        });
        //建立连接
        goeasy.connect({
            id: "001", //pubsub选填，im必填
            data: {"avatar": "/www/xxx.png", "nickname": "Neo"}, //必须是一个对象，pubsub选填，im必填，用于上下线提醒和查询在线用户列表时，扩展更多的属性
            onSuccess: function () {  //连接成功
                console.log("GoEasy connect successfully.") //连接成功
            },
            onFailed: function (error) { //连接失败
                console.log("Failed to connect GoEasy, code:" + error.code + ",error:" + error.content);
            },
            onProgress: function (attempts) { //连接或自动重连中
                console.log("GoEasy is connecting", attempts);
            }
        });
        <%
        String username=(String) session.getAttribute("normalUsername");
        String Group=(String) session.getAttribute("goID");
        %>
        let pubsub = goeasy.pubsub;
        pubsub.subscribe({
            channel: <%=Group%>,//替换为您自己的channel
            onMessage: function (message) {
                console.log("Channel:" + message.channel + " content:" + message.content);
                let chatMessage = JSON.parse(message.content);
                showMess(chatMessage);
            },
            onSuccess: function () {
                console.log("Channel订阅成功。");
            },
            onFailed: function (error) {
                console.log("Channel订阅失败, 错误编码：" + error.code + " 错误信息：" + error.content)
            }
        });

        //发送消息
        function sendMessage() {
            let messageContent = document.getElementById("MessContent").value;
            let x =<%=username%>;
            let message = {
                content: messageContent,
                senderUserId: "<%=username%>"
            };
            pubsub.publish({
                channel: <%=Group%>,//替换为您自己的channel
                message: JSON.stringify(message),//替换为您想要发送的消息内容
                onSuccess: function () {
                    console.log("消息发布成功。");
                },
                onFailed: function (error) {
                    console.log("消息发送失败，错误编码：" + error.code + " 错误信息：" + error.content);
                }
            });
            $("#MessContent").val("");
        };

        // 展示收到的消息
        function showMess(msg) {
            let message = JSON.parse(JSON.stringify(msg));
            let mess = message.senderUserId + ": " + message.content;
            //let MsgBefore =<%=(String)session.getAttribute("BeforeShowContent")%>;
            // if (MsgBefore != null) {
            //     document.getElementById("MessShowContent").append(MsgBefore);
            // }
            document.getElementById("MessShowContent").append(mess);
            document.getElementById("MessShowContent").append("\n");

        };

        function clearMsg() {
            window.location.href = "GoChat.jsp";
        };

        //Todo:下面是尝试使用jsp的数据库操作


    </script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="#"><img src="https://pic.imgdb.cn/item/61977ca62ab3f51d91e9cb0c.png"></a>

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="userInfo.jsp">用户信息</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="groupMember.jsp">群成员</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="groupSelect.jsp">群</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <button type="button" class="btn btn-link" onclick="window.location.href='../index.jsp'">重新登录</button>
            </div>
        </div>
    </nav>
</div>

<div class="container">
    <%--消息展示框--%>
    <div><h3>以下消息是<%=username%>发给<%=Group%>的</h3></div>
    <%--消息展示框--%>
    <textarea id="MessShowContent" class="form-control" rows="6" readonly name="MessShow_Content"></textarea>
    <div>
        <%--输入框--%>
        <textarea id="MessContent" class="form-control" rows="2" name="Mess_Content" placeholder="InPut"></textarea>
        <%--提交按钮--%>
        <button type="submit" id="sendMsg" class="btn btn-primary" onclick="sendMessage()">发送</button>
        <button id="clearMsg" class="btn btn-primary" onclick="clearMsg()">清空</button>
    </div>
</div>
<%--<div class="container" name="Msg2">--%>
<%--    <div><h3>以下消息是<%=username%>发给<%=Group%>的</h3></div>--%>
<%--    &lt;%&ndash;消息展示框&ndash;%&gt;--%>
<%--    <textarea id="MessShowContent" class="form-control" rows="6" readonly name="MessShow_Content"></textarea>--%>
<%--    <form action="chatAction.jsp" name="chat2">--%>
<%--        <input name="chatInput" placeholder="Msg Input"/>--%>
<%--        <button type="submit" name="btn_chat2"></button>--%>
<%--    </form>--%>
<%--</div>--%>
</body>
</html>
</html>
