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
<div class="wrapper">
	<jsp:include page="/WEB-INF/view/common/header.jsp"/>
	<jsp:include page="/WEB-INF/view/common/menu.jsp"/>
	<div class="page-wrapper">
		<div class="page-content">
			<!--breadcrumb-->
			<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
				<div class="breadcrumb-title pe-3">Tables</div>
				<div class="ps-3">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 p-0">
							<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
							</li>
							<li class="breadcrumb-item active" aria-current="page">列表</li>
						</ol>
					</nav>
				</div>

			</div>
			<!--end breadcrumb-->

			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table id="example2" class="table table-striped table-bordered">
							<thead>
							<tr>
								<th>借阅ID</th>
								<th>书名</th>
								<th>借阅人用户名</th>
								<th>借阅时间</th>
								<th>归还时间</th>
								<th>应还时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${bookborrowinglist}" var="data">
							<tr>
								<td>${data.borrowid}</td>
								<td>${data.bookinformation.bookname}</td>
								<td>${data.user.username}</td>
								<td>${data.borrowtime}</td>
								<td>${data.returntime}</td>
								<td>${data.duetime}</td>
								<td>
									<c:if test="${data.borrowstatus==0}"><span class="badge rounded-pill text-primary bg-light-success p-2 text-uppercase px-3">借阅待审核</span></c:if>
								    <c:if test="${data.borrowstatus==1}"><span class="badge rounded-pill text-primary bg-light-success p-2 text-uppercase px-3">借阅通过审核</span></c:if>
									<c:if test="${data.borrowstatus==2}"><span class="badge rounded-pill text-primary bg-light-danger p-2 text-uppercase px-3">借阅未通过审核</span></c:if>
									<c:if test="${data.borrowstatus==3}"><span class="badge rounded-pill text-primary bg-light-success p-2 text-uppercase px-3">归还待审核</span></c:if>
									<c:if test="${data.borrowstatus==4}"><span class="badge rounded-pill text-primary bg-light-success p-2 text-uppercase px-3">归还通过审核</span></c:if>
									<c:if test="${data.borrowstatus==5}"><span class="badge rounded-pill text-primary bg-light-danger p-2 text-uppercase px-3">归还未通过审核</span></c:if>
								</td>
								<td>
									<c:if test="${reader!=null}">
									    <c:if test="${data.borrowstatus==1
													|| data.borrowstatus==5}">
											<button type="button" class="btn btn-outline-primary"
													onclick="restore(${data.borrowid})"
											>申请归还</button>
									    </c:if>
										<c:if test="${data.borrowstatus!=1
													&& data.borrowstatus!=5}">
											<button type="button" class="btn btn-outline-primary"
													onclick="restore(${data.borrowid})"
													disabled="disabled"
											>申请归还</button>
										</c:if>
									</c:if>
									<c:if test="${worker!=null}">
									    <c:if test="${data.borrowstatus==0
													|| data.borrowstatus==3}">
											<button type="button" class="btn btn-outline-success"
													onclick="approve(${data.borrowid})"
											>通过</button>
											<button type="button" class="btn btn-outline-danger"
													onclick="disapprove(${data.borrowid})"
											>不通过</button>
										</c:if>
										<c:if test="${data.borrowstatus!=0
													&& data.borrowstatus!=3}">
											<button type="button" class="btn btn-outline-success"
													onclick="approve(${data.borrowid})"
													disabled="disabled"
											>通过</button>
											<button type="button" class="btn btn-outline-danger"
													onclick="disapprove(${data.borrowid})"
													disabled="disabled"
											>不通过</button>
										</c:if>
									</c:if>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end wrapper-->


<!--plugins-->
<%--分页以及模糊查询登录不可删除--%>
<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>

<script>
	$('#uid').attr("disabled",true);
</script>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	} );
</script>
<script>
	$(document).ready(function() {
		var table = $('#example2').DataTable( {
			lengthChange: false,
			buttons: [ 'copy', 'excel', 'pdf', 'print']
		} );

		table.buttons().container()
				.appendTo( '#example2_wrapper .col-md-6:eq(0)' );
	} );
</script>

<script>

	function approve(borrowid){
		if(confirm("确定通过?")){
			$.ajax({
				url:"approveBorrowing",
				data:{"borrowid": borrowid},
				type:"post",
				dataType:"json",
				success:function (data) {
					if (data) {
						alert("审核成功");
						document.location.reload();//当前页面
					}else{
						alert("审核失败");
					}
				}
			});
		}
	}

	function disapprove(borrowid){
		if(confirm("确定不通过?")){
			$.ajax({
				url:"disapproveBorrowing",
				data:{"borrowid": borrowid},
				type:"post",
				dataType:"json",
				success:function (data) {
					if (data) {
						alert("审核成功");
						document.location.reload();//当前页面
					}else{
						alert("审核失败");
					}
				}
			});
		}
	}

	function restore(borrowid){
			if(confirm("确定申请归还?")){
				$.ajax({
					url:"restoreBorrowing", // "toRestoreBorrowing",
					data:{"borrowid": borrowid},
					type:"post",
					dataType:"json",
					success:function (data) {
						if (data) {
							alert("申请归还成功: 待审核");
							document.location.reload(); // 当前页面
						}else{
							alert("申请归还失败");
						}
					}
				});
			}
	}

</script>

</body>

</html>
