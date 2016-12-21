<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="ui segment">
    <form class="layui-form layui-form-pane layui-box">
	    <div class="layui-form-item">
		    <label class="layui-form-label">范围选择</label>
		    <div class="layui-input-inline">
		      <input class="layui-input" id="start" placeholder="开始日" onclick="layui.laydate({elem: this, istime: false, format: 'YYYY-MM-DD'})">
		    </div>
		    <div class="layui-input-inline">
		      <input class="layui-input" id="end" placeholder="截止日" onclick="layui.laydate({elem: this, istime: false, format: 'YYYY-MM-DD'})">
		    </div>
	    </div>
   </form>
   <button class="layui-btn layui-btn-normal" onclick="_findCondiction()">查询</button>
</div>	
<table class="ui selectable celled table" id="new_app_list01">
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
	<tbody id="demo801">
	</tbody>
	<tfoot>
		<tr>
			<th colspan="11">
				<div id="biuuu_city_list01"></div>
			</th>
		</tr>
	</tfoot>
</table>

<script>
	layui.use([ 'form', 'laydate'], function() {
	});

</script>