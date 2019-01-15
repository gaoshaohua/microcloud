package com.micro.cloud.frame.commons.base.service.crud.select;

import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;

public interface IBaseSelectService<T,D> {
    
    BaseDtoOut<D> selectOne(BaseDtoIn<D> in);
    
    BaseDtoOut<D> selectAll();
    
    BaseDtoOut<D> select(BaseDtoIn<?> in);
}
