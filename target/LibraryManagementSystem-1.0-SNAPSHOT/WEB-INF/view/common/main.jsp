<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/view/common/template.jsp"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link href="assets/css/pace.min.css" rel="stylesheet" />
<script src="assets/js/pace.min.js"></script>
<html lang="cn">

<body >
<!--wrapper-->
<div class="wrapper">
    <jsp:include page="/WEB-INF/view/common/header.jsp"/>
    <jsp:include page="/WEB-INF/view/common/menu.jsp"/>
    <!--sidebar wrapper -->
    <!--end sidebar wrapper -->
    <!--start header -->
    <!--end header -->
    <!--end page wrapper -->
    <!--start overlay-->
    <!--end overlay-->
    <!--Start Back To Top Button-->
    <!--End Back To Top Button-->
</div>
<!--end wrapper-->

</body>
</html>
