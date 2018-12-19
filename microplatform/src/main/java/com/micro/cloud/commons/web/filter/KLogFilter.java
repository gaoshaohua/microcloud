package com.micro.cloud.commons.web.filter;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.shiro.web.servlet.AdviceFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.NamedThreadLocal;

import com.alibaba.fastjson.JSON;
import com.micro.cloud.frame.kit.DateKit;
import com.micro.cloud.frame.kit.web.UserAgentKit;
import com.micro.cloud.frame.kit.web.WebKit;
import com.micro.cloud.kit.web.ShiroKit;
import com.micro.cloud.sys.vo.ActiveUser;
import com.micro.cloud.sys.vo.LogVo;

/**
 * 系统日志拦截器
 * 
 * @author 龚亮
 * @version 1.0 PathMatchingFilter主要是对AdviceFilter preHandle做进一步细化控制
 */
public class KLogFilter extends AdviceFilter {

	protected static final Logger logger = LoggerFactory
			.getLogger(KLogFilter.class);

	private static final ThreadLocal<Long> startTimeThreadLocal = new NamedThreadLocal<Long>(
			"ThreadLocal StartTime");

	/**
	 * 在执行action里面的处理逻辑之前执行
	 */
	@Override
	protected boolean preHandle(ServletRequest requestParm,
			ServletResponse response) throws Exception {
		// HttpServletRequest request = (HttpServletRequest)requestParm;
		long beginTime = System.currentTimeMillis();// 1、开始时间
		startTimeThreadLocal.set(beginTime); // 线程绑定变量（该数据只有当前请求的线程可见）
		return true;
	}

	/**
	 * 在执行action里面的逻辑后返回视图之前执行
	 */
	@Override
	protected void postHandle(ServletRequest request, ServletResponse response)
			throws Exception {

	}

	/**
	 * 在action返回视图后执行
	 */
	@Override
	public void afterCompletion(ServletRequest requestParm,
			ServletResponse response, Exception exception) throws Exception {
		long beginTime = startTimeThreadLocal.get();
		long endTime = System.currentTimeMillis();
		saveLog((HttpServletRequest) requestParm, ShiroKit.getLoginUser(),
				exception, DateKit.formatDateTime(endTime - beginTime));
	}

	public void saveLog(HttpServletRequest request, ActiveUser user,
			Exception exception, String timeConsuming) {
		LogVo log = new LogVo();
		log.setIp(WebKit.getIpAddr(request));
		log.setCreateDate(new java.util.Date());
		if (user != null) {
			log.setCreator(user.getUser().getId());
		}
		log.setTimeConsuming(timeConsuming);
		log.setUserAgent(UserAgentKit.getUserAgent(request).toString());
		log.setReqUrl(request.getRequestURI());
		Map<String, Object> reqParams = WebKit.getParams(request);
		if (reqParams.containsKey("password")) {
			reqParams.put("password", "******");
		}
		if (reqParams.containsKey("newPassword")) {
			reqParams.put("newPassword", "******");
		}
		log.setReqParam(JSON.toJSONString(reqParams));
		log.setReqMethod(request.getMethod());
		if (exception != null) {
			log.setException(ExceptionUtils.getStackTrace(exception));
			log.setReqOk(false);
		} else {
			log.setReqOk(true);
		}
		logger.debug("日志记录:" + JSON.toJSONString(log));
		// TaskLog.getSingleton().add(log);
	}
}
