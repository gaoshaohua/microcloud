package com.micro.cloud.commons.web.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.micro.cloud.frame.commons.enums.ExceptionEnums;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;
import com.micro.cloud.frame.sys.vo.ActiveUser;
import com.micro.cloud.frame.sys.entity.Resources;

/**
 * 
 * @Description 拦截器-权限
 * @author gsh
 * @date 2017年12月5日 上午10:14:15
 */
public class PermissionInterceptor implements HandlerInterceptor {

	Logger logger = LogManager.getLogger(PermissionInterceptor.class);

	/**
	 * @Description 在执行handler之前执行的 ，用于用户认证校验、用户权限校验
	 * @author gsh
	 * @param request
	 * @param response
	 * @param handler
	 * @return 如果返回false表示拦截器不继续执行handler，如果返回true表示放行
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.debug("preHandle...");
		String url = request.getRequestURI();
		/**
		 * step2:判断用户身份在Session中是否存在
		 */
		HttpSession session = request.getSession();
		ActiveUser activeUser = (ActiveUser) session.getAttribute("activeUser");
		if (activeUser == null) {
			BaseResult result = ResultUtils.fail();
			result.setResCode(ExceptionEnums.USER_NOT_LOGIN.getResCode());
			result.setResMsg(ExceptionEnums.USER_NOT_LOGIN.getResMsg());
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(JSON.toJSONString(result));
			return false;
		}
		/**
		 * step3: 判断用户是否有访问该资源的权限
		 */
		List<Resources> permissions = activeUser.getPermissions();
		for (Resources permission : permissions) {
			String permission_url = permission.getUrl();
			if (url.indexOf(permission_url) > 0) {
				return true;
			}
		}
		/**
		 * step4: 执行到这里拦截，表示用户无权访问
		 */
		BaseResult result = ResultUtils.fail();
		result.setResCode(ExceptionEnums.NOT_PERMISSION.getResCode());
		result.setResMsg(ExceptionEnums.NOT_PERMISSION.getResMsg());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSON.toJSONString(result));

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("postHandle...");

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("afterCompletion...");

	}

}
