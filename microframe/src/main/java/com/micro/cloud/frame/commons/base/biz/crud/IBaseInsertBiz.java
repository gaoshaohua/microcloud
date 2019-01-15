package com.micro.cloud.frame.commons.base.biz.crud;

import com.micro.cloud.frame.commons.base.biz.crud.insert.IInsertSelectiveBiz;
import com.micro.cloud.frame.commons.base.biz.crud.insert.IInsertBiz;

public interface IBaseInsertBiz<T> extends IInsertBiz<T>, IInsertSelectiveBiz<T> {

}
