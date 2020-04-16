<%--
  Created by IntelliJ IDEA.
  User: 97845
  Date: 2020/4/13
  Time: 16:04
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
    <title>注册</title>
</head>
<body>
<div class="modal-dialog" style="margin-top: 10%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title text-center">注册</h4>
        </div>
        <div class="modal-body">
            <form:form modelAttribute="user" action="/user/register" method="post">
                <div class="form-group">
                    <span class="glyphicon glyphicon-user text-success"></span>&nbsp;用户名<form:input path="username" cssClass="form-control"/><form:errors path="username"></form:errors>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-eye-close text-success"></span>&nbsp;密码<form:password path="password" cssClass="form-control"/><form:errors path="password"></form:errors>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-repeat text-success"></span>&nbsp;确认密码<input type="password" name="checkedPassword" class="form-control"/>
                </div>
                <div class="form-group">
                    <span class="glyphicon glyphicon-pencil text-success"></span>&nbsp;年龄<input type="text" name="age" class="form-control"/>
                </div>
                <div class="form-group" style="text-align: center">
                    <input type="submit" value="注册" class="btn btn-primary"/>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
