<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/16 0016
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="/resources/css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/js/jquery-3.4.1.js"></script>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>信息管理主页面</title>
    <style>
        #fr{
            width: 100%;
            height:100%;
        }

        #userInfo{
            padding-top: 20px;
            font-size: 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">电影后管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a id="movie" href="">电影管理</a></li>
                <li><a id="type" href="">电影类别管理</a></li>
                <li ><a id="news" href="">新闻管理</a></li>
                <li><a id="user" href="">用户管理 <span class="sr-only">(current)</span></a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                   <span class="glyphicon glyphicon-user text-muted" id="userInfo">
                       欢迎你
                       <a href="/user/queryUserById?id=${user.id}">${user.getNickname()}</a>
                       <a href="/user/logOut">退出登陆</a>
                   </span>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
    <iframe id="fr" src="/movie/getAllMovie" border="0">
    </iframe>

<script>
    alert("${msg}")
    let user = document.getElementById("user");
    let news = document.getElementById("news");
    let movie = document.getElementById("movie");
    let type = document.getElementById("type");
    user.onclick = function (){
        $("#fr").attr('src','/user/getAllUser');
        return false;
    }

    news.onclick = function (){
        $("#fr").attr('src','/news/getAllNews');
        return false;
    }
    movie.onclick = function (){
        $("#fr").attr('src','/movie/getAllMovie');
        return false;
    }
    type.onclick = function (){
        $("#fr").attr('src','/type/getAllType');
        return false;
    }
</script>

</body>
</html>
