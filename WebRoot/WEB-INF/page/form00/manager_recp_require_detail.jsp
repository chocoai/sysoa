<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="ui small modal" id="updApply">
	<i class="close icon"
		style="top: 1.0535rem; right: 1rem; color: black;"></i>
		<div class="header" style="text-align: center;">查看接待任务</div>
		<div class="ui form" style="margin: 10px" 
			id="applyForm">
			<h3 class="ui dividing header">接待人信息</h3>
			<div class="two fields disabled">
				<div class="field">
					<label>来兰州时间：</label> <input type="text"
						name="oo.persion_start_time" class="start" id="s1"
						placeholder="Last Name">
				</div>
				<div class="field">
					<label>离开兰州的时间：</label> <input type="text"
						name="oo.persion_end_time" class="end" id="e1"
						placeholder="Last Name">
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
			<div class="ui horizontal  divider"></div>
			<h3 class="ui dividing header">接待要求</h3>
			<div class="field disabled" id="organiz">
				<label>下发机构：</label>
				<div class="ui multiple selection dropdown">
					<input name="or.require_user_organiz"  id="organiz" type="hidden" value="">
					<i class="dropdown icon"></i>
					<div class="default text">下发机构</div>
					<div class="menu">
						<c:forEach var="item" items="${organizList }">
							<div class="item" data-value="${item.id }">${item.user_organiz_name}</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="field disabled">
				<label>行程安排：</label> <input type="text" name="or.require_trip"
					id="trip" placeholder="Last Name">
			</div>
			<div class="field disabled">
				<label>陪同人员：</label> <input type="text" name="or.require_users"
					id="users" placeholder="Last Name">
			</div>
			<div class="field disabled">
				<label>用车要求：</label> <input type="text" name="or.require_cars"
					id="cars" placeholder="Last Name">
			</div>
			<div class="field disabled">
				<label>住宿要求：</label> <input type="text" name="or.require_live"
					id="live" placeholder="Last Name">
			</div>
			<div class="field disabled">
				<label>行车路线：</label> <input type="text" name="or.require_route"
					id="route" placeholder="Last Name">
			</div>

			<button class="ui blue disabled button" onclick="">提交</button>
		</div>
	</div>