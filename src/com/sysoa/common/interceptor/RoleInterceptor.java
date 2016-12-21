package com.sysoa.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.sysoa.common.Contans;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月16日 上午11:35:14 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class RoleInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String userflag =inv.getController().getSessionAttr("flag");
		
		if(Contans.ROLE_USER.equals(userflag)){
			
			returnMap.put("msg", "用户权限不够");
			
		}else if((Contans.ROLE_MANAGER.equals(userflag))){
			
			inv.invoke();
		}else if((Contans.ROLE_LEADER.equals(userflag))){
			inv.invoke();
			
		}else{
			returnMap.put("msg", "用户不合法请重新登录");
		}
		if(returnMap.size()>0){
			inv.getController().renderJson(returnMap);
		}
		
	}

}
