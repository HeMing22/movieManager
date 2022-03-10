<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影管理页面</title>
    <link href="/resources/css/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery-3.4.1.js"></script>
    <style>
        #pic_url{
            width: 252px;
            height: 150px;
        }
        #mov_url{
            width: 288px;
            height: 150px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <%--        <div class="col-md-4 column"></div>--%>
            <div class="col-md-4 column"></div>
            <div class="col-md-3 column">
            <div class="page-header">
                <h1>
                    <small>电影列表 ------ 显示电影</small>
                </h1>
            </div>
        </div>
    </div>
</div>

<%--    新增电影    --%>
<div class="row">

    <div class="col-md-4 column">
        <a class="btn btn-primary" href="/movie/getAllMovie">显示全部</a>
        <a class="btn btn-primary" href="/movie/toAddMovie">新增电影</a>
    </div>
    <div class="col-md-5 column">
        <%--     根据名字查询      --%>
        <form class="form-inline" action="/movie/queryMovieByTitle" method="post" style="float:right">
            <input type="text" name="title" class="form-control" placeholder="请输入电影名称" required>
            <input type="submit" value="查询" class="btn btn-primary">
        </form>
    </div>

    <div class="col-md-3 column">
        <%--     根据导演查询      --%>
        <form class="form-inline" action="/movie/queryMovieByAuthor" method="post" style="float:right">
            <input type="text" name="author" class="form-control" placeholder="请输入电影导演" required>
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
                <th>电影名称</th>
                <th>封面</th>
                <th>上映日期</th>
                <th>电影描述</th>
                <th>导演名字</th>
                <th>电影预览</th>
                <th>电影类型</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="movie" items="${movies}">
                <tr>
                    <td>${movie.id}</td>
                    <td>${movie.title}</td>
                    <td>
                        <img src="../upload/${movie.moviecover_url}" id="pic_url"/>
                    </td>

                    <td>
                        <fmt:formatDate value="${movie.create_date}" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${movie.description}</td>
                    <td>${movie.author}</td>
                    <td>

                        <video src="../upload/${movie.movie_link}" controls="controls" id="mov_url">

                        </video>

                    </td>
                    <td>${movie.type}</td>
                    <td>
                        <a href="/movie/deleteMovie?id=${movie.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

