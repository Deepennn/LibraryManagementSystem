<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <meta charset="utf-8" />
    <title>图书馆管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--favicon-->
    <link rel="icon" href="<%=path%>/assets/images/favicon-32x32.png" type="image/png" />
    <!--plugins-->
    <link href="<%=path%>/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <link href="<%=path%>/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="<%=path%>/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="<%=path%>/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <!-- loader-->

    <!-- Bootstrap CSS -->
    <link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="<%=path%>/assets/css/app.css" rel="stylesheet">
    <link href="<%=path%>/assets/css/icons.css" rel="stylesheet">
    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="<%=path%>/assets/css/dark-theme.css" />
    <link rel="stylesheet" href="<%=path%>/assets/css/semi-dark.css" />
    <link rel="stylesheet" href="<%=path%>/assets/css/header-colors.css" />

<%--layui的js--%>
    <script type="text/javascript"  src="<%=path%>/assets/layui/layui.js"></script>
    <script type="text/javascript"  src="<%=path%>/assets/layui/jquery-1.9.1.min.js"></script>
    <link type="text/text/css"  src="<%=path%>/assets/css/layui.css"></link>

<%--list页面的引用，包括了模糊查询、分页等等--%>
    <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
    <!--plugins-->
    <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <link href="assets/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <script src="assets/js/jquery.min.js"></script>

    <!--plugins-->

    <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
    <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
    <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
    <script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>


    <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/app.css" rel="stylesheet">
    <link href="assets/css/icons.css" rel="stylesheet">
    <!-- Theme Style CSS 右侧的主题选择-->
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="assets/css/dark-theme.css" />
    <link rel="stylesheet" href="assets/css/semi-dark.css" />
    <link rel="stylesheet" href="assets/css/header-colors.css" />

    <%--左侧菜单栏的--%>
    <script src="assets/js/app.js"></script>
    <%--echarts图表--%>

</head>
<body>

</body>
</html>
