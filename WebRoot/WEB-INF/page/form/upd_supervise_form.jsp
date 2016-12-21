<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="jsPlugin/layui/layui.js"></script>
<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<div class="form-div">
	<form class="layui-form layui-form-pane" id="updsupervise">

		<div class="layui-form-item">
			<label class="layui-form-label">收文时间</label>
			<div class="layui-input-inline">
			<input type="hidden" name="oo.info_id">
			<input type="hidden" name="or.dbrequire_id">
			<input type="hidden" id="require_organiz_id" name="or.require_organiz_id">
				<input class="layui-input" name="oo.rec_time" id="rdate"
					placeholder="收文时间"
					onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
			</div>
			<label class="layui-form-label">来文单位</label>
			<div class="layui-input-inline">

				<select name="oo.rec_organiz_id" id="organiz">
					<c:forEach items="${organizList }" var="item">
						<option value="${item.id }">${item.user_organiz_name }</option>
					</c:forEach>
				</select>
			</div>
			<label class="layui-form-label">来文原号</label>
			<div class="layui-input-inline">
				<input type="number" name="oo.rec_sno" id="rec_sno" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文件类型</label>
			<div class="layui-input-inline">
				<select name="oo.info_type" id="type">
					<c:forEach items="${type}" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
			<label class="layui-form-label">文件编号</label>
			<div class="layui-input-inline">
				<input type="number" name="oo.info_sno" id="info_sno"
					class="layui-input">
			</div>
			<label class="layui-form-label">办理期限</label>
			<div class="layui-input-inline">
				<select name="or.require_finish_limit" id="limit">
					<c:forEach items="${limit }" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">简要内容</label>
			<div class="layui-input-block">
				<input type="text" id="title" name="oo.info_title" autocomplete="off" placeholder="简要内容"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">内容及要求</label>
			<div class="layui-input-block">
				<textarea name="oo.info_con" id="con" placeholder="请输入内容"
					class="layui-textarea" style="height: 250px"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">承办单位</label>
			<div class="layui-input-block">
				<c:forEach items="${organizList }" var="item">
					<input type="checkbox" name="organizs" value="${item.id }"
						title="${item.user_organiz_name }">
				</c:forEach>
			</div>
		</div>
	</form>
</div>
<script>
layui.use([ 'form', 'laydate' ], function() {
	var form = layui.form();
});
function loadform(){
	layui.use([ 'form', 'laydate' ], function() {
	});
	var form1 = layui.form();
	return form1;
}
</script>