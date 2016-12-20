<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myfun" uri="/myfuns" %>
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
<style type="text/css">
#image_segment {
   max-width: 1067px;
   overflow: auto;
   }
#image_segment .image {
	display: inline-block;
	height: 140px;
	white-space: nowrap;
}

#image_segment .image img {
	max-height: 140px;
	display: inline-block;
	/* max-width: 140px; */
}
</style>
<script>
	var con1 = '${obj.approval_flag1_con}';
	var con2 = '${obj.approval_flag2_con}';
	layui.use('layer', function() {
		$('#manager').on('click', function() {
			var that = this;
			if (con1) {
				layer.tips('审批意见：' + con1, that, {
					tips : [ 3, '#F7B824' ]
				}); //在元素的事件回调体中，follow直接赋予this即可
			}
		});
		$('#leader').on('click', function() {
			var that = this;
			if (con2) {
				layer.tips('审批意见：' + con2, that, {
					tips : [ 3, '#F7B824' ]
				}); //在元素的事件回调体中，follow直接赋予this即可
			}
		});
	});
</script>
<body>
	<!--  -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="ui container" style="background: #fff; min-height: 500px">
		<div class="ui segment">
			<div class="ui ordered mini steps">
			  <div class="completed step">
			    <div class="content">
			      <div class="title">提交</div>
			      <div class="description">
			      <p>${obj.cuser_organiz_name }${obj.cuser_name }</p>
			      <p><fmt:formatDate value="${obj.cdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			     </div>
			    </div>
			  </div>
			  <div class="${obj.approval_flag1 == 1? 'completed':'active'} step" id="manager" data-content="${obj.approval_flag1_con }" data-position="bottom left">
			    <div class="content">
			      <div class="title">管理员审批</div>
			      <div class="description"><p>${obj.oragniz_name_m }${obj.user_name_m }</p><p><fmt:formatDate value="${obj.approval_flag1_cdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></div>
			    </div>
			  </div>
			  <div class="${obj.approval_flag2 == 1? 'completed':'active'} step" id="leader" data-content="${obj.approval_flag2_con }" data-position="bottom left">
			    <div class="content">
			      <div class="title">领导审批</div>
			      <div class="description"><p>${obj.oragniz_name_l }${obj.user_name_l }</p><p><fmt:formatDate value="${obj.approval_flag2_cdate }" pattern="yyyy-MM-dd HH:mm:ss"/></p></div>
			    </div>
			  </div>
			</div>
			<button class="positive ui button"  style="float: right;">
				<a href="goNews1User" >返回新闻列表</a>
			</button>
		</div>
		<div class="ui segment">
			<h2 class="ui center aligned icon header">${obj.app_title}</h2>
			<c:if test="${obj.app_type=='1' }">
			<div class="ui segment" id="image_segment">
				<div class="image">
				    <c:forEach items="${fn:split(obj.app_urls,',')}" var="addr" begin="0" end="${fn:length(fn:split(obj.app_urls,','))}" varStatus="stat">
					<img src="${ addr}">
					</c:forEach>
				</div>
			</div>
            </c:if>
			<div class="description" style="min-height: 300px">
				<p>${obj.app_content}</p>
			</div>
			<div class="extra right" align="right">
				<p>创建人：${obj.cuser_organiz_name} ${obj.cuser_name}</p>
				<p></p>
				创建时间：<fmt:formatDate value="${obj.cdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
			<c:if test="${obj.app_files !=null }">
			<div class="ui segment" id="image_segment">
				<c:forEach items="${fn:split(obj.app_files,',')}" var="addr" begin="0" end="${fn:length(fn:split(obj.app_files,','))}" varStatus="stat">
					<i class="file text blue large icon" title="下载"></i><a href="news/app/download?url=${addr }">${myfun: tostr( addr)}</a>
				</c:forEach>
			</div>
			</c:if>
	
		</div>
	</div>

</body>
</html>