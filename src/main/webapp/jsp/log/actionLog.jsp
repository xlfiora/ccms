<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function(){
        $("#log_dg").datagrid({
            url:"${pageContext.request.contextPath}/log/queryLogByPage",
            columns:[[
                {field:"logId",title:"日志编号",width:100},
                {field:"userName",title:"用户名",width:100},
                {field:"logDate",title:"日志时间",width:100},
                {field:"logResource",title:"事物源",width:100},
                {field:"logAction",title:"事物名",width:100},
                {field:"logMessage",title:"事物详细信息",width:100},
                {field:"logResult",title:"事物结果",width:100},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,

        });

    });



</script>
<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        系统操作日志
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">
                <table id="log_dg"></table>
            </div>
        </div>
    </div>
</div>

