package com.micro.cloud.frame.commons.base.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.micro.cloud.frame.commons.base.biz.IBaseBiz;
import com.micro.cloud.frame.commons.base.dao.IBaseDao;

public class BaseBizImpl<T> implements IBaseBiz<T> {

	@Autowired
	IBaseDao<T> baseDao;

    @Override
    public int insert(T record) {
        return baseDao.insert(record);
    }

    @Override
    public int insertSelective(T record) {
        return baseDao.insertSelective(record);
    }

    @Override
    public T selectOne(T record) {
        return baseDao.selectOne(record);
    }

    @Override
    public List<T> select(T record) {
        return baseDao.select(record);
    }

    @Override
    public List<T> selectAll() {
        return baseDao.selectAll();
    }

    @Override
    public T selectByPrimaryKey(Object key) {
        return baseDao.selectByPrimaryKey(key);
    }

    @Override
    public int selectCount(T record) {
        return baseDao.selectCount(record);
    }

    @Override
    public boolean existsWithPrimaryKey(Object key) {
        return baseDao.existsWithPrimaryKey(key);
    }

    @Override
    public int updateByPrimaryKey(T record) {
        return baseDao.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {
        return baseDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(T record) {
        return baseDao.delete(record);
    }

    @Override
    public int deleteByPrimaryKey(Object key) {
        return baseDao.deleteByPrimaryKey(key);
    }

    @Override
    public List<T> selectByExample(Object example) {
        return baseDao.selectByExample(example);
    }

    @Override
    public int selectCountByExample(Object example) {
        return baseDao.selectCountByExample(example);
    }

    @Override
    public int deleteByExample(Object example) {
        return baseDao.deleteByExample(example);
    }

    @Override
    public int updateByExample(T record, Object example) {
        return baseDao.updateByExample(record, example);
    }

    @Override
    public int updateByExampleSelective(T record, Object example) {
        return baseDao.updateByExampleSelective(record, example);
    }

}
