<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/17 0017
  Time: 下午 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function() {
        $("#role_mf_submit").linkbutton({
            onClick:function(){
                $("#role_mf").form("submit", {
                    url:"${pageContext.request.contextPath}/role/modifyRole",
                    onSubmit: function(){
                        // do some check
                        // return false to prevent submit;
                    },
                    success:function(r){
                        if(r=="1"){
                            $("#roleList").datagrid('load',{});
                            $("#role_dd").dialog("close");
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


        $("#role_mf_cancel").linkbutton({
            onClick:function () {
                $("#role_dd").dialog("close");
            },
        });
    });


</script>
<form id="role_mf" method="post">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <input type="text" name="accountId" style="display: none"/>
            <tr>
                <td>请为用户选择角色</td>
            </tr>
            <tr>
                <td><label><input name="roleId" type="radio" value="1" />超级管理员 </label></td>
            </tr>
            <tr>
                <td><label><input name="roleId" type="radio" value="2" />普通理员 </label></td>
            </tr>
            <tr>
                <td><label><input name="roleId" type="radio" value="3" />系统用户 </label></td>
            </tr>
            <tr>
                <td><a id="role_mf_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="role_mf_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>
    </div>

</form>
