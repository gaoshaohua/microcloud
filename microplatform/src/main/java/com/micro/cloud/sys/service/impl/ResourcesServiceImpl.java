package com.micro.cloud.sys.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.micro.cloud.frame.commons.base.service.impl.BaseServiceImpl;
import com.micro.cloud.frame.commons.enums.ExceptionEnums;
import com.micro.cloud.frame.commons.exception.ExceptionParam;
import com.micro.cloud.sys.dao.IResourcesDao;
import com.micro.cloud.frame.sys.entity.Resources;
import com.micro.cloud.sys.service.IResourcesService;

@Service
public class ResourcesServiceImpl extends BaseServiceImpl<Resources>
		implements IResourcesService {

	@Autowired
	private IResourcesDao resourcesDao;

	@Override
	public List<Resources> findByUserId(Serializable userId) throws Exception {
		if (userId == null) {
			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "userId",
					userId);
		}
		return resourcesDao.findByUserId(userId);
	}

}
