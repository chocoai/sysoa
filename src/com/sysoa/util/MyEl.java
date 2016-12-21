package com.sysoa.util;

import java.io.File;


/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月28日 下午2:46:27 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class MyEl {

	public static String  toSubfilename(String fName){
		
        File tempFile =new File( fName.trim());  
        
        String fileName = tempFile.getName();  
           
        //System.out.println("方法一：fileName = " + fileName);  
        
		return new String(fileName);
		
	}
}
