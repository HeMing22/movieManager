<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/24 0024
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>添加电影类别</title>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>电影类别添加</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="/type/addType" method="get">
        <div class="form-group">
            <label for="movieType">类别名称</label>
            <input type="text" name="type" class="form-control" id="movieType" required>
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" id="addType" value="添加">
        </div>
    </form>
</div>
</body>
</html>
