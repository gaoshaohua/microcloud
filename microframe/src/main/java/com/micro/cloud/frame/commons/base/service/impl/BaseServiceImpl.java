package com.micro.cloud.frame.commons.base.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.micro.cloud.frame.commons.base.dao.IBaseDao;
import com.micro.cloud.frame.commons.base.service.IBaseService;

public class BaseServiceImpl<T> implements IBaseService<T> {

	@Autowired
	IBaseDao<T> baseDao;

	@Override
	public <S extends T> void save(S entity) {
		baseDao.save(entity);
	}

	@Override
	public void deleteById(Serializable id) {
		baseDao.deleteById(id);
	}

	@Override
	public void deleteByIds(String[] ids) {
		baseDao.deleteByIds(ids);
	}

	@Override
	public void deleteAll() {
		baseDao.deleteAll();
	}

	@Override
	public Long updateById(T entity) {
		return baseDao.updateById(entity);
	}

	@Override
	public T findById(Serializable id) {
		return baseDao.findById(id);
	}

	@Override
	public T findOne(T entity) {
		return baseDao.findOne(entity);
	}

	@Override
	public List<T> findAll(T entity) {
		return baseDao.findAll(entity);
	}

	@Override
	public <S extends T> List<S> findAllVo(T entity) {
		return baseDao.findAllVo(entity);
	}

	@Override
	public long count() {
		return baseDao.count();
	}

}
