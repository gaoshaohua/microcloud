package com.micro.cloud.frame.commons.security.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.micro.cloud.frame.kit.Constant;

/**
 * 会话退出监听
 */
public class ForceLogoutFilter extends AccessControlFilter {
	/**
	 * true 同意访问 false拒绝
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		Session session = getSubject(request, response).getSession(false);
		if (session == null) {
			return true;
		}
		return session.getAttribute(Constant.SESSION_FORCE_LOGOUT_KEY) == null;
	}

	/**
	 * 访问拒绝时
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		try {
			getSubject(request, response).logout();// 强制退出
		} catch (Exception e) {
			e.printStackTrace();
		}
		String loginUrl = getLoginUrl()
				+ (getLoginUrl().contains("?") ? "&" : "?") + "forceLogout=1";
		WebUtils.issueRedirect(request, response, loginUrl);
		return false;
	}
}
