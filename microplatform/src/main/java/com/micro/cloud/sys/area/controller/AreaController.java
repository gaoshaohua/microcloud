package com.micro.cloud.sys.area.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.micro.cloud.frame.commons.base.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import com.micro.cloud.sys.area.entity.Area;
import com.micro.cloud.sys.area.service.IAreaService;

/**
 * @desc Area控制层
 * @author gsh
 * @version 1.0
 * @date 2019年01月15日 05:10:48
 */
@Controller
@RequestMapping("/sys_area")
public class AreaController extends BaseController {

    @Autowired
    private IAreaService areaService;
}
