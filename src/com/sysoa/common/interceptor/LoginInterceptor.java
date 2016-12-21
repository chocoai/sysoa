package com.sysoa.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.sysoa.common.Contans;
import com.sysoa.user.model.User;
import com.sysoa.util.QStringUtil;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation ai) {
		String user = ai.getController().getSessionAttr("username");
		  //判断是否ajax请求
	    String header = ai.getController().getRequest().getHeader("X-Requested-With");
	    HttpServletRequest request = ai.getController().getRequest();
	    HttpServletResponse response = ai.getController().getResponse();
	    boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(header);
	    
		if (user == null) {
			if(isAjax){
				
				response.setHeader("sessionstatus", Contans.AJAX_TIME_OUT);
				response.setHeader("location", request.getContextPath()+Contans.LOGIN_URL);
	              
				return;
			}else{
				
			ai.getController().redirect("/");
			
			}
		} else {
			
		    String type="";
		    if(isAjax){type="AJAX";}
			System.out.println("----------------------------------"+type+"------------------------------------------");
			System.out.println("ActionKey   :"+ai.getActionKey());
			System.out.println("ViewPath    s:"+ai.getViewPath());
			System.out.println("--------------------------------------------------------------------------------");
			
			ai.invoke();

			/**
			 * 权限控制 根据用户所属角色的权限 判断求url是否可以跳转
			 */
		/*	String res = authVisit(ai);
			if (res == null) {
				ai.invoke();
			} else {//无权限角色访问被退回
				ai.getController().setSessionAttr("pageType", null);
				ai.getController().setAttr("msg", "当前用户无权限访问");
				ai.getController().forwardAction(res);
				//ai.getController().renderJsp("login.jsp");
			}*/

		}
	}

	/**
	 * 是否有权限访问
	 * 
	 * @param ai
	 * @return
	 */
	public String authVisit(Invocation ai) {
		try {
			User user = ai.getController().getSessionAttr("user");
			if (user != null) {
				String urls = user.role().urls();
				String actionKey = QStringUtil.subStringUrl(ai.getActionKey());
				//String actionKey = ai.getActionKey();
				for (String url : urls.split(",")) {
					if (actionKey.equals(url)) {
						return null;
					}
				}

				return user.role().getStr("user_role_login_url");
			}
		} catch (Exception e) {
			e.printStackTrace();
			// logger.error(QStringUtil.fromException(e));
		}

		return "/exit";
	}
}
