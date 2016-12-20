package com.sysoa.user.model;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Model;

/**
 * UserEmployerModel<br>
 * id	id<br>
 * user_employer_name	鍗曚綅鍚嶇О<br>
 * user_employer_type	棰勭暀瀛楁<br>
 * cdate	鍒涘缓鏃堕棿<br>
 * cuser_id	鍒涘缓浜篿d<br>
 * cuser_name	鍒涘缓浜哄鍚�<br>
 * @author qiaowenbin
 */
@SuppressWarnings("serial")
public class UserEmployerModel extends Model<UserEmployerModel>{
	
	public static final UserEmployerModel dao = new UserEmployerModel();
	
	/**
	 * find all
	 * @return
	 */
	public List<UserEmployerModel> findAll(){
		return findAll(null);
	}
	
	/**
	 * find all by order
	 * @param order
	 * @return
	 */
	public List<UserEmployerModel> findAll(String order){
		StringBuilder sb = new StringBuilder("select * from t_user_employer ");
		if(StringUtils.isEmpty(order)){
			return dao.find(sb.append("order by id desc").toString());
		}else{
			return dao.find(sb.append(order).toString());
		}
	}
	
	
}
