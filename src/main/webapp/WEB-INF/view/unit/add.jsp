<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="card border-top border-0 border-4 border-danger">
			<div class="card-body p-5">
				<div class="card-title d-flex align-items-center">
					<div><i class="bx bxs-college me-1 font-22 text-danger"></i>
					</div>
					<h5 class="mb-0 text-danger">添加单位</h5>
				</div>
				<hr>
				<form id="saveForm" method="post" class="row g-3 ">
					<div class="col-md-6">
						<label for="unitid" class="form-label">单位ID</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="unitid" class="form-control border-start-0" id="unitid" placeholder="* 系统自动生成 *" readonly="readonly">
						</div>
					</div>
					<div class="col-md-6">
						<label for="unitname" class="form-label">单位名称</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="unitname" class="form-control border-start-0" id="unitname">
						</div>
					</div>
					<div class="col-md-6">
						<label for="contactperson" class="form-label">联系人</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="contactperson" class="form-control border-start-0" id="contactperson">
						</div>
					</div>
					<div class="col-md-6">
						<label for="contactnumber" class="form-label">联系电话</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="contactnumber" class="form-control border-start-0" id="contactnumber">
						</div>
					</div>
					<div class="col-md-6">
						<label for="emailaddress" class="form-label">邮箱地址</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="emailaddress" class="form-control border-start-0" id="emailaddress">
						</div>
					</div>
					<div class="col-md-6">
						<label for="contactaddress" class="form-label">联系地址</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="contactaddress" class="form-control border-start-0" id="contactaddress">
						</div>
					</div>
					<div class="col-md-6">
						<label for="unittype" class="form-label">单位性质</label>
						<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
							<input type="text" name="unittype" class="form-control border-start-0" id="unittype">
						</div>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-danger px-5" id="save">添加</button>
					</div>
				</form>
			</div>
		</div>
    </div>
    <!--end page wrapper -->
    <!--start overlay-->
	</div>
</div>

<script >
	layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
		var form = layui.form,
				layer = layui.layer,
				laydate = layui.laydate,
				upload = layui.upload,
				$= layui.jquery;
		form.render(); // 这句一定要加

		$("#save").click(function() {
			$.ajax({
				cache : true,
				type : "post",
				url : "addUnit",
				data : $("#saveForm").serialize(),
				async : false,
				success : function(e) {
					if (e) {
						alert("添加成功");
						window.parent.location.href = "unitList.do";
					} else {
						alert("添加失败: 单位名重复");
					}
				}
			})
		})
	});
</script>

</body>

</html>
