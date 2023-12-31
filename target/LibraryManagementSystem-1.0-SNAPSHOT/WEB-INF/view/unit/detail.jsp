﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<div class="page-wrapper">
		<div class="page-content">
			<!--start page wrapper -->
			<div class="wrapper">

				<div class="page-content">

					<!--breadcrumb-->
					<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
						<div class="breadcrumb-title pe-3"></div>
						<div class="ps-3">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb mb-0 p-0">
									<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
									</li>
									<li class="breadcrumb-item active" aria-current="page">单位详情</li>
								</ol>
							</nav>
						</div>

					</div>
					<!--end breadcrumb-->

					<div class="card">
						<div class="row g-0">
							<div class="col-md-8">
								<div class="card-body">
									<dl class="row">
										<dt class="col-sm-3">单位ID</dt>
										<dd class="col-sm-9">${unitdata.unitid}</dd>
										<hr>
										<dt class="col-sm-3">单位名称</dt>
										<dd class="col-sm-9">${unitdata.unitname}</dd>
										<hr>
										<dt class="col-sm-3">联系人</dt>
										<dd class="col-sm-9">${unitdata.contactperson}</dd>
										<hr>
										<dt class="col-sm-3">联系电话</dt>
										<dd class="col-sm-9">${unitdata.contactnumber}</dd>
										<hr>
										<dt class="col-sm-3">邮箱地址</dt>
										<dd class="col-sm-9">${unitdata.emailaddress}</dd>
										<hr>
										<dt class="col-sm-3">联系地址</dt>
										<dd class="col-sm-9">${unitdata.contactaddress}</dd>
										<hr>
										<dt class="col-sm-3">单位性质</dt>
										<dd class="col-sm-9">${unitdata.unittype}</dd>
										<hr>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end page wrapper -->
	<!--start overlay-->
	<div class="overlay toggle-icon"></div>
	<!--end overlay-->
	<!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
	<!--End Back To Top Button-->
	<footer class="page-footer">
		<p class="mb-0">Copyright © 2023. All right By <a href="http://www.bootstrapmb.com/">bootstrapmb</a>.</p>
	</footer>
</div>
<!--end wrapper-->

</body>
</html>
