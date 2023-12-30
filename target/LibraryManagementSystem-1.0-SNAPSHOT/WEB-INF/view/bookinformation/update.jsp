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

			<div class="card border-top border-0 border-4 border-primary">
				<div class="card-body p-5">
					<div class="card-title d-flex align-items-center">
						<div><i class="bx bxs-user me-1 font-22 text-primary"></i>
						</div>
						<h5 class="mb-0 text-primary">修改</h5>
					</div>
					<hr>
					<form class="row g-3" id="saveForm">
						<div class="col-md-6">
							<label for="bookid" class="form-label">图书编号</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="bookid" class="form-control border-start-0" id="bookid" value="${bookdata.bookid}" readonly="readonly">
							</div>
						</div>
						<div class="col-md-6">
							<label for="bookname" class="form-label">书名</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="bookname" class="form-control border-start-0" id="bookname" value="${bookdata.bookname}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="publicationdate" class="form-label">出版时间</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="date" name="publicationdate" class="form-control border-start-0" id="publicationdate" value="${bookdata.publicationdate}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="author" class="form-label">作者</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="author" class="form-control border-start-0" id="author" value="${bookdata.author}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="publisher" class="form-label">出版社</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="publisher" class="form-control border-start-0" id="publisher" value="${bookdata.publisher}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="bookcategory" class="form-label">分类</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="bookcategory" class="form-control border-start-0" id="bookcategory" value="${bookdata.bookcategory}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="pagecount" class="form-label">页数</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="text" name="pagecount" class="form-control border-start-0" id="pagecount" value="${bookdata.pagecount}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="price" class="form-label">价格</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="number" name="price" class="form-control border-start-0" id="price" value="${bookdata.price}">
							</div>
						</div>
						<div class="col-md-6">
							<label for="bookcount" class="form-label">本数</label>
							<div class="input-group"> <span class="input-group-text bg-transparent"><i class="bx bxs-user"></i></span>
								<input type="number" name="bookcount" class="form-control border-start-0" id="bookcount" value="${bookdata.bookcount}">
							</div>
						</div>
						<input type="hidden" name="imagepath" class="img" value="${bookdata.imagepath}">
						<div class="col-6">
							<label  class="form-label">图片上传</label>
							<div class="layui-upload-list">
								<img class="layui-upload-img" style="width:200px;height:100px;" id="demo1">
								<button type="button" class="btn btn-primary" id="test1">+</button>
								<p id="demoText"></p>
							</div>
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-primary px-5" id="save">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	$("#save").click(function() {
		var bookname=$("#bookname").val();

		if(bookname == null || bookname === ""){
			layer.msg('书名不能为空');
			return false;
		}

		$.ajax({
			cache : true,
			type : "post",
			url : "updateBook",
			data : $("#saveForm").serialize(),
			async : false,
			success : function(e) {
				if (e) {
					alert("修改成功");
					window.parent.location.href = "bookList.do";
				} else {
					alert("修改失败");
				}
			}
		})
	});
</script>

<script>

	layui.use([ 'form','jquery','layer','laydate','upload' ], function() {
		var form = layui.form,
				layer = layui.layer,
				laydate = layui.laydate,
				upload = layui.upload,
				$= layui.jquery;
		form.render(); // 这句一定要加

		/*   laydate.render({
          elem: '#schoolTime'
        });
          laydate.render({
          elem: '#day'
        });  */


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
	});


</script>
</body>

</html>
