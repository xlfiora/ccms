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
<body style="background-color: #dddddd">
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
                    <strong>学生社团</strong> 是指学生在自愿基础上结成的各种群众性文化、艺术、学术团体。不分年级、系科甚至学校的界限，由兴趣爱好相近的同学组成。在保证学生完成学习任务和不影响学校正常教学秩序的前提下开展各种活动。
                </p>
                <p>
                    <strong>大学生社团</strong> 是我国校园文化建设的重要载体，是我国高校第二课堂的引领者。每年各社团以其具有思想性、艺术性、知识性、趣味性、多样性的社团生活吸引广大学生积极参与其中。
                </p>
                <p>
                    <strong>创建目的</strong> 是活跃学校学习氛围，提高学生自治能力，丰富课余生活；交流思想，切磋技艺，互相启迪，增进友谊。种类很多，如各种学术、社会问题研究会，文艺社、棋艺社、影视评论社、摄影社、美工社、篆刻社、歌咏队、剧团、篮球队、足球队、信息社等。
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
