package com.sysoa.common.plugin;

import java.util.List;

import com.jfinal.config.Routes;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.sysoa.util.ClassSearcher;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月6日 下午9:30:02 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 * 
 * AutoControllerRegist的注册规则探测到所有继承了Controller的类,
 * 然后查找类上是否有ControllerBind注解,有注解按照注解配置的值进行注册.
 * 如果没有则检测类名是否用Controller作为结尾，如果不是则跑出异常，
 * 是则截取类名中Controller前面的部分并且首字母小写作为controllerkey。
 */
public class AutoControllerRegist {
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void regist(Routes routes) {
		List<Class> classList = ClassSearcher.findClasses(Controller.class);
		ControllerBind controllerBind = null;
		for (Class clazz : classList) {
			controllerBind = (ControllerBind) clazz.getAnnotation(ControllerBind.class);
			if (controllerBind == null) {
				routes.add(controllerKey(clazz), clazz);
			} else {
				routes.add(controllerBind.controllerKey(), clazz, controllerBind.viewPath());
			}
		}
	}

	@SuppressWarnings("rawtypes")
	private static String controllerKey(Class clazz) {
		if (!clazz.getSimpleName().endsWith("Controller")) {
			throw new RuntimeException(clazz + " don,t has a ControllerBind annotation and it,s don,t end Controller! ");
		}
		String controllerKey = "/" + StrKit.firstCharToLowerCase(clazz.getSimpleName());
		controllerKey = controllerKey.substring(0, controllerKey.indexOf("Controller"));
		return controllerKey;
	}

}
