<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ui small modal" id="upd">
	<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
	<div class="header">修改申请</div>
	<form class="ui form" style="margin: 10px"
		id="updapplyForm">
		<div class="two fields disabled">
		 <input type="hidden" id="appid" name="oo.apply_id"/>
			<div class="field ">
				<label>来兰州时间：</label> <input type="text"
					name="oo.persion_start_time" id="start" placeholder="Last Name">
			</div>
			<div class="field ">
				<label>离开兰州的时间：</label> <input type="text"
					name="oo.persion_end_time" id="end" placeholder="Last Name">
			</div>
		</div>
		<div class="three fields disabled">
			<div class="field">
				<label>接待人姓名：</label> <input type="text" name="oo.persion_name"
					id="name" placeholder="First Name">
			</div>
			<div class="field">
				<label>接待人职务：</label> <input type="text" name="oo.persion_position"
					id="position" placeholder="Last Name">
			</div>

			<div class="field">
				<label>接待人所在部门：</label> <input type="text" name="oo.persion_depart"
					id="depart" placeholder="First Name">
			</div>
		</div>
		<div class="field disabled">
			<label>来兰州的目的：</label> <input type="text"
				name="oo.persion_purpose_tolz" id="purpose" placeholder="Last Name">
		</div>
		<div class="ui blue button" onclick="updApply()">提交</div>
	</form>
</div>