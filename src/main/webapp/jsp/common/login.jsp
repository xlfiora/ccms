<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/29
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column" style="margin-top: 30px">
                <h1 class="text-center" style="font-family: Microsoft YaHei;font-weight: 900;">
                    校园社团管理系统
                </h1>
            </div>
        </div>
        <div class="row clearfix" style="margin-top: 80px">
            <div class="col-md-1 column">
            </div>
            <div class="col-md-4 column">
                <p>
                    <em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong> 编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small> 社区中。
                </p>
                <p>
                    <em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong> 编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small> 社区中。
                </p>
                <p>
                    <em>Git</em> 是一个分布式的版本控制系统，最初由 <strong>Linus Torvalds</strong> 编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在 <small>Ruby</small> 社区中。
                </p>
            </div>
            <div class="col-md-2 column">
            </div>
            <div class="col-md-4 column">
                <form role="form">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" style="width: 240px"/>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" style="width: 240px;"/>
                    </div>
                    <div class="form-group">
                        <label for="vcode">Verification Code</label>
                        <div>
                        <input type="text" class="form-control" id="vcode" style="width: 100px;"/>
                        <img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/manager/createVaildateCode" title="点击更换验证码"/>
                        </div>
                    </div>
                </form>
                <div class="checkbox">
                    <label><input type="checkbox" />Remember Account</label>
                </div>
                <button type="submit" class="btn btn-success" style="width: 100px">Login</button>

            </div>
            <div class="col-md-1 column">
            </div>
        </div>
        <div class="row clearfix" style="margin-top: 80px">
            <div class="col-md-12 column">
                <p style="text-align: center">
                    <em>&copy;校园社团管理系统 www.ccms.com</em>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
