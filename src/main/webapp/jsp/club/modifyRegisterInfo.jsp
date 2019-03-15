<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/21 0021
  Time: 下午 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function() {
        $("#registerInfo_mf_submit").linkbutton({
            onClick:function(){
                $("#registerInfo_mf").form("submit", {
                    url:"${pageContext.request.contextPath}/registerInfo/approval",
                    onSubmit: function(){
                        // do some check
                        // return false to prevent submit;
                    },
                    success:function(){
                        $("#registerInfoList").datagrid('load',{

                        });
                        $("#registerInfo_dd").dialog("close");
                    }
                });

            },

        });


        $("#registerInfo_mf_cancel").linkbutton({
            onClick:function () {
                $("#registerInfo_dd").dialog("close");
            },
        });
    });


</script>
<form id="registerInfo_mf" method="post">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <input type="text" name="id" style="display: none"/>
            <tr>
                <td>是否批准？</td>
            </tr>
            <tr>
                <td><label><input name="status" type="radio" value="0" />待审批 </label></td>
            </tr>
            <tr>
                <td><label><input name="status" type="radio" value="1" />批准 </label></td>
            </tr>
            <tr>
                <td><label><input name="status" type="radio" value="2" />不批准 </label></td>
            </tr>
            <tr>
                <td><a id="registerInfo_mf_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="registerInfo_mf_cancel" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a></td>
            </tr>
        </table>
    </div>

</form>
