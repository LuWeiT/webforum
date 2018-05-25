<%@ page import="java.util.List" %>
<%@ page import="model.PostTable" %>
<%@ page import="model.PostTableWithBLOBs" %><%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 2018/4/30
  Time: 下午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>welcome</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<nav class="navbar fixed-top navbar-inverse navbar-fixed-top" role="navigation" style="height: 80px">

    <div class="container-fluid" style="font-size: 25px">
        <div class="navbar-header" style="padding-top: 10px">
            <button type="button" class="navbar-toggle navbar-inverse navbar-right" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./index" style="font-size: 25px;">主页</a>
        </div>
        <div class="collapse navbar-collapse navbar-inverse" id="example-navbar-collapse">
            <ul class="nav navbar-nav" style="padding-top: 10px">
                <li>
                    <%
                        String name = (String) session.getAttribute("user_name");
                        if (name != null && name != "null") {
                    %>
                    <a  href="#" data-toggle="modal" data-target="#myModal">发帖</a>
                    <%
                        }
                    %>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right" style="padding-top: 10px">

                <%

                    if(name!=null&&name!="null"){
                        %>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                <%=name%></a></li>
                <li><a href="./cancel"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
                <%
                    }else{
                        %>
                <li><a href="./register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="./login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    发帖
                </h4>
            </div>
            <form action="./AddPost" name="add" method="post">
            <div class="modal-body">
                    <div class="form-group">
                        <label>Title:</label>
                        <input type="text" class="form-control" name="title"/>
                        <br>
                        <label>Content:</label>
                        <textarea name="content" id=""  rows="10" class="form-control" ></textarea>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭
                </button>
                <button type="submit" class="btn btn-primary"  >
                    提交更改
                </button>
            </div>
            </form>
        </div>
    </div>
</div>
<body style="background-color: #6c757d">
<div style="height: 90px"></div>
<div class="container-fluid" style="height: 1000px">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 jumbotron" style="padding: 0px;">
            <%
                List<PostTable> postlist=(List<PostTable>)request.getAttribute("postList");
                List<PostTableWithBLOBs> postBLOB=(List<PostTableWithBLOBs>)request.getAttribute("postBLOB");
                if (postlist!=null&&postlist.size()!=0){
                for (int i=postlist.size()-1;i>=0;i--) {
                    %>

            <div class="" style="height: 100px;margin:10px">
                <div class="form-inline">
                    <label style="font-size: 13px"><span class="glyphicon glyphicon-user"></span> <%=postlist.get(i).getUsername()%></label>
                    <span class="badge pull-right"><%=postlist.get(i).getReplaynumber()%></span>
                </div>
                <div class="" style="font-size: 20px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                    <a href="./content?post_id=<%=postlist.get(i).getId()%>" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                        <%=postBLOB.get(i).getTitle()%>
                    </a>
                </div>
                <div class=""
                     style="font-size: 15px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;margin-top: 5px">
                    <div style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                        <%=postBLOB.get(i).getContent()%>
                    </div>
                </div>
                <span style="float: right;"><%=postBLOB.get(i).getTime()%> </span>
            </div>


<%
                    if(i!=0){
                        %> <hr style="margin: 0px;"><%
                    }
                }
            }
            %>
        </div>
    </div>
</div>
</body>
</html>
