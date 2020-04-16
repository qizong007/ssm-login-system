<%--
  Created by IntelliJ IDEA.
  User: 97845
  Date: 2020/4/13
  Time: 14:46
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
    <title>登录</title>
</head>
<body>
    <div class="modal-dialog" style="margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">用户登录</h4>
            </div>
            <div class="modal-body">
                <form:form modelAttribute="user" action="/user/login" method="post">
                    <div class="form-group">
                        <span class="glyphicon glyphicon-user text-success"></span>&nbsp;用户名<form:input path="username" cssClass="form-control"/><form:errors path="username"></form:errors>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-eye-close text-success"></span>&nbsp;密码<form:password path="password" cssClass="form-control"/><form:errors path="password"></form:errors>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-sunglasses text-success"></span>&nbsp;验证码<input type="text" name="checkcode" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <img src="/user/checkCode" id="checkCode" title="看不清，点击换一张" alt="" width="100" height="32" class="center-block" style="height:43px;cursor:pointer;" onclick="getPic()"/>
                    </div>
                    <div class="form-group" style="text-align: center">
                        <input type="submit" value="登录" class="btn btn-primary"/>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    function getPic(){
        $("#checkCode").attr("src","/user/checkCode?flag="+Math.random());
    };
</script>