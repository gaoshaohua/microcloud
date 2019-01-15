package com.micro.cloud.sys.user.service.impl;

import org.springframework.stereotype.Service;
import com.micro.cloud.frame.commons.base.service.impl.BaseServiceImpl;
import com.micro.cloud.sys.user.dto.UserDto;
import com.micro.cloud.sys.user.entity.User;
import com.micro.cloud.sys.user.service.IUserService;

/**
 * service层实现
 * 
 * @Description
 * @author gsh
 * @date 2018年12月25日 11:29:14
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User,UserDto>
        implements IUserService {

}
