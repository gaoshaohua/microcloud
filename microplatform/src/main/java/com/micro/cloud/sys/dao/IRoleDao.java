package com.micro.cloud.sys.dao;

import java.io.Serializable;
import java.util.List;

import com.micro.cloud.frame.commons.base.dao.IBaseDao;
import com.micro.cloud.frame.sys.entity.Role;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public interface IRoleDao extends IBaseDao<Role> {

	/**
	 * 根据用户ID查询角色
	 * 
	 * @Description
	 * @author gsh
	 * @param id
	 * @return
	 */
	List<Role> findByUserId(Serializable id);
}
