<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #cc_table div {
        width: 620px;
        height: 580px;
    }
</style>
<div class="container" style="background-color:#CCCCCC;padding: 10px">
    <div style="height:30px;text-align: center;font-family: Microsoft Yahei; font-size: 22px; font-weight: 600;background-color: #FFFFFF">
        社团统计
    </div>
    <div class="row" style="height: 93%;background-color: #FFFFFF;margin-top: 8px">
        <div class="col-md-12">
            <div style="margin: 10px; padding-top: 10px ">

                <table id="cc_table">
                    <tr>
                        <td>
                            <div id="club_category"></div>
                        </td>
                        <td>
                            <div id="club_register"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var ccChart = echarts.init(document.getElementById('club_category'));

    // 异步加载统计信息
    $.post("${pageContext.request.contextPath }/club/countClubCategory",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        ccChart.setOption({
            title: {
                text: '各分类社团数量占比',
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)",
                extraCssText:'width:120px;height:40px;'
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:data.x
            },
            series: [
                {
                    name:'社团数量占比',
                    type:'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:data.value
                }
            ]
        });
    },"json");


    var crChart = echarts.init(document.getElementById('club_register'));

    $.post("${pageContext.request.contextPath }/club/countClubRegister",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        crChart.setOption({
            title: {
                text: '各社团报名情况',
                x:'center'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },
                extraCssText:'width:120px;height:60px;'
            },
            legend: {
                data: ['待审批人数', '已加入人数'],
                x: 'right'
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                data: data.club
            },
            series: [
                {
                    name: '待审批人数',
                    type: 'bar',
                    data: data.unApprove
                },
                {
                    name: '已加入人数',
                    type: 'bar',
                    data: data.approve
                }
            ]
        });
    },"json");
</script>
