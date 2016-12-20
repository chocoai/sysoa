<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="/layui/layui.js"></script>
<link href='/layui/css/layui.css' rel='stylesheet' />
<link href='/css/form-style.css' rel='stylesheet' />
<div class="form-div">
	<form class="layui-form layui-form-pane" id="editpwd">
		<div class="layui-form-item">
			<label class="layui-form-label">原密码</label>
			<div class="layui-input-block">
				<input type="password" name="password" id="oldpwd" required lay-verify="required"
					placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-block">
				<input type="password" name="password" id="newpwd" required lay-verify="required"
					placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
		</div>
	</form>
</div>
<script>
	layui.use('form', function(){
		var form = layui.form;
	});
</script>