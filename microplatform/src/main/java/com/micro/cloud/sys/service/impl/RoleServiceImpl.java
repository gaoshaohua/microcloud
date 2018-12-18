package com.micro.cloud.sys.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.micro.cloud.frame.commons.base.service.impl.BaseServiceImpl;
import com.micro.cloud.frame.commons.enums.ExceptionEnums;
import com.micro.cloud.frame.commons.exception.ExceptionParam;
import com.micro.cloud.sys.dao.IRoleDao;
import com.micro.cloud.frame.sys.entity.Role;
import com.micro.cloud.sys.service.IRoleService;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role>
		implements IRoleService {

	@Autowired
	private IRoleDao roleDao;

	@Override
	public List<Role> findByUserId(Serializable userId) throws Exception {
		if (userId == null) {
			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "userId",
					userId);
		}
		return roleDao.findByUserId(userId);
	}

}
