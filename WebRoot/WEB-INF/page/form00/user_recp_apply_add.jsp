<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ui small modal" id="add">
	<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
	<div class="header">接待申请</div>
	<form class="ui form" style="margin: 10px" id="applyForm" action="apply/addUserApplyEvent" method="post">
		<div class="two fields">
			<div class="field">
				<label>来兰州时间：</label> <input type="text"
					name="oo.persion_start_time" class="stime" placeholder="来兰州时间">
			</div>
			<div class="field">
				<label>离开兰州的时间：</label> <input type="text"
					name="oo.persion_end_time" class="etime" placeholder="离开兰州的时间">
			</div>
		</div>
		<div class="three fields">
			<div class="field">
				<label>接待人姓名：</label> <input type="text" name="oo.persion_name"
					placeholder="接待人姓名">
			</div>
			<div class="field">
				<label>接待人职务：</label> <input type="text" name="oo.persion_position"
					placeholder="接待人职务">
			</div>

			<div class="field">
				<label>接待人所在部门：</label> <input type="text" name="oo.persion_depart"
					placeholder="接待人所在部门">
			</div>
		</div>
		<div class="field">
			<label>来兰州的目的：</label> <input type="text"
				name="oo.persion_purpose_tolz" placeholder="来兰州的目的">
		</div>
		<button class="ui blue button" type="submit">提交</button>
	</form>
</div>