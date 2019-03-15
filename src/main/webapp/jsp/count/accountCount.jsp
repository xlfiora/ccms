<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #ac_table div {
        width: 620px;
        height: 580px;
    }
</style>
<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        用户统计
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <table id="ac_table">
                    <tr>
                        <td>
                            <div id="account_type"></div>
                        </td>
                        <td>
                            <div id="account_sex"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var atChart = echarts.init(document.getElementById('account_type'));

    // 异步加载统计信息
    $.post("${pageContext.request.contextPath }/account/countAccountType",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        atChart.setOption({
            title: {
                text: '各角色用户数量',
                x:'center'
            },
            legend: {
                data:['用户数量']
            },
            xAxis: {
                data: ['普通用户','普通管理员','超级管理员']
            },
            yAxis: {
                type:"value"
            },
            series: [{
                name: '数量',
                type: 'bar',
                data: data.value,
            }]
        });
    },"json");


    var asChart = echarts.init(document.getElementById('account_sex'));

    $.post("${pageContext.request.contextPath }/account/countAccountSex",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        asChart.setOption({
            title: {
                text: '用户性别比例',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)",
                extraCssText:'width:120px;height:40px;'
            },
            legend: {
                orient: 'vertical',
                left: 'right',
                data: ['男','女']
            },
            series : [
                {
                    name: '男女比例',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:data.value[0], name:'男'},
                        {value:data.value[1], name:'女'},
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        });
    },"json");
</script>