package com.micro.cloud.frame.commons.base.biz.example;

import java.util.List;

public interface SelectByExampleBiz<T> {

    List<T> selectByExample(Object example);
    
}
