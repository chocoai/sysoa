<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<table class="ui selectable celled table" id="new_app_list02">
	<thead>
		<tr>
			<th>序号</th>
			<th>收件时间</th>
			<th>来文单位</th>
			<th>原号</th>
			<th width="15%">简要内容</th>
			<th width="15%">领导批示</th>
			<th>承办单位</th>
			<th width="15%">办理情况</th>
			<th>类型</th>
			<th>办理进度</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody id="demo802">
	</tbody>
	<tfoot>
		<tr>
			<th colspan="11">
				<div id="biuuu_city_list02"></div>
			</th>
		</tr>
	</tfoot>
</table>

<script>
	layui.use([ 'form', 'laydate'], function() {
	});

</script>