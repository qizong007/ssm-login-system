<%--
  Created by IntelliJ IDEA.
  User: 97845
  Date: 2020/4/13
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<script src="/static/js/jquery/2.0.0/jquery.min.js"></script>
<link href="/static/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="/static/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<head>
    <title>登录成功</title>
</head>
<body>
    <div class="modal-dialog" style="margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">欢迎回来</h4>
            </div>
            <div class="modal-body">
                用户信息：${user.username},${user.age}岁
            </div>
            <div class="modal-body" style="text-align: center">
                <a href="/user/findAll" class="btn btn-info">点我查水表</a>
            </div>
        </div>
    </div>
</body>
</html>
