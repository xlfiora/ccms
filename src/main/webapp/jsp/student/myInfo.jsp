<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
    tr {
        width: 600px;
        height: 50px;
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



    });
</script>

<div style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        我的个人信息
    </div>
    <div class="row" style="height: 60%;background-color: #FFFFFF;margin-top: 8px;padding: 100px">
        <div class="container" style="border:1px dashed #000">
            <table style="margin: 10px;border: hidden">
                <tr>
                    <td><div>账号：${sessionScope.account.id}</div></td>
                    <td><div>用户名：${sessionScope.account.username}</div></td>
                    <td rowspan="6"><img src="resource/student/${sessionScope.account.photo}"></td>
                </tr>
                <tr>
                    <td><div>生日：<fmt:formatDate value="${sessionScope.account.birthday}" pattern="yyyy-MM-dd"/> </div></td>
                    <td><div>性别：${sessionScope.account.sex}</div></td>
                </tr>
                <tr>
                    <td><div>手机号：${sessionScope.account.tel}</div></td>
                    <td><div>QQ：${sessionScope.account.qq}</div></td>
                </tr>
                <tr>
                    <td><div>家乡：${sessionScope.account.hometown}</div></td>
                    <td><div>宿舍：${sessionScope.account.dormitory}</div></td>
                </tr>
                <tr>
                    <td><div>爱好：${sessionScope.account.hobby}</div></td>
                </tr>
            </table>
        </div>
    </div>
</div>
