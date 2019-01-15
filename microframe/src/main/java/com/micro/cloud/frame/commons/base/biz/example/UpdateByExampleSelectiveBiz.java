package com.micro.cloud.frame.commons.base.biz.example;

import org.apache.ibatis.annotations.Param;

public interface UpdateByExampleSelectiveBiz<T> {

    int updateByExampleSelective(@Param("record") T record, @Param("example") Object example);
    
}
