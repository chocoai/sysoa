<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>督办工作详情</title>
<link rel="stylesheet" type="text/css"
	href="jsPlugin/semantic/semantic.min.css">
<link rel="stylesheet" type="text/css"
	href="jsPlugin/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/login.jsp.css">
<script src="js/jquery.min.js"></script>
<script src="jsPlugin/semantic/semantic.min.js"></script>
<script src="jsPlugin/layui/layui.js"></script>
<script src="jsPlugin/jqprint/jQuery.print.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container" style="background: #fff; min-height: 500px">

		<div class="ui segment">
			<fieldset class="layui-elem-field layui-field-title">
				<legend>
					<i class="layui-icon" style="font-size: 20px; color: #009688;">&#xe60a;</i>工作详情
				</legend>
				<button class="positive ui button"
					onclick="window.location.href='<%=basePath%>goSupervises'" style="float: right;">
					<i class="angle double left icon"></i> 返回列表
				</button>
			</fieldset>
			<div class="ui  segments">
				<div class="ui horizontal segments">
					<div class="ui basic segment" style="width: 70%">
						<h2 class="ui center aligned icon header">${obj.info_title}</h2>

						<div class="description">
							<p>${obj.info_con}</p>
						</div>
					</div>
					<div class="ui right floated segment" style="width: 25%">
						<p id="type">文件类型：${obj.info_type }</p>
						<p id="rec_org_id">${obj.rec_organiz_id}</p>
						<p>来文原号：${obj.rec_sno }</p>
						<p>批示文件编号：${obj.info_sno }</p>
						<p>创建人： ${obj.cuser_name}</p>
						<p>
							创建时间：
							<fmt:formatDate value="${obj.cdate }" pattern="yyyy-MM-dd HH:mm" />
						</p>
						<div class="ui basic segment" id="image_segment">
							<p>批示件扫描</p>
							<div class="image" id="layer-photos-demo">
								<c:if
									test="${ obj.info_img_url != null && obj.info_img_url !=''}">
									<c:forEach items="${fn:split(obj.info_img_url,',')}" var="addr"
										begin="0" end="${fn:length(fn:split(obj.info_img_url,','))}"
										varStatus="stat">
										<img src="<%=basePath%>${ addr}"
											style="height: 2em; cursor: pointer;" title="点击查看大图"
											alt="批示件扫描">
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="ui  segment">
					<blockquote class="layui-elem-quote " id="require1"></blockquote>
					<blockquote class="layui-elem-quote " id="require2"></blockquote>
				</div>
			</div>

			<div id="list">

				<table class="ui celled table">
					<caption style=" font-size: 1.3em;line-height: 3em;">
						<strong>各部门办理详情</strong>
					</caption>
					<thead>
						<tr>
							<th>办理部门</th>
							<th>办理进度(日期)</th>
							<th width="30%">办理情况</th>
							<th>上报材料</th>
							<th>审批状态</th>
							<th>审批部门/(日期)</th>
							<th class="no-print">操作</th>
						</tr>
					</thead>

					<tbody>

					</tbody>
					<tfoot>
						<tr>
							<th colspan="7">
								<div id="biuuu_city_list"></div>
							</th>
						</tr>
					</tfoot>

				</table>
			</div>
		</div>

		<input type="hidden" id="t_end_time" value="${obj.cdate}"> <input
			type="hidden" id="t_info_type" value="${obj.info_type}"> <input
			type="hidden" id="t_str" value="${str1}"> <input
			type="hidden" id="t_limit" value="${obj.require_finish_limit}">
		<input type="hidden" id="t_info_img_url" value="${obj.info_img_url}">
		<input type="hidden" id="t_progress_id" value="${obj.progress_id}">
		<input type="hidden" id="t_userflag" value="${flag}"> <input
			type="hidden" id="t_supervise_info_con"
			value="${obj.supervise_info_con}"> <input type="hidden"
			id="t_supervise_isfinish" value="${obj.isfinish}"> <input
			type="hidden" id="t_curr_user_organizid" value="${organizid}">

	</div>

	<script>
			var endtime = '${obj.cdate}';
			var info_type = '${obj.info_type}';
			var str = '${str1}';
			var limit = '${obj.require_finish_limit}';
			var info_img_url = '${obj.info_img_url}';
			var progress_id = "${obj.progress_id}";
			var userflag = "${flag}";
			var supervise_info_con = "${obj.supervise_info_con}";
			var supervise_isfinish = "${obj.isfinish}";
			var curr_user_organizid = "${organizid}"
		</script>
	<script src="js/supervise_detail.jsp.js"></script>
</body>
</html>