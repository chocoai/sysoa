package com.sysoa.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseNewsApproval<M extends BaseNewsApproval<M>> extends Model<M> implements IBean {

	public void setApprovalId(java.lang.Integer approvalId) {
		set("approval_id", approvalId);
	}

	public java.lang.Integer getApprovalId() {
		return get("approval_id");
	}

	public void setNewsAppId(java.lang.Integer newsAppId) {
		set("news_app_id", newsAppId);
	}

	public java.lang.Integer getNewsAppId() {
		return get("news_app_id");
	}

	public void setApprovalFlag1(java.lang.String approvalFlag1) {
		set("approval_flag1", approvalFlag1);
	}

	public java.lang.String getApprovalFlag1() {
		return get("approval_flag1");
	}

	public void setApprovalFlag1Con(java.lang.String approvalFlag1Con) {
		set("approval_flag1_con", approvalFlag1Con);
	}

	public java.lang.String getApprovalFlag1Con() {
		return get("approval_flag1_con");
	}

	public void setApprovalFlag1UserId(java.lang.Integer approvalFlag1UserId) {
		set("approval_flag1_user_id", approvalFlag1UserId);
	}

	public java.lang.Integer getApprovalFlag1UserId() {
		return get("approval_flag1_user_id");
	}

	public void setApprovalFlag1Cdate(java.util.Date approvalFlag1Cdate) {
		set("approval_flag1_cdate", approvalFlag1Cdate);
	}

	public java.util.Date getApprovalFlag1Cdate() {
		return get("approval_flag1_cdate");
	}

	public void setApprovalFlag2(java.lang.String approvalFlag2) {
		set("approval_flag2", approvalFlag2);
	}

	public java.lang.String getApprovalFlag2() {
		return get("approval_flag2");
	}

	public void setApprovalFlag2Con(java.lang.String approvalFlag2Con) {
		set("approval_flag2_con", approvalFlag2Con);
	}

	public java.lang.String getApprovalFlag2Con() {
		return get("approval_flag2_con");
	}

	public void setApprovalFlag2UserId(java.lang.Integer approvalFlag2UserId) {
		set("approval_flag2_user_id", approvalFlag2UserId);
	}

	public java.lang.Integer getApprovalFlag2UserId() {
		return get("approval_flag2_user_id");
	}

	public void setApprovalFlag2Cdate(java.util.Date approvalFlag2Cdate) {
		set("approval_flag2_cdate", approvalFlag2Cdate);
	}

	public java.util.Date getApprovalFlag2Cdate() {
		return get("approval_flag2_cdate");
	}

	public void setCdate(java.util.Date cdate) {
		set("cdate", cdate);
	}

	public java.util.Date getCdate() {
		return get("cdate");
	}

	public void setCuserId(java.lang.Integer cuserId) {
		set("cuser_id", cuserId);
	}

	public java.lang.Integer getCuserId() {
		return get("cuser_id");
	}

	public void setCuserName(java.lang.String cuserName) {
		set("cuser_name", cuserName);
	}

	public java.lang.String getCuserName() {
		return get("cuser_name");
	}

	public void setCuserOrganizId(java.lang.Integer cuserOrganizId) {
		set("cuser_organiz_id", cuserOrganizId);
	}

	public java.lang.Integer getCuserOrganizId() {
		return get("cuser_organiz_id");
	}

}
