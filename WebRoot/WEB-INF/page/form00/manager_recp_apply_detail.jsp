<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ui small long modal" id="lookApply">
		<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
	<div class="header">申请详情</div>
	<div class="ui form" style="margin: 10px" id="updapplyForm">
		<div class="two fields disabled">
			<div class="field ">
				<label>来兰州时间：</label> <input type="text"
					name="oo.persion_start_time" class="start" placeholder="Last Name">
			</div>
			<div class="field ">
				<label>离开兰州的时间：</label> <input type="text"
					name="oo.persion_end_time" class="end" placeholder="Last Name">
			</div>
		</div>
		<div class="three fields disabled">
			<div class="field">
				<label>接待人姓名：</label> <input type="text" name="oo.persion_name"
					class="name" placeholder="First Name">
			</div>
			<div class="field">
				<label>接待人职务：</label> <input type="text" name="oo.persion_position"
					class="position" placeholder="Last Name">
			</div>

			<div class="field">
				<label>接待人所在部门：</label> <input type="text" name="oo.persion_depart"
					class="depart" placeholder="First Name">
			</div>
		</div>
		<div class="field disabled">
			<label>来兰州的目的：</label> <input type="text"
				name="oo.persion_purpose_tolz" class="purpose"
				placeholder="Last Name">
		</div>
		<div class="field disabled">
			<label>申请部门：</label> <input type="text" name="oo.persion_organiz"
				class="organiz" placeholder="Last Name">
		</div>
		<h3 class="ui dividing header">审批信息</h3>
		<div class="field">
			<label>审批类型</label> <select class="ui dropdown" name="type" id="type">
				<option value="">请选择</option>
				<option value="1">同意</option>
				<option value="2">拒绝</option>
			</select>
		</div>
		<div class="field">
			<label>审批意见</label>
			<textarea name="con" id="con"></textarea>
		</div>
		<button class="ui blue button" onclick="updApply(this)">审批</button>
		<div class="ui error message" id="msg"></div>
	</div>
</div>

<script>
//$('#lookApply .dropdown').dropdown();
</script>