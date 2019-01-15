package com.micro.cloud.frame.commons.base.biz.crud.insert;

public interface IInsertSelectiveBiz<T> {

    int insertSelective(T record);
    
}
