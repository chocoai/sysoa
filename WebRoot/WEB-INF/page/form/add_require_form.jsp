<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="jsPlugin/layui/layui.js"></script>
<script src="jsPlugin/laydate/laydate.js"></script>
<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<div class="form-div">
	<form class="layui-form layui-form-pane" id="addsupervise">
		<div class="layui-form-item">
			<label class="layui-form-label">下发的工作</label>
			<div class="layui-input-block">
				<select name="supervise" id="supervise">
				   <c:forEach items="${supervise }" var="item"> 
					<option value="${item.info_id }">${item.info_title }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">办理期限</label>
			<div class="layui-input-block">
				<select name="limit" id="limit">
				   <c:forEach items="${limit }" var="item"> 
					<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">承办单位</label>
			<div class="layui-input-block">
			    <c:forEach items="${organizList }" var="item"> 
				<input type="checkbox" name="organizs" value="${item.id }" title="${item.user_organiz_name }">
				</c:forEach>
			</div>
		</div>
		
	</form>
</div>
<script>
	layui.use('form', function() {
		var form = layui.form;
		
		//laydate({elem: '#finish', istime: true,min: laydate.now(), format: 'YYYY-MM-DD hh:mm'});
	});
</script>