package com.micro.cloud.frame.commons.base.biz.example;

public interface IExampleBiz<T> extends 
SelectByExampleBiz<T>,
SelectCountByExampleBiz<T>,
DeleteByExampleBiz<T>,
UpdateByExampleBiz<T>,
UpdateByExampleSelectiveBiz<T> {

}
