package com.sysoa.common;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateFormatUtils;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Page;
import com.sysoa.model.data.RecOrganiz;
import com.sysoa.news.model.AppModel;
import com.sysoa.supervise.model.SuperviseInfo;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.user.model.User;
import com.sysoa.user.model.UserOrganizModel;
import com.sysoa.user.model.UserOrganizUserModel;
import com.sysoa.util.ConvertSwf;
import com.sysoa.util.MD5Util;
import com.sysoa.util.QPropertiesUtil;
import com.sysoa.util.QStringUtil;


@Clear
public class CommonController extends Controller {

	public void index() {
		if(getSession().getAttribute("username")==null){
			
			redirect("/_l_1");
			
		}else if(Contans.URL_LOACTION_RECP.equals(getSessionAttr("submitType"))){
			if(Contans.ROLE_USER.equals(getSessionAttr("flag"))){
				
				redirect("/goRecpUserIndex");
				
			}else if(Contans.ROLE_MANAGER.equals(getSessionAttr("flag"))){
				
				redirect("/goRecpManagerIndex");
			}
			
		}else if(Contans.URL_LOACTION_SUPERVISE.equals(getSessionAttr("submitType"))){
			
			redirect("/goSupervises");
			
		}else if(Contans.URL_LOACTION_NEWS.equals(getSessionAttr("submitType"))){
			
			redirect("/goNews1User");
			
		}else if(Contans.URL_LOACTION_INTEGRATED.equals(getSessionAttr("submitType"))){
			
			redirect("/gointegratedindex");
			
		}else{
			render("login.jsp");
		}
	}
		
	public void _l_1() {
		
		render("login.jsp");
		
	}
	public void _l_2() {
		
		render("login2.jsp");
		
	}
	public void _l_3() {
		
		render("login3.jsp");
		
	}
	public void _l_4() {
		
		render("login4.jsp");
		
	}
	public void login(){
		User user=User.dao.getUserByLoginName(getPara("username"));
		if(user==null || ! user.getStr("password").equals(MD5Util.MD5(getPara("password")))){
			setAttr("msg", "用户名或密码错误");
			
			if(Contans.URL_LOACTION_RECP.equals(getPara("submit_type"))){
				render("login.jsp");
			}else if(Contans.URL_LOACTION_NEWS.equals(getPara("submit_type"))){
				render("login2.jsp");
			}else if(Contans.URL_LOACTION_SUPERVISE.equals(getPara("submit_type"))){
				render("login3.jsp");
			}else if(Contans.URL_LOACTION_INTEGRATED.equals(getPara("submit_type"))){
				render("login4.jsp");
			}
			return;
		}else{
			Integer oragnizid = UserOrganizUserModel.dao.findByUserid(user.getInt("id")).getInt("user_organiz_id");
			
			getSession().setAttribute("userId", user.getInt("id"));
			getSession().setAttribute("username", user.getStr("name"));
			getSession().setAttribute("loginname", user.getStr("loginName"));
			getSession().setAttribute("submitType", getPara("submit_type"));
			getSession().setAttribute("employer", user.getStr("user_employer_name"));
			getSession().setAttribute("organiz", user.getStr("user_organiz_name"));
			getSession().setAttribute("organizid", oragnizid);
			getSession().setAttribute("role", user.getStr("user_role_name"));
			getSession().setAttribute("flag", user.getStr("user_role_login_url"));
			getSession().setAttribute("user", user);
			getSession().setAttribute("organizList", UserOrganizModel.dao.findAll());
			
			redirect("/");
		}
	}
	
