package com.sysoa.integrate.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.sysoa.common.Contans;
import com.sysoa.integrate.model.IntegratedApproval;
import com.sysoa.integrate.model.IntegratedHandling;
import com.sysoa.integrate.model.IntegratedInfo;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月23日 上午11:26:44 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class IntegratedInfoController extends Controller {
	
	public void page1(){
		
		Page<IntegratedInfo> page = IntegratedInfo.dao.queryByOrganizid(getParaToInt("num"), getParaToInt("size"), getSessionAttr("organizid"));
		
		renderJson(page);
	}

	public void page2(){
		
		Page<IntegratedInfo> page = IntegratedInfo.dao.queryByOrganizid(getParaToInt("num"), getParaToInt("size"), 0);
		
		renderJson(page);
	}
	
	public void add(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		IntegratedInfo ii = new IntegratedInfo(); 
		boolean flag1 = ii.set("info_title", getPara("title"))
										.set("info_con", getPara("con"))
										
										.set("cdate", new Date())
										.set("cuser_id", getSessionAttr("userId"))
										.set("cuser_name", getSessionAttr("username"))
										.set("cuser_organiz_id", getSessionAttr("organizid"))
										.set("cuser_organiz_name", getSessionAttr("organiz"))
										.save();
		
		boolean flag2 = new IntegratedApproval().set("integrated_info_id", ii.getInt("info_id"))
												.save();
				
		if(flag1 && flag2){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));	
		}
		renderJson(returnMap);
	}
	public void upd(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		boolean flag1 = IntegratedInfo.dao.findById(getParaToInt("id")).set("info_title", getPara("title"))
										.set("info_con", getPara("con"))
										.set("cdate", new Date())
										.update();
		
	
				
		if(flag1){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));	
		}
		renderJson(returnMap);
	}
	
	public void finished(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		boolean flag1 = IntegratedInfo.dao.findById(getParaToInt("id")).set("isfinish",Contans.IS_FINISH_01)
										.update();
		if(flag1){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));	
		}
		renderJson(returnMap);
	}
	
    public void del(){
		
		boolean flag = IntegratedInfo.dao.findById(getParaToInt("id")).set("isdelete", Contans.IS_DELETE_01).update();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag) {
			returnMap.put("isSuccess", false);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);

	}
	public void oncheck(){
		IntegratedApproval ip = IntegratedApproval.dao.findById(getParaToInt("appid"));
		boolean flag = ip
				.set("approval_status", getPara("type"))
				.set("approval_idea", getPara("con"))
				
				.set("cdate", new Date())
				.set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username"))
				.set("cuser_organiz_id", getSessionAttr("organizid"))
				.set("cuser_organiz_name", getSessionAttr("organiz"))
				.update();
		
		
		if(Contans.APPROVAL_YES.equals(getPara("type")) ){
				
			if(IntegratedHandling.dao.findbyinfoid(ip.getInt("integrated_info_id")).size() <1){
				new IntegratedHandling().set("integrated_info_id", ip.getInt("integrated_info_id")).save();
			}
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	public void findbyid(){
		
		renderJson(IntegratedInfo.dao.querybyid(getParaToInt("id")));
	}
}
