package com.sysoa.bo;
/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月8日 下午5:51:48 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class OrganizBo {

	private String name;
	private String value;
	private String text;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	
	public OrganizBo() {
		super();
	}
	public OrganizBo(String name, String value, String text) {
		super();
		this.name = name;
		this.value = value;
		this.text = text;
	}
	
}
