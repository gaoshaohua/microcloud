package com.micro.cloud.frame.commons.base.biz.crud;

import com.micro.cloud.frame.commons.base.biz.crud.update.IUpdateByPrimaryKeySelectiveBiz;
import com.micro.cloud.frame.commons.base.biz.crud.update.IUpdateByPrimaryKeyBiz;

public interface IBaseUpdateBiz<T> extends IUpdateByPrimaryKeyBiz<T>, IUpdateByPrimaryKeySelectiveBiz<T> {

}
