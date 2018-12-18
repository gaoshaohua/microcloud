package com.micro.cloud.config;

import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.mgt.RememberMeManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.common.collect.Maps;
import com.micro.cloud.commons.security.shiro.ShiroDbRealm;
import com.micro.cloud.commons.security.shiro.filter.UserAccessFilter;
import com.micro.cloud.frame.commons.security.shiro.filter.ForceLogoutFilter;

/**
 * shiro配置
 * 
 * @Description
 * @author gsh
 * @date 2018年5月29日 上午9:38:03
 */
@Configuration
public class ShiroConfig extends com.micro.cloud.frame.config.ShiroConfig {

	@Bean(name = "securityManager")
	public SecurityManager securityManager(ShiroDbRealm shiroDbRealm,
			CacheManager shiroSpringCacheManager, SessionManager sessionManager,
			RememberMeManager rememberMeManager) {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(shiroDbRealm);
		securityManager.setCacheManager(shiroSpringCacheManager);
		securityManager.setSessionManager(sessionManager);
		securityManager.setRememberMeManager(rememberMeManager);
		return securityManager;
	}

	/**
	 * Realm
	 * 
	 * @Description
	 * @author gsh
	 * @param shiroSpringCacheManager
	 * @param credentialsMatcher
	 * @return
	 */
	@Bean(name = "shiroDbRealm")
	public ShiroDbRealm shiroDbRealm(CacheManager shiroSpringCacheManager,
			CredentialsMatcher credentialsMatcher) {
		ShiroDbRealm shiroDbRealm = new ShiroDbRealm();
		shiroDbRealm.setCachingEnabled(true);
		shiroDbRealm.setCacheManager(shiroSpringCacheManager);
		shiroDbRealm.setCredentialsMatcher(credentialsMatcher);
		shiroDbRealm.setAuthenticationCachingEnabled(true);
		shiroDbRealm.setAuthorizationCachingEnabled(true);
		shiroDbRealm.setAuthenticationCacheName("userinfoCache");
		shiroDbRealm.setAuthorizationCacheName("permissionCache");
		return shiroDbRealm;
	}

	/**
	 * 内置过滤器有： 身份验证相关的：authc、authcBasic、logout、user、anon
	 * 授权相关的：roles、perms、port、rest、ssl
	 * 
	 * @Description Shiro的过滤器链，执行顺序： 自上而下，从左到右。
	 * @author gsh
	 * @param securityManager
	 * @return
	 */
	@Bean
	public ShiroFilterFactoryBean shiroFilter(
			org.apache.shiro.mgt.SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
		shiroFilter.setSecurityManager(securityManager);
		// 加入自定义的过滤器
		Map<String, Filter> filters = Maps.newHashMap();
		filters.put("forceLogout", new ForceLogoutFilter());
		LogoutFilter logout = new LogoutFilter();
		logout.setRedirectUrl("/");
		filters.put("logout", logout);
		filters.put("userAccess", new UserAccessFilter());
		shiroFilter.setFilters(filters);

		// 默认的登陆访问url
		shiroFilter.setLoginUrl("/login");
		// 登陆成功后跳转的url
		shiroFilter.setSuccessUrl("/index");
		// 没有权限跳转的url
		shiroFilter.setUnauthorizedUrl("/sys/unauth");

		// 配置shiro过滤器链
		Map<String, String> hashMap = Maps.newHashMap();
		hashMap.put("/css/**", "anon");
		hashMap.put("/error/**", "anon");
		hashMap.put("/image/**", "anon");
		hashMap.put("/js/**", "anon");
		hashMap.put("/plugins/**", "anon");
		hashMap.put("/view/**", "anon");
		hashMap.put("/sys/login", "anon");
		hashMap.put("/sys/logout", "logout");
		hashMap.put("/**", "user,perms,roles,forceLogout");
		shiroFilter.setFilterChainDefinitionMap(hashMap);
		return shiroFilter;
	}

}
