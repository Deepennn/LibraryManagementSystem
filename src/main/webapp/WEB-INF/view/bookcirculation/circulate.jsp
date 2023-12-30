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
							<li class="breadcrumb-item active" aria-current="page">图书列表</li>
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
								<th>图书编号</th>
								<th>书名</th>
								<th>图片</th>
								<th>类型</th>
								<th>本数</th>
								<th>所属单位</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${booklist}" var="data">
							<tr>
								<td>${data.bookid}</td>
								<td>${data.bookname}</td>
								<td><img src="/images/${data.imagepath}" id="preview_img" class="product-img-2"></td>
								<td>${data.bookcategory}</td>
								<td>${data.bookcount}</td>
								<td>${data.unit.unitname}</td>
								<td>
									<c:if test="${worker!=null && data.unitid!=worker.unitid}">
									    <c:if test="${data.bookcount>0}">
											<button type="button" class="btn btn-outline-primary"
													onclick="circulate(${data.bookid})"
											>申请流通</button>
									    </c:if>
										<c:if test="${data.bookcount<1}">
											<button type="button" class="btn btn-outline-primary"
													onclick="circulate(${data.bookid})"
													disabled="disabled"
											>申请流通</button>
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

<!--start overlay-->
<div class="overlay toggle-icon"></div>
<!--end overlay-->
<!--Start Back To Top Button-->
<a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
<!--End Back To Top Button-->

<!--plugins-->
<%--分页以及模糊查询登录不可删除--%>
<script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>

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

	function circulate(bookid){
		if(confirm("确定申请流通?")){
			$.ajax({
				url:"addCirculation",
				data:{"bookid": bookid},
				type:"post",
				dataType:"json",
				success:function (data) {
					if (data) {
						alert("申请流通成功: 待审核");
						window.parent.location.href = "circulationList.do";
					}else{
						alert("申请流通失败: 库存不足");
					}
				}
			});
		}
	}

</script>


</body>

</html>
