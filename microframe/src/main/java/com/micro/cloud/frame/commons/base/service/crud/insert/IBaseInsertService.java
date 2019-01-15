package com.micro.cloud.frame.commons.base.service.crud.insert;

import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;

public interface IBaseInsertService<T,D> {

    BaseDtoOut<D> insert(BaseDtoIn<D> in);
    
    BaseDtoOut<D> insertSelective(BaseDtoIn<D> in);
}
