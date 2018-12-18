package com.micro.cloud.sys.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.micro.cloud.frame.commons.base.controller.BaseController;
import com.micro.cloud.frame.commons.enums.ExceptionEnums;
import com.micro.cloud.frame.commons.exception.ExceptionParam;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;
import com.micro.cloud.frame.sys.vo.LoginVo;
import com.micro.cloud.sys.service.IUserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/sys")
@Api("系统用户登录控制器")
@PropertySource(value = {
		"classpath:config/other.properties" }, encoding = "utf-8")
public class LoginController extends BaseController {

	Logger logger = LogManager.getLogger(getClass());

	@Autowired
	IUserService userService;

	@Value("${user.age}")
	private String age;
	@Value("${user.source}")
	private String source;

	@ApiOperation(value = "用户登录", notes = "账号密码登录")
	@ResponseBody
	@PostMapping(path = "/login")
	public BaseResult login(@RequestBody LoginVo vo, HttpSession session)
			throws Exception {
		logger.debug("this is debug log:" + source);
		logger.info("this is info log:" + age);
		logger.warn("this is warn log");
		logger.error("this is error log");
		logger.fatal("this is fatal log");
		if (StringUtils.isEmpty(vo.getUsername())) {
			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "username",
					vo.getUsername());
		}
		if (StringUtils.isEmpty(vo.getPassword())) {
			throw new ExceptionParam(ExceptionEnums.PARAM_NOT_NULL, "password",
					vo.getPassword());
		}

		Subject user = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(
				vo.getUsername(), vo.getPassword());
		user.login(token);
		user.checkRoles("admin");
		BaseResult result = ResultUtils.success();
		return result;
	}
}
