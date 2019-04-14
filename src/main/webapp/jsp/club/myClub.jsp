<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $("#myClubList").datagrid({
            url:"${pageContext.request.contextPath}/registerInfo/queryMyClub",
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
            toolbar : "#myClub_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //删除
        $("#myClub_cancel").linkbutton({
            onClick:function(){
                var rowData = $("#myClubList").datagrid("getSelected");
                console.log(rowData);

                $('#myClub_confirm').dialog({
                    title: '确认退出社团？',
                    width: 400,
                    height: 200,
                    closed: false,
                    cache: false,
                    content:"你确定要退出"+rowData.clubName+"吗？",
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
                                success: function(r){
                                    if (r=="1"){
                                        $("#myClubList").datagrid('load',{});
                                        $("#myClub_confirm").window("close");
                                        $.messager.show({
                                            title:'提交成功',
                                            msg:'退出社团成功！',
                                            timeout:3000,
                                            showType:'slide'
                                        });
                                    }else {
                                        $.messager.show({
                                            title:'提交成功',
                                            msg:'退出社团成功！',
                                            timeout:3000,
                                            showType:'slide'
                                        });
                                    }

                                }
                            });
                        }
                    },{
                        text:'取消',
                        iconCls:'icon-cancel',
                        handler:function(){
                            $("#myClub_confirm").window("close");

                        }
                    }],
                });

            },

        });
    });
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        我的社团
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="myClubList"></table>

                <%--操作栏--%>
                <div id="myClub_tb" style="display: none;">
                    <a id="myClub_cancel" class="easyui-linkbutton"
                       data-options="iconCls:'icon-cancel',plain:true,text:'退出社团'"></a>
                    <%--操作窗口--%>
                    <div id="myClub_dd"></div>

                    <%--确认框--%>
                    <div id="myClub_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>

