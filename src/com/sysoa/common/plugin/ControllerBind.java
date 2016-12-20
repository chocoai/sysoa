package com.sysoa.common.plugin;
/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月6日 下午9:41:33 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public @interface ControllerBind {
	public String controllerKey() ;
	public String viewPath() default"";

}
