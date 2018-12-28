<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2018/11/25 0025
  Time: 下午 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <style type="text/css">
        p {
            text-align: center;
        }

        p a{
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        function addTab(menuName,menuUrl,menuIcon) {
            var flag =$("#center").tabs("exists",menuName);
            if (flag){
                $("#center").tabs("select",menuName);
            }else{
                $("#center").tabs("add",{
                    iconCls:menuIcon,
                    title:menuName,
                    href:"${pageContext.request.contextPath}/"+menuUrl, // 一个菜单项 对应一个需要加载的数据页面
                    closable:true,
                });
            }

        }
    </script>

<body class="easyui-layout">

    <%--首部--%>
    <div data-options="region:'north',split:true" style="height:60px;background-color: #8d8d8d">
        <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >校园社团管理系统</div>
        <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">${a}欢迎您：${sessionScope.managerName} &nbsp;
            <a href="${pageContext.request.contextPath}/manager/modifyManager" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/login.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a>
        </div>
    </div>

    <%--左侧菜单栏--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
        <div id="west" class="easyui-accordion" data-options="fit:true">

            <%--用户功能--%>
            <div title="我的信息" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('个人信息','student/personInfo.jsp','icon-help')">个人信息</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('修改个人信息','student/modifyPersonInfo.jsp','icon-help')">修改个人信息</a></p>
            </div>

            <div title="我的社团" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团报名','student/chooseClub.jsp','icon-help')">社团报名</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('已参加社团','student/myClub.jsp','icon-help')">已参加社团</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团活动','student/myActivity.jsp','icon-help')">社团活动</a></p>
            </div>

            <%--管理员功能--%>
            <div title="用户管理" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('学生信息管理','manager/studentList.jsp','icon-help')">学生信息管理</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('管理员管理','manager/managerList.jsp','icon-help')">管理员管理</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('角色管理','role/role.jsp','icon-help')">角色管理</a></p>
            </div>

            <div title="社团管理" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团信息管理','manager/clubList.jsp','icon-help')">社团信息管理</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团报名管理','manager/enrollList.jsp','icon-help')">社团报名管理</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团活动管理','manager/activityList.jsp','icon-help')">社团活动管理</a></p>
            </div>

            <div title="统计管理" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('用户统计','count/stuCount.jsp','icon-help')">用户统计</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团统计','count/clubCount.jsp','icon-help')">社团统计</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('社团活动统计','count/activityCount.jsp','icon-help')">社团活动统计</a></p>
            </div>

            <div title="系统日志管理" data-options="iconCls:'icon-help'" style="padding:10px;">
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('系统操作日志','log/actionLog.jsp','icon-help')">系统操作日志</a></p>
                <p><a class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true" onclick="addTab('系统登录日志','log/loginLog.jsp','icon-help')">系统登录日志</a></p>
            </div>

        </div>
    </div>

    <%--中心内容--%>
    <div data-options="region:'center'">
        <div id="center" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
            <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(${pageContext.request.contextPath}/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
        </div>
    </div>

    <%--底部--%>
    <div data-options="region:'south',split:true" style="height: 40px;background-color: #8d8d8d">
        <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;校园社团管理系统 www.ccms.com</div>
    </div>




</body>
</html>
