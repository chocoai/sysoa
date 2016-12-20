package com.sysoa.supervise.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.sysoa.common.Contans;
import com.sysoa.supervise.model.SuperviseProgress;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.supervise.model.SuperviseProgressInfoApply;

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

		SuperviseProgressInfo spo = SuperviseProgressInfo.dao.findById(getParaToInt("id"));
		
		SuperviseProgress sp = SuperviseProgress.dao.findById(spo.getSuperviseProgressId());
		
		 boolean flag = false;    
		 
		 for(SuperviseProgressInfo spi : SuperviseProgressInfo.dao.findbyPro(sp.getProgressId())){
		
			 SuperviseProgressInfoApply sppa =  SuperviseProgressInfoApply.dao.findbyinfoid(spi.getProgressInfoId());
			  //flag = spi.get("progress_info_status").equals(Contans.HANDLE_STATIUS_02) ? true : false;
			 flag = sppa.getApplyStatus().equals(Contans.APPROVAL_YES);
			  
             if (!flag) break;			  
		 }
		       
		       
		//boolean flag2 = flag ? sp.set("progress_status", Contans.HANDLE_STATIUS_02).update() : sp.set("progress_status", Contans.HANDLE_STATIUS_01).update();
		
		sp.set("progress_status", flag ? Contans.HANDLE_STATIUS_02:Contans.HANDLE_STATIUS_01).update();
		
		if(flag1){
			returnMap.put("isSuccess", true);
			
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
}
