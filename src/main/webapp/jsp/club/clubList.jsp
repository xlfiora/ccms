<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $("#clubList").datagrid({
            url:"${pageContext.request.contextPath}/club/queryAllClub",
            columns:[[
                {field:"clubName",title:"社团名称",width:30},
                {field:"categoryId",title:"社团类型",width:30,formatter:function (value,row,index) {
                    if(value=='1'){
                        return '体育类';
                    }else if(value=='2'){
                        return '文艺类';
                    }else if(value=='3'){
                        return '科技类';
                    }else if(value=='4'){
                        return '社会实践类';
                    }else if(value=='5'){
                        return '学术类';
                    }
                }},
                {field:"founder",title:"创始人",width:20},
                {field:"createDate",title:"创建日期",width:30},
                {field:"attached",title:"挂靠单位",width:30},
                {field:"dues",title:"会费",width:30},
                {field:"operate",title:"查看详情",width:30,
                    formatter:function(value,rowData,rowIndex) {
                        return "<a href='#' onclick='showDetail("+rowIndex+")'>查看详情</a>";
                    },
                }
            ]],
            striped:true,
            pagination:true,
            pageList:[5,10,15,20],
            pageSize : 5,
            toolbar : "#club_tb",
            fitColumns: true,
            singleSelect:true,
            remoteSort:false,
            nowrap:false,
        });

        //添加
        $("#club_add").linkbutton({
            onClick:function(){
                $("#club_dd").dialog({
                    title: '新增社团',
                    width:800,
                    height:600,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/club/addClub.jsp", //包含子页面
                });
            },
        });

        //修改
        $("#club_modify").linkbutton({
            onClick:function(){
                var rowData = $("#clubList").datagrid("getSelected");
                console.log(rowData);
                $("#club_dd").dialog({
                    title: '修改社团',
                    width:900,
                    height:800,
                    modal: true,
                    href:"${pageContext.request.contextPath}/jsp/club/modifyClub.jsp", //包含子页面
                    onLoad:function(){
                        $("#club_mf").form("load",rowData); //在加载表单时将行数据加载到表单元素中
                    }
                });
            },
        });


        //删除
        $("#club_remove").linkbutton({
            onClick:function(){
                var rowData = $("#clubList").datagrid("getSelected");
                console.log(rowData);

                $('#club_confirm').dialog({
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
                                url:"${pageContext.request.contextPath}/club/removeClub",
                                data:"id="+rowData.id,
                                success: function(){
                                    $("#clubList").datagrid('load',{

                                    });
                                    $("#club_confirm").window("close");
                                }
                            });
                        }
                    },{
                        text:'取消',
                        iconCls:'icon-cancel',
                        handler:function(){
                            $("#club_confirm").window("close");

                        }
                    }],
                });
            },
        });
    });

    function showDetail(rowIndex) {
        $('#clubList').datagrid('selectRow',rowIndex);// 关键在这里
        var rowData = $('#clubList').datagrid('getSelected');
        console.log(rowData);
        $("#club_dd").dialog({
            title: '社团简介',
            width:800,
            height:600,
            modal: true,
            href:"${pageContext.request.contextPath}/jsp/club/showDetail.jsp", //包含子页面
            onLoad:function(){
                $("#detail_clubName").text(rowData.clubName);
                $("#detail_introduction").html(rowData.introduction);
            }
        });
    }

    function searchClub() {
        $("#clubList").datagrid('load',{
            clubName:$("#search_clubName").val(),
        });
    }
</script>

<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        社团列表
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <%--列表--%>
                <table id="clubList"></table>

                <%--操作栏--%>
                <div id="club_tb" style="display: none;">
                    <%--<a id="club_modify" class="easyui-linkbutton"--%>
                       <%--data-options="iconCls:'icon-edit',plain:true,text:'修改'"></a>--%>
                    <a id="club_add" class="easyui-linkbutton"
                       data-options="iconCls:'icon-add',plain:true,text:'新增'"></a>
                    <a id="club_remove" class="easyui-linkbutton"
                       data-options="iconCls:'icon-cancel',plain:true,text:'删除'"></a>
                    <div style="float: right">
                        <input type="text" id="search_clubName" placeholder="请输入社团名称">
                        <a id="club_search" class="easyui-linkbutton"
                           data-options="iconCls:'icon-search',plain:true,text:'查询'" onclick="searchClub()"></a>
                    </div>
                    <%--操作窗口--%>
                    <div id="club_dd"></div>

                    <%--确认框--%>
                    <div id="club_confirm"></div>
                </div>
            </div>
        </div>
    </div>
</div>
