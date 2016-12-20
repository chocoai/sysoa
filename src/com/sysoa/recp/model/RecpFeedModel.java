package com.sysoa.recp.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月8日 上午9:42:08 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class RecpFeedModel extends Model<RecpFeedModel> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final RecpFeedModel dao = new RecpFeedModel();
	
	/**
	 * 根据要求id查询反馈信息
	 * @param requireid
	 * @return
	 */
	public List<RecpFeedModel> getFeed(Integer requireid){
		
	   String ssql ="select f.*,uo.user_organiz_name from t_recp_feed f "
	   		+ " left join t_user_organiz uo on f.feed_organiz=uo.id "
	   		+ " where require_id = ? ";
	
		return dao.find(ssql,requireid);
		
	}
	/**
	 * 根据要求id查询反馈信息
	 * @param requireid
	 * @return
	 */
	public List<RecpFeedModel> getFeed(Integer requireid, Integer userid){
		
	   String ssql ="select * from t_recp_feed f where require_id = ? and cuser_id = ?";
	
		return dao.find(ssql,requireid,userid);
		
	}

}
