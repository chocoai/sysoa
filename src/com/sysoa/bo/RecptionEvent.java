/**
 * 
 */
package com.sysoa.bo;

import java.util.Date;

/**apply_id	int	11	0	0	-1	0	0	0		0					-1	0
persion_name	varchar	255	0	0	0	0	0	0		0	接待人姓名	utf8	utf8_general_ci		0	0
persion_position	varchar	255	0	0	0	0	0	0		0	接待人职务	utf8	utf8_general_ci		0	0
persion_depart	varchar	255	0	0	0	0	0	0		0	所属部门	utf8	utf8_general_ci		0	0
persion_purpose _tolz	varchar	255	0	0	0	0	0	0		0	来兰州的目的	utf8	utf8_general_ci		0	0
persion_start_time	datetime	0	0	-1	0	0	0	0		0	来兰州的时间				0	0
persion_end_time	datetime	0	0	-1	0	0	0	0		0	离开时间				0	0
persion_end_time_true	datetime	0	0	-1	0	0	0	0		0	真实离开时间				0	0
recp_flag	varchar	255	0	-1	0	0	0	0	'0'	0	接待标志(0.业务部门接待 1.办公室牵头接待)	utf8	utf8_general_ci		0	0
approval_flag	varchar	255	0	-1	0	0	0	0	'0'	0	审批标志(0.未审批 1.已审批)	utf8	utf8_general_ci		0	0
finish_flag	varchar	255	0	-1	0	0	0	0	'0'	0	接待完成标志(0.未完成 1.已接待完成)	utf8	utf8_general_ci		0	0
cdate	datetime	0	0	-1	0	0	0	0		0					0	0
cuser_name	varchar	255	0	-1	0	0	0	0		0		utf8	utf8_general_ci		0	0
cuser_id	int	11	0	-1	0	0	0	0		0					0	0

 * 
 * @author zhai
 *
 * 2016-10-24 上午11:46:17
 */
public class RecptionEvent extends Event {

	private static final long serialVersionUID = 1L;
	
	private String persionName;//需要接待的人的名字
	private String persionPosition;//需要接待的人的职务
	private String persionDepart;//需要接待的人的部门
	private String persionPurpose;//来兰州的目的
	//private String persion_end_time_true;//真实离开时间
	private String recp_flag;//接待标志(0.业务部门接待 1.办公室牵头接待)
	private String approval_flag;//审批标志(0.未审批 1.已审批)
	private String finish_flag;//接待完成标志(0.未完成 1.已接待完成)
	private String userName;//申请人
	
	private String organiz;
	
	
	
	public String getOrganiz() {
		return organiz;
	}



	public void setOrganiz(String organiz) {
		this.organiz = organiz;
	}



	/**
	 * 
	 */
	public RecptionEvent() {
		super();
	}
	
	
	
	/**
	 * @param persionName
	 * @param persionPosition
	 * @param persionDepart
	 * @param persionPurpose
	 * @param recp_flag
	 * @param approval_flag
	 * @param finish_flag
	 * @param userName
	 */
	public RecptionEvent( int id, String title, Date start, Date end, String color, String backgroundColor,
	 boolean editable, String persionName, String persionPosition,
			String persionDepart, String persionPurpose, String recp_flag,
			String approval_flag, String finish_flag, String userName) {
		super();
		this.persionName = persionName;
		this.persionPosition = persionPosition;
		this.persionDepart = persionDepart;
		this.persionPurpose = persionPurpose;
		this.recp_flag = recp_flag;
		this.approval_flag = approval_flag;
		this.finish_flag = finish_flag;
		this.userName = userName;
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		this.color = color;
		this.backgroundColor = backgroundColor;
		this.editable = editable;
	}



	public String getPersionName() {
		return persionName;
	}
	public void setPersionName(String persionName) {
		this.persionName = persionName;
	}
	public String getPersionPosition() {
		return persionPosition;
	}
	public void setPersionPosition(String persionPosition) {
		this.persionPosition = persionPosition;
	}
	public String getPersionDepart() {
		return persionDepart;
	}
	public void setPersionDepart(String persionDepart) {
		this.persionDepart = persionDepart;
	}
	public String getPersionPurpose() {
		return persionPurpose;
	}
	public void setPersionPurpose(String persionPurpose) {
		this.persionPurpose = persionPurpose;
	}
	public String getRecp_flag() {
		return recp_flag;
	}
	public void setRecp_flag(String recp_flag) {
		this.recp_flag = recp_flag;
	}
	public String getApproval_flag() {
		return approval_flag;
	}
	public void setApproval_flag(String approval_flag) {
		this.approval_flag = approval_flag;
	}
	public String getFinish_flag() {
		return finish_flag;
	}
	public void setFinish_flag(String finish_flag) {
		this.finish_flag = finish_flag;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
