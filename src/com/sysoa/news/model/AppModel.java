package com.sysoa.news.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年11月11日 下午4:53:30
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class AppModel extends Model<AppModel> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public final static AppModel dao = new AppModel();

	/**
	 * 根据userid查询申请列表
	 * 
	 * @param userid
	 * @return
	 */
	public List<AppModel> find1All(Integer userid) {

		String ssql = " SELECT tn.*, tnp.* FROM t_news_app tn "
				+ " LEFT JOIN t_news_approval tnp ON tn.app_id = tnp.news_app_id " ;
		if(userid !=0){	
			ssql += "WHERE tn.cuser_id = ? and tn.isdelete = 0 ";
		}		
			ssql += " ORDER BY tn.cdate desc, tn.app_type";

		return dao.find(ssql, userid);
	}

	public Page<AppModel> find1All(Integer pageNumber, Integer pageSize, Integer userid) {

		String select = " SELECT tn.*, tnp.* ";
		String sqlExceptSelect = "FROM t_news_app tn "
				+ " LEFT JOIN t_news_approval tnp ON tn.app_id = tnp.news_app_id ";
		if(userid !=0){	
			sqlExceptSelect += " WHERE tn.cuser_id = ? and tn.isdelete = 0 ORDER BY tn.cdate desc, tn.app_type";
			
			return dao.paginate(pageNumber, pageSize, select, sqlExceptSelect, userid);
		}
		sqlExceptSelect += " WHERE tn.isdelete = 0 ORDER BY tn.cdate desc, tn.app_type";

		return dao.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	
	/**
	 * 审批状态
	 * flag1  --管理员
	 * flag2  --领导
	 * 
	 * @param userid
	 * @return
	 */
	public List<AppModel> find2All(String flag1,String flag2) {

		String ssql = " SELECT tn.*, tnp.* FROM t_news_app tn "
				+ " LEFT JOIN t_news_approval tnp ON tn.app_id = tnp.news_app_id " + " WHERE tn.app_id > 1 and tn.isdelete = 0 ";
	    if(null == flag1){
	    	ssql += " AND tnp.approval_flag1 = ? ";
	    	
	    }else if(null != flag2){
	    	ssql += " AND tnp.approval_flag2 = ? ";
	    }
			ssql += " ORDER BY tn.cdate desc";

		return dao.find(ssql);
	}
	public AppModel findBy1Id(Integer aapid){
		String ssql = " SELECT tn.*, tnp.*, tuou1.user_user_name AS user_name_m,"
				+ " tuo1.user_organiz_name AS oragniz_name_m,"
				+ " tuou2.user_user_name AS user_name_l,"
				+ " tuo2.user_organiz_name AS oragniz_name_l "
				
				+ " FROM t_news_app tn "
				+ " LEFT JOIN t_news_approval tnp ON tn.app_id = tnp.news_app_id "
				
				+ " LEFT JOIN t_user_organiz_user tuou1 ON tnp.approval_flag1_user_id = tuou1.user_user_id "
				+ " LEFT JOIN t_user_organiz tuo1 ON tuo1.id = tuou1.user_organiz_id "
				+ " LEFT JOIN t_user_organiz_user tuou2 ON tnp.approval_flag2_user_id = tuou2.user_user_id "
				+ " LEFT JOIN t_user_organiz tuo2 ON tuo2.id = tuou2.user_organiz_id "
				
				+ " WHERE tn.app_id = ? and tn.isdelete = 0 ";
		return  dao.find(ssql, aapid).get(0);
	}
	

}
