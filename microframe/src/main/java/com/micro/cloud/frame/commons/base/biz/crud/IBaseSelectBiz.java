package com.micro.cloud.frame.commons.base.biz.crud;

import com.micro.cloud.frame.commons.base.biz.crud.select.IExistsWithPrimaryKeyBiz;
import com.micro.cloud.frame.commons.base.biz.crud.select.ISelectAllBiz;
import com.micro.cloud.frame.commons.base.biz.crud.select.ISelectByPrimaryKeyBiz;
import com.micro.cloud.frame.commons.base.biz.crud.select.ISelectCountBiz;
import com.micro.cloud.frame.commons.base.biz.crud.select.ISelectOneBiz;
import com.micro.cloud.frame.commons.base.biz.crud.select.ISelectBiz;

public interface IBaseSelectBiz<T> extends ISelectOneBiz<T>, ISelectBiz<T>, ISelectAllBiz<T>,
        ISelectByPrimaryKeyBiz<T>, ISelectCountBiz<T>, IExistsWithPrimaryKeyBiz<T> {

}
