<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="jsPlugin/layui/layui.js"></script>
<script src="jsPlugin/laydate/laydate.js"></script>
<link href="jsPlugin/layui/css/layui.css" rel='stylesheet' />
<link href='css/form-style.css' rel='stylesheet' />
<script src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<div class="form-div">
	<form class="layui-form layui-box layui-form-pane" id="addprogress">
		<div class="layui-form-item" id="url_type">
			<label class="layui-form-label">材料类型</label>
			<div class="layui-input-block">
				<select name="type" id="type">
					<c:forEach items="${report }" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
		</div>


		<div class="ui horizontal segments" id="image_segment">
			<div class="ui segment list">
				<div class="ui basic segment" id="file"></div>
				<input type="file" name="file" class="layui-upload-file"
					lay-ext="doc|pdf" lay-title="汇报材料(doc/pdf)" id="upfile"> <input
					type="hidden" id="info_file">
			</div>
			<div class="ui segment list">
				<div class="ui basic segment" id="img"></div>
				<input type="file" name="file" class="layui-upload-file"
					lay-ext="jpg|png|gif" lay-title="相关图片(jpg/png/gif)" id="upimg">
				<input type="hidden" id="info_img">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">办理进度</label>
			<div class="layui-input-block">
				<select name="complete" id="complete">
					<c:forEach items="${complete }" var="item">
						<option value="${item.value }">${item.text }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">办理情况</label>
			<div class="layui-input-block">
				<textarea name="con" id="con" placeholder="请输入内容"
					class="layui-textarea"></textarea>
			</div>
		</div>


	</form>
</div>
<script>
layui.use([ 'form', 'laydate', 'upload', 'layer' ], function() {
	var form = layui.form(), layer = layui.layer, $ = layui.jquery;
	$('.layui-upload-button').css( 'background-color', 'rgba(0,0,0,.2)');
	var abc = null;
	var imgele = '';
	var urlval = '';
	var _file = '';
	var _urlval = '';
	layui.upload({
		elem : '#upfile',
		url : 'news/app/upload',
		before : function(input) {

			abc = layer.load(0, {
				time : 10 * 1000
			});
		},
		success : function(res) {
			
			
			 _file = $('#image_segment #file').html();
			 _urlval = $('#info_file').val();
			
			layer.close(abc);
			if(_urlval){_urlval += ',';}
			_urlval += res.url;
			 _file += '<p><i class="file text blue semll icon"></i><span>'+res.filename+'</span><i class="close icon" style="position: absolute; cursor: pointer;color: black;" title="删除" data="'+res.url+'"></i></p>';
			$('#info_file').val(_urlval);
			$('#image_segment #file').html(_file);
			initform();
			//$('#upimg').addClass('layui-disabled');
		}
	});
	layui.upload({
		elem :'#upimg',
		url : 'news/app/upload',
		before : function(input) {

			abc = layer.load(0, {
				time : 10 * 1000
			});
		},
		success : function(res) {
			 imgele = $('#image_segment #img').html();
			 urlval = $('#info_img').val();
			layer.close(abc);
			if(urlval){urlval+=',';}
			urlval += res.url;
			imgele += '<div><img src="'+res.url+'" alt="..."><i class="close icon" style="position: absolute; cursor: pointer;color: black;" title="删除" data="'+res.url+'"></i></div>';
			$('#info_img').val(urlval);
			$('#image_segment #img').html(imgele);
			initform();
			//$('#upimg').addClass('layui-disabled');
		}
	});
});
function initform(){
	layui.use([ 'form', 'laydate' ], function() {
		var form1 = layui.form();
		form1.render();
	});
	
	$(".segment .close").on('click', function(){
		
		var o = $(this).attr("data");
		var p = $(this).parents('div .list');
		var c = $(p).find('input[type="hidden"]');
		var s = $(c).val();
		if(s){
			s = s.replace(o,'');
			$(this).parents('.list').find('input[type="hidden"]').val(s);
		}
		$(this).parent().remove();
		//alert(s);
	});
}

function vdform(){
	layui.use(['layer'], function() {
	var layer = layui.layer, $ = layui.jquery;
	$('form input, textarea').each(function(i, item){
		
			
			if(item.id = 'info_img' && !item.value && item.type == 'hidden'){
				
				layer.tips('请上传附件', '#image_segment', {tips: [3, 'red'],tipsMore: true});
			}
			
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
		});

	});
}
</script>