package com.sysoa.common.config;

import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.sysoa.common.CommonController;
import com.sysoa.integrate.controller.IntegratedApprovalController;
import com.sysoa.integrate.controller.IntegratedHandlingController;
import com.sysoa.integrate.controller.IntegratedInfoController;
import com.sysoa.integrate.model.IntegratedApproval;
import com.sysoa.integrate.model.IntegratedHandling;
import com.sysoa.integrate.model.IntegratedInfo;
import com.sysoa.news.controller.AppController;
import com.sysoa.news.controller.ApprovalController;
import com.sysoa.news.model.AppModel;
import com.sysoa.news.model.ApprovalModel;
import com.sysoa.recp.HelloController;
import com.sysoa.recp.controller.RecpApplyController;
import com.sysoa.recp.controller.RecpFeedController;
import com.sysoa.recp.controller.RecpRequireController;
import com.sysoa.recp.model.RecpApplyModel;
import com.sysoa.recp.model.RecpFeedModel;
import com.sysoa.recp.model.RecpRequireModel;
import com.sysoa.supervise.controller.SuperviseInfoController;
import com.sysoa.supervise.controller.SuperviseProgressController;
import com.sysoa.supervise.controller.SuperviseProgressInfoApplyController;
import com.sysoa.supervise.controller.SuperviseProgressInfoController;
import com.sysoa.supervise.controller.SuperviseRequireController;
import com.sysoa.supervise.model.SuperviseInfo;
import com.sysoa.supervise.model.SuperviseProgress;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.supervise.model.SuperviseProgressInfoApply;
import com.sysoa.supervise.model.SuperviseRequire;
import com.sysoa.user.model.User;
import com.sysoa.user.model.UserEmployerModel;
import com.sysoa.user.model.UserMenuModel;
import com.sysoa.user.model.UserOrganizEmployerModel;
import com.sysoa.user.model.UserOrganizModel;
import com.sysoa.user.model.UserOrganizUserModel;
import com.sysoa.user.model.UserRoleMenuModel;
import com.sysoa.user.model.UserRoleModel;
import com.sysoa.user.model.UserRoleUserModel;

/**
 * 
 * Title: _MappingKit
 * Description: 
 * Company: 
 * @author zharh
 * @date 2016年11月23日 上午11:38:13
 */
public class _MappingKit {

	public static void mappingModel(ActiveRecordPlugin arp) {
        //角色权限
        arp.addMapping("user", User.class);
  		arp.addMapping("t_user_role", UserRoleModel.class);
  		arp.addMapping("t_user_role_menu", UserRoleMenuModel.class);
  		arp.addMapping("t_user_role_user", UserRoleUserModel.class);
  		arp.addMapping("t_user_menu", UserMenuModel.class);
  		//组织机构
  		arp.addMapping("t_user_employer", UserEmployerModel.class);
  		arp.addMapping("t_user_organiz", UserOrganizModel.class);
  		arp.addMapping("t_user_organiz_employer", UserOrganizEmployerModel.class);
  		arp.addMapping("t_user_organiz_user", UserOrganizUserModel.class);
  		//接待模块
  		arp.addMapping("t_recp_apply", "apply_id", RecpApplyModel.class);
  		arp.addMapping("t_recp_require", "require_id", RecpRequireModel.class);
  		arp.addMapping("t_recp_feed", "feed_id", RecpFeedModel.class);
  		//消息模块
  		//arp.addMapping("t_user_message", "message_id", UserMessageModel.class);
  		//新闻模块
  		arp.addMapping("t_news_app", "app_id", AppModel.class);
  		arp.addMapping("t_news_approval", "approval_id", ApprovalModel.class);
        //督办模块
  		arp.addMapping("t_supervise_info", "info_id", SuperviseInfo.class);
		arp.addMapping("t_supervise_progress", "progress_id", SuperviseProgress.class);
		arp.addMapping("t_supervise_progress_info", "progress_info_id", SuperviseProgressInfo.class);
		arp.addMapping("t_supervise_progress_info_apply", "progress_info_apply_id", SuperviseProgressInfoApply.class);
		arp.addMapping("t_supervise_require", "dbrequire_id", SuperviseRequire.class);
		//综合审批模块
		arp.addMapping("t_integrated_approval", "approval_id", IntegratedApproval.class);
		arp.addMapping("t_integrated_handling", "handl_id", IntegratedHandling.class);
		arp.addMapping("t_integrated_info", "info_id", IntegratedInfo.class);
	}
	
	public static void mappingController(Routes me) {
		
		//AutoControllerRegist.regist(me);
		me.add("/hello", HelloController.class);
		me.add("/", CommonController.class);
		//接待模块
		me.add("/apply", RecpApplyController.class );
		me.add("/require", RecpRequireController.class );
		me.add("/feed", RecpFeedController.class );
		
		me.add("/news/app", AppController.class );
		me.add("/news/approl", ApprovalController.class );
		
		me.add("/supervise/info", SuperviseInfoController.class);
		me.add("/supervise/progress", SuperviseProgressController.class);
		me.add("/supervise/require", SuperviseRequireController.class);
		me.add("/supervise/progress/info", SuperviseProgressInfoController.class);
		me.add("/supervise/progress/info/apply", SuperviseProgressInfoApplyController.class);
		
		me.add("/integrated/info", IntegratedInfoController.class);
		me.add("/integrated/approval", IntegratedApprovalController.class);
		me.add("/integrated/handling", IntegratedHandlingController.class);
		
	}
}

