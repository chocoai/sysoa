package com.sysoa.news.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.render.JsonRender;
import com.jfinal.upload.UploadFile;
import com.sysoa.common.CommonConstant;
import com.sysoa.common.Contans;
import com.sysoa.common.interceptor.RoleInterceptor;
import com.sysoa.news.model.AppModel;
import com.sysoa.news.model.ApprovalModel;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年11月11日 下午4:57:02
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class AppController extends Controller {

	public void queryAll() {

		renderJson(AppModel.dao.find1All(CommonConstant.PAGENUMBER, CommonConstant.PAGESIZE007, getSessionAttr("userId")));

	}
	public void queryAll1() {

		renderJson(AppModel.dao.find1All(getParaToInt("number"), getParaToInt("size"), getSessionAttr("userId")));

	}
	public void queryAll2() {

		renderJson(AppModel.dao.find1All(getParaToInt("number"), getParaToInt("size"), 0));

	}
	public void queryApp() {

		renderJson(AppModel.dao.findById(getParaToInt("appid")));

	}
	
	public void add() {

		String type = getPara("type");
		AppModel am = new AppModel();
				am.set("app_title", getPara("title")).set("app_type", getPara("type"))
				.set("app_content", getPara("content"))
				
				.set("cdate", new Date())
				.set("cuser_id", getSessionAttr("userId"))
				.set("cuser_name", getSessionAttr("username"))
				.set("cuser_organiz_id", getSessionAttr("organizid"))
				.set("cuser_organiz_name", getSessionAttr("organiz"))
				.set("app_files", getPara("file_true"));
				
		if ("1".equals(type)) {
			am.set("app_urls", getPara("url_true"));
		}
		boolean flag = am.save();
		
		new ApprovalModel().set("news_app_id", am.getInt("app_id"))
							.set("cdate", new Date())
							.set("cuser_id", getSessionAttr("userId"))
							.set("cuser_name", getSessionAttr("username"))
							.set("cuser_organiz_id", getSessionAttr("organizid")).save();

		
		
		if(flag){
			
			//redirect("/goNewsUserIndex");
			redirect("/goNews1User");
		}
	}

	public void del(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", true);
		returnMap.put("msg", "删除成功");
		 boolean flag = AppModel.dao.findById(getParaToInt("appid")).set("isdelete", "1").update();
		 if(!flag){
			 returnMap.put("isSuccess", false); 
			 returnMap.put("msg", "删除失败"); 
		 }
		 renderJson(returnMap);
	}
	
	@Before(RoleInterceptor.class)
	public void appM(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String userflag = getSessionAttr("flag");
		
		returnMap.put("isSuccess", false);
		returnMap.put("msg", "审批失败");
		
		 if((Contans.ROLE_MANAGER.equals(userflag))){
			
			//更新审批 状态
			boolean flag = ApprovalModel.dao.findById(getParaToInt("approval_id"))
					      .set("approval_flag1", Contans.APPROVAL_YES )
						  .set("approval_flag1_con", getPara("app_con"))
						  .set("approval_flag1_user_id", getSessionAttr("userId"))
						  .set("approval_flag1_cdate", new Date())
						  .update();
			if(flag){
				returnMap.put("isSuccess", true);
				returnMap.put("msg", "成功");
			}
			
			
			
		}else if((Contans.ROLE_LEADER.equals(userflag))){
			
			boolean flag = ApprovalModel.dao.findById(getParaToInt("approval_id"))
				      .set("approval_flag2", Contans.APPROVAL_YES )
					  .set("approval_flag2_con", getPara("app_con"))
					  .set("approval_flag2_user_id", getSessionAttr("userId"))
					  .set("approval_flag2_cdate", new Date())
					  .update();
			if(flag){
				returnMap.put("isSuccess", true);
				returnMap.put("msg", "成功");
			}
		}	
		 renderJson(returnMap);
	}
	@Before(RoleInterceptor.class)
	public void appN(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		String userflag = getSessionAttr("flag");
		
		returnMap.put("isSuccess", false);
		returnMap.put("msg", "审批失败");
		
		 if((Contans.ROLE_MANAGER.equals(userflag))){
			
			//更新审批 状态
			boolean flag = ApprovalModel.dao.findById(getParaToInt("approval_id"))
					      .set("approval_flag1", Contans.APPROVAL_NO )
						  .set("approval_flag1_con", getPara("app_con"))
						  .set("approval_flag1_user_id", getSessionAttr("userId"))
						  .set("approval_flag1_cdate", new Date())
						  .update();
			if(flag){
				returnMap.put("isSuccess", true);
				returnMap.put("msg", "成功");
			}
			
			
			
		}else if((Contans.ROLE_LEADER.equals(userflag))){
			
			boolean flag = ApprovalModel.dao.findById(getParaToInt("approval_id"))
				      .set("approval_flag2", Contans.APPROVAL_NO )
					  .set("approval_flag2_con", getPara("app_con"))
					  .set("approval_flag2_user_id", getSessionAttr("userId"))
					  .set("approval_flag2_cdate", new Date())
					  .update();
			if(flag){
				returnMap.put("isSuccess", true);
				returnMap.put("msg", "成功");
			}
		}	
	
		 renderJson(returnMap);
	}
	
	
	public void upload() {
		
		Map<String, Object> json = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		
		String path = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss").format(new Date());
		UploadFile file = getFile("file");
		File source = file.getFile();
		String fileName = file.getFileName();
		
		json.put("filename", fileName);
		
		String extension = fileName.substring(fileName.lastIndexOf("."));
		String prefix;
		if (".png".equals(extension) || ".jpg".equals(extension) || ".gif".equals(extension)) {
			prefix = "img";
			fileName = generateWord() + extension;
		} else {
			prefix = "file";
		}
		
		try {
			FileInputStream fis = new FileInputStream(source);
			File targetDir = new File(PathKit.getWebRootPath() + "/" + prefix + "/u/" + path);
			if (!targetDir.exists()) {
				targetDir.mkdirs();
			}
			File target = new File(targetDir, fileName);
			if (!target.exists()) {
				target.createNewFile();
			}
			FileOutputStream fos = new FileOutputStream(target);
			byte[] bts = new byte[300];
			while (fis.read(bts, 0, 300) != -1) {
				fos.write(bts, 0, 300);
			}
			fos.close();
			fis.close();
			json.put("isSuccess", true);
			json.put("code", 0);
			json.put("url",   prefix + "/u/" + path + "/" + fileName);
			data.put("src", prefix + "/u/" + path + "/" + fileName);
			json.put("data", data);
			source.delete();
			
		} catch (FileNotFoundException e) {
			json.put("isSuccess", false);
			json.put("code", 1);
			json.put("msg", "上传出现错误，请稍后再上传");
		} catch (IOException e) {
			json.put("isSuccess", false);
			json.put("code", 1);
			json.put("msg", "文件写入服务器出现错误，请稍后再上传");
		}
		
		//getResponse().setContentType("application/json;charset=UTF-8");
		//renderJson(json);
		render(new JsonRender(json).forIE());
	}

	public void download() {
		String path =PathKit.getWebRootPath()+"/"+getPara("url");
		
		renderFile(path);
	}
    //生成文件名
	private String generateWord() {
		String[] beforeShuffle = new String[] { "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
				"G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
		List<String> list = Arrays.asList(beforeShuffle);
		Collections.shuffle(list);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < list.size(); i++) {
			sb.append(list.get(i));
		}
		String afterShuffle = sb.toString();
		String result = afterShuffle.substring(5, 9);
		return result;
	}

}
