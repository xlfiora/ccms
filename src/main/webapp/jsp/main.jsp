<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2018/11/25 0025
  Time: 下午 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>校园社团管理系统主页</title>
</head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <style type="text/css">
        #west p {
            text-align: center;
        }

        #west p a{
            width: 100%;
        }



        #inner img {
            width:300px;
            height:400px;
            float:left;
        }
        #outer {
            margin-top: 50px;
            margin:auto;
            width:900px;
            height:400px;
            border:2px solid #52d689;
            overflow:hidden;
            /*把多余的部分隐藏掉*/
        }
        #inner {
            width:3000px;
            height:400px;
        }
        #inner div {
            float:left;
        }

    </style>
    <script type="text/javascript">

        $(function () {

            //修改学生信息
            $("#modify_password").linkbutton({
                onClick:function(){

                    $("#main_dd").dialog({
                        title: '修改密码',
                        width:300,
                        height:200,
                        modal: true,
                        href:"${pageContext.request.contextPath}/jsp/account/modifyPassword.jsp", //包含子页面
                    });
                },
            });


        })



        function addTab(menuName,menuUrl,menuIcon) {
            var flag =$("#center").tabs("exists",menuName);
            if (flag){
                $("#center").tabs("select",menuName);
            }else{
                $("#center").tabs("add",{
                    iconCls:menuIcon,
                    title:menuName,
                    href:"${pageContext.request.contextPath}/jsp/"+menuUrl, // 一个菜单项 对应一个需要加载的数据页面
                    closable:true,
                });
            }

        }


        //定义变量初值
        var dOuter = null;
        var demo1 = null;
        var demo2 = null;
        var timer = null;
        //绑定事件
        window.onload = function() {
            dOuter = document.getElementById('outer');
            demo1 = document.getElementById('demo1');
            demo2 = document.getElementById('demo2');
            demo2.innerHTML = demo1.innerHTML;
            //			timer=setInterval(moveLeft,10);
            clock();
            //绑定鼠标
            dOuter.onmouseover = function() {
                clearInterval(timer);
            }
            dOuter.onmouseout = function() {
                //				timer=setInterval(moveLeft,10);
                clock()
            }
        }

        //重新定义一个函数
        function clock() {
            clearInterval(timer);
            timer = setInterval(moveLeft, 10);
        }

        function clock2() {
            clearInterval(timer);
            timer = setInterval(moveRight, 10);
        }

        //计时器函数
        function moveLeft() {
            //容器向左滚动的距离
            dOuter.scrollLeft += 1;
            //判断临界值
            if (dOuter.scrollLeft >= demo1.offsetWidth) {
                dOuter.scrollLeft = 0;
            }

            //每一幅图停顿一次
            if (dOuter.scrollLeft % 300 == 0) {
                clearInterval(timer);
                timer = setTimeout(clock, 1500);
            }
        }
        //向右
        function moveRight() {
            //容器向右滚动的距离
            dOuter.scrollLeft -= 1;
            //判断临界值
            if (dOuter.scrollLeft <= 0) {
                dOuter.scrollLeft = demo1.offsetWidth;
            }
            //每一幅图停顿一次
            if (dOuter.scrollLeft % 300 == 0) {
                clearInterval(timer);
                timer = setTimeout(clock2, 1500);
            }
        }
    </script>

