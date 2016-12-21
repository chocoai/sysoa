<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="jsPlugin/layui/layui.js"></script>
<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<div class="form-div">
	<form class="layui-form layui-box layui-form-pane" id="applysupervise">
		<div class="layui-form-item">
			<label class="layui-form-label">审批状态</label>
			<div class="layui-input-block">
				<select name="status" id="status">
						<option value="1">通过</option>
						<option value="2">拒绝</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">审批意见</label>
			<div class="layui-input-block">
				<textarea name="con" id="con" placeholder="请输入意见"
					class="layui-textarea"></textarea>
			</div>
		</div>

	</form>
</div>
<script>
layui.use([ 'form', 'laydate' ], function() {
	var form = layui.form();
});
function initform(){
	layui.use([ 'form', 'laydate' ], function() {
		var form1 = layui.form();
		form1.render();
	});
}
</script>