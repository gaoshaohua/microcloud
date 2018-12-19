package com.micro.cloud.sys.dao;

import java.io.Serializable;
import java.util.List;

import com.micro.cloud.frame.commons.base.dao.IBaseDao;
import com.micro.cloud.sys.entity.Resources;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public interface IResourcesDao extends IBaseDao<Resources> {

	/**
	 * 根据用户ID查询资源列表
	 * 
	 * @Description
	 * @author gsh
	 * @param id
	 * @return
	 */
	List<Resources> findByUserId(Serializable userId);
}
