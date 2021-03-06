package com.sysoa.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUserRole<M extends BaseUserRole<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setUserRoleName(java.lang.String userRoleName) {
		set("user_role_name", userRoleName);
	}

	public java.lang.String getUserRoleName() {
		return get("user_role_name");
	}

	public void setUserRoleLoginUrl(java.lang.String userRoleLoginUrl) {
		set("user_role_login_url", userRoleLoginUrl);
	}

	public java.lang.String getUserRoleLoginUrl() {
		return get("user_role_login_url");
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

}
