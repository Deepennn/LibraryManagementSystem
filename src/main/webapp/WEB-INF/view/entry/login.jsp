<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="cn">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
	<!--plugins-->
	<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
	<!-- loader-->
	<link href="assets/css/pace.min.css" rel="stylesheet" />
	<script src="assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
	<link href="assets/css/app.css" rel="stylesheet">
	<script type="text/javascript"  src="assets/boot/layui/layui.js"></script>
	<script type="text/javascript" src="assets/boot/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/boot/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/boot/js/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="assets/boot/js/main.min.js"></script>
	<script type="text/javascript" src="assets/boot/js/Chart.js"></script>
	<script type="text/javascript" src="assets/echarts.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/boot/js/jquery.min.js"></script>
	<script type="text/javascript"  src="<%=path%>/assets/layui/layui.js"></script>
	<script type="text/javascript"  src="<%=path%>/assets/boot/layui/layui.js"></script>

	<title>图书馆管理系统</title>

</head>

<body class="bg-login">
	<!--wrapper-->
	<div class="wrapper">
		<div class="section-authentication-signin d-flex align-items-center justify-content-center my-5 my-lg-0">
			<div class="container-fluid">
				<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
					<div class="col mx-auto">

						<div class="card">
							<div class="card-body">
								<div class="border p-4 rounded">
									<div class="text-center">
										<h3 class="">登&nbsp;&nbsp;录</h3>
										<p>没有账号? <a href="${pageContext.request.contextPath}/toRegister">立即注册</a>
										</p>
									</div>

									<div class="login-separater text-center mb-4"> <span>输入用户名和密码登录</span>
										<hr/>
									</div>
									<div class="form-body">
										<form class="row g-3">
											<div class="col-12">
												<label for="username" class="form-label">用户名</label>
												<span id="msg" style="color:red;"></span>
												<input type="text" name="username" class="form-control" id="username" placeholder="">
											</div>
											<div class="col-12">
												<label for="password" class="form-label">密码</label>
												<span id="msg2" style="color:red;"></span>
												<div class="input-group" id="show_hide_password">
													<input type="password" name="password" class="form-control border-end-0" id="password" value="" placeholder=""> <a href="javascript:;" class="input-group-text bg-transparent"><i class='bx bx-hide'></i></a>
												</div>
											</div>
<%--											<div class="col-12">--%>
<%--												<select class="form-select mb-3" aria-label="Default select example" id="type" name="type" size="1">--%>
<%--													<option selected>--- 选择角色 ---</option>--%>
<%--													<option value="0">管理员</option>--%>
<%--													<option value="1">工作人员</option>--%>
<%--													<option value="2">读者</option>--%>
<%--												</select>--%>
<%--												<font  color="red">${message}</font>--%>
<%--											</div>--%>

										    <div class="col-md-6 text-end">
												<p>忘记密码? <a href="${pageContext.request.contextPath}/toReset">立即重置</a>
												</p>
											</div>

											<div class="col-12">
												<div class="d-grid">
													<button type="button" class="btn btn-primary" id="login"><i class="bx bxs-lock-open"></i>登录</button>
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
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<!--plugins-->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
	<script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
	<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
	<!--Password show & hide js -->

	<!--app JS-->
	<script src="assets/js/app.js"></script>

	<script type="text/javascript">
		layui.use(['layer', 'form','jquery'], function(){
			var layer = layui.layer
					,form = layui.form
					,jquery=layui.jquery;
			$("#login").on("click", function() {
				var username = $("#username").val().trim(); // trim()去除空格
				var password = $("#password").val().trim();
				var type = $("#type").val();
				if(!username) {
					$("#msg").html("用户名不能为空");
					$("#username").focus(); // 聚焦
					return false;
				} else {
					if(!password) {
						$("#msg2").html("密码不能为空");
						$("#password").focus(); // 聚焦
						return false;
					} else {
						$("#msg").html("");
					}
				}

				$.ajax({
					type: "post", // post或get
					url: "${pageContext.request.contextPath}/login", // 提交路径
					data: {
						username: username,
						password: password,
						type: type,
					},
					// dataType: "json", // 指定后台传来的数据是json格式
					success: function(data) {

						if (data === "adminok") {
							layer.msg('登陆成功: 欢迎管理员', {icon: 6});
							// 延迟跳转
							window.setTimeout("window.location='toMain.do'",900);
						}
						else if(data === 'workerok'){
							layer.msg('登陆成功: 欢迎工作人员', {icon: 6});
							window.setTimeout("window.location='toMain.do'",900);
						}
						else if(data === 'readerok'){
							layer.msg('登陆成功: 欢迎读者', {icon: 6});
							window.setTimeout("window.location='toMain.do'",900);
						}
						else if(data === "error"){
							layer.tips('用户名或密码错误', '#login', {
								tips: [2, '#ff0033'],
								time: 4000
							});
						}
					},
					error: function(err) {}
				})
			})
		});
	</script>
</body>

</html>
