package com.micro.cloud.frame.commons.base.service.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.micro.cloud.frame.commons.base.biz.IBaseBiz;
import com.micro.cloud.frame.commons.base.dto.BaseDtoIn;
import com.micro.cloud.frame.commons.base.dto.BaseDtoOut;
import com.micro.cloud.frame.commons.base.service.IBaseService;
import com.micro.cloud.frame.kit.BeanMapperKit;

public class BaseServiceImpl<T, D> implements IBaseService<T, D> {

    @Autowired
    IBaseBiz<T> baseBiz;

    private Type[] type = ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments();

    private Class<T> entityClass = (Class<T>) type[0];

    private Class<D> dtoClass = (Class<D>) type[1];

    @Override
    public BaseDtoOut<D> selectOne(BaseDtoIn<D> in) {
        // dto 转 entity
        Class<T> entityClass = (Class<T>) type[0];
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        T t = baseBiz.selectOne(record);
        // entity 转 dto
        Class<D> dtoClass = (Class<D>) type[1];
        D d = BeanMapperKit.convert(t, dtoClass);
        BaseDtoOut<D> out = new BaseDtoOut<D>();
        out.setMode(d);
        return out;
    }

    @Override
    public BaseDtoOut<D> selectAll() {
        List<T> sources = baseBiz.selectAll();
        // entity 转 dto
        Class<D> dtoClass = (Class<D>) type[0];
        List<D> list = BeanMapperKit.convertList(sources, dtoClass);
        BaseDtoOut<D> out = new BaseDtoOut<D>();
        out.setList(list);
        return out;
    }

    @Override
    public BaseDtoOut<D> select(BaseDtoIn<?> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        List<T> sources = baseBiz.select(record);
        // entity 转 dto
        List<D> list = BeanMapperKit.convertList(sources, dtoClass);
        BaseDtoOut<D> out = new BaseDtoOut<D>();
        out.setList(list);
        return out;
    }

    @Override
    public BaseDtoOut<Integer> delete(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.delete(record);
        BaseDtoOut<Integer> out = new BaseDtoOut<Integer>();
        out.setMode(i);
        return out;
    }

    @Override
    public BaseDtoOut<Integer> deleteByPrimaryKey(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.deleteByPrimaryKey(record);
        // entity 转 dto
        BaseDtoOut<Integer> out = new BaseDtoOut<Integer>();
        out.setMode(i);
        return out;
    }

    @Override
    public BaseDtoOut<Integer> updateByPrimaryKey(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.updateByPrimaryKey(record);
        // entity 转 dto
        BaseDtoOut<Integer> out = new BaseDtoOut<Integer>();
        out.setMode(i);
        return out;
    }

    @Override
    public BaseDtoOut<Integer> updateByPrimaryKeySelective(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.updateByPrimaryKeySelective(record);
        // entity 转 dto
        BaseDtoOut<Integer> out = new BaseDtoOut<Integer>();
        out.setMode(i);
        return out;
    }

    @Override
    public BaseDtoOut<D> insert(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.insert(record);
        // entity 转 dto
        D dto = BeanMapperKit.convert(record, dtoClass);
        BaseDtoOut<D> out = new BaseDtoOut<D>();
        out.setMode(dto);
        return out;
    }

    @Override
    public BaseDtoOut<D> insertSelective(BaseDtoIn<D> in) {
        // dto 转 entity
        T record = BeanMapperKit.convert(in.getMode(), entityClass);
        int i = baseBiz.insertSelective(record);
        // entity 转 dto
        D dto = BeanMapperKit.convert(record, dtoClass);
        BaseDtoOut<D> out = new BaseDtoOut<D>();
        out.setMode(dto);
        return out;
    }

}
