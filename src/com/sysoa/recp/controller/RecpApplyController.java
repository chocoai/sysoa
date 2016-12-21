/**
 * 
 */
package com.sysoa.recp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.sysoa.bo.RecptionEvent;
import com.sysoa.common.Contans;
import com.sysoa.recp.model.RecpApplyModel;
import com.sysoa.recp.model.RecpRequireModel;
import com.sysoa.user.model.UserOrganizUserModel;

/**
 * 
 * @author zhai
 *
 *         2016-10-24 上午10:19:55
 */
public class RecpApplyController extends Controller {

	// 普通用户查询自己申请的接待任务
	public void getUserDurationEvent() {

		List<RecpApplyModel> list = RecpApplyModel.dao.getAllevents("0", getSessionAttr("userId"));

		List<RecptionEvent> events = new ArrayList<RecptionEvent>();
		for (RecpApplyModel recpApplyModel : list) {
			RecptionEvent event = new RecptionEvent(recpApplyModel.getInt("apply_id"),
					recpApplyModel.getStr("persion_name"), recpApplyModel.getTimestamp("persion_start_time"),
					recpApplyModel.getTimestamp("persion_end_time"), null, null, false,
					recpApplyModel.getStr("persion_name"), recpApplyModel.getStr("persion_position"),
					recpApplyModel.getStr("persion_depart"), recpApplyModel.getStr("persion_purpose_tolz"),
					recpApplyModel.getStr("recp _flag"), recpApplyModel.getStr("approval_flag"),
					recpApplyModel.getStr("finish_flag"), recpApplyModel.getStr("userName"));
			event.setOrganiz(recpApplyModel.getStr("user_organiz_name"));
			// 根据事件的日期和审批状态给事件添加颜色
			/*
			 * if (recpApplyModel.getTimestamp("persion_start_time").before(new
			 * Date())) { event.setColor(CommonConstant.COLOR_FOR_PAST_EVENT); }
			 * else
			 * if(recpApplyModel.getInt("userid").equals(getSessionAttr("userId"
			 * ))){ event.setColor(CommonConstant.COLOR_FOR_OWN_FUTURE_EVENT);
			 * if("1".equals(recpApplyModel.getStr("approval_flag"))){
			 * event.setColor(CommonConstant.COLOR_FOR_FUTURE_EVENT_ALLOW);
			 * }else if("2".equals(recpApplyModel.getStr("room_sh_status"))){
			 * event.setColor(CommonConstant.COLOR_FOR_FUTURE_EVENT_NOT_ALLOW);
			 * } event.setEditable(true); } else {
			 * //event.setColor(CommonConstant.COLOR_FOR_FUTURE_EVENT);
			 * if("1".equals(recpApplyModel.getStr("approval_flag"))){
			 * event.setColor(CommonConstant.COLOR_FOR_FUTURE_EVENT_ALLOW);
			 * }else if("2".equals(recpApplyModel.getStr("room_sh_status"))){
			 * event.setColor(CommonConstant.COLOR_FOR_FUTURE_EVENT_NOT_ALLOW);
			 * } }
			 */
			events.add(event);
		}

		renderJson(events);
	}

	// 普通用户查看下发的接待任务
	public void getUserEvent() {

		List<RecpApplyModel> events = RecpApplyModel.dao.getAllevents2(
				UserOrganizUserModel.dao.findByUserid(getSessionAttr("userId")).getInt("user_organiz_id"));

		renderJson(events);
	}

	// 管理员查看 普通用户的接待申请
	public void getManagerDurationEvent() {

		List<RecpApplyModel> events = RecpApplyModel.dao.getAllevents("0", 0);
		renderJson(events);
	}

	// 管理员查看 下发的接待任务
	public void getManagerEvent() {

		List<RecpApplyModel> events = RecpApplyModel.dao.getAllevents2(0);

		renderJson(events);

	}

