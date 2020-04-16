<%--
  Created by IntelliJ IDEA.
  User: 97845
  Date: 2020/4/14
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<script src="/static/js/jquery/2.0.0/jquery.min.js"></script>
<link href="/static/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="/static/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<head>
    <title>个人信息</title>
</head>
<body>
<div class="modal-dialog" style="margin-top: 10%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title text-center">用户信息</h4>
        </div>
        <div class="modal-body">
            <form:form modelAttribute="foundUser" action="/user/update" method="post">
                <div class="form-group">
                    <span class="glyphicon glyphicon-user text-success"></span>&nbsp;ID<input type="text" name="id" class="form-control" value="${foundUser.id}" readonly/>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-user text-success"></span>&nbsp;用户名(禁止更改)<input type="text" name="username" class="form-control" value="${foundUser.username}" readonly/>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-eye-close text-success"></span>&nbsp;密码<input type="text" name="password" class="form-control" value="${foundUser.password}"/>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-pencil text-success"></span>&nbsp;年龄<input type="text" name="age" class="form-control" value="${foundUser.age}"/>
                </div>
                <div class="form-group" style="text-align: center">
                    <input type="submit" value="提交更改" class="btn btn-primary"/>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
