<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/12 0012
  Time: 下午 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function() {
        $("#stu_af_submit").linkbutton({
            onClick:function(){
                $("#stu_af").form("submit", {
                    url:"${pageContext.request.contextPath}/student/addStudent",
                    onSubmit: function(){

                    },
                    success:function(){
                        $("#stuList").datagrid('load',{});
                        $("#stu_dd").dialog("close");
                    },
                });

            },

        });

        $("#stu_af_cancel").linkbutton({
            onClick:function () {
                $("#stu_dd").dialog("close");
            },
        });

    });


</script>
<form id="stu_af" method="post" >
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <tr>
                <td>学号:</td>
                <td><input class="easyui-validatebox" data-options="required:true," id="stuId" name="stuId"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><input class="easyui-validatebox" data-options="required:true," name="username"/></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input class="easyui-validatebox" data-options="required:true," name="password" type="password"/></td>
            </tr>
            <tr>
                <td><a id="stu_af_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="stu_af_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>

    </div>

</form>
