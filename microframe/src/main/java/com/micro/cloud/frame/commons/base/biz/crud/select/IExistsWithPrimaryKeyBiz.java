package com.micro.cloud.frame.commons.base.biz.crud.select;

public interface IExistsWithPrimaryKeyBiz<T> {

    boolean existsWithPrimaryKey(Object key);
    
}
