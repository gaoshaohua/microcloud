package com.micro.cloud.frame.commons.base.biz.crud.update;

public interface IUpdateByPrimaryKeySelectiveBiz<T> {

    int updateByPrimaryKeySelective(T record);
    
}
