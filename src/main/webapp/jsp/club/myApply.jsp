<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $("#myApplyList").datagrid({
            url:"${pageContext.request.contextPath}/registerInfo/queryMyApply",
            columns:[[
                {field:"clubName",title:"社团名称",width:30},
                {field:"registerDate",title:"申请日期",width:30},
                {field:"status",title:"状态",width:30,formatter:function (value,row,index) {
                    if(value=='0'){
                        return '待审批';
                    }else if(value=='1'){
                        return '加入成功';
                    }else if(value=='2'){
                        return '加入失败';
                    }
                }},
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#myApply_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //删除
        $("#myApply_cancel").linkbutton({
            onClick:function(){
                var rowData = $("#myApplyList").datagrid("getSelected");
                console.log(rowData);

                $('#myApply_confirm').dialog({
                    title: '确认撤销报名申请？',
                    width: 400,
                    height: 200,
                    closed: false,
                    cache: false,
                    content:"你确定要撤销加入"+rowData.clubName+"的申请吗？",
                    modal: true,
                    toolbar:[{

                    }],
                    buttons:[{
                        text:'确认',
                        iconCls:'icon-accept',
                        handler:function(){
                            $.ajax({
                                type:"POST",
                                url:"${pageContext.request.contextPath}/registerInfo/cancelMyApply",
                                data:"id="+rowData.id,
                                success: function(){
                                    $("#myApplyList").datagrid('load',{});
                                    $("#myApply_confirm").window("close");
                                    alert("撤销报名申请加入成功！");
                                }
                            });
                        }
                    },{
                        text:'取消',
                        iconCls:'icon-cancel',
                        handler:function(){
                            $("#myApply_confirm").window("close");

                        }
                    }],
                });

            },

        });
    });
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        报名申请列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="myApplyList"></table>

                <%--操作栏--%>
                <div id="myApply_tb" style="display: none;">
                    <a id="myApply_cancel" class="easyui-linkbutton"
                       data-options="iconCls:'icon-cancel',plain:true,text:'撤销申请'"></a>
                    <%--操作窗口--%>
                    <div id="myApply_dd"></div>

                    <%--确认框--%>
                    <div id="myApply_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>
