package com.sysoa.common;

/**
 * @author 作者 E-mail:
 * @date 创建时间：2016年11月5日 下午10:20:04
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public class Contans {

	// 是，否
	public static final String YESNO_YES = "000101";
	public static final String YESNO_NO = "000102";
	public static final String[] YESNO = new String[] { YESNO_YES, YESNO_NO };

	// 男，女
	public static final String SEX_MALE = "SEX_MALE";
	public static final String SEX_FEMALE = "SEX_FEMALE";
	public static final String[] SEX = new String[] { SEX_MALE, SEX_FEMALE };

	// 用户，管理员，领导
	public static final String ROLE_USER = "A";
	public static final String ROLE_MANAGER = "M";
	public static final String ROLE_LEADER = "L";
	public static final String[] ROLE = new String[] { ROLE_USER, ROLE_MANAGER, ROLE_LEADER };

	// 审批
	public static final String APPROVAL_NO = "2";
	public static final String APPROVAL_YES = "1";
	public static final String APPROVAL_UN = "0";
	public static final String[] APPROVAL = new String[] { APPROVAL_NO, APPROVAL_YES, APPROVAL_UN };
	public static final String CODE_APPROVAL = "CODE_APPROVAL";
	//审批类型
	public static final String APPROVAL_TYPE = "s";
	
	//超时
	public static final String AJAX_TIME_OUT = "00004";
	//登录
	public static final String LOGIN_URL= "/";
	//完成
	public static final String IS_FINISH_00= "0";
	public static final String IS_FINISH_01= "1";
	public static final String IS_FINISH_02= "2";
	//删除
	public static final String IS_DELETE_00 = "0";
	public static final String IS_DELETE_01 = "1";
	

	//登录跳转路径
	public static final String URL_LOACTION_RECP = "recp";
	public static final String URL_LOACTION_INTEGRATED = "integrated";
	public static final String URL_LOACTION_NEWS = "news";
	public static final String URL_LOACTION_SUPERVISE = "supervise";
	
	
	//督办事件类型
	public static final String EVENT_SUPERVISE_TYPE_0 = "EVENT_SUPERVISE_TYPE_0";
	public static final String EVENT_SUPERVISE_TYPE_1 = "EVENT_SUPERVISE_TYPE_1";
	public static final String[] EVENT_SUPERVISE = new String[]{EVENT_SUPERVISE_TYPE_0, EVENT_SUPERVISE_TYPE_1};
	public static final String  CODE_EVENT_SUPERVISE= "CODE_EVENT_SUPERVISE";
	
	//操作结果
	public static final String OPATION_SUCCESS=  "OPATION_SUCCESS";
	public static final String OPATION_FAIL=  "OPATION_FAIL";
	
	//进度
	public static final String PROGRESS_SPEED_0=  "PROGRESS_SPEED_0";
	public static final String PROGRESS_SPEED_1=  "PROGRESS_SPEED_1";
	public static final String PROGRESS_SPEED_2=  "PROGRESS_SPEED_2";
	public static final String PROGRESS_SPEED_3=  "PROGRESS_SPEED_3";
	public static final String PROGRESS_SPEED_4=  "PROGRESS_SPEED_4";
	public static final String PROGRESS_SPEED_5=  "PROGRESS_SPEED_5";
	public static final String PROGRESS_SPEED_6=  "PROGRESS_SPEED_6";
	public static final String PROGRESS_SPEED_7=  "PROGRESS_SPEED_7";
	public static final String PROGRESS_SPEED_8=  "PROGRESS_SPEED_8";
	public static final String PROGRESS_SPEED_9=  "PROGRESS_SPEED_9";
	public static final String PROGRESS_SPEED_10=  "PROGRESS_SPEED_10";
	public static final String[] PROGRESS_SPEED = new String[]{PROGRESS_SPEED_1,PROGRESS_SPEED_3,PROGRESS_SPEED_5,PROGRESS_SPEED_7,PROGRESS_SPEED_9,PROGRESS_SPEED_10};
   
    // 办理情况
	/**
	 * 办理中
	 */
	public static final String HANDLE_STATIUS_01=  "HANDLE_STATIUS_01";
	/**
	 * 办理完成
	 */
	public static final String HANDLE_STATIUS_02=  "HANDLE_STATIUS_02";
	/**
	 * 办理情况
	 */
	public static final String[]  HANDLE_STATIUS=  new String[]{HANDLE_STATIUS_01, HANDLE_STATIUS_02};
	public static final String  CODE_HANDLE_STATIUS = "CODE_HANDLE_STATIUS";
	
	/**
	 * 急件
	 */
	public static final String HANDLE_LIMIT_01=  "HANDLE_LIMIT_01";
	/**
	 * 普件
	 */
	public static final String HANDLE_LIMIT_02=  "HANDLE_LIMIT_02";
	/**
	 * 延期
	 */
	public static final String HANDLE_LIMIT_03=  "HANDLE_LIMIT_03";
	/**
	 * 办理期限
	 */
	public static final String[] HANDLE_LIMIT=   new String[]{HANDLE_LIMIT_01, HANDLE_LIMIT_02, HANDLE_LIMIT_03};
	public static final String  CODE_HANDLE_LIMIT = "CODE_HANDLE_LIMIT";
	
	/**
	 * 内部文上报文头
	 */
	public static final String REPORT_MATERIAL_TYPE_01 = "REPORT_MATERIAL_TYPE_01";
	/**
	 * 兰公督字文头
	 */
	public static final String REPORT_MATERIAL_TYPE_02 = "REPORT_MATERIAL_TYPE_02";
	/**
	 * 专报文头
	 */
	public static final String REPORT_MATERIAL_TYPE_03 = "REPORT_MATERIAL_TYPE_03";
	/**
	 * 汇报材料类型
	 */
	public static final String[] REPORT_MATERIAL_TYPE = new String[]{REPORT_MATERIAL_TYPE_01, REPORT_MATERIAL_TYPE_02, REPORT_MATERIAL_TYPE_03};
	public static final String CODE_REPORT_MATERIAL_TYPE = "CODE_REPORT_MATERIAL_TYPE";
	
	/**
	 * 省市领导批示
	 */
	public static final String  LEADER_APPROVAL_TYPE_01 = "LEADER_APPROVAL_TYPE_01";
	/**
	 * 肖局长批示
	 */
	public static final String  LEADER_APPROVAL_TYPE_02 = "LEADER_APPROVAL_TYPE_02";
	/**
	 * 领导批示类型
	 */
	public static final String[]  LEADER_APPROVAL_TYPE = new String[]{LEADER_APPROVAL_TYPE_01, LEADER_APPROVAL_TYPE_02};
	public static final String  CODE_LEADER_APPROVAL_TYPE = "CODE_LEADER_APPROVAL_TYPE";
	
	
	public static final String  REC_ORGANIZS_01 = "REC_ORGANIZS_01";
	public static final String  REC_ORGANIZS_02 = "REC_ORGANIZS_02";
	public static final String  REC_ORGANIZS_03 = "REC_ORGANIZS_03";
	public static final String  REC_ORGANIZS_04 = "REC_ORGANIZS_04";
	public static final String  REC_ORGANIZS_05 = "REC_ORGANIZS_05";
	public static final String  REC_ORGANIZS_06 = "REC_ORGANIZS_06";
	public static final String  REC_ORGANIZS_07 = "REC_ORGANIZS_07";
	public static final String  REC_ORGANIZS_08 = "REC_ORGANIZS_08";
	public static final String  REC_ORGANIZS_09 = "REC_ORGANIZS_09";
	public static final String  REC_ORGANIZS_10 = "REC_ORGANIZS_10";
	public static final String  REC_ORGANIZS_11 = "REC_ORGANIZS_11";
	public static final String  REC_ORGANIZS_12 = "REC_ORGANIZS_12";
	public static final String  REC_ORGANIZS_13 = "REC_ORGANIZS_13";
	public static final String  REC_ORGANIZS_14 = "REC_ORGANIZS_14";
	public static final String  REC_ORGANIZS_15 = "REC_ORGANIZS_15";
	public static final String  REC_ORGANIZS_16 = "REC_ORGANIZS_16";
	public static final String  REC_ORGANIZS_17 = "REC_ORGANIZS_17";
	public static final String  REC_ORGANIZS_18 = "REC_ORGANIZS_18";
	public static final String  REC_ORGANIZS_19 = "REC_ORGANIZS_19";
	public static final String  REC_ORGANIZS_20 = "REC_ORGANIZS_20";
	public static final String  REC_ORGANIZS_21 = "REC_ORGANIZS_21";
	public static final String  REC_ORGANIZS_22 = "REC_ORGANIZS_22";
	public static final String  REC_ORGANIZS_23 = "REC_ORGANIZS_23";
	public static final String  REC_ORGANIZS_24 = "REC_ORGANIZS_24";
	
	public static final String[]  REC_ORGANIZS = new String[]{REC_ORGANIZS_01,REC_ORGANIZS_02,REC_ORGANIZS_03,REC_ORGANIZS_04,REC_ORGANIZS_05,
			REC_ORGANIZS_06,REC_ORGANIZS_07,REC_ORGANIZS_08,REC_ORGANIZS_09,REC_ORGANIZS_10,REC_ORGANIZS_11,REC_ORGANIZS_12,REC_ORGANIZS_13,
			REC_ORGANIZS_14,REC_ORGANIZS_15,REC_ORGANIZS_16,REC_ORGANIZS_17,REC_ORGANIZS_18,REC_ORGANIZS_19,REC_ORGANIZS_20,REC_ORGANIZS_21,
			REC_ORGANIZS_22,REC_ORGANIZS_23,REC_ORGANIZS_24};
	public static final String  CODE_REC_ORGANIZS="CODE_REC_ORGANIZS";
	
	/**
	 * 单位类型
	 */
	/**
	 * 市局机关
	 */
	public static final String ORGANIZ_TYPE_01 = "ORGANIZ_TYPE_01";
	/**
	 * 分县局
	 */
	public static final String ORGANIZ_TYPE_02 = "ORGANIZ_TYPE_02";
	/**
	 * 直属分局
	 */
	public static final String ORGANIZ_TYPE_03 = "ORGANIZ_TYPE_03";
	public static final String[] ORGANIZ_TYPE = new String[]{ORGANIZ_TYPE_01,ORGANIZ_TYPE_02,ORGANIZ_TYPE_03};
	public static final String CODE_ORGANIZ_TYPE = "CODE_ORGANIZ_TYPE";
}
