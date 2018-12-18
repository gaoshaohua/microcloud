package com.micro.cloud.frame.commons.security.shiro.cache;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Destroyable;

/**
 * 使用spring-cache作为shiro缓存 缓存管理器
 */
public class ShiroSpringCacheManager implements CacheManager, Destroyable {
	private static final Log logger = LogFactory
			.getLog(ShiroSpringCacheManager.class);
	private org.springframework.cache.CacheManager cacheManager;

	public org.springframework.cache.CacheManager getCacheManager() {
		return cacheManager;
	}

	public void setCacheManager(
			org.springframework.cache.CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}

	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		if (logger.isTraceEnabled()) {
			logger.trace(
					"Acquiring ShiroSpringCache instance named [" + name + "]");
		}
		org.springframework.cache.Cache cache = cacheManager.getCache(name);
		return new ShiroSpringCache<K, V>(cache);
	}

	@Override
	public void destroy() throws Exception {
		cacheManager = null;
	}

}
