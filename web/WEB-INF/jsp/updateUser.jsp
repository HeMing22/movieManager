<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/17 0017
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>用户信息修改</title>
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改用户</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="/user/updateUser" method="get">

        <input type="hidden" name="id" value="${user.id}"/>
        <div class="form-group">
            <label for="nName">用户昵称:</label>
            <input type="text" name="nickname" class="form-control" value="${user.nickname}" id="nName" required>
        </div>

        <div class="form-group">
            <label for="uname">用户账号:</label>
            <input type="text" name="username" class="form-control" value="${user.username}" id="uname" required>
        </div>

        <div class="form-group">
            <label for="uPwd">用户密码:</label>
            <input type="password" name="password" class="form-control" value="${user.password}" id="uPwd" required>
        </div>

        <div class="form-group">
            <label for="uEmail">用户邮箱:</label>
            <input type="email" name="email" class="form-control" value="${user.email}" id="uEmail" required>
        </div>

        <div class="form-group">
            <label for="cDate">创建日期:</label>
            <input type="date" name="create_date" class="form-control" value="${user.create_date}" id="cDate" required>
        </div>

        <div class="form-group">
            <input type="submit" class="form-control" id="upUser" value="修改">
        </div>
    </form>

</div>
    <script>
        document.getElementById("cDate").valueAsDate = new Date("${user.create_date}");
    </script>
</body>
</html>
