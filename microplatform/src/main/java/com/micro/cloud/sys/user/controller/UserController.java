package com.micro.cloud.sys.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.micro.cloud.frame.commons.base.controller.BaseController;
import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;
import com.micro.cloud.frame.kit.BeanMapperKit;
import com.micro.cloud.sys.user.dto.UserDto;
import com.micro.cloud.sys.user.entity.User;
import com.micro.cloud.sys.user.service.IUserService;
import com.micro.cloud.sys.user.vo.UserVo;

import io.swagger.annotations.Api;

/**
 * @desc User控制层
 * @author gsh
 * @version 1.0
 * @date 2018年12月25日 11:29:14
 */
@Api(tags="用户管理")
@Controller
@RequestMapping("/sys_user")
public class UserController extends BaseController {

    @Autowired
    private IUserService userService;
    
    @ResponseBody
    @RequestMapping(value = "/selectOnt/{id}", method = RequestMethod.GET)
    public BaseResult selectOne(@PathVariable Long id) throws Exception {
        UserDto dto = new UserDto();
        dto.setId(id);
        BaseDtoIn<UserDto> in = new BaseDtoIn<UserDto>(dto);
        BaseDtoOut<UserDto> out = userService.selectOne(in);
        UserVo vo = BeanMapperKit.convert(out.getMode(), UserVo.class);
        BaseResult result = ResultUtils.success();
        result.getData().put("model", vo);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    public BaseResult select(@RequestBody UserVo vo) throws Exception {
        UserDto dto = BeanMapperKit.convert(vo, UserDto.class);
        BaseDtoIn<UserDto> in = new BaseDtoIn<UserDto>(dto);
        BaseDtoOut<UserDto> out = userService.select(in);
        BaseResult result = ResultUtils.success();
        List<UserVo> listVo = BeanMapperKit.convertList(out.getList(),UserVo.class);
        result.getData().put("list",listVo);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public BaseResult insert(@RequestBody UserVo vo) throws Exception {
        UserDto dto = BeanMapperKit.convert(vo, UserDto.class);
        BaseDtoIn<UserDto> in = new BaseDtoIn<UserDto>(dto);
        BaseDtoOut<UserDto> out = userService.insert(in);
        BaseResult result = ResultUtils.success();
        UserVo model = BeanMapperKit.convert(out.getMode(),UserVo.class);
        result.getData().put("model",model);
        return result;
    }
}
