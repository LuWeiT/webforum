<%@ page import="model.PostTable" %>
<%@ page import="model.PostTableWithBLOBs" %>
<%@ page import="model.ReplyTable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %><%--
Created by IntelliJ IDEA.
User: lu
Date: 2018/5/2
Time: 下午12:39
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Content</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
                    <a href="#" data-toggle="modal" data-target="#myModal">发帖</a>
                    <%
                        }
                    %>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right" style="padding-top: 10px">

                <%

                    if (name != null && name != "null") {
                %>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                    <%=name%>
                </a></li>
                <li><a href="./cancel"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
                <%
                } else {
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
                        <textarea name="content" id="" rows="10" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<body style="background-color: #6c757d">
<div style="height: 90px"></div>
<%
    PostTableWithBLOBs post = (PostTableWithBLOBs) request.getAttribute("post");
%>
<div class="container-fluid" style="height: 1000px">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 jumbotron" style="padding: 0px;">
            <div class="row" id="title" style="padding: 10px;">
                <h2 class="col-md-12" style="word-wrap:break-word; word-break:break-all; overflow: hidden;  ">
                    Topic:<%= post.getTitle()%>
                </h2>
            </div>
            <hr style="margin: 0px;">
            <div class="row" style="padding: 10px;">
                <div class="col-md-2 col-sm-2 " style="height: 100px;">
                    <div class="form-group text-center" style="float: left;">
                        <span class="glyphicon glyphicon-user " style="font-size: 60px"></span>
                        <br>
                        <label style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><%=post.getUsername()%>
                        </label>
                    </div>
                </div>
                <div class="col-md-10 col-sm-10 " style="margin-top:10px;">
                    <%= post.getContent()%>
                </div>
            </div>
            <div class="row" style="padding: 10px;">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <label class="" style="float: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=post.getTime()%>
                    </label>
                    <label class="" style="float: right">楼主专属</label>
                </div>
            </div>

            <%
                List<ReplyTable> replylist = (List<ReplyTable>) request.getAttribute("replylist");
                if (replylist.size() != 0) {
                    for (int i = 0; i < replylist.size(); i++) {
            %>
            <hr style="margin: 0px;">
            <div class="row" style="padding: 10px;">
                <div class="col-md-2 col-sm-2" style="height: 100px;">
                    <div class="form-group text-center" style="float: left;">
                        <span class="glyphicon glyphicon-user " style="font-size: 60px"></span>
                        <br>
                        <label style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><%=replylist.get(i).getUsername()%>
                        </label>
                    </div>
                </div>
                <div class="col-md-10 col-sm-10" style="padding: 15px;">
                    <%=replylist.get(i).getReplyContent()%>
                </div>
            </div>
            <div class="row" style="padding: 10px;">
                <div class="col-md-12">
                    <label class="" style="float: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=replylist.get(i).getTime()%></label>
                    <label class="" style="float: right"><%=replylist.get(i).getFloor()%>楼</label>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
    <div style="height: 70px"></div>
    <%--回复--%>
    <%

        if (name != null && name != "null") {
    %>
    <div class="navbar-fixed-bottom" style="background-color: #6c757d;" >
        <h4 class="panel-title " style="margin-left: 20px;margin-bottom: 20px">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseOne" style="font-size: 30px">
                <label class="fa fa-send fa-lg"></label>
            </a>
        </h4>

        <div id="collapseOne" class="panel-collapse collapse " style="margin-bottom: -15px">
            <div class="panel-body">
                <form action="./AddReply" method="post">
                    <textarea class="form-control" rows="10" name="replyContent"></textarea>
                    <button type="submit" class="form-control btn-primary">提交</button>
                    <input type="hidden" value="<%=name%>" name="username"/>
                    <input type="hidden" value="<%=post.getId()%>" name="postId"/>
                    <input type="hidden" value="<%=replylist.size()+1%>" name="floor"/>
                    <input type="hidden" value="<%=new Date()%>" name="time"/>
                </form>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
