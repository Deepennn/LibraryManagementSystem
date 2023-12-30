<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/view/common/template.jsp"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<body>
<!--wrapper-->
<div class="wrapper">
	<jsp:include page="/WEB-INF/view/common/header.jsp"/>
	<jsp:include page="/WEB-INF/view/common/menu.jsp"/>
	<!--start page wrapper -->
	<div class="page-wrapper">
		<div class="page-content">

			<div class="card border-top border-0 border-4 border-primary">
				<div class="card-body p-5">
					<div class="card-title d-flex align-items-center">
						<div><i class="bx bxs-user me-1 font-22 text-primary"></i>
						</div>
						<h5 class="mb-0 text-primary">确定归还</h5>
					</div>
					<hr>
					<form class="row g-3" id="saveForm">
						<input type="hidden" name="id"  value="${bookborrowing.borrowid}">
						<div class="col-md-6">
							<label  class="form-label">图书编号</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="names" class="form-control border-start-0" readonly  placeholder=" " value="${bookborrowing.bookid}">
							</div>
						</div>
						<div class="col-md-6">
							<label  class="form-label">借阅时间</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text"  class="form-control border-start-0" readonly  placeholder=" " value="${bookborrowing.borrowtime}">
							</div>
						</div>
						<div class="col-md-6">
							<label  class="form-label">还书时间</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text"  class="form-control border-start-0" readonly  placeholder=" " value="${bookborrowing.returntime}">
							</div>
						</div>
						<div class="col-md-6">
							<label  class="form-label">借阅天数</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text"  class="form-control border-start-0" readonly  placeholder=" " value="${borrrowday}">
							</div>
						</div>
						<div class="col-md-6">
							<label  class="form-label">超时天数</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text"  class="form-control border-start-0" readonly  placeholder=" " value="${exceedday}">
							</div>
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-danger px-5" id="save">归还</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	$("#save").click(function() {
		$.ajax({
			cache : true,
			type : "post",
			url : "restoreBorrowing",
			data : $("#saveForm").serialize(),
			async : false,
			success : function(e) {
				if (e) {
					alert("申请归还成功: 待审核");
					window.parent.location.href = "borrowingList.do";
				} else {
					alert("申请归还失败");
				}
			}
		})
	});
</script>


</body>

</html>
