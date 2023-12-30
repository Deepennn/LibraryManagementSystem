<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/view/common/template.jsp"/>
<%
    String basePath=request.getScheme()
            +"://"
            +request.getServerName()
            +":"+
            +request.getServerPort()
            +request.getContextPath()
            +"/";
%>
<html lang="cn">
<script>
    $(function() {
        const hrefArr = window.location.href.split('/');
        const name = hrefArr[hrefArr.length-1];
        $('.menu a[href=\''+name+'\']').addClass('active');
    });
</script>
<body >
<!--wrapper-->
<div class="wrapper">
    <jsp:include page="/WEB-INF/view/common/header.jsp"/>
    <jsp:include page="/WEB-INF/view/common/menu.jsp"/>

    <div class="page-wrapper">
        <div class="page-content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-lg-9 col-xl-10">
                                    <form class="float-lg-end" >
                                        <div class="row row-cols-lg-auto g-2">
                                            <div class="col-12">
                                                <button type="button" id="totally" class="btn btn-primary mb-3 mb-lg-0" >按占比</button>
                                            </div>
                                            <div class="col-12">
                                                <button type="button" id="monthly" class="btn btn-primary mb-3 mb-lg-0" >按月</button>
                                            </div>
                                            <div class="col-12">
                                                <button type="button" id="yearly" class="btn btn-primary mb-3 mb-lg-0" >按年</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row" style="overflow:auto;">
                                <div class="col">
                                    <div class="echarts" style="width: 1000px;height: 600px" id="echarts"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end wrapper-->
<!--start switcher-->
<link href="assets/plugins/datetimepicker/css/classic.css" rel="stylesheet" />
<link href="assets/plugins/datetimepicker/css/classic.time.css" rel="stylesheet" />
<link href="assets/plugins/datetimepicker/css/classic.date.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="assets/plugins/datetimepicker/js/legacy.js"></script>
<script src="assets/plugins/datetimepicker/js/picker.js"></script>
<script src="assets/plugins/datetimepicker/js/picker.time.js"></script>
<script src="assets/plugins/datetimepicker/js/picker.date.js"></script>
<script src="assets/plugins/bootstrap-material-datetimepicker/js/moment.min.js"></script>
<script src="assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.min.js"></script>

<script src="assets/echarts/echarts.min.js"></script>
<!--app JS-->

<script type="text/javascript">
    $.ajax({
        cache : true,
        type : "post",
        url : "selectByUnitid",
        async : false,
        success : function(e) {
            if (e) {
                var list = eval(e);
                console.log(list);
                if(list.length > 0){
                    var pieData = [
                        {
                            name: "在库总数",
                            value:list[0].availableCount
                        },
                        {
                            name: "借阅总数",
                            value:list[0].count
                        }
                    ]
                    var titleData = list[0].totalCount

                    echarts.init(document.getElementById('echarts')).setOption({
                        title: {
                            text: '单位图书总数: '+titleData,
                            left: 'center'
                        },
                        // tooltip: {},
                        series: [{
                            type: 'pie',
                            data: pieData
                        }]
                    });
                }
            } else {
                alert("查询失败");
            }
        }
    })
</script>

<script type="text/javascript">
    $("#totally").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "selectByUnitid",
            async : false,
            success : function(e) {
                if (e) {
                    var list = eval(e);
                    console.log(list);
                    if(list.length > 0){
                        var pieData = [
                            {
                                name: "在库总数",
                                value:list[0].availableCount
                            },
                            {
                                name: "借阅总数",
                                value:list[0].count
                            }
                        ]
                        var titleData = list[0].totalCount

                        echarts.init(document.getElementById('echarts')).setOption({
                            title: {
                                text: '单位图书总数: '+titleData,
                                left: 'center'
                            },
                            // tooltip: {},
                            series: [{
                                    type: 'pie',
                                    data: pieData
                                }]
                        });
                    }
                } else {
                    alert("查询失败");
                }
            }
        })
    })
</script>

