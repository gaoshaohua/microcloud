package com.micro.cloud.frame.kit.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.micro.cloud.frame.kit.StringKit;

public class WebKit {

	/**
	 * 
	 * @Description 获取http param
	 * @author 龚亮
	 * @param request
	 * @return param对应map
	 */
	public static Map<String, Object> getParams(HttpServletRequest request) {
		Map<String, Object> map = Maps.newHashMap();
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			String value = request.getParameter(name);
			map.put(name, StringKit.isBlank(value) ? null : value.trim());
		}
		return map;
	}

	/**
	 * 
	 * @Description 获取http body
	 * @author 龚亮
	 * @param request
	 * @return body对应map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getBodys(HttpServletRequest request) {
		InputStreamReader inputReader = null;
		StringBuilder sb = new StringBuilder();
		try {
			inputReader = new InputStreamReader(request.getInputStream(),
					"UTF-8");
			BufferedReader bufferReader = new BufferedReader(inputReader);
			String line = null;
			while ((line = bufferReader.readLine()) != null) {
				sb.append(line);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return JSON.parseObject(sb.toString(), Map.class);
	}

	/**
	 * 
	 * @Description 获取http headers
	 * @author 龚亮
	 * @param request
	 * @return headers对应map
	 */
	public static Map<String, Object> getheaders(HttpServletRequest request) {
		Map<String, Object> map = Maps.newHashMap();
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String key = headerNames.nextElement();
			String value = request.getHeader(key);
			map.put(key, value);
		}
		return map;
	}

	/**
	 * @Description 判断请求是否是ajax请求
	 * @author 龚亮
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String requestType = request.getHeader("X-Requested-With");
		if (requestType == null || "".equals(requestType.trim())) {
			return false;
		} else {
			return requestType.equals("XMLHttpRequest");
		}

	}

	/**
	 * 获取项目名
	 */
	public static String getRootPath() {
		String str = System.getProperty("user.dir");
		return "/" + str.substring(str.lastIndexOf("\\") + 1);
	}

	/**
	 * 获取客户端IP
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")
					|| ipAddress.equals("0:0:0:0:0:0:0:1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}
		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		return ipAddress;
	}

	/**
	 * 获取HttpSession
	 * 
	 * @return
	 */
	public static final HttpSession getSession() {
		return ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest().getSession();
	}

	/**
	 * 获取HttpServletRequest
	 * 
	 * @return
	 */
	public static final HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
	}

	/**
	 * 获取HttpServletResponse
	 * 
	 * @return
	 */
	public static final HttpServletResponse getResponse() {
		return ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getResponse();
	}
}