<body class="easyui-layout">

    <%--首部--%>
    <div data-options="region:'north',split:false" style="height:50px;background-color: #8d8d8d">
        <div style="font-size: 28px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >校园社团管理系统</div>
        <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 500px;float:right;padding-top:15px">欢迎您：${sessionScope.account.username} &nbsp;
            <a id="modify_password" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/jsp/login.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a>
        </div>
    </div>

    <%--左侧菜单栏--%>
    <div data-options="region:'west',title:'导航菜单',split:false" style="width:220px;">
        <div id="west" class="easyui-accordion" data-options="fit:false">

            <shiro:hasRole name="user">
            <%--用户功能--%>
            <div title="我的信息" data-options="iconCls:'icon-user'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-vcard',plain:true" onclick="addTab('个人信息','student/myInfo.jsp','icon-vcard')">个人信息</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-vcard_edit',plain:true" onclick="addTab('修改个人信息','student/modifyMyInfo.jsp','icon-vcard_edit')">修改个人信息</a></p>
            </div>
            </shiro:hasRole>

            <shiro:hasRole name="user">
            <div title="我的社团" data-options="iconCls:'icon-qwe3334343'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-house',plain:true" onclick="addTab('社团报名','club/chooseClub.jsp','icon-house')">社团报名</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-house_go',plain:true" onclick="addTab('我的申请','club/myApply.jsp','icon-house_go')">申请中社团</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-house_link',plain:true" onclick="addTab('已参加社团','club/myClub.jsp','icon-house_link')">已参加社团</a></p>
            </div>
            </shiro:hasRole>

            <%--管理员功能--%>
            <shiro:hasAnyRoles name="admin,root">
            <div title="用户管理" data-options="iconCls:'icon-user_home'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-user_b',plain:true" onclick="addTab('学生信息管理','student/studentList.jsp','icon-user_b')">学生信息管理</a></p>
                <shiro:hasRole name="root">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-user_brown',plain:true" onclick="addTab('管理员管理','manager/managerList.jsp','icon-user_brown')">管理员管理</a></p>
                </shiro:hasRole>
                <shiro:hasRole name="root">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-user_key',plain:true" onclick="addTab('角色管理','role/roleInfoList.jsp','icon-user_key')">角色管理</a></p>
                </shiro:hasRole>
            </div>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="admin,root">
            <div title="社团管理" data-options="iconCls:'icon-sport_soccer'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-home',plain:true" onclick="addTab('社团信息管理','club/clubList.jsp','icon-home')">社团信息管理</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-group_edit',plain:true" onclick="addTab('社团报名管理','club/registerInfoList.jsp','icon-group_edit')">社团报名管理</a></p>
            </div>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="admin,root">
            <div title="统计管理" data-options="iconCls:'icon-graph'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-people',plain:true" onclick="addTab('用户统计','count/accountCount.jsp','icon-people')">用户统计</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-report',plain:true" onclick="addTab('社团统计','count/clubCount.jsp','icon-report')">社团统计</a></p>
            </div>
            </shiro:hasAnyRoles>

            <shiro:hasAnyRoles name="admin,root">
            <div title="系统日志管理" data-options="iconCls:'icon-laptop_disk'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-laptop_edit',plain:true" onclick="addTab('系统操作日志','log/actionLog.jsp','icon-laptop_edit')">系统操作日志</a></p>
                <%--<p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('系统登录日志','log/loginLog.jsp','icon-help')">系统登录日志</a></p>--%>
            </div>
            </shiro:hasAnyRoles>


        </div>
    </div>

    <%--中心内容--%>
    <div data-options="region:'center'">
        <div id="center" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
            <div title="主页" data-options="iconCls:'icon-neighbourhood',">
                <div class="container">

                    <div style="width: 100%;height: 100px;text-align: center">
                        <p style="font-size: 68px;color: #63B8FF;font-family: STHupo;font-weight: 900;">欢迎使用校园社团管理系统</p>
                    </div>

                    <div style="padding-top: 50px">
                        <div id="outer">
                            <div id="inner">
                                <div id="demo1">
                                    <img src="../image/shouye/1.jpg">
                                    <img src="../image/shouye/2.jpg">
                                    <img src="../image/shouye/3.jpg">
                                    <img src="../image/shouye/4.jpg">
                                    <img src="../image/shouye/5.jpg">
                                </div>
                                <div id="demo2">
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>



    <%--底部--%>
    <div data-options="region:'south',split:false" style="height: 25px;background-color: #8d8d8d">
        <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;校园社团管理系统 www.ccms.com</div>
    </div>

    <div id="main_dd"></div>

</body>
</html>
