package com.sysoa.common.config;

import javax.sql.DataSource;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.generator.Generator;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年11月12日 上午9:57:22 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
/**
 * 在数据库表有任何变动时，运行一下 main 方法，极速响应变化进行代码重构
 */
public class _JFinalGenerator {
     
    public static DataSource getDataSource() {
        PropKit.use("config.properties");
        C3p0Plugin c3p0Plugin=new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"), PropKit.get("driverClass"));
		c3p0Plugin.start();
        return c3p0Plugin.getDataSource();
    }
    public static void main(String[] args) {
        // base model 所使用的包名
        String baseModelPackageName = "com.sysoa.model.base";
        // base model 文件保存路径
        String baseModelOutputDir = PathKit.getWebRootPath() + "/../src/com/sysoa/model/base";
         
        // model 所使用的包名 (MappingKit 默认使用的包名)
        String modelPackageName = "com.sysoa.model.data";
        // model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
        String modelOutputDir = PathKit.getWebRootPath() + "/../src/com/sysoa/model/data";
        // 创建生成器
        Generator gernerator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
        gernerator.setDialect(new MysqlDialect()); 
        // 添加不需要生成的表名
        // gernerator.addExcludedTable("view_","sys_","sys_role_privilege","sys_user_role");
        // 设置是否在 Model 中生成 dao 对象
        gernerator.setGenerateDaoInModel(true);
        // 设置是否生成字典文件
        gernerator.setGenerateDataDictionary(true);
        // 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
        gernerator.setRemovedTableNamePrefixes("t_","sys_");
        // 生成
        gernerator.generate();
    }
}
