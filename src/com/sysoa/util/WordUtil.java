package com.sysoa.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.text.WordUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

import com.jfinal.kit.PathKit;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年11月11日 上午9:09:55
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class WordUtil {

	  //配置信息,代码本身写的还是很可读的,就不过多注解了  
    public static Configuration configuration = null;  
    //这里注意的是利用WordUtils的类加载器动态获得模板文件的位置  
    public static final String templateFolder = WordUtils.class.getClassLoader().getResource("../../").getPath() + "tmp/";  
    static {  
        configuration = new Configuration();  
        configuration.setDefaultEncoding("utf-8");  
        try {  
            configuration.setDirectoryForTemplateLoading(new File(templateFolder));  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
   }  
  
    public WordUtil() {  
        throw new AssertionError();  
    }  
  
    public static void exportMillCertificateWord(HttpServletRequest request, HttpServletResponse response, Map<?,?> map) throws IOException {  
        Template freemarkerTemplate = configuration.getTemplate("templates.ftl");  
        File file = null;  
        InputStream fin = null;  
        ServletOutputStream out = null;  
        try {  
            // 调用工具类的createDoc方法生成Word文档  
            file = createDoc(map,freemarkerTemplate);  
            fin = new FileInputStream(file);  
  
            response.setCharacterEncoding("utf-8");  
            response.setContentType("application/msword");  
            // 设置浏览器以下载的方式处理该文件名  
            String fileName = "接待方案.doc";  
            response.setHeader("Content-Disposition", "attachment;filename="  
                    .concat(String.valueOf(URLEncoder.encode(fileName, "UTF-8"))));  
  
            out = response.getOutputStream();  
            byte[] buffer = new byte[512];  // 缓冲区  
            int bytesToRead = -1;  
            // 通过循环将读入的Word文件的内容输出到浏览器中  
            while((bytesToRead = fin.read(buffer)) != -1) {  
                out.write(buffer, 0, bytesToRead);  
            }  
        } finally {  
            if(fin != null) fin.close();  
            if(out != null) out.close();  
            if(file != null) file.delete(); // 删除临时文件  
        }  
    }  
    public static File _exportMillCertificateWord(HttpServletRequest request, HttpServletResponse response, Map<?,?> map) throws IOException {  
        Template freemarkerTemplate = configuration.getTemplate("templates.ftl");  
        File file = null;  
        InputStream fin = null;  
        ServletOutputStream out = null;  
        try {  
            // 调用工具类的createDoc方法生成Word文档  
            file = createDoc(map,freemarkerTemplate);  
            fin = new FileInputStream(file);  
  
            response.setCharacterEncoding("utf-8");  
            response.setContentType("application/msword");  
            // 设置浏览器以下载的方式处理该文件名  
            String fileName = "接待方案.doc";  
            response.setHeader("Content-Disposition", "attachment;filename="  
                    .concat(String.valueOf(URLEncoder.encode(fileName, "UTF-8"))));  
         
        	return file;  
        } finally {  
            if(fin != null) fin.close();  
            if(out != null) out.close();  
            if(file != null) file.delete(); // 删除临时文件  
        }
    }  
	public static void download (HttpServletRequest request, HttpServletResponse response, Map<?,?> map) throws IOException {  
	  //得到要下载的文件名
	    String fileName = request.getParameter("filename"); //23239283-92489-阿凡达.avi
	    fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
	    String path = fileName;
	    //得到要下载的文件
	    File file = new File(PathKit.getWebRootPath()+path);
	    //如果文件不存在
	    if(!file.exists()){
/*	    request.setAttribute("message", "您要下载的资源已被删除！！");
	    request.getRequestDispatcher("/message.jsp").forward(request, response);*/
	    return;
	    }
	    //处理文件名
	    String realname = fileName.substring(fileName.indexOf("_")+1);
	    //设置响应头，控制浏览器下载该文件
	    response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
	    //读取要下载的文件，保存到文件输入流
	    FileInputStream in = new FileInputStream(path + "\\" + fileName);
	    //创建输出流
	    OutputStream out = response.getOutputStream();
	    //创建缓冲区
	    byte buffer[] = new byte[1024];
	    int len = 0;
	    //循环将输入流中的内容读取到缓冲区当中
	    while((len=in.read(buffer))>0){
	    //输出缓冲区的内容到浏览器，实现文件下载
	    out.write(buffer, 0, len);
	    }
	    //关闭文件输入流
	    in.close();
	    //关闭输出流
	    out.close();
	}
	
    public static File createDoc(Map<?, ?> dataMap, Template template) {  
    	
    	String date = DateFormatUtils.format(new Date(), "yyyyMMddHHmmss");
        String name =  date+".doc";  
        File f = new File(PathKit.getWebRootPath() +"/tmp/",name);
        
   
        
        Template t = template;  
        try {  
        	
            if  (!f .exists()  )//&& !f .isDirectory())      
            {       
                f .createNewFile();    
            }
            // 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开  
            Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");  
            t.process(dataMap, w);  
            w.close();  
        } catch (Exception ex) {  
            ex.printStackTrace();  
            throw new RuntimeException(ex);  
        }  
        return f;  
    }  

}
