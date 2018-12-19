package com.micro.cloud.sys.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.micro.cloud.frame.commons.base.service.impl.BaseServiceImpl;
import com.micro.cloud.frame.commons.enums.ExceptionEnums;
import com.micro.cloud.frame.commons.exception.ExceptionParam;
import com.micro.cloud.frame.kit.StringKit;
import com.micro.cloud.sys.dao.IUserDao;
import com.micro.cloud.sys.entity.User;
import com.micro.cloud.sys.service.IUserService;
import com.micro.cloud.sys.vo.UserVo;

@Service
public class UserServiceImpl extends BaseServiceImpl<User>
		implements IUserService {

	@Autowired
	IUserDao userDao;

	@Override
	public UserVo findByAccount(String account) throws Exception {
		// 参数校验
		if (StringUtils.isEmpty(account)) {
			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL,
					account.toString(), account);
		}
		// 查询用户
		User entity = new User();
		entity.setUsername(account);
		return userDao.findOneVo(entity);
	}

	@Override
	public List<User> findAll(User entity) {
		if (StringKit.isEmpty(entity.getUsername())) {
			entity.setUsername(null);
		}
		if (StringKit.isEmpty(entity.getName())) {
			entity.setName(null);
		}
		if (StringKit.isEmpty(entity.getNickname())) {
			entity.setNickname(null);
		}
		if (StringKit.isEmpty(entity.getPhone())) {
			entity.setPhone(null);
		}
		return super.findAll(entity);
	}
}
