package com.micro.cloud.sys.service;

import java.io.Serializable;
import java.util.List;

import com.micro.cloud.frame.commons.base.service.IBaseService;
import com.micro.cloud.sys.entity.Role;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2017年12月04日 04:16:04
 */
public interface IRoleService extends IBaseService<Role> {

	/**
	 * 根据用户ID查询角色列表
	 * 
	 * @Description
	 * @author gsh
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<Role> findByUserId(Serializable userId) throws Exception;
}
