<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/11/15 0015
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-2.0.0.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登录页面</title>
    <style>


        .login {
            width: 1200px;
            height: 400px;
            position: absolute;
            top: 0px;
            left: 200px;
            right: 0px;
            bottom: 0px;
            margin: auto;
        }

        .login_left {
            width: 400px;
            height: 400px;
            float: left;
            background-color: rgba(240, 255, 255, 0.25);

        }

        .login_right {
            width: 475px;
            height: 400px;
            float: left;
            background-color: white;
        }

        .login_img {
            background-size: cover;
            width: 100%;
            height: auto;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            min-width: 1000px;
            z-index: -10;
            zoom: 1;
            background-color: #fff;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-position: center 0;
        }

        .login_name {
        <%--background:url(${pageContext.request.contextPath}/img) no-repeat 0 0;--%> padding-left: 20px;
            padding-top: 0px;
            padding-bottom: 0px;
            width: 305px;
            height: 28px;
            border: 0;
            border-bottom: #000000 1px solid;
            outline: none;
        }

        .login_pwd {
        <%--background:url(${pageContext.request.contextPath}/img/眼睛_隐藏_o.png) no-repeat 0 0;--%> padding-left: 20px;
            padding-top: 0px;
            padding-bottom: 0px;
            width: 305px;
            height: 28px;
            border: 0;
            border-bottom: #000000 1px solid;
            outline: none;
        }

        #captchaCode{
            padding-left: 20px;
            padding-top: 0px;
            padding-bottom: 0px;
            width: 305px;
            height: 28px;
            border: 0;
            border-bottom: #000000 1px solid;
            outline: none;
        }
        td {
            height: 80px;
            margin: 0 auto;
        }

        .login_table {
            width: 300px;
            height: 300px;
            margin: 58px;
        }

        .login_submit {
            width: 305px;
            margin: 0px 0%;
        }

        h1 {
            text-align: center;
            color: white;
            margin-top: 84px;
        }

        .pwd_show {
            position: absolute;
            top: 180px;
            right: 434px;
            width: 24px;
        }
    </style>

</head>
<body>

<img src="${pageContext.request.contextPath}/resources/img/R-C%20(1).jpg" class="login_img"/>
<div class="login">
    <div class="login_left">
        <h1>Welcome</h1>
        <h1>电影后台管理系统</h1>
    </div>
    <div class="login_right">
        <form action="${pageContext.request.contextPath}/user/login" method="POST">
            <table class="login_table">
                <tr>
                    <td><input type="text" name="username" placeholder="请输入账号" required class="login_name"/></td>
                </tr>
                <tr>
                    <td>
                        <label><img src="${pageContext.request.contextPath}/resources/img/眼睛_隐藏_o.png" class="pwd_show"/></label>
                        <input type="password" name="password" placeholder="请输入密码" required class="login_pwd"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <img id="changeCaptcha" href="" src="/verifyCode/getCaptchaCode"><a href="javascript:changeCaptcha()">看不清，换一张</a>
                        <br><br>
                        <input id="captchaCode" name="verifyCode" placeholder="请输入验证码" required type="text">
                    </td>
                </tr>

                <tr>
                    <td><input type="submit"  value="登录" class="login_submit"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>


<script>
    alert("${msg}");
    let img = document.querySelector('.pwd_show');
    let input = document.querySelector('.login_pwd');
    let flag = 0;
    img.onclick = function changeImg() {
        if (flag == 0) {
            img.src = '${pageContext.request.contextPath}/resources/img/眼睛_隐藏_o.png';
            input.type = 'text';
            flag = 1;
        } else {
            img.src = '${pageContext.request.contextPath}/resources/img/眼睛_显示_o.png';
            input.type = 'password';
            flag = 0;
        }
    }
        //获取验证码图片
        function changeCaptcha() {
            $("#changeCaptcha").attr("src", "/verifyCode/getCaptchaCode");
        }

        //验证输入的验证码,由于在UserController中对验证码进行校验,下面这个请求不再使用
        function checkCaptcha() {
        let captchaCode = $("#captchaCode").val();
        $.ajax({
        type: 'post',
        async: false,
        url: '/verifyCode/checkCaptchaCode',
        data: {"captchaCode": captchaCode},
        success: function (res) {
            if(res === 0){
                alert("验证码验证错误,返回登录")
                }
            }
        });
    }
</script>
</body>
</html>