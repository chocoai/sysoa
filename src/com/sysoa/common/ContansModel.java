package com.sysoa.common;
/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月5日 下午10:21:13 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class ContansModel {

	   private String value;  
	   private String text;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
	public ContansModel() {
		super();
	}
	public ContansModel(String value, String text) {
		super();
		this.value = value;
		this.text = text;
	} 
	   
	   
}
