<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<script src="jsPlugin/layui/layui.js"></script>
<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<div class="form-div">
<form class="layui-form layui-form-pane" id="addintegrated">
	<div class="layui-form-item">
		<label class="layui-form-label">申请标题</label>
		<div class="layui-input-block ">
			<input type="text"  id="title" autocomplete="off" placeholder="工作标题"
				class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">申请内容</label>
		<div class="layui-input-block ">
			<textarea name="con" id="con" placeholder="请输入内容" class="layui-textarea" ></textarea>
		</div>
	</div>
</form>
</div>
<script>
	layui.use(['form','jquery'], function(){
		 form = layui.form
         
	});	

</script>