<script type="text/javascript">
    $("#monthly").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "selectByUnitidMonthly",
            async : false,
            success : function(e) {
                if (e) {
                    var list = eval(e);
                    console.log(list);
                    if(list.length > 0){
                        // var names = [];
                        // var counts = [];
                        // for(var i= 0;i<list.length;i++){
                        //     names.push(list[i].name);
                        //     counts.push(list[i].count);
                        // }

                        var names = [
                            // '2021-1', '2021-2', '2021-3', '2021-4', '2021-5', '2021-6', '2021-7', '2021-8', '2021-9', '2021-10', '2021-11', '2021-12',
                            // '2022-1', '2022-2', '2022-3', '2022-4', '2022-5', '2022-6', '2022-7', '2022-8', '2022-9', '2022-10', '2022-11', '2022-12',
                            '2023-1', '2023-2', '2023-3', '2023-4', '2023-5', '2023-6', '2023-7', '2023-8', '2023-9', '2023-10', '2023-11', '2023-12'
                        ];

                        var counts = Array(names.length).fill(0); // Initialize counts array with zeros

                        for (var i = 0; i < list.length; i++) {
                            var index = names.indexOf(list[i].name);
                            if (index !== -1) {
                                counts[index] = list[i].count;
                            }
                        }

                        echarts.init(document.getElementById('echarts')).setOption({
                            // title: {
                            //     text: '借阅统计(按月)',
                            //     left: 'center'
                            // },
                            tooltip: {},
                            xAxis: {
                                type: 'category',
                                data: names
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [{
                                type: 'line',
                                data: counts,
                                // 最大值和最小值
                                markPoint: {
                                    data: [
                                        {
                                            type: 'max'
                                        },
                                        {
                                            type: 'min'
                                        }
                                    ]
                                },
                                // 平均值
                                markLine: {
                                    data: [
                                        {
                                            type: 'average'
                                        }
                                    ]
                                },
                                // 线条控制
                                smooth: true,
                                lineStyle: {
                                    color: 'green'
                                },
                                // 填充风格
                                areaStyle: {
                                    color: 'pink'
                                }
                            }]
                        });
                    }
                } else {
                    alert("查询失败");
                }
            }
        })
    })
</script>

<script type="text/javascript">
    $("#yearly").click(function() {
        $.ajax({
            cache : true,
            type : "post",
            url : "selectByUnitidYearly",
            async : false,
            success : function(e) {
                if (e) {
                    var list = eval(e);
                    console.log(list);
                    if(list.length > 0){
                        // var names = [];
                        // var counts = [];
                        // for(var i= 0;i<list.length;i++){
                        //     names.push(list[i].name);
                        //     counts.push(list[i].count);
                        // }

                        var names = ['2019','2020', '2021', '2022','2023'];
                        var counts = Array(names.length).fill(0); // Initialize counts array with zeros

                        for (var i = 0; i < list.length; i++) {
                            var index = names.indexOf(list[i].name);
                            if (index !== -1) {
                                counts[index] = list[i].count;
                            }
                        }

                        echarts.init(document.getElementById('echarts')).setOption({
                            // title: {
                            //     text: '借阅统计(按年)',
                            //     left: 'center'
                            // },
                            tooltip: {},
                            xAxis: {
                                type: 'category',
                                data: names
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [{
                                type: 'line',
                                data: counts,
                                // 最大值和最小值
                                markPoint: {
                                    data: [
                                        {
                                            type: 'max'
                                        },
                                        {
                                            type: 'min'
                                        }
                                    ]
                                },
                                // 平均值
                                markLine: {
                                    data: [
                                        {
                                            type: 'average'
                                        }
                                    ]
                                },
                                // 线条控制
                                smooth: true,
                                lineStyle: {
                                    color: 'green'
                                },
                                // 填充风格
                                areaStyle: {
                                    color: 'pink'
                                }
                            }]
                        });
                    }
                } else {
                    alert("查询失败");
                }
            }
        })
    })
</script>

</body>

</html>
