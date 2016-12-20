/**
 * 
 */
package com.sysoa.recp.model;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Model;

/**
 * 
 * @author zhai
 *
 * 2016-10-24 上午10:16:19
 */
@SuppressWarnings("serial")
public class RecpRequireModel extends Model<RecpRequireModel> {

	public static final RecpRequireModel dao = new RecpRequireModel();
	
	/**
	 * find all
	 * @return
	 */
	public List<RecpRequireModel> findAll(){
		return findAll(null);
	}
	
	/**
	 * find all by order
	 * @param order
	 * @return
	 */
	public List<RecpRequireModel> findAll(String order){
		StringBuilder sb = new StringBuilder("select * from t_recp_require ");
		if(StringUtils.isEmpty(order)){
			return dao.find(sb.append("order by require_id desc").toString());
		}else{
			return dao.find(sb.append(order).toString());
		}
	}
	
	public RecpRequireModel findbyApplyid(Integer applyid){
		
		return dao.find("select * from t_recp_require where recp_apply_id=? ",applyid).get(0);
		
	}
}
