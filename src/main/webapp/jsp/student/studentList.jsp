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
        $("#stuList").datagrid({
            url:"${pageContext.request.contextPath}/student/queryAllStu",
            columns:[[
                {field:"stuId",title:"学号",width:20},
                {field:"username",title:"姓名",width:20},
                {field:"sex",title:"性别",width:10},
                {field:"birthday",title:"出生日期",width:30},
                {field:"tel",title:"电话",width:30},
                {field:"qq",title:"QQ",width:30},
                {field:"dormitory",title:"宿舍",width:30},
                {field:"enterdate",title:"创建日期",width:30},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#stu_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td style="border:0"><img src="resource/student/' + rowData.photo + '" style="height:150px;"></td>' +
                    '</tr></table>';
            }
        });

        //添加学生用户
        $("#stu_add").linkbutton({
            onClick:function(){
                $("#stu_dd").dialog({
                    title: '新增学生用户',
                    width:360,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/student/addStudent.jsp", //包含子页面
                });
            },
        });

        //修改学生信息
        $("#stu_modify").linkbutton({
            onClick:function(){
                var rowData = $("#stuList").datagrid("getSelected");
                console.log(rowData);
                $("#stu_dd").dialog({
                    title: '修改学生信息',
                    width:300,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/student/modifyStudent.jsp", //包含子页面
                    onLoad:function(){
                        $("#stu_mf").form("load",rowData); //在加载表单时将行数据加载到表单元素中
                    }
                });
            },
        });


        //删除学生用户
        $("#stu_remove").linkbutton({
            onClick:function(){
                var rowData = $("#stuList").datagrid("getSelected");
                console.log(rowData);

                $('#stu_confirm').dialog({
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
                                url:"${pageContext.request.contextPath}/student/removeStudent",
                                data:"id="+rowData.id,
                                success: function(){
                                    $("#stuList").datagrid('load',{

                                    });
                                    $("#stu_confirm").window("close");
                                }
                            });
                        }
                    },{
                        text:'取消',
                        iconCls:'icon-cancel',
                        handler:function(){
                            $("#stu_confirm").window("close");

                        }
                    }],
                });

            },

        });



        function stu_qq(value, name) {
            $("#stuList").datagrid('load',{
                value:value,
                name:name
            });
        }


    });
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        学生用户列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="stuList"></table>

                <%--操作栏--%>
                <div id="stu_tb" style="display: none;">
                    <a id="stu_modify" class="easyui-linkbutton"
                       data-options="iconCls:'icon-edit',plain:true,text:'修改'"></a>
                    <a id="stu_add" class="easyui-linkbutton"
                       data-options="iconCls:'icon-add',plain:true,text:'新增'"></a>
                    <a id="stu_remove" class="easyui-linkbutton"
                       data-options="iconCls:'icon-cancel',plain:true,text:'删除'"></a>
                    <a id="stu_adds" class="easyui-linkbutton"
                       data-options="iconCls:'icon-disk_upload',plain:true,text:'批量插入'"></a>
                    <a id="stu_export" class="easyui-linkbutton"
                       data-options="iconCls:'icon-disk_download',plain:true,text:'导出Excel'"></a>
                    <input id="stu_ss" class="easyui-searchbox" style="width:300px"
                           data-options="searcher:stu_qq,prompt:'请您输入需要模糊查询的内容',menu:'#stu_mm'"></input>
                    <div id="stu_mm" style="width:120px">
                        <%--<div data-options="name:'name',iconCls:'icon-ok'">上师名</div>--%>
                            <%--<div data-options="name:'department',iconCls:'icon-ok'">部门</div>--%>
                            <%--<div data-options="name:'address',iconCls:'icon-ok'">地址</div>--%>
                    </div>

                    <%--操作窗口--%>
                    <div id="stu_dd"></div>

                    <%--确认框--%>
                    <div id="stu_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>

