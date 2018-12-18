package com.micro.cloud.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.micro.cloud.frame.commons.base.controller.BaseController;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;
import com.micro.cloud.frame.kit.Constant;
import com.micro.cloud.frame.sys.entity.Resources;
import com.micro.cloud.sys.service.IResourcesService;

/**
 * @desc 控制器
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
@RestController
@RequestMapping("/sys/resources")
public class ResourcesController extends BaseController {

	@Autowired
	private IResourcesService resourcesService;

	@GetMapping(value = "/findAllMenu")
	public BaseResult findAllMenu() throws Exception {
		BaseResult result = ResultUtils.success();
		Resources entity = new Resources();
		entity.setType(Constant.menu);
		result.getResData().put("resources", resourcesService.findAll(entity));
		return result;
	}
}
