//package com.micro.cloud.kit.web;
//
//import java.util.Collection;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.session.Session;
//import org.apache.shiro.session.mgt.eis.SessionDAO;
//import org.apache.shiro.subject.PrincipalCollection;
//import org.apache.shiro.subject.support.DefaultSubjectContext;
//
//import com.google.common.collect.Lists;
//import com.google.common.collect.Maps;
//import com.micro.cloud.frame.kit.Constant;
//import com.micro.cloud.frame.kit.SpringKit;
//import com.micro.cloud.sys.vo.ActiveUser;
//
//public class ShiroKit {
//
//	private static SessionDAO sessionDAO = SpringKit.getBean(SessionDAO.class);
//
//	/**
//	 * 获取在线用户列表
//	 */
//	public static List<Map<String, Object>> getOnlineUser() {
//		Collection<Session> sessions = sessionDAO.getActiveSessions();
//		List<Map<String, Object>> list = Lists.newArrayList();
//		Iterator<Session> i = sessions.iterator();
//		while (i.hasNext()) {
//			Session session = i.next();
//			Map<String, Object> m = Maps.newHashMap();
//			m.put("sessionid", session.getId().toString());
//			PrincipalCollection principalCollection = (PrincipalCollection) session
//					.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
//			if (principalCollection != null) {
//				m.put("username",
//						((ActiveUser) principalCollection.getPrimaryPrincipal())
//								.getUser().getUsername());
//			}
//			m.put("lastAccessTime", session.getLastAccessTime());
//			m.put("startTime", session.getStartTimestamp());
//			m.put("host", session.getHost());
//			list.add(m);
//		}
//		return list;
//	}
//
//	/**
//	 * 获取当前登录用户
//	 */
//	public static ActiveUser getLoginUser() {
//		Object obj = SecurityUtils.getSubject().getPrincipal();
//		return (ActiveUser) obj;
//	}
//
//	/**
//	 * 获取session 账号
//	 */
//	public static ActiveUser getLoginUser(Session session) {
//		PrincipalCollection principalCollection = (PrincipalCollection) session
//				.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
//		if (principalCollection == null)
//			return null;
//		else
//			return (ActiveUser) principalCollection.getPrimaryPrincipal();
//	}
//
//	/**
//	 * 判断是否强制退出
//	 */
//	public static boolean isForceLogout(Session session) {
//		return session.getAttribute(Constant.SESSION_FORCE_LOGOUT_KEY) != null;
//	}
//
//	/**
//	 * 获取session
//	 */
//	public static Session getSession() {
//		return SecurityUtils.getSubject().getSession();
//	}
//
//	public static void setSessionAttribute(Object key, Object value) {
//		getSession().setAttribute(key, value);
//	}
//
//	public static Object getSessionAttribute(Object key) {
//		return getSession().getAttribute(key);
//	}
//
//	/**
//	 * 判断是否登录
//	 */
//	public static boolean isLogin() {
//		return SecurityUtils.getSubject().getPrincipal() != null;
//	}
//
//	/**
//	 * 退出
//	 */
//	public static void logout() {
//		SecurityUtils.getSubject().logout();
//	}
//}
