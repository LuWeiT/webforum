<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 2018/5/1
  Time: 下午7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

    <script>

        function check() {
            var p1 = document.getElementById("psw1");
            var p2 = document.getElementById("psw2");
            if (p1.value != p2.value) {
                document.getElementById("label").style.display="inline";
                document.getElementById("register").disabled="true";
            }else{
                document.getElementById("label").style.display="none";
                document.getElementById("register").removeAttribute("disabled");
            }

        }

    </script>
</head>
<body style="background-color: #6c757d">
<div class="container jumbotron " style="margin-top: 50px">
    <div class=" text-center">
        <h1 class=".font-italic" >欢迎注册</h1>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-sm-4 offset-4" >
            <form class="" name="form"  action="./registerService" method="post" id="form">
                <div class="form-group">
                    <label for="usr">用户名:</label>
                    <input type="text" class="form-control" id="usr" name="name"
                           required
                            value="${user.name}">
                   ${message}
                </div>
                <div class="form-group">
                    <label for="psw1">密码:</label>
                    <input type="password" class="form-control" name="password" id="psw1" required pattern="[0-9]+" value="${user.password}">
                </div>
                <div class="form-group">
                    <label for="psw2">重复密码:</label>
                    <input type="password" class="form-control" value="${user.password}" name="psw2" id="psw2"   onblur="check()" >
                    <label style="display: none;font-size: 10px;color:red;" id="label" >密码不一致，请重新输入</label>
                </div>
                <div class="form-group">
                    <label for="email">邮箱:</label>
                    <input type="email" class="form-control" name="emil" id="email" value="${user.emil}">
                </div>
                <br>
                <br>
                <input class="btn btn-info btn-lg col-12" type="submit" value="注册" id="register" disabled="disabled"/>

            </form>
        </div>

    </div>
    <br>
</div>
</body>
</html>
