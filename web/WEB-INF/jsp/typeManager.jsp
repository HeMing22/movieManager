<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/24 0024
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery-3.4.1.js"></script>
    <title>电影类别管理</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <%--        <div class="col-md-4 column"></div>--%>
        <div class="col-md-3 column"></div>

        <div class="col-md-4 column">
            <div class="page-header">
                <h1>
                    <small>电影类别列表 ------ 显示电影</small>
                </h1>
            </div>
        </div>
    </div>
</div>

<%--    新增类别    --%>
<div class="row">

    <div class="col-md-4 column">
        <a class="btn btn-primary" href="/type/getAllType">显示全部</a>
        <a class="btn btn-primary" href="/type/toAddType">新增类别</a>
    </div>
</div>

<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>电影类别</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="type" items="${types}">
                <tr>
                    <td>${type.id}</td>
                    <td>${type.type}</td>
                    <td>
                        <a href="/type/toUpdateType?id=${type.id}">修改</a>
                        &nbsp;|&nbsp;
                        <a href="/type/deleteTypeById?id=${type.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
