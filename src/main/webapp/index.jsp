<%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 2018/4/30
  Time: 下午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #6c757d">
<div class="container jumbotron " style="margin-top: 150px" >
    <div class=" text-center">
        <h1 class=".font-italic" >网络论坛</h1>
    </div>
    <br>
    <br>

    <div class="row">
        <div class="col-sm-4 offset-4" >
            <form class="" action="./loginService" method="post">
                <div class="form-group">
                    <label for="usr">用户名:</label>
                    <input type="text" class="form-control" id="usr" name="username" required>
                    ${nameMessage}
                </div>
                <div class="form-group">
                    <label for="pwd">密码:</label>
                    <input type="password" required class="form-control" id="pwd" name="password" required >
                    ${passwordMessage}
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input"  value="" >记住密码
                    <a href="./register" style="float: right;text-decoration:underline;margin-right: 10px">注册</a>

                    <a href="./forget" style="float: right;margin-right: 10px;text-decoration:underline;">忘记密码</a>

                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-lg form-control" type="submit"  >登陆</button>
                </div>
            </form>
        </div>

    </div>
    <br>
</div>

</body>
</html>

