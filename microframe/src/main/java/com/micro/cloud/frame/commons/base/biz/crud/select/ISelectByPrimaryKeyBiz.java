package com.micro.cloud.frame.commons.base.biz.crud.select;

public interface ISelectByPrimaryKeyBiz<T> {

    T selectByPrimaryKey(Object key);
    
}
