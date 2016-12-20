package com.sysoa.supervise.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.sysoa.common.Contans;
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
public class SuperviseRequireController extends Controller {

	public void add() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		boolean succeed = Db.tx(new IAtom() {
			public boolean run() throws SQLException {
				boolean flag1 = new SuperviseRequire().set("cdate", new Date())
						.set("cuser_id", getSessionAttr("userId")).set("cuser_organiz_id", getSessionAttr("organizid"))
						.set("cuser_organiz_name", getSessionAttr("organiz"))
						.set("supervise_info_id", getParaToInt("supervise")).set("require_organiz_id", getPara("ids"))
						.set("require_finish_limit", getPara("limit")).save();

				// 插入进度记录
				SuperviseProgress sp = new SuperviseProgress();
				boolean flag2 = sp.set("udate", new Date()).set("uuser_id", getSessionAttr("userId"))
						.set("uuser_name", getSessionAttr("username"))
						.set("uuser_organiz_id", getSessionAttr("organizid"))
						.set("uuser_organiz_name", getSessionAttr("organiz"))

						.set("supervise_info_id", getParaToInt("supervise"))
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
				return flag1 && flag2 && flag3 && flag4;
			}
		});

		if (succeed) {

			// 下发成功更新info表
			SuperviseInfo.dao.findById(getParaToInt("supervise")).set("isfinish", Contans.IS_FINISH_01).update();
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
}
