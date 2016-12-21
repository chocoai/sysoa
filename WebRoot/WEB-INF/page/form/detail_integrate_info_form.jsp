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
			<input type="text"  readonly="readonly"  id="title" autocomplete="off" placeholder="工作标题"
				class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">申请内容</label>
		<div class="layui-input-block ">
			<textarea name="con" id="con" readonly="readonly" placeholder="请输入内容" class="layui-textarea" ></textarea>
		</div>
	</div>
	
    <div class="layui-form-item" id="type">
    <label class="layui-form-label">审批</label>
    <div class="layui-input-block">
      			<select name="type">
      			    <option value="">请选择</option>
					<option value="2">拒绝</option>
					<option value="1">同意</option>
				</select>
    </div>
    </div>
  	<div class="layui-form-item">
		<label class="layui-form-label">审批意见</label>
		<div class="layui-input-block">
			<textarea name="con" id="idea" placeholder="暂未审批" class="layui-textarea" ></textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">办理状态</label>
		<div class="layui-input-block layui-disabled ">
			<input type="text" id="handl"  autocomplete="off" placeholder="暂未办理"
				class="layui-input" disabled>
		</div>
	</div>
</form>
</div>
<script>
	layui.use(['form','jquery'], function(){
		 form = layui.form
         
	});	

</script>