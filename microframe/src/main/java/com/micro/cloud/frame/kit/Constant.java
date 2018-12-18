package com.micro.cloud.frame.kit;

/**
 * 系统常量
 * 
 * @Description
 * @author gsh
 * @date 2018年6月8日 下午4:40:33
 */
public class Constant {

	/**
	 * 强制退出
	 */
	public static final String SESSION_FORCE_LOGOUT_KEY = "session.force.logout";
	/**
	 * token
	 */
	public static final String TOKEN_KEY = "x-auth-token";

	/**
	 * 任务调度常量
	 */
	public static final String SCHEDULE_JOB = "jsmileScheduleJob";
	public static final String JOB_DATA_MAP = "jsmile_job_data_map";

	/**
	 * 任务暂停
	 */
	public static final String STATUS_STOP = "0";
	/**
	 * 任务正常
	 */
	public static final String STATUS_NORMAL = "1";

	/**
	 * 有状态任务
	 */
	public static final String CONCURRENT_IS = "1";
	/**
	 * 无状态任务
	 */
	public static final String CONCURRENT_NOT = "0";

	/**
	 * 系统菜单类型
	 */
	public static final String menu = "1";
	public static final String permission = "2";
	public static final String all = "-1";

	/**
	 * 数据字典缓存常量
	 */
	public static final String SYS_DICT_CACHE = "sys_dict_data";
}
