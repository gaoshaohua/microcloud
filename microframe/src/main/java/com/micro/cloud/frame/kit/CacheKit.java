package com.micro.cloud.frame.kit;

import org.springframework.cache.Cache;
import org.springframework.cache.Cache.ValueWrapper;
import org.springframework.cache.CacheManager;

import com.micro.cloud.frame.commons.enums.CacheEnums;

/**
 * spring缓存工具类
 * 
 * @Description
 * @author gsh
 * @date 2018年6月25日 下午4:23:58
 */
public class CacheKit {

	private static CacheManager cacheManager = SpringKit
			.getBean(CacheManager.class);

	/**
	 * 获取SYS_CACHE缓存
	 */
	public static Object getSysCache(String key) {
		return get(CacheEnums.sysCache, key);
	}

	/**
	 * 写入SYS_CACHE缓存，默认保存半天
	 */
	public static void putSysCache(String key, Object value) {
		put(CacheEnums.sysCache, key, value);
	}

	/**
	 * 从SYS_CACHE缓存中移除
	 */
	public static void removeSysCache(String key) {
		remove(CacheEnums.sysCache, key);
	}

	/**
	 * 从默认缓存中移除
	 */
	public static void remove(String key) {
		remove(CacheEnums.defaultCache, key);
	}

	/**
	 * 获取默认缓存 默认保存一个小时
	 */
	public static Object get(String key) {
		return get(CacheEnums.defaultCache, key);
	}

	/**
	 * 写入默认缓存 默认缓存保存一小时
	 */
	public static void put(String key, Object value) {
		put(CacheEnums.defaultCache, key, value);
	}

	/**
	 * 获取缓存
	 *
	 * @param cacheName
	 * @param key
	 * @return
	 */
	public static Object get(CacheEnums cache, String key) {
		ValueWrapper value = getCache(cache).get(key);
		return value == null ? null : value.get();
	}

	/**
	 * 写入缓存
	 *
	 * @param cacheName
	 * @param key
	 * @param value
	 */
	public static void put(CacheEnums cache, String key, Object value) {
		getCache(cache).put(key, value);
	}

	/**
	 * 从缓存中清除
	 */
	public static void clear(CacheEnums cache) {
		getCache(cache).clear();
	}

	/**
	 * 从缓存中移除
	 */
	public static void remove(CacheEnums cache, String key) {
		getCache(cache).evict(key);
	}

	/**
	 * 获得一个Cache
	 */
	private static Cache getCache(CacheEnums cache) {
		return cacheManager.getCache(cache.getCacheName());
	}
}
