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
							<li class="breadcrumb-item active" aria-current="page">单位列表</li>
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
								<th>单位ID</th>
								<th>单位名称</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${unitlist}" var="data">
							<tr>
								<td>${data.unitid}</td>
								<td>${data.unitname}</td>
								<td>
									<c:if test="${admin!=null}">
                                        <a href="toUnitDetail.do?unitid=${data.unitid}" type="button" class="btn btn-outline-primary">详情</a>
                                        <a href="toUpdateUnit.do?unitid=${data.unitid}" type="button" class="btn btn-outline-success">修改</a>
										<button type="button" class="btn btn-outline-danger" onclick="del(${data.unitid})">删除</button>
									</c:if>
								</td>
							</tr>
							</c:forEach>
							</tfoot>
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

	function del(id){
		if(confirm("确定删除?")){
			$.ajax({
				url:"deleteUnit",
				data:{"id": id},
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
