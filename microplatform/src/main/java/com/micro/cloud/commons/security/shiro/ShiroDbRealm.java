package com.micro.cloud.commons.security.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.micro.cloud.frame.kit.SpringKit;
import com.micro.cloud.frame.sys.vo.ActiveUser;
import com.micro.cloud.frame.sys.vo.UserVo;
import com.micro.cloud.sys.service.IResourcesService;
import com.micro.cloud.sys.service.IRoleService;
import com.micro.cloud.sys.service.IUserService;
import com.micro.cloud.sys.service.impl.ResourcesServiceImpl;
import com.micro.cloud.sys.service.impl.RoleServiceImpl;
import com.micro.cloud.sys.service.impl.UserServiceImpl;

/**
 * 自定义JDBC Realm实现
 * 
 * @Description
 * @author gsh
 * @date 2018年5月31日 下午3:43:46
 */
public class ShiroDbRealm extends AuthorizingRealm {

	/**
	 * shiro登录认证
	 * 
	 * @param authToken
	 * @return
	 * @throws AuthenticationException
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authToken) throws AuthenticationException {

		IUserService userService = SpringKit.getBean(UserServiceImpl.class);
		IRoleService roleService = SpringKit.getBean(RoleServiceImpl.class);
		IResourcesService resourcesService = SpringKit
				.getBean(ResourcesServiceImpl.class);
		// 用户名
		String username = (String) authToken.getPrincipal();
		UserVo user = null;
		try {
			user = userService.findByAccount(username);
			// 账号不存在
			if (user == null) {
				throw new UnknownAccountException("账号不存在");
			}
			// 帐号已被锁定
			if (user.getLocked()) {
				throw new DisabledAccountException("帐号已被禁用!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActiveUser activeUser = new ActiveUser(user);
		try {
			activeUser.setRoles(
					roleService.findByUserId(activeUser.getUser().getId()));
			activeUser.setPermissions(resourcesService
					.findByUserId(activeUser.getUser().getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SimpleAuthenticationInfo(activeUser,
				user.getPassword().toCharArray(), getName());
	}

	/**
	 * 
	 * shiro授权
	 * 
	 * @param principals
	 * @return
	 * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {

		ActiveUser activeUser = (ActiveUser) principals.getPrimaryPrincipal();

		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setRoles(activeUser.getStringRoles());
		info.setStringPermissions(activeUser.getStringPermissions());
		return info;
	}
}
