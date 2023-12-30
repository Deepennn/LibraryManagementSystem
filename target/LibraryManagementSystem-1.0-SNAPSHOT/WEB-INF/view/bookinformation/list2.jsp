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
					<form class="float-lg-end" action="bookList.do" method="post">
						<div class="col-12">
							<button type="submit" class="btn btn-primary mb-3 mb-lg-0">切换视图</button>
						</div>
					</form>
				</div>
			</div>

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
									<a href="toBookDetail.do?bookid=${data.bookid}" type="button" class="btn btn-outline-secondary">详情</a>
									<c:if test="${admin!=null || worker!=null}">
										<a href="toUpdateBook.do?bookid=${data.bookid}" type="button" class="btn btn-outline-success">修改</a>
										<c:if test="${data.bookcount>0}" >
											<button type="button" class="btn btn-outline-danger"
													onclick="del(${data.bookid})"
													disabled="disabled"
											>删除</button>
										</c:if>
										<c:if test="${data.bookcount<1}" >
											<button type="button" class="btn btn-outline-danger"
													onclick="del(${data.bookid})"
											>删除</button>
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

	function del(bookid){
		if(confirm("确定删除?")){
			$.ajax({
				url:"deleteBook",
				data:{"bookid": bookid},
				type:"post",
				dataType:"json",
				success:function (data) {
					if (data) {
						alert("删除成功");
						document.location.reload();//当前页面
					}else{
						alert("删除失败");
					}
				}
			});
		}
	}

</script>


</body>

</html>
