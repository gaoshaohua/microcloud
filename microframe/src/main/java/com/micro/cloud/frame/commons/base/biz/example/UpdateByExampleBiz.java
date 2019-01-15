package com.micro.cloud.frame.commons.base.biz.example;

import org.apache.ibatis.annotations.Param;

public interface UpdateByExampleBiz<T> {

    int updateByExample(@Param("record") T record, @Param("example") Object example);
    
}
