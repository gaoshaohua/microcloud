package com.micro.cloud.frame.commons.base.biz.crud.select;

import java.util.List;

public interface ISelectBiz<T> {

    List<T> select(T record);
}
