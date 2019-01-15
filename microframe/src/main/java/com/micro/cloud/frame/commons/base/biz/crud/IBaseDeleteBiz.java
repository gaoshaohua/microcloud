package com.micro.cloud.frame.commons.base.biz.crud;

import com.micro.cloud.frame.commons.base.biz.crud.delete.IDeleteByPrimaryKeyBiz;
import com.micro.cloud.frame.commons.base.biz.crud.delete.IDeleteBiz;

public interface IBaseDeleteBiz<T> extends IDeleteBiz<T>, IDeleteByPrimaryKeyBiz<T> {

}