	/**
	 * 更新事件的开始结束时间并更改状态
	 */
	public void updateRecpEvent() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		Date start = new Date(getParaToLong("start"));
		Date end = new Date(getParaToLong("end"));
		if (start.before(new Date())) {
			returnMap.put("isSuccess", false);
			returnMap.put("msg", "调整后的开始时间已过期!");
		} else if (!RecpApplyModel.dao.isLegalEvent(getParaToLong("start") / 1000, getParaToLong("end") / 1000,
				getParaToInt("id"), getParaToInt("userid"))) {
			returnMap.put("isSuccess", false);
			returnMap.put("msg", "与其他时间有冲突！");
		} else {
			RecpApplyModel recpApplyModel = RecpApplyModel.dao.findById(getParaToInt("id"));
			recpApplyModel.set("persion_start_time", start);
			recpApplyModel.set("persion_end_time", end);
			recpApplyModel.set("room_sh_status", 0);
			recpApplyModel.set("approval_flag", 0);
			recpApplyModel.set("recp_flag", " ");
			recpApplyModel.set("finish_flag", 0);
			recpApplyModel.update();
		}
		renderJson(returnMap);
	}

	/**
	 * 普通用户申请接待
	 */
	public void addUserApplyEvent() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		RecpApplyModel apply = getModel(RecpApplyModel.class, "oo");

		/*
		 * new RecpApplyModel().set("persion_start_time", start)
		 * .set("persion_end_time", end) .set("persion_name", end)
		 * .set("persion_position", title) .set("persion_depart",
		 * getSessionAttr("userId")) .set("persion_purpose _tolz", end)
		 */
		apply.set("cdate", new Date()).set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username")).set("recp_flag", "0").save();
		// boolean flag = Db.save("t_recp_apply", "apply_id", apply);

		// renderJson(returnMap);
		// render("/page/index_user.jsp");
		redirect("/goRecpUserIndex");
	}

	/**
	 * 普通用户申请接待
	 */
	public void updUserApplyEvent() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		RecpApplyModel apply = getModel(RecpApplyModel.class, "oo");

		/*
		 * new RecpApplyModel().set("persion_start_time", start)
		 * .set("persion_end_time", end) .set("persion_name", end)
		 * .set("persion_position", title) .set("persion_depart",
		 * getSessionAttr("userId")) .set("persion_purpose _tolz", end)
		 */
		apply.save();
		// boolean flag = Db.save("t_recp_apply", "apply_id", apply);

		// renderJson(returnMap);
		// render("/page/index_user.jsp");
		redirect("/goRecpUserIndex");
	}
	/***
	 * 管理员下发接待任务
	 */
	public void addMangerApplyEvent() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		RecpApplyModel apply = getModel(RecpApplyModel.class, "oo");
		RecpRequireModel require = getModel(RecpRequireModel.class, "or");

		/*
		 * String[] strs = getParaValues("or.require_user_organiz"); String str
		 * =""; for(int i=0;i<strs.length;i++){ //if(str.length()>0){str+=",";}
		 * str+=strs[i]+","; }
		 */
		String str = getPara("or.require_user_organiz") + ",";

		// 当前用户的机构id
		Integer oragnizid = UserOrganizUserModel.dao.findByUserid(getSessionAttr("userId")).getInt("user_organiz_id");
		/*
		 * Date start = new Date(getParaToLong("start")); Date end = new
		 * Date(getParaToLong("end")); String title = getPara("title");
		 */

		/*
		 * new RecpApplyModel().set("persion_start_time", start)
		 * .set("persion_end_time", end) .set("persion_name", end)
		 * .set("persion_position", title) .set("persion_depart",
		 * getSessionAttr("userId")) .set("persion_purpose _tolz", end)
		 */
		boolean flag1 = apply.set("cdate", new Date()).set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username")).set("recp_flag", "1").set("cuser_organiz_id", oragnizid)
				.save();
		// boolean flag = Db.save("t_recp_apply", "apply_id", apply);

		// 接待要求
		boolean flag2 = require.set("cdate", new Date()).set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username")).set("recp_apply_id", apply.getInt("apply_id"))
				.set("require_user_organiz", str).save();

		if (!flag2 || !flag1) {
			returnMap.put("isSuccess", false);
			returnMap.put("msg", "创建失败");
		}

		redirect("/goRecpManagerIndex");
	}

	/**
	 * 删除
	 */
	public void delUserApplyEvent() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);

		boolean flag = RecpApplyModel.dao.findById(getParaToInt("id")).set("isdelete", Contans.IS_DELETE_01 ).update();

		if (!flag) {
			returnMap.put("isSuccess", false);
		}
		renderJson(returnMap);
	}

	/**
	 * 接待完成更新申请表
	 * 
	 */
	public void finishApply() {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);

		boolean flag = RecpApplyModel.dao.findById(getParaToInt("id")).set("persion_end_time_true", new Date()).set("finish_flag", "1").update();

		if (!flag) {
			returnMap.put("isSuccess", false);
		}
		renderJson(returnMap);

	}

	/**
	 * 管理员审批接待申请
	 */
	public void updapply() {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);

		boolean flag = RecpApplyModel.dao.findById(getParaToInt("id"))
				.set("approval_flag", getParaToInt("type"))
				.set("approval_con", getPara("con")).update();

		if (!flag) {
			returnMap.put("isSuccess", false);
		}
		renderJson(returnMap);

	}

	/**
	 * 管理员检查反馈意见
	 */

	/**
	 * 管理员移除下发的接待要求
	 */
	public void delById() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);

		boolean flag = RecpApplyModel.dao.findById(getParaToInt("id")).set("isdelete", Contans.IS_DELETE_01).update();
		if (!flag) {
			returnMap.put("isSuccess", false);
		}
		renderJson(returnMap);

	}
}
