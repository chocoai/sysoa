package com.sysoa.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

import com.sysoa.common.ContansModel;




/**
 * 资源工具类<br>
 * 1.读取jar包路径<br>
 * 2.读取配置文件<br>
 * 3.获取配置文件中的属性<br>
 * 4.获取配置文件中的属性,返回boolean值<br>
 * @author qiaowenbin
 * @version 0.0.2.20141220
 * @history
 * 	0.0.2.20141220<br>
 * 	0.0.1.20141117<br>
 */
public class QPropertiesUtil {
	
	public static final Properties config = readProperties("/config.properties");
	//private static final Logger logger = LoggerFactory.getLogger(QPropertiesUtil.class);
	
   /**
    * 读取属性列表
    * @param values
    * @return
    */
    public static List<ContansModel> list(String[] values){  
        List<ContansModel> list = new ArrayList<ContansModel>();  
        if(values != null){  
            for(String value : values){  
                list.add(new ContansModel(value, get(value)));  
            }  
        }  
          
        return list;  
    } 
	/**
	 * 读取配置文件
	 * @param in
	 * @return
	 */
	public static Properties readProperties(String path){
		Properties p = new Properties();
		try {
			p.load(QPropertiesUtil.class.getResourceAsStream(path));
		} catch (IOException e) {
			//logger.error(StringUtils.fromException(e));
		}
		
		return p;
	}
	
	/**
	 * 获取config的value
	 * @param key
	 * @return
	 */
	public static String get(String key){
		return getProperty(config, key);
	}
	
	/**
	 * 获取配置文件中的属性
	 * @param properties
	 * @param key
	 * @return
	 */
	public static String getProperty(Properties properties, String key){
		if(properties != null && StringUtils.isNotEmpty(key)){
			return properties.getProperty(key);
		}else{
			return null;
		}
	}
	
	/**
	 * 获取config的值
	 * @param key
	 * @return
	 */
	public static boolean getBoolean(String key){
		return getPropertyToBoolean(config, key);
	}
	
	/**
	 * 获取配置文件中的属性,返回boolean值
	 * @param properties
	 * @param key
	 * @return
	 */
	public static boolean getPropertyToBoolean(Properties properties, String key){
		if(properties != null && StringUtils.isNotEmpty(key)){
			return Boolean.parseBoolean(properties.getProperty(key));
		}else{
			return false;
		}
	}
	
}
