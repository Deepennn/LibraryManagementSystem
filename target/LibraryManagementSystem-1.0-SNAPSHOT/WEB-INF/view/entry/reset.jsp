<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="cn">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="<%=path%>/assets/images/favicon-32x32.png" type="image/png" />
	<!--plugins-->
	<link href="<%=path%>/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="<%=path%>/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="<%=path%>/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
	<!-- loader-->
	<link href="<%=path%>/assets/css/pace.min.css" rel="stylesheet" />
	<script src="<%=path%>/assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="<%=path%>/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
	<link href="<%=path%>/assets/css/app.css" rel="stylesheet">
	<link href="<%=path%>/assets/css/icons.css" rel="stylesheet">
	<script type="text/javascript"  src="<%=path%>/assets/layui/layui.js"></script>
	<script type="text/javascript"  src="<%=path%>/assets/boot/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/main.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/Chart.js"></script>

	<title>图书馆管理系统</title>

</head>



<body class="bg-login">
<!--wrapper-->
<div class="wrapper">
	<div class="d-flex align-items-center justify-content-center my-5 my-lg-0">
		<div class="container">
			<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-2">
				<div class="col mx-auto">

					<div class="card">
						<div class="card-body">
							<div class="border p-4 rounded">
								<div class="text-center">
									<h3 class="">密码重置</h3>
									<p>找到密码? <a href="toLogin">点击登录</a>
									</p>
								</div>


								<div class="form-body">
									<form class="row g-3" id="saveForm" >
										<div class="col-sm-6">
											<label for="username" class="form-label">用户名</label>
											<input type="text" name="username" class="form-control" id="username" placeholder="">
										</div>
										<div class="col-sm-6">
											<label for="contactnumber4" class="form-label">您的联系电话后4位是?</label>
											<input type="password" name="contactnumber4" class="form-control " id="contactnumber4" placeholder="****">
										</div>
	                                    <div class="col-sm-6">
											<label for="password" class="form-label">新密码</label>
											<input type="password" name="password" class="form-control " id="password" placeholder="">
										</div>
	                                    <div class="col-sm-6">
											<label for="password2" class="form-label">确认新密码</label>
											<input type="password" name="password2" class="form-control " id="password2" placeholder="">
										</div>
										<div class="col-12">
											<div class="d-grid">
												<button type="button" id="save" class="btn btn-primary"><i class='bx bx-user'></i>重置</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--end row-->
		</div>
	</div>
</div>
<!--end wrapper-->
<!-- Bootstrap JS -->
<script src="<%=path%>/assets/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="<%=path%>/assets/js/jquery.min.js"></script>
<script src="<%=path%>/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="<%=path%>/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="<%=path%>/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>

<script>
	layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
		var form = layui.form,
				layer = layui.layer,
				laydate = layui.laydate,
				upload = layui.upload,
				$= layui.jquery;
		form.render(); // 这句一定要加

		$("#save").click(function(){
			var username=$("#username").val();
			var password=$("#password").val();
			var password2=$("#password2").val();
			var contactnumber4=$("#contactnumber4").val();

			var cnregex4 = /^\d{4}$/;

			if(username == null || username === ""){
				layer.msg('用户名不能为空');
				return false;
			}
			if(password == null || password === ""){
				layer.msg('密码不能为空');
				return false;
			}
			if(password !== password2){
				layer.msg('新密码输入不一致');
				return false;
			}
			if(contactnumber4 == null || contactnumber4 === ""){
				layer.msg('联系电话后4位不能为空');
				return false;
			}
			if (!cnregex4.test(contactnumber4)) {
				layer.msg('联系电话后4位不符合规则');
				return false;
			}

			//执行添加的操作ajax
			$.ajax({
				cache:true,
				type:"post",
				url:"resetUser",
				data:$("#saveForm").serialize(),
				async:false,
				success:function(e){
					if(e){
						layer.msg('重置成功', {
							icon: 1,
							time: 2000, //2秒关闭（如果不配置，默认是3秒）
							windows:location.href="toLogin"
						});
					}else{
						layer.msg('重置失败: 用户名或联系电话后4位错误', {
							icon: 5,
							time: 2000 //2秒关闭（如果不配置，默认是3秒）
						});
					}
				}
			})
		});
	});
</script>
<!--app JS-->
<script src="assets/js/app.js"></script>
</body>

</html>
