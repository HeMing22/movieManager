<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>添加新闻</title>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新闻信息添加</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="/news/addNews" method="get">
        <div class="form-group">
            <label for="newsTitle">新闻标题:</label>
            <input type="text" name="title" class="form-control" id="newsTitle" required>
        </div>

        <div class="form-group">
            <label for="createDate">发表时间:</label>
            <input type="date" name="create_date" class="form-control" id="createDate" required>
        </div>

        <div class="form-group">
            <label for="newsContent">新闻内容:</label>
            <textarea type="text" name="content" class="form-control"  row="10" id="newsContent" required></textarea>
        </div>

        <div class="form-group">
            <label for="newsAuthor">新闻作者:</label>
            <input type="text" name="author" class="form-control"  id="newsAuthor" required>
        </div>

        <div class="form-group">
            <label for="newsTag">新闻分类:</label>
            <input type="text" name="tag" class="form-control" id="newsTag" required>
        </div>

        <div class="form-group">
            <input type="submit" class="form-control" id="addNews" value="添加">
        </div>
    </form>

</div>
</body>
</html>
