/**
 * 
 */
package com.sysoa.recp.model;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

/**
 * 
 * @author zhai
 *
 * 2016-10-24 上午10:12:09
 */
@SuppressWarnings("serial")
public class RecpApplyModel extends Model<RecpApplyModel> {

	public static final RecpApplyModel dao = new RecpApplyModel();
	/**
	 * 查询当前用户下在这个时间段内的接待申请单
	 * @param start
	 * @param end
	 * @param userid
	 * @return
	 */
	public List<RecpApplyModel> getDurationEvents(long start, long end, int userid) {
		String sqlStr = "select x.*,y.name username,y.email from t_recp_apply x left join user y on x.cuser_id = y.id"
				+ " where  x.persion_start_time>=from_unixtime(?) and x.persion_start_time<from_unixtime(?) and x.cuser_id=? and x.isdelete = '0' ";
		return dao.find(sqlStr,start,end,userid);
	}
    /**
     * 查询未完成的接待申请单
     * 根据创建时间倒序
     * @param recpFlag 接待标志0.自己申请的 1.办公室下发的
     * @return
     */
	public List<RecpApplyModel> getAllevents(String recpFlag, Integer userid) {
		String sqlStr = "select x.*, y.name username, y.email, tuoe.user_organiz_name, tue.user_employer_name "
				+" from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				
				+" left JOIN t_user_organiz_user tuou ON y.id = tuou.user_user_id "
				+" left JOIN t_user_organiz_employer tuoe ON tuou.user_organiz_id = tuoe.user_organiz_id "
				+" left JOIN t_user_employer tue ON tuoe.user_employer_id = tue.id "
				
				+ " where x.recp_flag = ? and x.finish_flag='0' and x.isdelete = '0' ";
		if(userid != 0){
			sqlStr += " and x.cuser_id=?  order by x.persion_start_time desc";
			
			return dao.find(sqlStr, recpFlag, userid);
		}
		sqlStr += " order by x.persion_start_time desc";
		return dao.find(sqlStr, recpFlag);
	}
	/**
	 * 创建申请的机构查询
	 * @param organizid
	 * @return
	 */
	public List<RecpApplyModel> getAllevents1(Integer organizid) {
		String sqlStr = "select x.*, y.name username, y.email, tuoe.user_organiz_name, tue.user_employer_name "
				+" from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				
				+" left JOIN t_user_organiz_user tuou ON y.id = tuou.user_user_id "
				+" left JOIN t_user_organiz_employer tuoe ON tuou.user_organiz_id = tuoe.user_organiz_id "
				+" left JOIN t_user_employer tue ON tuoe.user_employer_id = tue.id "
				
				+ " where x.recp_flag = '0' and x.finish_flag = '0'   and x.cuser_organiz_id = ? and x.isdelete = '0' ";
	
		sqlStr += " order by x.persion_start_time";
		return dao.find(sqlStr, organizid);
	}
	/***
	 * 根据下发机构查询
	 * @param organizid
	 * @return
	 */
	public List<RecpApplyModel> getAllevents2(Integer organizid) {
		String sqlStr = "select x.*, y.name username, y.email, tuoe.user_organiz_name, tue.user_employer_name, trr.*  "
				+" from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				
				+" left JOIN t_user_organiz_user tuou ON y.id = tuou.user_user_id "
				+" left JOIN t_user_organiz_employer tuoe ON tuou.user_organiz_id = tuoe.user_organiz_id "
				+" left JOIN t_user_employer tue ON tuoe.user_employer_id = tue.id "
				//关联接待要求表
				+" left JOIN t_recp_require trr ON x.apply_id=trr.recp_apply_id "
				
				+ " where x.recp_flag = '1' and x.finish_flag = '0' and x.isdelete = '0' ";
	
		if(organizid !=0){
			sqlStr += "and trr.require_user_organiz LIKE ? order by x.persion_start_time desc ";
			return dao.find(sqlStr, "%"+organizid+",%");
		}
		sqlStr += " order by x.persion_start_time desc" ;
		return dao.find(sqlStr);
	}
    
