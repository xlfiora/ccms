<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/21 0021
  Time: 下午 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<script type="text/javascript">
    $(function () {
        $("#registerInfoList").datagrid({
            url:"${pageContext.request.contextPath}/registerInfo/queryAllRegisterInfo",
            columns:[[
                {field:"accountId",title:"学号",width:30},
                {field:"accountName",title:"姓名",width:30},
                {field:"clubName",title:"社团名称",width:30},
                {field:"registerDate",title:"申请日期",width:30},
                {field:"status",title:"状态",width:30,formatter:function (value,row,index) {
                    if(value=='0'){
                        return '待审批';
                    }else if(value=='1'){
                        return '批准';
                    }else if(value=='2'){
                        return '不批准';
                    }
                }},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#registerInfo_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //审批
        $("#registerInfo_modify").linkbutton({
            onClick:function(){
                var rowData = $("#registerInfoList").datagrid("getSelected");
                console.log(rowData);
                $("#registerInfo_dd").dialog({
                    title: '审批',
                    width:300,
                    height:200,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/club/modifyRegisterInfo.jsp", //包含子页面
                    onLoad:function(){
                        $("#registerInfo_mf").form("load",rowData); //在加载表单时将行数据加载到表单元素中
                    }
                });
            },
        });

    });

    function searchRegisterInfo() {
        $("#registerInfoList").datagrid('load',{
            accountId:$("#search_registerInfo_stuId").val(),
            accountName:$("#search_registerInfo_username").val(),
            clubName:$("#search_registerInfo_clubName").val(),
            status:$("#search_registerInfo_status").val()
        });
    }

</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        社团报名信息列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="registerInfoList"></table>

                <%--操作栏--%>
                <div id="registerInfo_tb" style="display: none;">

                    <div style="float: right">
                        <input type="text" id="search_registerInfo_stuId" placeholder="请输入学号">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="search_registerInfo_username" placeholder="请输入学生名称">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="search_registerInfo_clubName" placeholder="请输入社团名称">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <select id="search_registerInfo_status">
                            <option value="">请选择状态</option>
                            <option value="0">待审批</option>
                            <option value="1">批准</option>
                            <option value="2">不批准</option>
                        </select>
                        <a id="registerInfo_search" class="easyui-linkbutton"
                           data-options="iconCls:'icon-search',plain:true,text:'查询'" onclick="searchRegisterInfo()"></a>

                        <a id="registerInfo_modify" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,text:'审批'"></a>
                    </div>


                </div>

                <%--操作窗口--%>
                <div id="registerInfo_dd"></div>

                <%--确认框--%>
                <div id="registerInfo_confirm"></div>
            </div>
        </div>
    </div>
</div>
</div>
