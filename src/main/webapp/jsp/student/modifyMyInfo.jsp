<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2019/2/17 0017
  Time: 下午 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
    tr {
        width: 600px;
        height: 80px;
    }

    td {
        width: 300px;
    }

    img {
        width: 300px;
        height: 300px;
    }

</style>
<script type="text/javascript">

    $(function () {
        $("#modifyMyInfo_submit").on("click",function(){
            $("#myInfo_mf").form('submit',{
                    url: '${pageContext.request.contextPath}/student/modifyMyInfo',
                    success: function () {
                    $("#center").tabs("close","修改个人信息");
                    alert("修改成功");
                },
                error:function () {
                    alert("修改失败");
                }
            })
        });
    });

    function show() {
        var fileTag = document.getElementById('file');
        fileTag.onchange = function () {
            var file = fileTag.files[0];
            var fileReader = new FileReader();
            fileReader.onloadend = function () {
                if (fileReader.readyState == fileReader.DONE) {
                    document.getElementById('img').setAttribute('src', fileReader.result);
                }
            };
            fileReader.readAsDataURL(file);
        };
    };
</script>

<div style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        修改我的个人信息
    </div>
    <div class="row" style="height: 60%;background-color: #FFFFFF;margin-top: 8px;padding: 100px">
        <div class="container" style="border:1px dashed #000" >
            <form id="myInfo_mf" method="post" enctype="multipart/form-data">
                <table style="margin: 10px;border: hidden">
                    <tr>
                        <td>
                            <label>账号：</label>
                            <div><input type="text" name="id" value="${sessionScope.account.id}" readonly="readonly"></div>
                        </td>
                        <td>
                            <label>用户名：</label>
                            <div><input type="text" maxlength="32" name="username" value="${sessionScope.account.username}"></div>
                        </td>
                        <td rowspan="6">
                            <img id="img" src="resource/student/${sessionScope.account.photo}">
                            <div><input type="file" id="file" name="file" onclick="show()"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>生日：</label>
                            <div><input type="text" name="birthday" value='<fmt:formatDate value="${sessionScope.account.birthday}" pattern="yyyy-MM-dd" />'></div>
                        </td>
                        <td>
                            <label>性别：</label>
                            <div>
                                <input type="radio" name="sex" value="男" <c:if test="${sessionScope.account.sex=='男'}" >checked</c:if> />男
                                <input type="radio" name="sex" value="女" <c:if test="${sessionScope.account.sex=='女'}" >checked</c:if> />女
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>手机号：</label>
                            <div><input type="text" maxlength="11" name="tel" value="${sessionScope.account.tel}"></div>
                        </td>
                        <td>
                            <label>QQ：</label>
                            <div><input type="text" maxlength="12" name="qq" value="${sessionScope.account.qq}"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>家乡：</label>
                            <div><input type="text" maxlength="64" name="hometown" value="${sessionScope.account.hometown}"></div>
                        </td>
                        <td>
                            <label>宿舍：</label>
                            <div><input type="text" maxlength="64" name="dormitory" value="${sessionScope.account.dormitory}"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>爱好：</label>
                            <div><input type="text" maxlength="64" name="hobby" value="${sessionScope.account.hobby}"></div>
                        </td>
                        <td>
                            <input id="modifyMyInfo_submit" type="button" value="提交"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