    /**
     * 查询未完成的接待申请单
     * @param recpFlag 接待标志0.自己申请的 1.办公室下发的
     * @return
     */
	public List<RecpApplyModel> getAl(String recpFlag, Integer userid) {
		String sqlStr = "select x.*, y.name username, y.email, tuoe.user_organiz_name, tue.user_employer_name "
				+" from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				
				+" left JOIN t_user_organiz_user tuou ON y.id = tuou.user_user_id "
				+" left JOIN t_user_organiz_employer tuoe ON tuou.user_organiz_id = tuoe.user_organiz_id "
				+" left JOIN t_user_employer tue ON tuoe.user_employer_id = tue.id "
				
				+ " where x.recp_flag = ? and x.cuser_id=? and x.finish_flag='0' and x.isdelete = '0' orader by x.persion_start_time";
		return dao.find(sqlStr, recpFlag, userid);
	}
	
	/**
	 * 检验当前用户的申请与新增或修改后的时间有重叠
	 * @param start 开始时间
	 * @param end 结束时间
	 * @param id 事件id
	 * @return false：有重叠，true：无重叠 
	 */
	public boolean isLegalEvent(long start, long end, Integer id, Integer userid){
		String sql1="select count(*) from t_recp_apply "
				+ " where persion_start_time>from_unixtime(?) and persion_start_time<from_unixtime(?) and id <> ?";
		String sql2="select count(*) from t_recp_apply "
				+ " where persion_end_time>from_unixtime(?) and persion_end_time<from_unixtime(?) and id <> ?";
		String sql3="select count(*) from t_recp_apply "
				+ " where persion_start_time<=from_unixtime(?) and persion_end_time>=from_unixtime(?) and and id <> ?";

		Long n1 = Db.queryLong(sql1,start,end,id);
		Long n2 = Db.queryLong(sql2,start,end,id);
		Long n3 = Db.queryLong(sql3,start,end,id);
		
		return (n1+n2+n3) == 0 ? true : false;
	}
	
	
	/**
	 * 查询当天审批通过并确认的申请
	 * @return
	 */
	public List<RecpApplyModel> getTodayEventPast(){
		String sqlStr="select x.*,y.name username,y.tel,y.email from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				+" where to_days(persion_start_time)=to_days(now()) and x.approval_flag='1' and x.isdelete = '0' order by persion_start_time asc";
		return dao.find(sqlStr);
	}
	/**
	 * 查询当天有意见的申请
	 * @return
	 */
	public List<RecpApplyModel> getTodayEventNoPast(){
		String sqlStr="select x.*,y.name username,y.tel,y.email from t_recp_apply x "
				+" left join user y on x.cuser_id = y.id "
				+" where to_days(persion_start_time)=to_days(now()) and x.approval_flag='1' and x.isdelete = '0' order by persion_start_time asc";
		return dao.find(sqlStr);
	}
	
	/**
	 * 根据申请id
	 * @return
	 */
	public RecpApplyModel findAllbyId(Integer id){
		String sqlStr="select x.*, r.*"
						+" from t_recp_apply x "
					    +" left join t_recp_require r on r.recp_apply_id=x.apply_id"
						+ " where x.apply_id = ? and x.finish_flag='0' and x.isdelete = '0' ";
		return dao.find(sqlStr,id).get(0);
	}
	
	/**
	 * find all by order
	 * 未过期的申请
	 * @param order
	 * @return
	 */
	public List<RecpApplyModel> findAll(String order){
		StringBuilder sb = new StringBuilder("select * from t_recp_apply  where to_days(persion_start_time)>to_days(now()) and x.isdelete = '0' ");
		if(StringUtils.isEmpty(order)){
			return dao.find(sb.append("order by persion_id desc").toString());
		}else{
			return dao.find(sb.append(order).toString());
		}
	}
	
}
