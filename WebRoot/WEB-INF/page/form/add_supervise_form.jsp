<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
 <head>
 		<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
	<script src="js/jquery-3.1.1.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>

 </head>
 <body>
<div class="form-div">
	<form class="layui-form layui-box layui-form-pane" id="addsupervise">
		<div class="layui-form-item">
			<label class="layui-form-label">收文时间</label>
			<div class="layui-input-inline">
				<input class="layui-input" name="rdate" id="rdate"
					placeholder="收文时间"
					onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
			</div>
			<label class="layui-form-label">来文单位</label>
			<div class="layui-input-inline">

				<select name="organiz" id="organiz">
					<%-- <c:forEach items="${organizList }" var="item">
						<option value="${item.id }">${item.user_organiz_name }</option>
					</c:forEach> --%>
					<c:forEach items="${rec_organiz}" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
			<label class="layui-form-label">来文原号</label>
			<div class="layui-input-inline">
				<input type="text" name="rec_sno" id="rec_sno" placeholder="来文原号" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文件类型</label>
			<div class="layui-input-inline">
				<select name="type" id="type">
					<c:forEach items="${type}" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
			<label class="layui-form-label">文件编号</label>
			<div class="layui-input-inline">
				<input type="text" name="info_sno" id="info_sno" placeholder="文件编号"
					class="layui-input">
			</div>

			<label class="layui-form-label">领导批示类型</label>
			<div class="layui-input-inline">
				<select name="app_type" id="app_type">
					<c:forEach items="${app_type}" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="ui segment" id="image_segment">
				<div class="image">
					
				</div>
				<input type="file" name="file" class="layui-upload-file"
			lay-ext="jpg|png|gif" lay-title="批示文件扫描（图片）" id="upimg">
			<input type="hidden" id="info_img" >
		</div>
		
        
	   
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">来文简要内容</label>
			<div class="layui-input-block">
				<textarea name="title" id="title" placeholder="简要内容"
					class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">领导批示内容及要求</label>
			<div class="layui-input-block">
				<textarea name="con" id="con" placeholder="请输入内容"
					class="layui-textarea"></textarea>
			</div>
		</div>
		<!-- 要求内容 -->
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
			<div class="layui-input-block" id = "check-box">
			   <%--  <c:forEach items="${organizList }" var="item"> 
				<input type="checkbox" name="organizs" value="${item.id }" title="${item.user_organiz_name }">
				</c:forEach> --%>
				
				<div class="ui multiple selection dropdown" style="min-width: 57em; min-height: 2.2em;border: 1px solid black;">
				  <input name="organizs" type="hidden" id="organizs" value="">
				  <i class="dropdown icon"></i>
				  <div class="default text">选择下发单位</div>
				  <div class="menu">
				  <c:forEach items="${organizList }" var="item"> 
				      <div class="item" data-value="${item.id }">${item.user_organiz_name }</div>
				      </c:forEach>
				  </div>
				</div>
				
			</div>
		</div>
		
	</form>
</div>
</body>
</html>
<script>
	
	
	
	layui.use([ 'form', 'laydate', 'upload', 'layer' ], function() {
		var form = layui.form(), layer = layui.layer, $ = layui.jquery;
		$('.layui-upload-button').css( 'background-color', 'rgba(0,0,0,.2)');
		var abc = null;
		var imgele = '';
		var urlval ='';
		layui.upload({
			url : 'news/app/upload',
			before : function(input) {

				abc = layer.load(0, {
					time : 10 * 1000
				});
			},
			success : function(res) {
				layer.close(abc);
				if(urlval){urlval+=',';}
				urlval += res.url;
				imgele +='<img src='+res.url+' alt="....."> ';
				$('#info_img').val(urlval);
				$('#image_segment .image').html(imgele);
				
				//$('#upimg').addClass('layui-disabled');
			}
		});
		
	});
	$('#check-box .dropdown').dropdown();
function vdform(){
	var flag1 = false;
	layui.use(['layer'], function() {
	var layer = layui.layer, $ = layui.jquery;
	$('form input, textarea').each(function(i, item){
		
			
		/* 	if(item.id = 'info_img' && !item.value && item.type == 'hidden'){
				
				layer.tips('请上传附件', '#image_segment', {tips: [3, 'red'],tipsMore: true});
			} */
			
			if(item.name != 'file' && item.type != 'hidden'){
			     
				if(!item.value){
					layer.tips('内容不能为空', item, {tips: [3, 'red'],tipsMore: true});
				}
				if(item.type == 'checkbox' ){
					if(item.checked){
						flag1 = true;
					}
				}
			}
			if(item.id == 'organizs' && item.type == 'hidden'){
				if(!item.value){
					layer.tips('请选择下发部门', '#check-box', {tips: [3, 'red'],tipsMore: true});
				}
				
			}
		});
	
/* 	if(!flag1){
		layer.tips('请选择下发部门', '#check-box', {tips: [3, 'red'],tipsMore: true});
	} */
	});
}

</script>