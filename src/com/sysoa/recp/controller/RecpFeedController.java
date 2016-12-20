/**
 * 
 */
package com.sysoa.recp.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.jfinal.core.Controller;
import com.sysoa.recp.model.RecpApplyModel;
import com.sysoa.recp.model.RecpFeedModel;
import com.sysoa.recp.model.RecpRequireModel;
import com.sysoa.user.model.UserOrganizModel;
import com.sysoa.util.QStringUtil;

import com.sysoa.util.WordUtil;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 
 * @author zhai
 *
 * 2016-10-24 上午10:19:55
 */
public class RecpFeedController extends Controller {
	
	
	public void addFeed(){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
						
		boolean flag = new RecpFeedModel().set("require_id", getParaToInt("id"))
										.set("feed_con", getPara("feed"))
										.set("feed_organiz",getSessionAttr("organizid"))
										.set("cdate", new Date())
										.set("cuser_id", getSessionAttr("userId"))
										.set("cuser_name", getSessionAttr("username")).save();
		if(!flag){
			returnMap.put("isSuccess", false);
		}
		renderJson(returnMap);
	}
	
	
	public void getFeedbyRequireId() {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
						
		List<RecpFeedModel> list = RecpFeedModel.dao.getFeed(getParaToInt("id"), getSessionAttr("userId"));
		
		returnMap.put("list", list);
	
		renderJson(returnMap);
		
	}
	public void getFeed2byRequireId() {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
						
		List<RecpFeedModel> list = RecpFeedModel.dao.getFeed(getParaToInt("id"));
		
		returnMap.put("list", list);
	
		renderJson(returnMap);
		
	}
	
	public void updFeed(){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
						
		boolean flag =  RecpFeedModel.dao.findById(getParaToInt("id")).set("feed_status", "1").update();
		if(!flag){
			returnMap.put("isSuccess", false);
		}
		
		if(flag){
			//判断任务部门是否全部有反馈
			
			Integer requireid = RecpFeedModel.dao.findById(getParaToInt("id")).getInt("require_id");
			String  organiz = RecpRequireModel.dao.findById(requireid).getStr("require_user_organiz");
			List<RecpFeedModel> list1 =  RecpFeedModel.dao.getFeed(requireid);
			
			boolean flag1 = QStringUtil.countStr(organiz, ",") == list1.size() ? true : false;
			//判断反馈是否都被同意
			List<RecpFeedModel> list2 = list1.stream().filter(x -> "1".equals(x.getStr("feed_status"))).collect(Collectors.toList());
			boolean flag2 = list2.size() == list1.size() ? true : false;
			
			if(flag1 && flag2){
				//下发部门全部完成反馈，则要求确认完成，更新要求表
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "2").update();
			}else if(flag1 || flag2){
				//下发部门部分完成反馈，更新要求表
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "1").update();
			}else{
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "0").update();
			}
		}
		renderJson(returnMap);
	}
	public void delFeed() {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		Integer requireid = RecpFeedModel.dao.findById(getParaToInt("id")).getInt("require_id");
						
		boolean flag =  RecpFeedModel.dao.deleteById(getParaToInt("id"));
		
		if(!flag){
			returnMap.put("isSuccess", false);
		}
		if(flag){
			//判断任务部门是否全部有反馈
			
			String  organiz = RecpRequireModel.dao.findById(requireid).getStr("require_user_organiz");
			List<RecpFeedModel> list1 =  RecpFeedModel.dao.getFeed(requireid);
			
			boolean flag1 = QStringUtil.countStr(organiz, ",") == list1.size() ? true : false;
			//判断反馈是否都被同意
			List<RecpFeedModel> list2 = list1.stream().filter(x -> "1".equals(x.getStr("feed_status"))).collect(Collectors.toList());
			boolean flag2 = list2.size() == list1.size() ? true : false;
			if(list1.size() == 0) flag2 = false;
			
			
			if(flag1 && flag2){
				//下发部门全部完成反馈，则要求确认完成，更新要求表
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "2").update();
			}else if(flag1 || flag2){
				//下发部门部分完成反馈，更新要求表
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "1").update();
			}else{
				RecpRequireModel.dao.findById(requireid).set("confirm_flag", "0").update();
			}
		}
		renderJson(returnMap);
	}
	
	/**
	 * 生成并下载模版
	 * @throws IOException 
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void downTemp() throws IOException, IllegalAccessException, InvocationTargetException, NoSuchMethodException{
		
		//判断要求是否通过
		boolean flag = "2".equals(RecpRequireModel.dao.findById(getParaToInt("id")).getStr("confirm_flag"));
		
		if(flag){
			//生成模版文件返回到浏览器
			Map<String,String> dataMap = new HashMap<>();
			
			RecpRequireModel rr = RecpRequireModel.dao.findById(getParaToInt("id"));
			RecpApplyModel ra = RecpApplyModel.dao.findAllbyId(rr.getInt("recp_apply_id"));
			//添加模版数据
			//dataMap = BeanUtils.describe(ra);
			dataMap.put("persion_name", ra.getStr("persion_name"));
			dataMap.put("persion_position", ra.getStr("persion_position"));
			dataMap.put("persion_purpose_tolz", ra.getStr("persion_purpose_tolz"));
			dataMap.put("persion_start_time", DateFormatUtils.format(ra.getTimestamp("persion_start_time"), "yyyy-MM-dd"));
			dataMap.put("persion_end_time", DateFormatUtils.format(ra.getTimestamp("persion_end_time"), "yyyy-MM-dd"));
			dataMap.put("cdate", DateFormatUtils.format(ra.getTimestamp("cdate"), "yyyy-MM-dd"));
		
			
			dataMap.put("require_trip", ra.getStr("require_trip"));
			dataMap.put("require_users", ra.getStr("require_users"));
			dataMap.put("require_cars", ra.getStr("require_cars"));
			dataMap.put("require_live", ra.getStr("require_live"));
			dataMap.put("require_route", ra.getStr("require_route"));
			

			
			
			
			String organizs="";
			for(String s : rr.getStr("require_user_organiz").split(",")){
				
				if(s.length()>0){
					if(organizs.length()>0){organizs +="，";}
					organizs += UserOrganizModel.dao.findById(s).getStr("user_organiz_name");
				}
			}
			dataMap.put("oragnizs", organizs);
			
		   WordUtil.exportMillCertificateWord(getRequest(), getResponse(), dataMap);
			//renderFile(WordUtil._exportMillCertificateWord(getRequest(), getResponse(), dataMap));
		   renderNull();
		}
		
	}
}
