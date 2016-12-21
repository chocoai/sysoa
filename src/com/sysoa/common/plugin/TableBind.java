package com.sysoa.common.plugin;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月6日 下午6:53:58 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
public @interface TableBind {
    String tableName();
    String pkName() default "";
}