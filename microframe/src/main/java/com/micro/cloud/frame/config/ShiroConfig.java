package com.micro.cloud.frame.config;

import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.config.MethodInvokingFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;

import com.micro.cloud.frame.commons.security.shiro.HttpSessionManager;
import com.micro.cloud.frame.commons.security.shiro.RetryLimitCredentialsMatcher;
import com.micro.cloud.frame.commons.security.shiro.cache.ShiroSpringCacheManager;
import com.micro.cloud.frame.kit.Constant;

/**
 * shiro配置
 * 
 * @Description
 * @author gsh
 * @date 2018年5月29日 上午9:38:03
 */
public class ShiroConfig {

	/**
	 * 使用当前spring容器配置的缓存作为shiro的cacheManager实现
	 * 如果spring容器的缓存是redis，则shiro同样使用redis作为缓存
	 * 
	 * @Description
	 * @author gsh
	 * @param cacheManager
	 * @return
	 */
	@Bean(name = "shiroSpringCacheManager")
	public CacheManager shiroSpringCacheManager(
			org.springframework.cache.CacheManager cacheManager) {
		ShiroSpringCacheManager shiroSpringCacheManager = new ShiroSpringCacheManager();
		shiroSpringCacheManager.setCacheManager(cacheManager);
		return shiroSpringCacheManager;
	}

	/**
	 * session管理器
	 */
	@Bean(name = "sessionManager")
	public SessionManager sessionManager(SessionDAO sessionDao,
			SimpleCookie sessionIdCookie) {
		HttpSessionManager sessionManager = new HttpSessionManager();
		sessionManager.setGlobalSessionTimeout(30 * 60 * 1000);
		sessionManager.setSessionIdUrlRewritingEnabled(false);
		sessionManager.setDeleteInvalidSessions(true);
		sessionManager.setSessionIdCookieEnabled(true);
		sessionManager.setSessionValidationSchedulerEnabled(true);
		sessionManager.setSessionIdCookie(sessionIdCookie);
		sessionManager.setSessionDAO(sessionDao);
		return sessionManager;
	}

	/**
	 * 使用当前spring容器配置的缓存作为sessionDAO的缓存配置
	 * 
	 * @Description
	 * @author gsh
	 * @param shiroSpringCacheManager
	 * @return
	 */
	@Bean(name = "sessionDAO")
	public SessionDAO sessionDAO(CacheManager shiroSpringCacheManager) {
		EnterpriseCacheSessionDAO sessionDAO = new EnterpriseCacheSessionDAO();
		sessionDAO.setActiveSessionsCacheName("activeSessionCache");
		sessionDAO.setCacheManager(shiroSpringCacheManager);
		return sessionDAO;
	}

	/**
	 * rememberMe管理器
	 * 
	 * @Description
	 * @author gsh
	 * @param rememberMeCookie
	 * @return
	 */
	@Bean(name = "rememberMeManager")
	public CookieRememberMeManager rememberMeManager(
			SimpleCookie rememberMeCookie) {
		CookieRememberMeManager manager = new CookieRememberMeManager();
		manager.setCipherKey(Base64.decode("Z3VucwACAOVAKALACAADSA=="));
		manager.setCookie(rememberMeCookie);
		return manager;
	}

	/**
	 * 记住密码Cookie
	 */
	@Bean(name = "rememberMeCookie")
	public SimpleCookie rememberMeCookie() {
		SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
		simpleCookie.setHttpOnly(true);
		simpleCookie.setPath("/");
		simpleCookie.setMaxAge(7 * 24 * 60 * 60);// 7天
		return simpleCookie;
	}

	/**
	 * 错误5次锁定
	 */
	@Bean(name = "credentialsMatcher")
	public CredentialsMatcher credentialsMatcher(
			org.apache.shiro.cache.CacheManager cacheManager) {
		RetryLimitCredentialsMatcher hashedCredentialsMatcher = new RetryLimitCredentialsMatcher(
				cacheManager);
		hashedCredentialsMatcher.setHashIterations(2);
		hashedCredentialsMatcher.setHashAlgorithmName("md5");
		return hashedCredentialsMatcher;
	}

	@Bean(name = "sessionIdCookie")
	public SimpleCookie sessionIdCookie() {
		SimpleCookie sessionIdCookie = new SimpleCookie(Constant.TOKEN_KEY);
		sessionIdCookie.setHttpOnly(true);
		sessionIdCookie.setMaxAge(-1);// 关闭浏览器
		sessionIdCookie.setPath("/");
		return sessionIdCookie;
	}

	/**
	 * @Description 在方法中 注入 securityManager,进行代理控制
	 * @author gsh
	 * @param securityManager
	 * @return
	 */
	@Bean
	public MethodInvokingFactoryBean methodInvokingFactoryBean(
			org.apache.shiro.mgt.SecurityManager securityManager) {
		MethodInvokingFactoryBean bean = new MethodInvokingFactoryBean();
		bean.setStaticMethod(
				"org.apache.shiro.SecurityUtils.setSecurityManager");
		bean.setArguments(new Object[] { securityManager });
		return bean;
	}

	/**
	 * 
	 * @Description 保证实现了Shiro内部lifecycle函数的bean执行
	 * @author gsh
	 * @return
	 */
	@Bean(name = "lifecycleBeanPostProcessor")
	public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
		return new LifecycleBeanPostProcessor();
	}

	/**
	 * 
	 * @Description 启用shrio授权注解拦截方式，AOP式方法级权限检查
	 * @author gsh
	 * @return
	 */
	@Bean
	@DependsOn(value = "lifecycleBeanPostProcessor") // 依赖其他bean的初始化
	public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
		DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
		defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
		return defaultAdvisorAutoProxyCreator;
	}

	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
			org.apache.shiro.mgt.SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}
}
