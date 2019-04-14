<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/14 0014
  Time: 下午 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function() {
        $("#manager_af_submit").linkbutton({
            onClick:function(){
                $("#manager_af").form("submit", {
                    url:"${pageContext.request.contextPath}/manager/addManager",
                    onSubmit: function(){
                        if ($("#stuId").val()=="" || $("#username").val()=="" || $("#password").val()==""|| $("#tel").val()==""){
                            return false;
                        }
                    },
                    success:function(r){
                        if(r=="2"){
                            $("#managerList").datagrid('load',{});
                            $("#manager_dd").dialog("close");
                            $.messager.show({
                                title:'提交成功',
                                msg:'新增成功！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }else {
                            alert("该帐号已存在！请重新输入。");
                        }

                    },
                });

            },

        });

        $("#manager_af_cancel").linkbutton({
            onClick:function () {
                $("#manager_dd").dialog("close");
            },
        });

    });


</script>
<form id="manager_af" method="post" >
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <tr>
                <td>账号:</td>
                <td><input class="easyui-validatebox" data-options="required:true,"  id="stuId" name="stuId"/></td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="username" name="username"/></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="password" name="password" type="password"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="tel" name="tel" type="tel"/></td>
            </tr>
            <tr>
                <td><a id="manager_af_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">新增</a></td>
                <td><a id="manager_af_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>

    </div>

</form>

