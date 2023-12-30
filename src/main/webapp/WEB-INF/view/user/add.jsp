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

			<c:if test="${admin!=null}">
				<div class="card">
					<div class="card-body">
						<form enctype="multipart/form-data" method="post" action="imExcelForUser">
							<input type="file" name="file" />
							<input type="submit" value="数据导入" />
						</form>
					</div>
				</div>
			</c:if>

			<div class="card border-top border-0 border-4 border-danger">
				<div class="card-body p-5">
					<div class="card-title d-flex align-items-center">
						<div><i class="bx bxs-venues me-1 font-22 text-danger"></i>
						</div>
						<h5 class="mb-0 text-danger">添加用户</h5>
					</div>
					<hr>
					<form class="row g-3" id="saveForm" >
						<div class="col-sm-6">
							<label for="userid" class="form-label">用户ID</label>
							<input type="text" name="userid" class="form-control" id="userid" placeholder="* 系统自动生成 *" readonly="readonly">
						</div>
						<div class="col-sm-6">
							<label for="workid" class="form-label">工号</label>
							<input type="text" name="workid" class="form-control" id="workid" placeholder="* 4~10位工号(INT) *">
						</div>
						<div class="col-sm-6">
							<label for="username" class="form-label">用户名</label>
							<input type="text" name="username" class="form-control" id="username" placeholder="* 工号 *" readonly="readonly">
						</div>
						<div class="col-sm-6">
							<label for="password" class="form-label">密码</label>
							<input type="text" name="password" class="form-control " id="password" placeholder="* 工号后4位 *" readonly="readonly">
						</div>
						<div class="col-sm-6">
							<label for="roleid" class="form-label">角色</label>
							<select class="form-select" id="roleid" name="roleid" aria-label="Default select example">
<%--								<option></option>--%>
<%--								<option value="0">管理员</option>--%>
								<option value="1" selected>工作人员</option>
<%--								<option value="2">读者</option>--%>
							</select>
						</div>
						<div class="col-sm-6">
							<label for="unitid" class="form-label">工作单位</label>
							<select class="form-select" id="unitid" name="unitid" aria-label="Default select example">
								<option></option>
								<option value="0">北京林业大学</option>
								<option value="1">清华大学</option>
								<option value="2">北京大学</option>
							</select>
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
							<button type="button" class="btn btn-danger px-5" id="save">添加</button>
						</div>
					</form>
				</div>
			</div>
			<!--breadcrumb-->

			<!--end row-->
		</div>
	</div>
	<!--end page wrapper -->
	<!--start overlay-->

</div>

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
			var roleid=$("#roleid").val();
			var workid=$("#workid").val();
			var unitid=$("#unitid").val();

			var unregex = /^\d{4,10}$/
			var cnregex = /^1[3|4|5|7|8][0-9]{9}$/;
			var emregex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
			var workidregex = /^\d{4,10}$/

			// if(username == null || username === ""){
			// 	layer.msg('用户名不能为空');
			// 	return false;
			// }
			// if (!unregex.test(username)) {
			// 	layer.msg('用户名不符合规则');
			// 	return false;
			// }
			// if(password == null || password === ""){
			// 	layer.msg('密码不能为空');
			// 	return false;
			// }
			if(workid == null || workid === ""){
				layer.msg('工号不能为空');
				return false;
			}
			if (!workidregex.test(workid)) {
				layer.msg('工号不符合规则');
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
			if(roleid == null || roleid === ""){
				layer.msg('请选择角色');
				return false;
			}
			if(unitid == null || unitid === ""){
				layer.msg('请选择工作单位');
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
							windows:location.href="userList.do"
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
