package com.micro.cloud.sys.service;

import com.micro.cloud.frame.commons.base.service.IBaseService;
import com.micro.cloud.sys.entity.User;
import com.micro.cloud.sys.vo.UserVo;

/**
 * 
 * @Description 用户登录接口
 * @author gsh
 * @date 2017年10月14日 下午1:20:13
 */
public interface IUserService extends IBaseService<User> {

	/**
	 * 
	 * @Description 根据账号查询用户
	 * @author gsh
	 * @param account
	 * @return
	 * @throws Exception
	 */
	UserVo findByAccount(String account) throws Exception;

}
