<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/23
  Time: 下午3:48
  尝试对页面进行布局
  这个页面将作为最终的聊天页面//QAQ忽略命名
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.goeasy.io/goeasy-2.2.2.min.js"></script>
    <style>
        .footer {

            position: fixed;

            bottom: 0;
        }
    </style>
    <script type="text/javascript">
        var goeasy = GoEasy.getInstance({
            host: "hangzhou.goeasy.io",  //若是新加坡区域：singapore.goeasy.io
            appkey: "BC-8b85b22cbb814784ba4e44521a9b5d12",
            modules: ['pubsub']//根据需要，传入‘pubsub’或'im’，或数组方式同时传入
        });
        //用javascript连接数据库

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
        %>
        const pubsub = goeasy.pubsub;
        pubsub.subscribe({
            channel: "456",//替换为您自己的channel
            onMessage: function (message) {
                console.log("Channel:" + message.channel + " content:" + message.content);
                let chatMessage = JSON.parse(message.content); //解析拿到的json
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
            let group = '456';
            let messageContent = document.getElementById("MessContent").value;
            let x =<%=username%>;
            //发送的包
            let sendToGroup = group
            let message = {
                content: messageContent,
                senderUserId: "<%=username%>", //发送人
                sendToGroup: group //发送到的群组
            };
            pubsub.publish({
                channel: group,//要发送到的群聊
                message: JSON.stringify(message),//替换为您想要发送的消息内容
                onSuccess: function () {
                    console.log("消息发布成功。");
                },
                onFailed: function (error) {
                    console.log("消息发送失败，错误编码：" + error.code + " 错误信息：" + error.content);
                }
            });
            $("#MessContent").val("");
        }

        function doSQL() {

        }

        // 展示收到的消息
        function showMess(msg) {
            let message = JSON.parse(JSON.stringify(msg));
            <%--let BeforeMsg=<%=session.getAttribute("showContent")%>;--%>
            // document.getElementById("MessShowContent").append(BeforeMsg);
            let mess = message.senderUserId + ": " + message.content;
            document.getElementById("MessShowContent").append(mess);
            document.getElementById("MessShowContent").append("\n");
            // 将消息存入数据库部分,这部分太离谱了。。。。留着不删了，以后看到可以想起这个愚蠢的bug
            <%--引入数据库bean--%>
            <%--            <%--%>
            <%--            //获取 QAQ觉得这个写法好愚蠢，但是没有想到什么其他写法2021.12.23 23：15--%>
            <%--            String senderUserId=new String();--%>
            <%--            String sendToGroup=new String();--%>
            <%--            %>--%>
            <%--            <%=senderUserId%> = message.senderUserId--%>
            <%--                <%=sendToGroup%> = message.sendToGroup--%>
            <%--            <jsp:useBean id="db" class="com.example.webdemo.DbBean" scope="page"/>--%>
            <%--            <%--%>
            <%--            Date date = new Date();--%>
            <%--            Timestamp time = new Timestamp(date.getTime());--%>
            <%--            String sql = "insert into group_message (ID,G_ID,message_content,mess_time) values (" + senderUserId + "," + sendToGroup + "," + '"' + "helloWorld" + '"' + "," + '"' + time + '"' + ")";--%>
            <%--            String sql_add = "update wechat_group set mess_num=mess_num+1 where group_id="+sendToGroup;--%>
            <%--            db.execQuery(sql);//运行上面的语句--%>
            <%--            db.execQuery(sql_add);--%>
            <%--            %>--%>
            //把信息传给后端页面
            <%--let date = <%=username%>;--%>
            <%--$.ajax({url: "actionDic/Group_Contacts_Action.jsp", type: "post", data: ""});--%>
        }

        function clearMsg() {
            $("#MessShowContent").val("");
        }

        function reLogin() {

        }

        let group_selected;

        //用于选择群聊的函数
        function chooseGroup(x) {
            switch (x) {
                case 1:
                    group_selected = "群聊1"
                    document.getElementById("group_selected_h3").innerHTML("以下消息是<%=username%>发给的")
                    break;
                case 2:
                    document.getElementById("group_selected_h3").innerText("以下消息是sss<%=username%>发给的")
                    break;
                case 3:
                    break;
                case 4:
                    break;
                default :
            }
        }
    </script>
</head>
<body>
<%--菜单栏--%>
<div class="container-fluid shadow-sm">
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
                        <a class="nav-link " href="#">用户信息</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">联系人</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">群</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>

            </div>
        </div>
    </nav>
</div>
<div style="height: 10px">

</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-1 shadow-sm">
            还没想好这里放什么~_~
        </div>
        <div class="col-2 shadow-sm">

            <div>
                <h5 class="card-header text-secondary">所有群聊</h5>
            </div>

            <div>
                <div class="list-group" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-bs-toggle="list"
                       onclick="chooseGroup(1)"
                       role="tab">群聊1</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" role="tab"
                       onclick="chooseGroup(2)">群聊2</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" role="tab"
                       onclick="chooseGroup(3)">群聊3</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" role="tab"
                       onclick="chooseGroup(4)">群聊4</a>
                </div>
                <div class="footer">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <script>
                    // 对上述切换的响应
                    var firstTabEl = document.querySelector('#myTab a:last-child')
                    var firstTab = new bootstrap.Tab(firstTabEl)
                    firstTab.show()
                </script>
            </div>
        </div>
        <%--最重要的部分--%>
        <div class="col-8 shadow-sm">
            <%--消息展示框--%>
            <div><h3 id="group_selected_h3">以下消息是<%=username%>发给的</h3></div>
            <%--消息展示框--%>
            <form action="actionDic/Group_Contacts_Action.jsp" id="MessInputFrom" name="MessInputFromName"
                  method="post">
            <textarea id="MessShowContent" class="form-control" readonly
                      style="height: 450px;background-color: white"></textarea>
                <div>
                    <%--输入框--%>
                    <div class="progress" style="height: 1px;">
                        <div class="progress-bar progress-bar-animated" role="progressbar" style="width: 25%;"
                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>

                    <textarea type="text" id="MessContent" class="form-control" rows="2"
                              name="MessContentInput"></textarea>
                    <%--提交按钮--%>
                    <button id="sendMsg" type="submit" class="btn btn-primary" name="btn_sendMsg"
                            onclick="sendMessage()">发送
                    </button>
                    <button id="clearMsg" class="btn btn-primary" onclick="clearMsg()" disabled>清空</button>
                </div>
            </form>
        </div>

        <%--成员列表--%>
        <div class="col-1 shadow-sm">
            <div>
                <h5 class="card-header text-secondary">成员</h5>
            </div>
            <div class="list-group" id="myList2" role="tablist">
                <a class="list-group-item list-group-item-action active" data-bs-toggle="list" href="#home" role="tab">小明</a>
                <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#profile"
                   role="tab">小李</a>
                <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#messages"
                   role="tab">小王</a>
                <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#settings"
                   role="tab">小华</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
