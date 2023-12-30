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
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-lg-9 col-xl-10">
									<form class="float-lg-end" action="bookList.do" method="post">
										<div class="row row-cols-lg-auto g-2">
											<div class="col-12">
												<div class="position-relative">
													<input type="text" class="form-control ps-5"name="keyword" id="keyword" placeholder="书名"> <span class="position-absolute top-50 product-show translate-middle-y"><i class="bx bx-search"></i></span>
												</div>
											</div>
											<div class="col-12">
												<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
													<div class="btn-group" role="group">
														<select class="form-select" name="bookcategory" id="bookcategory">
															<option value="">类型</option>
															<%--<c:forEach items="${bookcategoryList}" var="data">--%>
															<%--<option value="${data.bookcategoryid }">${data.bookcategoryname}</option>--%>
															<%--</c:forEach>--%>
															<option value="科学">科学</option>
															<option value="文学">文学</option>
															<option value="技术">技术</option>
															<option value="艺术">艺术</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-12">
												<button type="submit" class="btn btn-primary mb-3 mb-lg-0">查询</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<form class="float-lg-end" action="bookList2.do" method="post">
						<div class="col-12">
							<button type="submit" class="btn btn-primary mb-3 mb-lg-0">切换视图</button>
						</div>
					</form>
				</div>
			</div>

			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5 product-grid">
				<c:forEach items="${booklist.list}" var="data">
				<div class="col">
					<div class="card"  style="width: 300px;">
						<img src="/images/${data.imagepath}" class="card-img-top" alt="..." style="width: 100%;height: 260px">

						<div class="card-body">
							<h6 class="card-title cursor-pointer">图书编号: ${data.bookid}</h6>
							<h6 class="card-title cursor-pointer">书名: ${data.bookname}</h6>

							<div class="d-flex align-items-center mt-3 fs-6">

								<div class="cursor-pointer">
									<span class="">类型: ${data.bookcategory}</span>
								</div>

								<div class="cursor-pointer">
									<span class="">本数: ${data.bookcount}</span>
								</div>

								<div class="cursor-pointer">
									<span class="">单位: ${data.unit.unitname}</span>
								</div>

								<p class="mb-0 ms-auto">
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
								</p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div><!--end row-->

		<div class="card-body">
			<nav aria-label="...">
				<ul class="pagination pagination-lg">
					<li class="page-item"><a class="page-link" href="bookList.do?currentPage=1">首页</a>
					</li>
					<c:if test="${booklist.hasPreviousPage }">
						<li class="page-item"><a class="page-link" href="bookList.do?currentPage=${booklist.pageNum-1}">下一页</a>
						</li>
					</c:if>
					<c:if test="${booklist.hasNextPage }">
						<li class="page-item active" aria-current="page"><a class="page-link" href="bookList.do?currentPage=${booklist.pageNum+1}">上一页 <span class="visually-hidden">(current)</span></a>
						</li>
					</c:if>

					<li class="page-item"><a class="page-link" href="bookList.do?currentPage=${booklist.pages}">尾页</a>
					</li>
					<li style="margin-left: 10px; margin-top: 6px;">共<i
							class="blue">${booklist.total }</i>条记录，当前显示第<i class="blue">${booklist.pageNum }</i>页,&nbsp;
						总<i class="blue">${booklist.pages }</i>页
					</li>
				</ul>
			</nav>
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
</div>
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
