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
import com.sysoa.supervise.model.SuperviseProgress;
import com.sysoa.supervise.model.SuperviseProgressInfo;
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

	
	@SuppressWarnings("unused")
	public void add(){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("isSuccess", false);
		returnMap.put("msg", PropKit.get(Contans.OPATION_FAIL));
		
		
	    SuperviseProgressInfo spi = SuperviseProgressInfo.dao.findbyProOrg(getParaToInt("id"), getSessionAttr("organizid"));
				
		spi	.set("progress_info_status", getPara("complete"))
								.set("progress_info_con", getPara("con"))
								.set("progress_info_url", getPara("url"))
								.set("progress_info_url_type", getPara("type"))
								.set("cdate", new Date())
								.set("cuser_id", getSessionAttr("userId"))
								.set("cuser_name", getSessionAttr("username"));
		if(StringUtils.isNotEmpty(getPara("img"))) { spi.set("progress_info_img", getPara("img"));}
		boolean flag1 = spi.update();
		SuperviseProgress sp = SuperviseProgress.dao.findById(getParaToInt("id"));
		//String ids = SuperviseRequire.dao.findbyINFOid(sp.getInt("supervise_info_id")).getStr("require_organiz_id");
	    //计算任务 的整体完成度，更新progress表
		
		//Integer num = QStringUtil.countStr(ids, ",");
		//Integer complete =  getParaToInt("complete");
		// boolean flag = false;    
		/* 
		 for(SuperviseProgressInfo spi : SuperviseProgressInfo.dao.findbyPro(getParaToInt("id"))){
		
			  flag = spi.get("progress_info_status").equals(Contans.HANDLE_STATIUS_02) ? true : false;
			  
              if (!flag) break;			  
		 }
		       
		       
		boolean flag2 = flag ? sp.set("progress_status", Contans.HANDLE_STATIUS_02).update() : false;*/
		
		if(flag1){
			returnMap.put("isSuccess", true);
			returnMap.put("msg", PropKit.get(Contans.OPATION_SUCCESS));
		}
		renderJson(returnMap);
	}
	
	public void query1(){
		
		SuperviseProgressInfo sp = SuperviseProgressInfo.dao.findbyProOrg(getParaToInt("pid"), getSessionAttr("organizid"));
		
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
