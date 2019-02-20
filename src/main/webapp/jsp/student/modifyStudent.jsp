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
        $("#stu_mf_submit").linkbutton({
            onClick:function(){
                $("#stu_mf").form("submit", {
                    url:"${pageContext.request.contextPath}/student/modifyStudent",
                    onSubmit: function(){
                        // do some check
                        // return false to prevent submit;
                    },
                    success:function(){
                        $("#stuList").datagrid('load',{

                        });
                        $("#stu_dd").dialog("close");
                    }
                });

            },

        });


        $("#stu_mf_cancel").linkbutton({
            onClick:function () {
                $("#stu_dd").dialog("close");
            },
        });
    });


</script>
<form id="stu_mf" method="post">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <input type="text" name="id" style="display: none"/>
            <tr>
                <td>姓名:</td>
                <td><input class="easyui-validatebox" data-options="required:true," name="username"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input class="easyui-validatebox" data-options="required:true," name="tel"/></td>
            </tr>
            <tr>
                <td><a id="stu_mf_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="stu_mf_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>
    </div>

</form>
