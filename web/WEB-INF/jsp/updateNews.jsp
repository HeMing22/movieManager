<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>修改新闻</title>
</head>
<body>
<div class="container">

    <%-- bootStrap 栅格布局   --%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新闻信息修改</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="/news/updateNews" method="get">
        <input type="hidden" name="id" value="${news.id}"/>

        <div class="form-group">
            <label for="newsTitle">新闻标题:</label>
            <input type="text" name="title" value="${news.title}" class="form-control" id="newsTitle" required>
        </div>

        <div class="form-group">
            <label for="createDate">发表时间:</label>
            <input type="date" name="create_date" value="${news.create_date}"  class="form-control" id="createDate" required>
        </div>

        <div class="form-group">
            <label for="newsContent">新闻内容:</label>
            <textarea type="text" name="content" class="form-control"    id="newsContent" required>${news.content}</textarea>
        </div>

        <div class="form-group">
            <label for="newsAuthor">新闻作者:</label>
            <input type="text" name="author" class="form-control"  value="${news.author}" id="newsAuthor" required>
        </div>

        <div class="form-group">
            <label for="newsTag">新闻分类:</label>
            <input type="text" name="tag" class="form-control" value="${news.tag}" id="newsTag" required>
        </div>

        <div class="form-group">
            <input type="submit" class="form-control" id="addNews" value="修改">
        </div>
    </form>
</div>
<script>
        document.getElementById("createDate").valueAsDate = new Date("${news.create_date}");
</script>
</body>
</html>

