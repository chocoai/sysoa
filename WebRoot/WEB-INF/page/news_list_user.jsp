<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
</head>

<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>

<body>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container" style="background: #fff">
		<div class="ui segment">
			<div class="site-title">
				<fieldset class="layui-elem-field layui-field-title">
					<legend>新闻申请表</legend>
				</fieldset>
			</div>
			<div class="site-con">
			
			    <button class="positive ui button"  >
				<i class="add icon"></i><a href="goNewsUserIndex" >申请</a>
			 	</button>
				<table class="ui celled table" id="new_app_list">
					<thead>
						<tr>
							<th>新闻主题</th>
							<th>新闻类型</th>
							<th>创建部门</th>
							<th>创建时间</th>
							<th>审批状态</th>
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
				<input type="hidden" id="userid" value="${userId }"> <input
					type="hidden" id="flag" value="${flag }">
			</div>
		</div>
	</div>
</body>
<script src="js/news_list_user.jsp.js">
	
</script>
</html>