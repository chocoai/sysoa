<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>督办</title>
</head>

<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>
<script src="js/supervise_list.jsp.js"></script>
<body>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container" style="background: #fff; width: 100%;">
		<div class="ui segment">
			<div class="site-title">
				<fieldset class="layui-elem-field layui-field-title">
					<legend>督办表</legend>
				</fieldset>
			</div>
			<div class="site-con">
			    <c:if test="${flag=='M' }">
				<button class="positive ui button" onclick="addSupervise()">
					<i class="add icon"></i>表单填写
				</button>
				</c:if>
				
				<div class="layui-tab layui-tab-brief" >
				  <ul class="layui-tab-title">
				    <li class="layui-this">全部督办工作</li>
				    <li>办理中的工作</li>
				    <li>完结的工作</li>
				  </ul>
				  <div class="layui-tab-content">
				  	<div class="layui-tab-item layui-show">
				     <jsp:include page="table/supervise_all_tab.jsp"></jsp:include>
				    </div>
				    <div class="layui-tab-item">
				     <jsp:include page="table/supervise_ing_tab.jsp"></jsp:include>
				    </div>
    				<div class="layui-tab-item">
    				  <jsp:include page="table/supervise_ed_tab.jsp"></jsp:include>
    				</div>
				  </div>
				</div> 
				<input type="hidden" id="userid" value="${userId }"> 
				<input type="hidden" id="flag" value="${flag }">
				<input type="hidden" id="organizid" value="${organizid }">
		
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>