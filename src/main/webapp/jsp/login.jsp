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
    <title>校园社团管理系统登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(function(){

            var enCodeFlag=false;

            //点击更换验证码：
            $("#captchaImage").click(function(){//点击更换验证码
                this.src="${pageContext.request.contextPath}/account/createVerifyCode?"+Math.random();
            });

            $("#verifyCode").blur(function(){

                $.ajax({
                    type:"POST",
                    data:"enCode="+$(this).val(),
                    url:"${pageContext.request.contextPath}/account/checkVerifyCode",
                    success:function (res) {
                        if(res=="true"){
                            enCodeFlag=true;
                            $("#result").text("验证通过").css("color","green");
                        }else {
                            enCodeFlag=false;
                            $("#result").text("验证码有误").css("color","red");
                        }
                    }
                });
            });

            //  form 表单提交
            $("#loginForm").bind("submit",function(){
                if(enCodeFlag){
                    return true;
                }else {
                    return false;
                }
            });
        });

    </script>
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
                <form id="loginForm" action="${pageContext.request.contextPath}/account/loginAccount" method="post">
                    <div class="form-group">
                        <label>Account ID</label>
                        <input type="text" class="form-control" id="id" name="id" style="width: 240px"/>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" id="password" name="password" style="width: 240px;" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <label>Verification Code</label>
                        <table>
                            <tr>
                                <td>
                                    <input type="text" id="verifyCode" class="form-control" style="width: 100px;" autocomplete="off"/>
                                </td>
                                <td>
                                    &nbsp;&nbsp;
                                    <img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/account/createVerifyCode" title="点击更换验证码"/>
                                    <span id="result"></span>
                                </td>
                            </tr>
                        </table>
                    </div>

                <div class="checkbox">
                    <label><input type="checkbox" name="rememberMe"/>If Remember Account ?</label>
                </div>
                <button type="submit" class="btn btn-success" style="width: 100px">Login</button>
                </form>
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
