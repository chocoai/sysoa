package com.sysoa.supervise.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.sysoa.common.Contans;
import com.sysoa.supervise.model.SuperviseProgressInfo;
import com.sysoa.supervise.model.SuperviseProgressInfoApply;
import com.sysoa.util.ConvertSwf;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月17日 下午3:00:02 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class SuperviseProgressInfoController extends Controller {

	
	public void add(){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		
		
	    SuperviseProgressInfo spi = SuperviseProgressInfo.dao.findbyProOrg(getParaToInt("id"), getSessionAttr("organizid")).get(0);
	    boolean flag1 = false;
	    /**
	     * 判断进度明细的记录是否填写内容了
	     *  true 新建一条记录插入
	     *  false 更新已有记录
	     */
		if(StringUtils.isEmpty(spi.getStr("progress_info_con"))){
			spi	.set("progress_info_status", getPara("complete"))
									.set("progress_info_con", getPara("con"))
									.set("progress_info_url", getPara("url"))
									.set("progress_info_url_type", getPara("type"))
									.set("cdate", new Date())
									.set("cuser_id", getSessionAttr("userId"))
									.set("cuser_name", getSessionAttr("username"));
			if(StringUtils.isNotEmpty(getPara("img"))) { spi.set("progress_info_img", getPara("img"));}
		    flag1 = spi.update();
		}else{
			
			SuperviseProgressInfo si = new SuperviseProgressInfo();
			
			flag1 = si
					.set("progress_info_status", getPara("complete"))
					.set("progress_info_con", getPara("con"))
					.set("progress_info_url", getPara("url"))
					.set("progress_info_url_type", getPara("type"))
					.set("cdate", new Date())
					.set("cuser_id", getSessionAttr("userId"))
					.set("cuser_name", getSessionAttr("username"))
					.set("cuser_organiz_id", getSessionAttr("organizid"))
					.set("cuser_organiz_name", getSessionAttr("organiz"))
					.set("supervise_progress_id", getParaToInt("id"))
					.save();
			//插入进度明细的审批状态
			new SuperviseProgressInfoApply().set("supervise_progress_info_id", si.get("progress_info_id")).set("apply_status", Contans.APPROVAL_UN).save();			
		
		}
	
		
		if(flag1){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
public void _edit(){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		
		
	    SuperviseProgressInfo spi = SuperviseProgressInfo.dao.findById(getPara("id"));
	    boolean flag1 = false;
		spi	.set("progress_info_status", getPara("complete"))
									.set("progress_info_con", getPara("con"))
									.set("progress_info_url", getPara("url"))
									.set("progress_info_url_type", getPara("type"))
									.set("cdate", new Date())
									.set("cuser_id", getSessionAttr("userId"))
									.set("cuser_name", getSessionAttr("username"))
									;
			//if(StringUtils.isNotEmpty(getPara("img"))) { spi.set("progress_info_img", getPara("img"));}
		spi.set("progress_info_img", getPara("img"));
		 flag1 = spi.update();
	
		//插入进度明细的审批状态
		SuperviseProgressInfoApply.dao.findbyinfoid(getParaToInt("id")).set("apply_status", Contans.APPROVAL_UN).update();			
	
		
		if(flag1){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
	
	public void query1(){
		
		SuperviseProgressInfo sp = SuperviseProgressInfo.dao.findbyProOrg(getParaToInt("pid"), getSessionAttr("organizid")).get(0);
		
		if(sp != null){
			renderJson(sp);
		}else{
			renderJson(false);	
		}
		
		
	}
	public void _query1(){
		
		SuperviseProgressInfo sp = SuperviseProgressInfo.dao.findbyProInfoid(getParaToInt("pid"));
		
		if(sp != null){
			renderJson(sp);
		}else{
			renderJson(false);	
		}
		
		
	}
	public void query2(){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		
		SuperviseProgressInfo sp = SuperviseProgressInfo.dao.findbyinfoid(getParaToInt("id"));
		
		if(sp != null){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
			returnMap.put("obj", sp);
		}
		renderJson(returnMap);
	}
	
	public void query3(){
		
		Page<SuperviseProgressInfo> page = SuperviseProgressInfo.dao.fingbyProId(getParaToInt("num"), getParaToInt("size"), getParaToInt("progress_id"));
		
		renderJson(page);
	}
	
	public void docinline(){
		
		String dirPath = PathKit.getWebRootPath()+"\\swf";   //pdf2swf.exe 拷贝到附件路径行 
		String fileName = PathKit.getWebRootPath()+"\\"+getPara("url");
		
		String outPath = new ConvertSwf().beginConvert(dirPath,fileName);   
		
		renderJson(outPath);
	}
}
