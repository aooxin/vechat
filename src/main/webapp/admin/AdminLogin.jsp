<%--
  Created by IntelliJ IDEA.
  User: auswitz
  Date: 2021/12/27
  Time: 下午8:24
  Admin登录
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-3.6.0.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js"></script>
    <style>
        #content {
            background-color: rgba(255, 255, 255, 0.95);
            width: 420px;
            height: 300px;
            border: 1px solid #a2a2a2;
            border-radius: 6px;
            padding: 10px;
            margin-top: 15%;
            margin-left: auto;
            margin-right: auto;
            display: block;
        }
    </style>

</head>
<body>
<div id="content">
    <h3>Admin Login</h3>
    <form id="AdminLogin_form" name="AdminLoginForm" method="post" action="AdminLoginCheck.jsp">
        <div class="mb-3">
            <label for="AdminName" class="form-label">Admin</label>
            <input class="form-control" id="AdminName" name="AdminName" aria-describedby="emailHelp">
            <div id="alert" class="form-text">Please use admin`s username.</div>
        </div>
        <div class="mb-3">
            <label for="AdminPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="AdminPassword" name="AdminPassword">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>