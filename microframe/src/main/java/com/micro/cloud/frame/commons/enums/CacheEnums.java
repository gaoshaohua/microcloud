package com.micro.cloud.frame.commons.enums;

import com.micro.cloud.frame.kit.StringKit;

/**
 * 缓存枚举
 * 
 * @Description
 * @author gsh
 * @date 2018年6月8日 下午4:42:25
 */
public enum CacheEnums {

	/**
	 * 默认缓存，一个小时
	 */
	defaultCache("defaultCache", 3600L),
	/**
	 * 缓存30分钟
	 */
	halfHour("halfHour", 1800L),
	/**
	 * 缓存一个小时
	 */
	hour("hour", 3600L),
	/**
	 * 缓存六个小时
	 */
	sixHour("sixHour", 10800L),
	/**
	 * 缓存三个小时
	 */
	threeHour("threeHour", 21600L),
	/**
	 * 缓存三个小时
	 */
	oneMonth("oneMonth", 2592000L),
	/**
	 * 缓存十二个小时
	 */
	halfDay("halfDay", 43200L),
	/**
	 * 缓存一天
	 */
	oneDay("oneDay", 86400L),
	/**
	 * 缓存一年
	 */
	oneYear("oneYear", 31536000L),
	/**
	 * 用户信息缓存，30分钟
	 */
	userinfoCache("userinfoCache", 1800L),
	/**
	 * 权限信息缓存，30分钟
	 */
	permissionCache("permissionCache", 1800L),
	/**
	 * session信息缓存，30分钟
	 */
	activeSessionCache("activeSessionCache", 1800L),
	/**
	 * 系统字典信息缓存，一天
	 */
	sysDictCache("sysDictCache", 86400L),
	/**
	 * 系统默认缓存，半天
	 */
	sysCache("jsmileSysCache", 43200L);

	/**
	 * 缓存过期时间
	 */
	private Long expires;
	/**
	 * 缓存名称
	 */
	private String cacheName;

	CacheEnums(String cacheName, Long expires) {
		this.expires = expires;
		this.cacheName = cacheName;
	}

	public String getCacheName() {
		return cacheName;
	}

	public void setCacheName(String cacheName) {
		this.cacheName = cacheName;
	}

	public Long getExpires() {
		return expires;
	}

	public void setExpires(Long expires) {
		this.expires = expires;
	}

	/**
	 * 根据cacheName获取 缓存时间
	 */
	public static Long valOf(String cacheName) {
		Long expires = -1L;
		if (StringKit.notBlank(cacheName)) {
			for (CacheEnums rt : CacheEnums.values()) {
				if (rt.getCacheName().equals(cacheName)) {
					expires = rt.getExpires();
					break;
				}
			}
		}
		return expires;
	}

}
