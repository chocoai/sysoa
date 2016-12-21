package com.sysoa.recp;

import com.jfinal.core.Controller;
import com.sysoa.common.Contans;
import com.sysoa.util.QPropertiesUtil;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月5日 下午12:46:59 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class HelloController extends Controller {
	
	public void index(){
		
		renderJson(QPropertiesUtil.list(Contans.SEX));
	}

}
