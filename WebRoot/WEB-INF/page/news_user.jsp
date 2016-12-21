<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
</head>

<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>
<script type="text/javascript">
	layui
			.use(
					[ 'form', 'layedit', 'laydate', 'upload' ],
					function() {
						var form = layui.form(), layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

						//创建一个编辑器
						//var editIndex = layedit.build('LAY_demo_editor');
						layedit.build('LAY_demo_editor', {
							tool : [ 'face', '|', 'left', 'center', 'right', '|', 'image'],
							uploadImage:{ url: 'news/app/upload', type: 'post'},
							height : 150
						});

						var num = 0;//上传文件的数量
						var abc = "";
						layui.upload({
							url : 'news/app/upload',
							method : 'post', //上传接口的http类型
							ext : 'jpg|png|gif',
							before: function(a){
							abc = layer.load(0, {time: 10*1000});
							},
							success : function(res) {
								if (res.isSuccess) {
									layer.close(abc);
								    num++;
									var str0 = $('#urls').val();
									var str = $('#url_true').val() ;
									if(str.length>0){
										str+=','
									}
									if(str0.length>0){
										str0+='|'
									}
									str0 += res.filename;
									str += res.url;
									$('#urls').val(str0);
									$('#url_true').val(str);
									$('#url_num').html('['+num+']').css('color','red');
								}
							}
						});
						var abd = "";
						layui.upload({
							url : 'news/app/upload',
							method : 'post', //上传接口的http类型
							elem: '#upfile1',
							before: function(a){
								abd = layer.load(0, {time: 10*1000});
							},
							success : function(res) {
								if (res.isSuccess) {
									layer.close(abd);
								    num++;
									var str0 = $('#files').val();
									var str = $('#file_true').val() ;
									if(str.length>0){
										str+=','
									}
									if(str0.length>0){
										str0+=' | '
									}
									str0 += res.filename;
									str += res.url;
									$('#files').val(str0);
									$('#file_true').val(str);
									$('#file_num').html('['+num+']').css('color','red');
								}
							}
						});


						form.on('radio(wenzi)', function(data){
							  //隐藏上传文件的标签
							hd_url_show.style.display = "none";
						});
						form.on('radio(img)', function(data){
							  //显示上传文件的标签
							hd_url_show.style.display = "block";
						});


						//自定义校验规则
						form.verify({
							  username: function(value){
							    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
							      return '用户名不能有特殊字符';
							    }
							    if(/(^\_)|(\__)|(\_+$)/.test(value)){
							      return '用户名首尾不能出现下划线\'_\'';
							    }
							    if(/^\d+\d+\d$/.test(value)){
							      return '用户名不能全为数字';
							    }
							  }

							  //我们既支持上述函数式的方式，也支持下述数组的形式
							  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
							  ,pass: [
							    /^[\S]{6,12}$/
							    ,'密码必须6到12位，且不能出现空格'
							  ],
							  url_true:function(value){

							  }

							});
					});
</script>
<body>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container"  style="background: #fff">
	  <div class="ui segment">
		<div class="site-title">
			<fieldset class="layui-elem-field layui-field-title">
				<legend>添加新闻材料</legend>
			</fieldset>
		</div>
		<div class="site-con">
			<button class="positive ui button"  style="float: right;">
				<a href="goNews1User" >返回新闻列表</a>
			</button>
			<form class="layui-form layui-form-pane" action="news/app/add" method="post">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">新闻标题</label>
					<div class="layui-input-block">
						<input type="text" name="title"
							placeholder="请输入标题" autocomplete="off" class="layui-input" lay-verify="required">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新闻类型</label>
					<div class="layui-input-inline">
						<input type="radio" name="type" value="0" title="文字" lay-filter="wenzi">
						<input type="radio" name="type" value="1" title="图片" checked lay-filter="img">
					</div>
				</div>
				<div class="layui-form-item" id="hd_url_show">
					<label class="layui-form-label">图片<span class="layui-circle" id="url_num"></span></label>
					<div class="layui-input-inline">
						<input type="text" name="urls" id="urls" laceholder="请输入标题" autocomplete="off" class="layui-input" >
						<input type="hidden" name="url_true" id="url_true" >
					</div>
						<input type="file" name="file" class="layui-upload-file" >
				</div>
				<div class="layui-form-item" >
					<label class="layui-form-label">附件<span class="layui-circle" id="file_num"></span></label>
					<div class="layui-input-inline">
						<input type="text" name="files"  id ="files" laceholder="请输入标题" autocomplete="off" class="layui-input" >
						<input type="hidden" name="file_true" id="file_true" >
					</div>
						<input type="file" name="file" id="upfile1" lay-ext="doc"  lay-type="file">
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">新闻内容</label>
					<div class="layui-input-block">
						<textarea class="layui-textarea layui-hide" name="content"
							 id="LAY_demo_editor" maxlength="245"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<button class="layui-btn" lay-submit >提交</button>
				</div>
			</form>
		</div>
     </div>
	</div>
</body>
</html>
