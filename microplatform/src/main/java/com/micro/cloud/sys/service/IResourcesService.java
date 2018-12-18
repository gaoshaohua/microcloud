package com.micro.cloud.sys.service;

import java.io.Serializable;
import java.util.List;

import com.micro.cloud.frame.commons.base.service.IBaseService;
import com.micro.cloud.frame.sys.entity.Resources;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2017年12月04日 04:16:04
 */
public interface IResourcesService extends IBaseService<Resources> {

	/**
	 * 根据用户ID查询资源列表
	 * 
	 * @Description
	 * @author gsh
	 * @param UserId
	 * @return
	 * @throws Exception
	 */
	public List<Resources> findByUserId(Serializable userId) throws Exception;
}