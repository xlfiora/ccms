<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/25 0025
  Time: 下午 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function() {

        $("#password_mf_submit").linkbutton({
            onClick:function(){
                $("#password_mf").form("submit", {
                    type:"POST",
                    url:"${pageContext.request.contextPath}/account/modifyPassword",
                    onSubmit: function(){
                        if($("#newPsw").val()=="" || $("#oldPsw").val()==""){
                            return false;
                        }
                    },
                    success:function(data){
                        if (data=="1"){
                            $("#main_dd").dialog("close");
                            $.messager.show({
                                title:'提交成功',
                                msg:'修改密码成功！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }else {
                            $.messager.show({
                                title:'提交成功',
                                msg:'修改密码失败！原密码有误！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }
                    }
                });
            },
        });


        $("#password_mf_cancel").linkbutton({
            onClick:function () {
                $("#main_dd").dialog("close");
            },
        });




    });

</script>
<form id="password_mf" method="post">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <tr>
                <td>原始密码:</td>
                <td>
                    <input class="easyui-validatebox" data-options="required:true," id="oldPsw" name="oldPsw"/>
                    <span id="res"></span>
                </td>
            </tr>
            <tr>
                <td>新密码:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="newPsw" name="newPsw"/></td>
            </tr>
            <tr>
                <td><a id="password_mf_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="password_mf_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>
    </div>

</form>
