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
                {field:"hometown",title:"家乡",width:30},
                {field:"hobby",title:"爱好",width:30},
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
                    '<td style="border:0"><img src="upload/stu/' + rowData.stuPhoto + '" style="height:150px;"></td>' +
                    '</tr></table>';
            }
        });


        function stu_qq(value, name) {
            $("#stu_dg").datagrid('load',{
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

