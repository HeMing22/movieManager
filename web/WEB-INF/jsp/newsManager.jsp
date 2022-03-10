<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻管理页面</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery-3.4.1.js"></script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
<%--        <div class="col-md-4 column"></div>--%>
    <div class="col-md-4 column"></div>

    <div class="col-md-3 column">
            <div class="page-header">
                <h1>
                    <small>新闻列表 ------ 显示新闻</small>
                </h1>
            </div>
        </div>
    </div>
</div>

<%--    新增新闻    --%>
<div class="row">

    <div class="col-md-4 column">
        <a class="btn btn-primary" href="/news/getAllNews">显示全部</a>
        <a class="btn btn-primary" href="/news/toAddNews">新增新闻</a>
    </div>
    <div class="col-md-5 column">
        <%--     查询      --%>
        <form class="form-inline" action="/news/queryNewsByTitle" method="post" style="float:right">
            <input type="text" name="title" class="form-control" placeholder="请输入新闻标题" required>
            <input type="submit" value="查询" class="btn btn-primary">
        </form>
    </div>
    <div class="col-md-3 column">
        <%--     查询      --%>
        <form class="form-inline" action="/news/queryNewsByAuthor" method="post" style="float:right">
            <input type="text" name="author" class="form-control" placeholder="请输入新闻作者" required>
            <input type="submit" value="查询" class="btn btn-primary">
        </form>
    </div>
</div>

<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>新闻标题</th>
                <th>发表日期</th>
                <th>新闻内容</th>
                <th>新闻作者</th>
                <th>新闻分类</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="news" items="${newsList}">
                <tr>
                    <td>${news.id}</td>
                    <td>${news.title}</td>
                    <td>
                        <fmt:formatDate value="${news.create_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${news.content}</td>
                    <td>${news.author}</td>
                    <td>${news.tag}</td>
                    <td>
                        <a href="/news/toUpdateNews?id=${news.id}">修改</a>
                        &nbsp;|&nbsp;
                        <a href="/news/deleteNews?id=${news.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
