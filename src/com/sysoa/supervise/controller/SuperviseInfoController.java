package com.sysoa.supervise.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.sysoa.common.Contans;
import com.sysoa.common.interceptor.RoleInterceptor;
import com.sysoa.supervise.model.SuperviseInfo;
import com.sysoa.supervise.model.SuperviseProgress;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.supervise.model.SuperviseProgressInfoApply;
import com.sysoa.supervise.model.SuperviseRequire;
import com.sysoa.user.model.UserOrganizModel;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年11月17日 下午3:00:02
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class SuperviseInfoController extends Controller {

	public void index() {
	}

	public void add() {

		SuperviseInfo sif = new SuperviseInfo();
		
		boolean succeed = Db.tx(new IAtom() {
			public boolean run() throws SQLException {
				//info
				boolean flag5 = sif.set("info_sno", getPara("info_sno"))
						.set("rec_sno", getPara("rec_sno"))
						.set("info_type", getPara("type"))
						.set("info_title", getPara("title"))
						.set("info_con", getPara("con"))
						.set("rec_time", getParaToDate("rdate"))
						.set("rec_organiz_id", getPara("organiz"))
						.set("info_img_url", getPara("info_img"))
						.set("cdate", new Date())
						.set("cuser_id", getSessionAttr("userId"))
						.set("cuser_name", getSessionAttr("username"))
						.set("cuser_organiz_id", getSessionAttr("organizid"))
						.set("cuser_organiz_name", getSessionAttr("organiz"))
						.set("info_approval_type", getPara("app_type"))
						.set("isfinish", "1")
						.save();
				//require
				boolean flag1 = new SuperviseRequire().set("cdate", new Date())
						.set("cuser_id", getSessionAttr("userId")).set("cuser_organiz_id", getSessionAttr("organizid"))
						.set("cuser_organiz_name", getSessionAttr("organiz"))
						.set("supervise_info_id", sif.get("info_id")).set("require_organiz_id", getPara("ids"))
						.set("require_finish_limit", getPara("limit")).save();

				// 插入进度记录
				SuperviseProgress sp = new SuperviseProgress();
				boolean flag2 = sp.set("udate", new Date()).set("uuser_id", getSessionAttr("userId"))
						.set("uuser_name", getSessionAttr("username"))
						.set("uuser_organiz_id", getSessionAttr("organizid"))
						.set("uuser_organiz_name", getSessionAttr("organiz"))

						.set("supervise_info_id", sif.get("info_id"))
						.set("progress_status", Contans.HANDLE_STATIUS_01).save();
				//
				boolean flag3 = false;
				boolean flag4 = false;
				for (String id : getPara("ids").split(",")) {
					String oname = UserOrganizModel.dao.findById(id).getStr("user_organiz_name");
					SuperviseProgressInfo si = new SuperviseProgressInfo();
					flag3 = si.set("supervise_progress_id", sp.get("progress_id"))
							.set("progress_info_status", Contans.HANDLE_STATIUS_01)
							.set("cuser_organiz_name", oname).set("cuser_organiz_id", id).save();
					flag4 = new SuperviseProgressInfoApply().set("supervise_progress_info_id", si.get("progress_info_id")).set("apply_status", Contans.APPROVAL_UN).save();			
				}
				
				
				return flag1 && flag2 && flag3 && flag4 && flag5;
			}
		});

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		
		if (succeed) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
	public void upd(){
		boolean flag1 = getModel(SuperviseInfo.class, "oo")
				        .update();
		boolean flag2 = getModel(SuperviseRequire.class, "or").update();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag1 && flag2) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);

		
	}

	public void del() {
		
		boolean flag = SuperviseInfo.dao.findById(getParaToInt("id")).set("isdelete", Contans.IS_DELETE_01).update();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);

	}
	public void onfinish(){
		
		
		boolean flag = SuperviseInfo.dao.findById(getParaToInt("id")).set("isfinish", Contans.IS_FINISH_02).update();
		
		boolean flag0 = SuperviseProgress.dao.querybyinfoid(getParaToInt("id")).set("supervise_info_con", getPara("con")).update();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		if (flag && flag0) {
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
	public void checkInfo(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		if(SuperviseInfo.dao.find2All().size()==0){
			returnMap.put("isSuccess", false);
			returnMap.put("msg", "工作已全部下发");
		}
	    renderJson(returnMap);	
	}
	
	@Before(RoleInterceptor.class)
	public void getAll1Supervise(){
		
		renderJson(SuperviseInfo.dao.queryBy1Organizid(getParaToInt("num"), getParaToInt("size"), getSessionAttr("organizid")));
		
	}
	public void getAll2Supervise(){
		
		renderJson(SuperviseInfo.dao.queryBy2Organizid(getParaToInt("num"), getParaToInt("size"), getSessionAttr("organizid")));
	}
	public void getbyid(){
		
		renderJson(SuperviseInfo.dao.queryByINFOid(getParaToInt("id")));
		
	}
	public void getAll3Supervise(){
		
		Map<String, Object> con = new HashMap<String, Object>();
		
		String start = getPara("start");
		String end = getPara("end");
		
		if(start !=null	&& start.length()>0){con.put("start", start);}else{con.put("start", null);}
			
		if(end !=null && end.length()>0){con.put("end", end);}else{con.put("end", null);}
		
		renderJson(SuperviseInfo.dao.querybycondition(getParaToInt("num"), getParaToInt("size"), con));
		
	}
	public void getAll4Supervise(){
		
		renderJson(SuperviseInfo.dao.querybyall(getParaToInt("num"), getParaToInt("size")));

	}
	
}
