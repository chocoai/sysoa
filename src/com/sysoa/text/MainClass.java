package com.sysoa.text;

import com.jfinal.kit.PathKit;
import com.sysoa.util.ConvertSwf;

public class MainClass {

	public static void main(String[] args) {
		
		String dirPath = PathKit.getWebRootPath()+"\\swf";   //pdf2swf.exe 拷贝到附件路径行 
		String fileName = "督办材料模板.doc";
		
		String outPath = new ConvertSwf().beginConvert(dirPath,fileName);   
		System.out.println("生成swf文件:" + outPath);  
		
	}
}
