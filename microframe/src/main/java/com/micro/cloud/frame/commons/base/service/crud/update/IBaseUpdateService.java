package com.micro.cloud.frame.commons.base.service.crud.update;

import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;

public interface IBaseUpdateService<T,D> {

    BaseDtoOut<Integer> updateByPrimaryKey(BaseDtoIn<D> in);
    
    BaseDtoOut<Integer> updateByPrimaryKeySelective(BaseDtoIn<D> in);
}
