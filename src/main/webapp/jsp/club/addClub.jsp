<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/19 0019
  Time: 下午 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<form id="club_af" method="post" enctype="multipart/form-data">
    <div style="margin-left: 20px;margin-top: 20px">
        <table>
            <tr style="width: 200px;">
                <td>社团名称:</td>
                <td><input class="easyui-validatebox" data-options="required:true," type="text" name="clubName"/></td>
                <td>创建日期:</td>
                <td><input class="easyui-validatebox" data-options="required:true," type="text" name="createDate"/></td>
            </tr>
            <tr style="width: 200px;">
                <td>社团分类:</td>
                <td>
                    <select class="easyui-combobox" name="categoryId">
                        <option value="1">体育类</option>
                        <option value="2">文艺类</option>
                        <option value="3">科技类</option>
                        <option value="4">社会实践类</option>
                        <option value="5">学术类</option>
                    </select>
                </td>
                <td>挂靠单位:</td>
                <td><input type="text" class="easyui-validatebox" data-options="required:true," name="attached"/></td>
            </tr>
            <tr style="width: 200px;">
                <td>创始人:</td>
                <td><input type="text" class="easyui-validatebox" data-options="required:true," name="founder"/></td>
                <td>会费:</td>
                <td><input type="text" class="easyui-validatebox" data-options="required:true," name="dues"/></td>
            </tr>
            <tr style="width: 200px;">
                <td colspan="4">
                    <p>社团简介</p>
                    <div id="addClub_editor"></div>
                </td>
            </tr>
            <tr style="width: 200px;">
                <td><a id="club_af_submit" class="easyui-linkbutton" data-options="iconCls:'icon-picture_save'">保存</a></td>
                <td><a id="club_af_reset" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">重置</a></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    $(function() {
        var addClubE = window.wangEditor;
        var addClub_editor = new addClubE('#addClub_editor');

        //不显示网络上传
        addClub_editor.customConfig.showLinkImg = false
        addClub_editor.customConfig.uploadImgMaxSize = 1024 * 1024 * 1024
        addClub_editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/club/uploadFiles';//图片上传到服务器
        addClub_editor.customConfig.uploadFileName = 'files';//上传图片名称
        addClub_editor.create();

        $(function () {
            $('#club_af_submit').linkbutton({
                onClick: function () {

                    $('#club_af').form('submit', {

                        url:"${pageContext.request.contextPath}/club/addClub",
                        onSubmit: function(param){
                            param.introduction = (addClub_editor).txt.html();
                        },
                        success:function () {
                            $("#clubList").datagrid('load',{});
                            $("#club_dd").dialog("close");
                            $.messager.show({
                                title:'提交成功',
                                msg:'创建社团成功！',
                                timeout:3000,
                                showType:'slide'
                            });

                            $('#club_af_reset').form('reset');
                            //括号内有东西是赋值没有事获取
                            (addClub_editor).txt.html("");
                        },
                        error:function () {
                            $.messager.show({
                                title:'提交失败',
                                msg:'创建社团失败！',
                                timeout:3000,
                                showType:'slide'
                            });
                        }
                    });

                },
            });
            $('#club_af_reset').linkbutton({
                onClick: function () {
                    $('#club_af').form('reset');
                    //括号内有东西是赋值没有事获取
                    (addClub_editor).txt.html("");
                },
            });
        });
    });


</script>
