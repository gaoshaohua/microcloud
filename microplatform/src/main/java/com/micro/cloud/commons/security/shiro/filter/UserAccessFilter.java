package com.micro.cloud.commons.security.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;

import com.alibaba.fastjson.JSON;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;

/**
 * 用户访问过滤器
 * 
 * @Description
 * @author gsh
 * @date 2018年7月11日 下午3:34:26
 */
public class UserAccessFilter extends AccessControlFilter {

	Logger logger = LogManager.getLogger(getClass());

	/**
	 * true表示允许访问 false表示拒绝访问，进入onAccessDenied方法处理 Description
	 * 
	 * @param request
	 * @param response
	 * @param mappedValue
	 * @return
	 * @throws Exception
	 * @see org.apache.shiro.web.filter.AccessControlFilter#isAccessAllowed(javax.servlet.ServletRequest,
	 *      javax.servlet.ServletResponse, java.lang.Object)
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		logger.debug("进入用户认证过滤器......");
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		BaseResult result = ResultUtils.success();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSON.toJSONString(result));
		return false;
	}

}
