package com.micro.cloud.frame.sys.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.google.common.collect.Sets;
import com.micro.cloud.frame.kit.StringKit;
import com.micro.cloud.frame.sys.entity.Resources;
import com.micro.cloud.frame.sys.entity.Role;
import com.micro.cloud.frame.sys.entity.User;

/**
 * 
 * @Description 当前登录用户
 * @author gsh
 * @date 2017年12月4日 下午3:46:49
 */
public class ActiveUser implements Serializable {
	/** @Fields serialVersionUID: */
	private static final long serialVersionUID = 1L;
	// 用户
	private User user;
	// 角色
	private List<Role> roles = new ArrayList<Role>();
	// 菜单
	private List<Resources> menus = new ArrayList<Resources>();
	// 权限
	private List<Resources> permissions = new ArrayList<Resources>();

	public ActiveUser(User user) {
		super();
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Resources> getMenus() {
		return menus;
	}

	public void setMenus(List<Resources> menus) {
		this.menus = menus;
	}

	public List<Resources> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Resources> permissions) {
		this.permissions = permissions;
	}

	public Set<String> getStringRoles() {
		Set<String> sRoles = Sets.newHashSet();
		if (roles != null) {
			for (Role role : roles) {
				if (StringKit.notBlank(role.getRoleCode())) {
					sRoles.add(role.getRoleCode());
				}
			}
		}
		return sRoles;
	}

	public Set<String> getStringPermissions() {
		Set<String> sPermissions = Sets.newHashSet();
		if (permissions != null) {
			for (Resources r : permissions) {
				if (StringKit.notBlank(r.getPermCode())) {
					sPermissions.add(r.getPermCode());
				}
			}
		}
		return sPermissions;
	}
}
