<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ui small modal" id="apply">
	<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
	<div class="header" style="text-align: center;">下发接待任务</div>
	<form class="ui form" style="margin: 10px"
		 id="applyForm" action="apply/addMangerApplyEvent" method="post">
		<h3 class="ui dividing header">接待人信息</h3>
		<div class="two fields">
			<div class="field">
				<label>来兰州时间：</label> <input type="text"
					name="oo.persion_start_time" id="start" placeholder="来兰州时间">
			</div>
			<div class="field">
				<label>离开兰州的时间：</label> <input type="text"
					name="oo.persion_end_time" id="end" placeholder="离开兰州的时间">
			</div>
		</div>
		<div class="three fields">
			<div class="field">
				<label>接待人姓名：</label> <input type="text" name="oo.persion_name"
					id="name" placeholder="接待人姓名">
			</div>
			<div class="field">
				<label>接待人职务：</label> <input type="text" name="oo.persion_position"
					id="position" placeholder="接待人职务">
			</div>

			<div class="field">
				<label>接待人所在部门：</label> <input type="text" name="oo.persion_depart"
					id="depart" placeholder="接待人所在部门">
			</div>
		</div>
		<div class="field">
			<label>来兰州的目的：</label> <input type="text"
				name="oo.persion_purpose_tolz" id="purpose" placeholder="来兰州的目的">
		</div>
		<div class="ui horizontal  divider"></div>
		<h3 class="ui dividing header">接待要求</h3>
		<div class="field">
			<label>下发机构：</label>
			<div class="ui multiple selection dropdown">
				<input name="or.require_user_organiz" type="hidden" value="">
				<i class="dropdown icon"></i>
				<div class="default text">下发机构</div>
				<div class="menu">
					<c:forEach var="item" items="${organizList }">
						<div class="item" data-value="${item.id }">${item.user_organiz_name}</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="field">
			<label>行程安排：</label> <input type="text" name="or.require_trip"
				id="start" placeholder="行程安排">
		</div>
		<div class="field">
			<label>陪同人员：</label> <input type="text" name="or.require_users"
				id="end" placeholder="陪同人员">
		</div>
		<div class="field">
			<label>用车要求：</label> <input type="text" name="or.require_cars"
				id="end" placeholder="用车要求">
		</div>
		<div class="field">
			<label>住宿要求：</label> <input type="text" name="or.require_live"
				id="end" placeholder="住宿要求">
		</div>
		<div class="field">
			<label>行车路线：</label> <input type="text" name="or.require_route"
				id="end" placeholder="行车路线">
		</div>

		<button class="ui blue button" type="submit">提交</button>
		<button class="ui blue button" type="reset">重填</button>
	</form>
</div>