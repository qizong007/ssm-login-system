<%--
  Created by IntelliJ IDEA.
  User: 97845
  Date: 2020/4/14
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="/static/js/jquery/2.0.0/jquery.min.js"></script>
<link href="/static/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="/static/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<head>
    <title>用户数据</title>
</head>
<body>
    <h2 class="text-center">水表</h2>
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
            <th>ID</th>
            <th>用户名</th>
            <th>密码</th>
            <th>年龄</th>
            <th>删除</th>
            <th>更改</th>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.age}</td>
                <td><a href="/user/delete?id=${user.id}" class="btn btn-primary">爬</a></td>
                <td><a href="/user/findByName?username=${user.username}" class="btn btn-primary">改</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
