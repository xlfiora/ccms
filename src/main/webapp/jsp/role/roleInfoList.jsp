<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<script type="text/javascript">
    $(function () {
        $("#roleList").datagrid({
            url:"${pageContext.request.contextPath}/role/queryRoleInfo",
            columns:[[
                {field:"accountId",title:"账户",width:20},
                {field:"username",title:"用户名",width:20},
                {field:"roleName",title:"拥有角色",width:10},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#role_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //修角色信息
        $("#role_modify").linkbutton({
            onClick:function(){
                var rowData = $("#roleList").datagrid("getSelected");
                console.log(rowData);
                $("#role_dd").dialog({
                    title: '修改角色信息',
                    width:300,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/role/modifyRole.jsp", //包含子页面
                    onLoad:function(){
                        $("#role_mf").form("load",rowData); //在加载表单时将行数据加载到表单元素中
                    }
                });
            },
        });

    });
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        用户角色列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="roleList"></table>

                <%--操作栏--%>
                <div id="role_tb" style="display: none;">
                    <a id="role_modify" class="easyui-linkbutton"
                       data-options="iconCls:'icon-edit',plain:true,text:'修改角色'">
                    </a>

                    <%--操作窗口--%>
                    <div id="role_dd"></div>

                    <%--确认框--%>
                    <div id="role_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>