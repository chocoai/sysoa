<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager</title>
</head>

<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/laydate/laydate.js"></script>
<script src="jsPlugin/layui/layui.js"></script>
<script src="js/index.manager.jsp.js"></script>
<script type="text/javascript">
	
</script>
<body>

	<!--查看申请详情 model  -->
	<jsp:include page="form00/manager_recp_apply_detail.jsp"></jsp:include>
	<!--  -->
	<!-- 下发要求弹出层 -->
	<jsp:include page="form00/manager_recp_require_add.jsp"></jsp:include>
	<!--  -->
	<!--查看下发要求详情 model  -->
	<jsp:include page="form00/manager_recp_require_detail.jsp"></jsp:include>
	<!--  -->
	<!--反馈信息弹层 -->
	<div class="ui small modal" id="feeds">
	<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
		<div class="header">反馈详情</div>
		<div class="ui form" style="margin: 10px"
			id="feedsForm"></div>
	</div>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>
	<div class="ui container">
	
	<div class="ui segment">
			<div class="site-title">
				<fieldset class="layui-elem-field layui-field-title">
					<legend>接待工作</legend>
				</fieldset>
			</div>
	<!--选项卡  -->
		<div class="layui-tab layui-tab-brief" >
				  <ul class="layui-tab-title">
				    <li class="layui-this">接待审批</li>
				    <li>下发的接待任务</li>
				  </ul>
				  <div class="layui-tab-content">
				    <div class="layui-tab-item layui-show" >
				      <div class="ui segment" style="min-height: 65%">
						<div class="ui active inverted  dimmer" id="data1">
							<div class="ui text loader">加载中...</div>
						</div>
						<div class="ui cards" id="con-lef"></div>
					</div>
				    </div>
				    <div class="layui-tab-item ">
				    <div class="ui segment" style="min-height: 65%">
						<div class="ui active inverted  dimmer" id="data2">
							<div class="ui text loader">加载中...</div>
						</div>
						<button class="positive ui button" onclick="apply()">创建接待任务</button>
						<div class="ui cards" id="con-rig"></div>
					</div>
				    </div>
				  </div>
		</div>
	
	 </div>

		<!-- <div class="ui horizontal divider">接待审批</div>
		<div class="ui segment" style="height: 40%">
		    <div class="ui active inverted  dimmer" id="data1">
				<div class="ui text loader">玩命加载中...</div>
			</div>
			<div class="ui cards" id="con-lef"></div>
		</div>
		<div class="ui horizontal divider">下发的接待任务</div>
		<div class="ui segment" style="height: 35%">
		    <div class="ui active inverted  dimmer" id="data2">
				<div class="ui text loader">玩命加载中...</div>
			</div>
			<button class="positive ui button" onclick="apply()">创建接待任务</button>
			<div class="ui cards" id="con-rig"></div>
		</div> -->
	</div>

</body>
</html>