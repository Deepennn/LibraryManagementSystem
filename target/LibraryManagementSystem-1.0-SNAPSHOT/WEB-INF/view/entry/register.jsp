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
									<h3 class="">注&nbsp;&nbsp;册</h3>
									<p>已有账号? <a href="toLogin">点击登录</a>
									</p>
								</div>


								<div class="form-body">
									<form class="row g-3" id="saveForm" >
										<div class="col-sm-6">
											<label for="userid" class="form-label">用户ID</label>
											<input type="text" name="userid" class="form-control" id="userid" placeholder="* 系统自动生成 *" readonly="readonly">
										</div>
										<div class="col-sm-6">
											<label for="username" class="form-label">用户名</label>
											<input type="text" name="username" class="form-control" id="username" placeholder="">
										</div>
										<div class="col-sm-6">
											<label for="password" class="form-label">密码</label>
											<input type="password" name="password" class="form-control " id="password" placeholder="">
										</div>
										<div class="col-sm-6">
											<label for="realname" class="form-label">真实姓名</label>
											<input type="text" name="realname" class="form-control" id="realname" placeholder="">
										</div>
										<div class="col-sm-6">
											<label for="gender" class="form-label">性别</label>
											<select class="form-select" id="gender" name="gender" aria-label="Default select example">
												<option></option>
												<option value="男">男</option>
												<option value="女">女</option>
											</select>
										</div>
										<div class="col-sm-6">
											<label for="contactnumber" class="form-label">联系电话</label>
											<input type="text" name="contactnumber" class="form-control " id="contactnumber" placeholder="">
										</div>
										<div class="col-sm-6">
											<label for="email" class="form-label">邮箱</label>
											<input type="email" name="email" class="form-control" id="email" placeholder="example@user.com">
										</div>
										<div class="col-sm-6">
											<label for="address" class="form-label">住址</label>
											<input type="text" name="address" class="form-control" id="address">
										</div>

										<input type="hidden" name="avatarpath" class="img">
										<div class="col-sm-6">
											<label for="test1" class="form-label">头像上传</label>
											<div class="layui-upload-list">
												<img class="layui-upload-img" style="width:200px;height:100px;" id="demo1">
												<button type="button" class="layui-btn layui-btn-sm " id="test1">+</button>
												<p id="demoText"></p>
											</div>
										</div>

										<div class="col-12">
											<div class="form-check form-switch">
												<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
												<label class="form-check-label" for="flexSwitchCheckChecked">我接受用户协议和隐私政策</label>
											</div>
										</div>
										<div class="col-12">
											<div class="d-grid">
												<button type="button" id="save" class="btn btn-primary"><i class='bx bx-user'></i>注册</button>
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


		var uploadInst = upload.render({
			elem: '#test1'
			,url: 'upload'
			,accept:'images'
			,size:50000
			,before: function(obj){

				obj.preview(function(index, file, result){

					$('#demo1').attr('src', result);
				});
			}
			,done: function(res){
				//如果上传失败
				if(res.code > 0){
					return layer.msg('上传失败');
				}
				//上传成功
				var demoText = $('#demoText');
				demoText.html('<span style="color: #4cae4c;">上传成功</span>');

				var fileupload = $(".img");
				fileupload.attr("value",res.data.src);
				console.log(fileupload.attr("value"));
			}
			,error: function(){
				//演示失败状态，并实现重传
				var demoText = $('#demoText');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function(){
					uploadInst.upload();
				});
			}
		});



		$("#save").click(function(){
			var username=$("#username").val();
			var password=$("#password").val();
			var contactnumber=$("#contactnumber").val();
			var email=$("#email").val();

			var cnregex = /^1[3|4|5|7|8][0-9]{9}$/;
			var emregex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

			if(username == null || username === ""){
				layer.msg('用户名不能为空');
				return false;
			}
			if(password == null || password === ""){
				layer.msg('密码不能为空');
				return false;
			}
			if(contactnumber == null || contactnumber === ""){
				layer.msg('联系电话不能为空');
				return false;
			}
			if (!cnregex.test(contactnumber)) {
				layer.msg('联系电话不符合规则');
				return false;
			}
			if(email == null || email === ""){
				layer.msg('邮箱地址不能为空');
				return false;
			}
			if (!emregex.test(email)) {
				layer.msg('邮箱地址不符合规则');
				return false;
			}

			//执行添加的操作ajax
			$.ajax({
				cache:true,
				type:"post",
				url:"addUser",
				data:$("#saveForm").serialize(),
				async:false,
				success:function(e){
					if(e){
						layer.msg('添加成功', {
							icon: 1,
							time: 2000, //2秒关闭（如果不配置，默认是3秒）
							windows:location.href="toLogin"
						});
					}else{
						layer.msg('添加失败: 用户名重复', {
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
