package com.micro.cloud.frame.commons.base.service.crud;

import com.micro.cloud.frame.commons.base.service.crud.delete.IBaseDeleteService;
import com.micro.cloud.frame.commons.base.service.crud.insert.IBaseInsertService;
import com.micro.cloud.frame.commons.base.service.crud.select.IBaseSelectService;
import com.micro.cloud.frame.commons.base.service.crud.update.IBaseUpdateService;

/**
 * 
 * @Description 公共service层接口
 * @author gsh
 * @date 2017年10月14日 下午1:21:43
 */
public interface IBaseCrudService<T,D>
        extends IBaseSelectService<T,D>, IBaseDeleteService<T,D>, IBaseUpdateService<T,D>, IBaseInsertService<T,D> {

}
