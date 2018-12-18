package com.micro.cloud.frame.commons.security.shiro;

import java.io.Serializable;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;

import com.micro.cloud.frame.kit.Constant;
import com.micro.cloud.frame.kit.StringKit;
import com.micro.cloud.frame.kit.web.UserAgentKit;

/**
 * shiro session管理器
 * 
 * @author 龚亮
 *
 */
public class HttpSessionManager extends DefaultWebSessionManager {

	@Override
	protected Serializable getSessionId(ServletRequest request,
			ServletResponse response) {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String tokenId = httpServletRequest.getHeader(Constant.TOKEN_KEY);
		if (UserAgentKit.isMobileOrTablet(httpServletRequest)) {
			setGlobalSessionTimeout(-1L);
		}
		if (StringKit.notBlank(tokenId)) {
			// 是否将sid保存到cookie，浏览器模式下使用此参数。
			if (WebUtils.isTrue(request, "__cookie")) {
				HttpServletRequest rq = (HttpServletRequest) request;
				HttpServletResponse rs = (HttpServletResponse) response;
				Cookie template = getSessionIdCookie();
				Cookie cookie = new SimpleCookie(template);
				cookie.setValue(tokenId);
				cookie.saveTo(rq, rs);
			}
			// 设置当前session状态
			request.setAttribute(
					ShiroHttpServletRequest.REFERENCED_SESSION_ID_SOURCE,
					ShiroHttpServletRequest.URL_SESSION_ID_SOURCE); // session来源与url
			request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID,
					tokenId);
			request.setAttribute(
					ShiroHttpServletRequest.REFERENCED_SESSION_ID_IS_VALID,
					Boolean.TRUE);
			return tokenId;
		}
		return super.getSessionId(request, response);
	}

}
