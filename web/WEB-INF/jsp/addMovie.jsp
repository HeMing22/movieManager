<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/jquery-3.4.1.js"></script>
    <title>添加电影</title>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>电影信息添加</small>
                </h1>
            </div>
        </div>
    </div>

    <form  enctype="multipart/form-data" method="post" id="addMovie">
        <div class="form-group">
            <label for="movieTitle">电影名称:</label>
            <input type="text" name="title" class="form-control" id="movieTitle" required>
        </div>

<%--   name 已经修改     --%>

        <div class="form-group">
            <label for="coverUrl">封面地址:</label>
            <input type="file" name="pic_url" class="form-control" id="coverUrl" required>
        </div>

        <div class="form-group">
            <label for="createDate">上映日期:</label>
            <input type="date" name="create_date" class="form-control" id="createDate" required>
        </div>

        <div class="form-group">
            <label for="movieDescription">电影描述:</label>
            <input type="text" name="description" class="form-control" id="movieDescription" required>
        </div>

        <div class="form-group">
            <label for="movieAuthor">电影导演:</label>
            <input type="text" name="author" class="form-control" id="movieAuthor" required>
        </div>

<%--   name 已经修改     --%>
        <div class="form-group">
            <label for="movieUrl">电影地址:</label>
            <input type="file" name="mov_url" class="form-control" id="movieUrl" required>
        </div>

        <div class="form-group">
<%--            <label for="movieType">电影类型:</label>--%>
<%--            <input type="text" name="type" class="form-control" id="movieType" required>--%>

            <select id="movieType" class="form-control">
                <c:forEach var="type" items="${typeList}">
                    <option selected value="${type.type}">
                        ${type.type}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <input type="submit" class="form-control" id="btnSubmit" value="新增">
        </div>
    </form>
</div>
<script type="text/javascript">

    $("#btnSubmit").click(function(){
        let movieTitle = $("#movieTitle").val();
        let coverUrl = $("#coverUrl")[0].files[0];
        let createDate = $("#createDate").val();
        let movieDescription = $("#movieDescription").val();
        let movieAuthor = $("#movieAuthor").val();
        let movieUrl =$("#movieUrl")[0].files[0];
        let movieType = $("#movieType option:selected").val();
        let movie = new FormData();
        movie.append("title",movieTitle)
        movie.append("pic_url",coverUrl)
        movie.append("create_date",createDate)
        movie.append("description",movieDescription)
        movie.append("author",movieAuthor)
        movie.append("mov_url",movieUrl)
        movie.append("type",movieType)

        console.log(movie)
        $.ajax({
            url:"/movie/addMovie",
            type:"POST",
            contentType:false,
            processData:false,
            cache:false,
            data:movie,
            dataType:"json",
            success:function (res){
                if(res === 1){
                    alert("添加成功")
                    window.location.href="http://localhost:8080/movie/getAllMovie";
                }else{
                    alert("添加失败")
                    window.location.href="http://localhost:8080/movie/addMovie";
                }
            }
        });
        return false;
    });
</script>
</body>
</html>
