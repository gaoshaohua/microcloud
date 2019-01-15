package com.micro.cloud.frame.commons.base.biz;

import com.micro.cloud.frame.commons.base.biz.crud.ICrudBiz;
import com.micro.cloud.frame.commons.base.biz.example.IExampleBiz;

/**
 * 
 * @Description 公共service层接口
 * @author gsh
 * @date 2017年10月14日 下午1:21:43
 */
public interface IBaseBiz<T> extends ICrudBiz<T>,IExampleBiz<T>{

	
}
