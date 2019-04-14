<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/13 0013
  Time: 下午 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function() {
        $("#manager_mf_submit").linkbutton({
            onClick:function(){
                $("#manager_mf").form("submit", {
                    url:"${pageContext.request.contextPath}/manager/modifyManager",
                    onSubmit: function(){
                        if($("#username").val()=="" || $("#tel").val()==""){
                            return false;
                        }
                    },
                    success:function(r){
                        if(r=="1"){
                            $("#managerList").datagrid('load',{});
                            $("#manager_dd").dialog("close");
                            $.messager.show({
                                title:'提交成功',
                                msg:'修改成功！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }else {
                            $.messager.show({
                                title:'提交成功',
                                msg:'修改失败！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }

                    }
                });

            },

        });


        $("#manager_mf_cancel").linkbutton({
            onClick:function () {
                $("#manager_dd").dialog("close");
            },
        });
    });


</script>
<form id="manager_mf" method="post">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <input type="text" name="id" style="display: none"/>
            <tr>
                <td>用户名:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="username" name="username"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="tel" name="tel"/></td>
            </tr>
            <tr>
                <td><a id="manager_mf_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">修改</a></td>
                <td><a id="manager_mf_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>
    </div>

</form>
