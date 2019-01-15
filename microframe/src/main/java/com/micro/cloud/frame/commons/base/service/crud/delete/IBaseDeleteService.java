package com.micro.cloud.frame.commons.base.service.crud.delete;

import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;

public interface IBaseDeleteService<T,D> {

    BaseDtoOut<Integer> delete(BaseDtoIn<D> in);
    
    BaseDtoOut<Integer> deleteByPrimaryKey(BaseDtoIn<D> in);
}
