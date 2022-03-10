<%@ page import="pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/16 0016
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理页面</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery-3.4.1.js"></script>

</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-4 column"></div>
            <div class="col-md-3 column">
                <div class="page-header">
                    <h1>
                        <small>用户列表 ------ 显示用户</small>
                    </h1>
                </div>
            </div>
        </div>
    </div>

    <%--    新增用户    --%>
    <div class="row">
        <div class="col-md-10 column"></div>
        <div class="col-md-2 column">
            <a class="btn btn-primary" href="/user/toAddUser">新增用户</a>
        </div>
    </div>
    <div class="row clearfix">

        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>昵称</th>
                        <th>账号</th>
                        <th>密码</th>
                        <th>邮箱地址</th>
                        <th>创建日期</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.nickname}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.email}</td>
                        <td>
                            <fmt:formatDate value="${user.create_date}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>
                            <a href="/user/toUpdateUser?id=${user.id}">修改</a>
                            &nbsp;|&nbsp;
                            <a href="/user/deleteUser?id=${user.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
