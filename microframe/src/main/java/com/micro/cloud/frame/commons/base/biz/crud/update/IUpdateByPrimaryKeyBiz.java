package com.micro.cloud.frame.commons.base.biz.crud.update;

public interface IUpdateByPrimaryKeyBiz<T> {

    int updateByPrimaryKey(T record);
    
}
