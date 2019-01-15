//package com.micro.cloud.commons.web.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.alibaba.fastjson.JSON;
//import com.micro.cloud.frame.commons.enums.ExceptionEnums;
//import com.micro.cloud.frame.commons.result.BaseResult;
//import com.micro.cloud.frame.commons.result.ResultUtils;
//import com.micro.cloud.sys.vo.ActiveUser;
//
///**
// * 
// * @Description 拦截器-登录
// * @author gsh
// * @date 2017年12月5日 上午10:14:15
// */
//public class LoginInterceptor implements HandlerInterceptor {
//
//	Logger logger = LogManager.getLogger(LoginInterceptor.class);
//
//	/**
//	 * @Description 在执行handler之前执行的 ，用于用户认证校验、用户权限校验
//	 * @author gsh
//	 * @param request
//	 * @param response
//	 * @param handler
//	 * @return 如果返回false表示拦截器不继续执行handler，如果返回true表示放行
//	 * @throws Exception
//	 */
//	@Override
//	public boolean preHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler) throws Exception {
//		logger.debug("preHandle...");
//		String url = request.getRequestURI();
//		logger.debug("preHandle..." + url);
//		/**
//		 * step2:判断用户身份在Session中是否存在
//		 */
//		HttpSession session = request.getSession();
//		ActiveUser activeUser = (ActiveUser) session.getAttribute("activeUser");
//		if (activeUser == null) {
//			BaseResult result = ResultUtils.fail();
//			result.setCode(ExceptionEnums.USER_NOT_LOGIN.getResCode());
//			result.setMsg(ExceptionEnums.USER_NOT_LOGIN.getResMsg());
//			response.setContentType("application/json");
//			response.setCharacterEncoding("utf-8");
//			response.getWriter().write(JSON.toJSONString(result));
//			return false;
//		}
//
//		return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		logger.debug("postHandle...");
//
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request,
//			HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		logger.debug("afterCompletion...");
//
//	}
//
//}
