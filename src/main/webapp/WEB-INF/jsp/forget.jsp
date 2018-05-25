<%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 2018/5/24
  Time: 下午4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>密码重置</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<script>

    function getCode(){
            $.get("./emailCode?email="+document.getElementById("email").value,function(data) {
                    alert(data);
                }
            );
    }

</script>
</head>
<body style="background-color: #6c757d">
<div id="message"></div>
<div class="container jumbotron " style="margin-top: 50px">
    <div class=" text-center">
        <h1 class=".font-italic" >忘记密码</h1>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-sm-4 offset-4" >
            <form >
                <div class="form-group">
                    <label >邮箱:</label>
                    <input type="text" class="form-control" id="email" name="email" form="form"
                           required
                    >
                </div>
            </form>
                <div class="form-group">
                    <label >验证码:</label>
                    <button onclick="getCode()" class="btn" style="text-decoration:underline;float: right" id="getCode">获取验证码</button>
                </div>


            <form name="form" action="./changePassword" method="post" id="form">
                <div class="form-group">
                    <input class="form-control" name="code" id="code"/>
                </div>

                <div class="form-group">
                    <label>新密码:</label>
                    <input type="text" class="form-control" name="password" id="password ">
                </div>
                <br>
                <br>
                <input class="btn btn-info btn-lg col-12" type="submit" value="重置" id="register" />

            </form>
        </div>
    </div>
    <br>

</div>
</body>
</html>
