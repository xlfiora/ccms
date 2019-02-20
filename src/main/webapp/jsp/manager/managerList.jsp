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
        $("#managerList").datagrid({
            url:"${pageContext.request.contextPath}/manager/queryManager",
            columns:[[
                {field:"stuId",title:"账号",width:20},
                {field:"username",title:"用户名",width:20},
                {field:"tel",title:"电话",width:30},
                {field:"enterdate",title:"创建日期",width:30},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#manager_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //添加管理员用户
        $("#manager_add").linkbutton({
            onClick:function(){
                $("#manager_dd").dialog({
                    title: '新增管理员用户',
                    width:360,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/manager/addManager.jsp", //包含子页面
                });
            },
        });

        //修改管理员信息
        $("#manager_modify").linkbutton({
            onClick:function(){
                var rowData = $("#managerList").datagrid("getSelected");
                console.log(rowData);
                $("#manager_dd").dialog({
                    title: '修改管理员信息',
                    width:300,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/manager/modifyManager.jsp", //包含子页面
                    onLoad:function(){
                        $("#manager_mf").form("load",rowData); //在加载表单时将行数据加载到表单元素中
                    }
                });
            },
        });


        //删除管理用户
        $("#manager_remove").linkbutton({
            onClick:function(){
                var rowData = $("#managerList").datagrid("getSelected");
                console.log(rowData);

                $('#manager_confirm').dialog({
                    title: '是否删除？',
                    width: 400,
                    height: 200,
                    closed: false,
                    cache: false,
                    content:"你确定要删除吗？",
                    modal: true,
                    toolbar:[{

                    }],
                    buttons:[{
                        text:'确认',
                        iconCls:'icon-accept',
                        handler:function(){
                            $.ajax({
                                type:"POST",
                                url:"${pageContext.request.contextPath}/manager/removeManager",
                                data:"id="+rowData.id,
                                success: function(){
                                    $("#managerList").datagrid('load',{});
                                    $("#manager_confirm").window("close");
                                }
                            });
                        }
                    },{
                        text:'取消',
                        iconCls:'icon-cancel',
                        handler:function(){
                            $("#manager_confirm").window("close");

                        }
                    }],
                });

            },
        });
    });
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        管理员用户列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="managerList"></table>

                <%--操作栏--%>
                <div id="manager_tb" style="display: none;">
                    <a id="manager_modify" class="easyui-linkbutton"
                       data-options="iconCls:'icon-edit',plain:true,text:'修改'"></a>
                    <a id="manager_add" class="easyui-linkbutton"
                       data-options="iconCls:'icon-add',plain:true,text:'新增'"></a>
                    <a id="manager_remove" class="easyui-linkbutton"
                       data-options="iconCls:'icon-cancel',plain:true,text:'删除'"></a>
                    <%--操作窗口--%>
                    <div id="manager_dd"></div>

                    <%--确认框--%>
                    <div id="manager_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>


