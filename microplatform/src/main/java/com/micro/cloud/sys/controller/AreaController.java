package com.micro.cloud.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.micro.cloud.frame.commons.base.controller.BaseController;
import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;
import com.micro.cloud.sys.service.IAreaService;
import com.micro.cloud.sys.vo.AreaVo;

/**
 * @desc 控制器
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
@Controller
@RequestMapping("/sys_area")
public class AreaController extends BaseController {

    @Autowired
    private IAreaService areaService;
    
    
    public BaseResult save(AreaVo vo) throws Exception{
//        areaService.save(entity);
        return ResultUtils.success();
    }
}
