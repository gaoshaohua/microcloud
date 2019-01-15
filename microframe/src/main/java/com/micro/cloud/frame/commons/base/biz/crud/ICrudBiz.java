package com.micro.cloud.frame.commons.base.biz.crud;

/**
 * service层：crud
 * @author gaoshaohua
 *
 * @param <T>
 */
public interface ICrudBiz<T>
        extends IBaseInsertBiz<T>, IBaseSelectBiz<T>, IBaseUpdateBiz<T>, IBaseDeleteBiz<T> {

}
