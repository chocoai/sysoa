package com.sysoa.integrate.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.sysoa.common.Contans;
import com.sysoa.integrate.model.IntegratedHandling;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月23日 上午11:26:44 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class IntegratedHandlingController extends Controller {

	
	public void upd_1(){
		boolean flag = IntegratedHandling.dao.findbyinfoid(getParaToInt("id")).get(0)
				.set("handl_status", Contans.IS_DELETE_01)
				.set("cdate", new Date())
				.set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username"))
				.set("cuser_organiz_id", getSessionAttr("organizid"))
				.set("cuser_organiz_name", getSessionAttr("organiz")).update();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
}
