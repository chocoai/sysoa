/**
 * 
 */
package com.sysoa.recp.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateFormatUtils;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.sysoa.bo.DwzResponseBO;
import com.sysoa.common.CommonConstant;
import com.sysoa.user.model.UserEmployerModel;
import com.sysoa.user.model.UserOrganizEmployerModel;

/**
 * 
 * @author zhai
 *
 * 2016-10-24 上午10:19:55
 */
public class RecpRequireController extends Controller {
	
	/**
	 * 跳转到首页 
	 */
	public void index(){
		
		Page<UserEmployerModel> page = UserEmployerModel.dao.paginate(CommonConstant.PAGENUMBER, CommonConstant.PAGESIZE, "select *", "from t_user_employer ");
		
		setAttr("page", page);
		
		render("employer/employer.jsp");
	}
	public void getPageList(){
		
		Page<UserEmployerModel> page = UserEmployerModel.dao.paginate(getParaToInt("pageNum"), getParaToInt("numPerPage"), "select *", "from t_user_employer ");
		
		setAttr("page", page);
		
		render("employer/employer.jsp");
	}
	public void isUnique(){
		List<UserEmployerModel> list = UserEmployerModel.dao.find("select * from t_user_employer where user_employer_name= ?", getPara("name"));
		if(list.size()>0){
			renderText("false");
		}else{
			renderText("true");
		}
	}
	
	public void goAdd(){

		setAttr("ServerTime", DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		render("employer/employer_add.jsp");
	}
	public void add(){
		
		DwzResponseBO responseBO = new DwzResponseBO(getPara("navTabId"),"closeCurrent");
		
		boolean flag  = new UserEmployerModel().set("user_employer_name", getPara("name"))
					.set("cdate", getPara("severtime"))
					.set("cuser_id", getPara("userid"))
					.set("cuser_name", getPara("username")).save();
		
		if(!flag){
			
			responseBO.setStatusCode("300");
			
			responseBO.setMessage("操作失败！");
			
		}
		renderJson(responseBO);
	}
	public void del(){
		DwzResponseBO responseBO = new DwzResponseBO();
		
		//删除单位和组织关系
		boolean flag = Db.tx(new IAtom(){

			@Override
			public boolean run() throws SQLException {

				boolean flag1 = UserEmployerModel.dao.deleteById(getParaToInt());
				
				List<UserOrganizEmployerModel> list = UserOrganizEmployerModel.dao.find("select * from t_user_organiz_employer where user_employer_id=?", getParaToInt());
				
				int flag3 = 1;
				int flag2 = 1;
				for(UserOrganizEmployerModel lm:list){
					flag3 += Db.update("delete from  t_user_organiz where id=?",lm.getInt("user_organiz_id"));
				}
				UserOrganizEmployerModel count = UserOrganizEmployerModel.dao.findFirst("select * from t_user_organiz_employer where user_employer_id=?",getParaToInt());
				if(count!=null){
				   flag2 = Db.update("delete from  t_user_organiz_employer where user_employer_id=?",getParaToInt());
				}
				return flag1 && flag2 > 0 && flag3 > 0; 
			}
			
		});
		
		if(!flag){
			responseBO.setStatusCode("300");
			responseBO.setMessage("操作失败！");
		}
		renderJson(responseBO);
	}

}
