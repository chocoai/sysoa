<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>综合管理</title>
</head>

<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>
<script src="js/integrated_list.jsp.js"></script>
<body>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container" style="background: #fff">
		<div class="ui segment">
			<fieldset class="layui-elem-field layui-field-title">
				<legend>综合信息</legend>
			</fieldset>
			  <button class="positive ui button" id="_add_integrated" onclick="addintegrateinfo()">
				<i class="add icon"></i>申请
			  </button>
			<table class="ui celled table" id="integrated_info_list">
					<thead>
						<tr>
							<th>标题</th>
							<th>申请部门</th>
							<th>申请时间</th>
							<th>审批状态</th>
							<th>办理状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="demo8">
					</tbody>
					<tfoot>
						<tr>
							<th colspan="6">
								<div id="biuuu_city_list"></div>
							</th>
						</tr>
					</tfoot>
				</table>
				<input type="hidden" id="userid" value="${userId }"> 
				<input type="hidden" id="flag" value="${flag }">
				<input type="hidden" id="organizid" value="${organizid }">
		</div>
	</div>
</body>
</html>