    public void goRecpApply(){
		setAttr("ServerTime", DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		render("RecpApply.jsp");
    }
	
	public void exit(){
		
		if(Contans.URL_LOACTION_RECP.equals(getSessionAttr("submitType"))){
			redirect("/_l_1");
		}else if(Contans.URL_LOACTION_NEWS.equals(getSessionAttr("submitType"))){
			redirect("/_l_2");
		}else if(Contans.URL_LOACTION_SUPERVISE.equals(getSessionAttr("submitType"))){
			redirect("/_l_3");
		}else if(Contans.URL_LOACTION_INTEGRATED.equals(getSessionAttr("submitType"))){
			redirect("/_l_4");
		}else{
			redirect("/");
		}
		getSession().invalidate();
	}
	/**
	 * 跳转管理会议室申请
	 */
	public void goManagerApplyRoom(){
		
		//setAttr("roomList", Room.dao.getAllRoom());
		
		//setAttr("ServerTime", DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		//setSessionAttr("messagecount", UserMessageModel.dao.findByRecId(0).size());
		
		//setAttr("usermessage", UserMessageModel.dao.findByRecId(0));
		
		render("bookRoom_manager.jsp");
	}
	/**
	 * 跳转申请会议室
	 */
	public void goApplyRoom(){
		
		//setAttr("roomList", Room.dao.getAllRoom());
		
		setAttr("ServerTime", DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		//List<UserMessageModel> mes = UserMessageModel.dao.findByRecId((Integer)getSessionAttr("userId"));
		
		//setSessionAttr("messagecount", mes.size());
		
		//setAttr("usermessage", mes);
		
		render("bookRoom.jsp");
	}
	/**
	 * 跳转新增领导事记
	 */
	public void goLeadership(){
		
		//setAttr("leaderList", LeaderInfo.dao.getAllLeaderInfo());
		
		setAttr("ServerTime", DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		
		render("leadership.jsp");
	}
	/**
	 * 跳转首页
	 */
	public void goIndex(){
		
		//setAttr("leaderSchedule",LeaderSchedule.dao.findAll());
		
		//setAttr("roomSchedule",RoomSchedule.dao.getTodayEvent());
		
		render("index.jsp");
	}
	
	
	/***************************************表单跳转start*************************************8/
	/**
	 * 跳转修改密码
	 */	
	public void goEditpwd(){
		
		render("form/editPwd.jsp");
	}
	/**
	 * 跳转添加领导
	 */	
	public void goAddLeader(){
		
		render("form/add_leader.jsp");
	}
	/**
	 * 跳转添加会议室
	 */	
	public void goAddRoom(){
		
		render("form/add_room.jsp");
	}
	/**
	 * 跳转添加领导事记的表单
	 */	
	public void goAddLeaderSchedule(){
		
		render("form/add_leaderSchedule.jsp");
	}
	/**
	 * 跳转修改领导事记申请表单
	 */	
	public void goUpdLeaderSchedule(){
		
		render("form/upd_leaderSchedule.jsp");
	}
	/**
	 * 跳转添加会议室申请表单
	 */	
	public void goAddRoomSchedule(){
		
		render("form/add_roomSchedule.jsp");
	}
	/**
	 * 跳转修改会议室申请表单
	 */	
	public void goUpdRoomSchedule(){
		
		render("form/upd_roomSchedule.jsp");
	}
	/***************************************表单跳转end**************************************/
	
	
	/***************************************系统sysoa跳转start**************************************/
	/**接待**/
	public void goRecpUserIndex(){
	    
        render("index_user.jsp");	    
	   
	}
	public void goRecpManagerIndex(){

        render("index_manager.jsp");	    
	   
	}
	
	
	/**新闻**/
	public void goNewsManagerIndex(){

        render("news_manager.jsp");	    
	   
	}
	public void goNewsUserIndex(){

        render("news_user.jsp");	    
	   
	}
	public void goNews1User(){

        render("news_list_user.jsp");	    
	   
	}
	public void goNewsDetail(){
		setAttr("obj",AppModel.dao.findBy1Id(getParaToInt()));
		render("news_detail.jsp");
	}
	
	/**督办**/
	public void goSupervises(){
		
		render("supervise_list.jsp");
	}
	
	public void goaddSupervise(){
		
		setAttr("type", QPropertiesUtil.list(Contans.EVENT_SUPERVISE));
		setAttr("limit", QPropertiesUtil.list(Contans.HANDLE_LIMIT));
		setAttr("app_type", QPropertiesUtil.list(Contans. LEADER_APPROVAL_TYPE));
		setAttr("rec_organiz", QPropertiesUtil.list(Contans. REC_ORGANIZS));
		render("form/add_supervise_form.jsp");
	}
	public void goupdSupervise(){
		setAttr("type", QPropertiesUtil.list(Contans.EVENT_SUPERVISE));
		setAttr("limit", QPropertiesUtil.list(Contans.HANDLE_LIMIT));
		render("form/upd_supervise_form.jsp");
	}
	public void goaddRequire(){
	    setAttr("supervise", SuperviseInfo.dao.find2All());
	    setAttr("limit", QPropertiesUtil.list(Contans.HANDLE_LIMIT));
		render("form/add_require_form.jsp");
	}
	
	public void goaddProgress(){
	    setAttr("complete",  QPropertiesUtil.list(Contans.HANDLE_STATIUS));
	    setAttr("report",  QPropertiesUtil.list(Contans.REPORT_MATERIAL_TYPE));
		render("form/add_progress_info_form.jsp");
	}
	
	public void goSuperviseDetail(){
		
		Integer infoid = getParaToInt();
		
		SuperviseInfo sf = SuperviseInfo.dao.queryByINFOid(infoid);
		
		String ids = sf.getStr("require_organiz_id");
		
		String idstr ="";
		if(QStringUtil.countStr(ids, ",")>0){
			
			for(String id :ids.split(",")){
				if(idstr.length()>0) idstr += "、";
			    idstr += UserOrganizModel.dao.findById(Integer.parseInt(id)).getStr("user_organiz_name");
			}
		}else {
			idstr = UserOrganizModel.dao.findById(Integer.parseInt(ids)).getStr("user_organiz_name");;
		}
		
		Page<SuperviseProgressInfo> page = SuperviseProgressInfo.dao.fingbyProId(CommonConstant.PAGENUMBER, CommonConstant.PAGESIZE, sf.getInt("progress_id"));
		
		setAttr("obj", sf);
		
		setAttr("str1", idstr);
		
		setAttr("page", page);
		
		render("supervise_detail.jsp");
		
	} 
	public void gosuperviseprogressinfo(){
		render("form/apply_supervise_progress_info_form.jsp");
	}
	
	public void godoc(){
		
		String dirPath = PathKit.getWebRootPath()+"\\swf";   //pdf2swf.exe 拷贝到附件路径行 
		String fileName = PathKit.getWebRootPath()+"\\"+getPara("url");
		
		String outPath = new ConvertSwf().beginConvert(dirPath,fileName);   
		
		outPath = outPath.substring(outPath.indexOf("swf"), outPath.length());
		
		outPath = outPath.replace("\\", "/");
		
		setAttr("file", outPath);

		render("views/FlexPaperViewer.jsp");
	}
	
	//综合审批
	public void gointegratedindex(){
		render("integrated_list.jsp");
	}
	public void goaddintegrated(){
		render("form/add_integrate_info_form.jsp");
	}
	public void gointegrateddetail(){
		render("form/detail_integrate_info_form.jsp");
	}
	public void gointegratedupd(){
		render("form/upd_integrate_info_form.jsp");
	}
	/***************************************系统sysoa跳转end**************************************/
	
	public void dicList(){
		List<ContansModel> li = null ;
		
		String ss = getPara("code");
		String[] sr = null;
		
		if(Contans.CODE_HANDLE_LIMIT.equals(ss)){
			
		/*	li = CacheKit.get("PRO_CODE", "HANDLE_LIMIT", new IDataLoader() {
				public Object load() {
					return QPropertiesUtil.list(Contans.HANDLE_LIMIT);
				}
			});*/
			sr = Contans.HANDLE_LIMIT;
			
		}else if(Contans.CODE_HANDLE_STATIUS.equals(ss)){
			
			sr = Contans.HANDLE_STATIUS;
			
		}else if(Contans.CODE_EVENT_SUPERVISE.equals(ss)){
			
			sr = Contans.EVENT_SUPERVISE;
			
		}else if(Contans.CODE_APPROVAL.equals(ss)){
			
			sr = Contans.APPROVAL;
			
		}else if(Contans.CODE_REPORT_MATERIAL_TYPE.equals(ss)){
			
			sr = Contans.REPORT_MATERIAL_TYPE;
			
		}else if(Contans.CODE_REC_ORGANIZS.equals(ss)){
			
			sr = Contans.REC_ORGANIZS;
			
		}
		li = QPropertiesUtil.list(sr);
		
		renderJson(li);
	}
	
	public void dicOrganiz(){
		
		renderJson(UserOrganizModel.dao.findAll(null));
		
	}
	
	public void dicRecOrganiz(){
		
		renderJson(RecOrganiz.dao.findAll(null));
		
	}
}
