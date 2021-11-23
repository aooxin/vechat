<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/11/23
  Time: 下午3:48
  尝试对页面进行布局
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%--菜单栏--%>
<div class="container-fluid">
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
                <button type="button" class="btn btn-link" disabled>重新登录</button>
            </div>
        </div>
    </nav>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-1">
            ddd
        </div>
        <div class="col-2">
            <div>
                <h5 class="card-header">所有群聊</h5>
            </div>
            <div>
                <div class="list-group" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-bs-toggle="list" href="#home"
                       role="tab">群聊1</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#profile" role="tab">群聊2</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#messages" role="tab">群聊3</a>
                    <a class="list-group-item list-group-item-action" data-bs-toggle="list" href="#settings" role="tab">群聊4</a>
                </div>

                <div class="tab-content">
                    <div class="tab-pane active" id="home" role="tabpanel">..1.</div>
                    <div class="tab-pane" id="profile" role="tabpanel">..2.</div>
                    <div class="tab-pane" id="messages" role="tabpanel">..3.</div>
                    <div class="tab-pane" id="settings" role="tabpanel">..4.</div>
                </div>
                <script>
                    // 对上述切换的响应
                    var firstTabEl = document.querySelector('#myTab a:last-child')
                    var firstTab = new bootstrap.Tab(firstTabEl)
                    firstTab.show()
                </script>
            </div>
        </div>
        <div class="col-8">
            <%--消息展示框--%>
            <div><h3>以下消息是发给群聊1的</h3></div>
            <%--消息展示框--%>
            <textarea id="MessShowContent" class="form-control" readonly
                      style="height: 450px;background-color: white"></textarea>
            <div>
                <%--输入框--%>
                <div class="progress" style="height: 1px;">
                    <div class="progress-bar progress-bar-animated" role="progressbar" style="width: 25%;"
                         aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <textarea id="MessContent" class="form-control" rows="2"></textarea>
                <%--提交按钮--%>

                <button id="sendMsg" class="btn btn-primary" onclick="sendMessage()">发送</button>
                <button id="clearMsg" class="btn btn-primary" onclick="clearMsg()" disabled>清空</button>
            </div>
        </div>
        <div class="col-1">
            ads
        </div>
    </div>
</div>
</body>
</html>
