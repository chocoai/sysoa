package com.sysoa.supervise.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.sysoa.common.Contans;
import com.sysoa.supervise.model.SuperviseProgress;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.supervise.model.SuperviseProgressInfoApply;
import com.sysoa.supervise.model.SuperviseRequire;

/**
 * @author  作者 E-mail:
 * @date 创建时间：2016年11月17日 下午3:00:02
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class SuperviseProgressInfoApplyController extends Controller {


	public void check(){

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));

		boolean flag1 = SuperviseProgressInfoApply.dao.findbyinfoid(getParaToInt("id"))
								.set("apply_status", getPara("type"))
								.set("apply_con", getPara("con"))
								.set("apply_date", new Date())
								.set("apply_user_id", getSessionAttr("userId"))
								.set("apply_user_name", getSessionAttr("username"))
								.set("apply_user_organiz_id", getSessionAttr("organizid"))
								.set("apply_user_organiz_name", getSessionAttr("organiz"))
								.update();
		//SuperviseProgress sp = SuperviseProgress.dao.findById(getParaToInt("id"));


     	/*
     	 * 如果督办事件下所有的办理部门的审批都通过，且都有完结的提交项，则更新督办事件的办理状态
     	 */

		//查询出审批的项的详情
		SuperviseProgressInfo spo = SuperviseProgressInfo.dao.findById(getParaToInt("id"));
		//查询出审批项所在的督办事件的详情
		SuperviseProgress sp = SuperviseProgress.dao.findById(spo.getSuperviseProgressId());
		//查询出审批项所在的督办事件下的所有提交项s
		List<SuperviseProgressInfo> sps = SuperviseProgressInfo.dao.findbyPro(spo.getInt("supervise_progress_id"));
	    //查询出当前督办事件的办理部门
		String ids = SuperviseRequire.dao.findbyINFOid(sp.getInt("supervise_info_id")).getStr("require_organiz_id");
		 boolean flag_1 = false;
		 boolean flag_2 = false;
		 //判断督办事件下所有的办理部门的审批是否都通过
		 for(SuperviseProgressInfo spi:  sps){
			 //审批详情
			 SuperviseProgressInfoApply sppa =  SuperviseProgressInfoApply.dao.findbyinfoid(spi.getProgressInfoId());

			 flag_1 = sppa.getApplyStatus().equals(Contans.APPROVAL_YES);

			 if (!flag_1) break;
		 }
		//判断 是否有完结的提交项
		 if(flag_1){
			 for(String id : ids.split(",")){

				 if(StringUtils.isNotEmpty(id)){
					 flag_2 = false;
					 for(SuperviseProgressInfo spi : SuperviseProgressInfo.dao.findbyProOrg(sp.getProgressId(), Integer.parseInt(id))){

						 flag_2 = Contans.HANDLE_STATIUS_02.equals(spi.getStr("progress_info_status"));
						 //如果有则跳出循环
						 if(flag_2){break;}
					 }
					 //当前部门的提交没有完结项，直接结束循环
					 if(!flag_2){break;}
				 }
			 }
		 }

/*		 boolean flag = false;
		 //遍历督办事件中审批项提交用户的所有提价
		 for(SuperviseProgressInfo spi : SuperviseProgressInfo.dao.findbyProOrg(sp.getProgressId(), spo.getInt("cuser_organiz_id"))){
		      //必须有完结的提交，完结的提交必须已审批通过
			 SuperviseProgressInfoApply sppa =  SuperviseProgressInfoApply.dao.findbyinfoid(spi.getProgressInfoId());
			  //flag = spi.get("progress_info_status").equals(Contans.HANDLE_STATIUS_02) ? true : false;
			 flag = sppa.getApplyStatus().equals(Contans.APPROVAL_YES);

             if (!flag) break;
		 }*/


		//boolean flag2 = flag ? sp.set("progress_status", Contans.HANDLE_STATIUS_02).update() : sp.set("progress_status", Contans.HANDLE_STATIUS_01).update();
        if(flag_2){
        	sp.set("progress_status",  Contans.HANDLE_STATIUS_02).update();
        }
		

		if(flag1){
			returnMap.put("isSuccess", true);

			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}

}
