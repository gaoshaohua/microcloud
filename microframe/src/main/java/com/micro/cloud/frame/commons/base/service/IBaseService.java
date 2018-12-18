package com.micro.cloud.frame.commons.base.service;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @Description 公共service层接口
 * @author gsh
 * @date 2017年10月14日 下午1:21:43
 */
public interface IBaseService<T> {

	/**
	 * 
	 * @Description 新增-保存一个实体对象
	 * @author gsh
	 * @param entity
	 * @return
	 */
	<S extends T> void save(S entity);

	/**
	 * 
	 * @Description 删除-根据ID删除实体对象
	 * @author gsh
	 * @param id
	 */
	void deleteById(Serializable id);

	/**
	 * 
	 * @Description 删除-根据ID删除实体对象
	 * @author gsh
	 * @param id
	 */
	void deleteByIds(String[] ids);

	/**
	 * 
	 * @Description 删除-删除所有
	 * @author gsh
	 */
	void deleteAll();

	/**
	 * 
	 * @Description 修改-修改一个实体对象
	 * @author gsh
	 * @param entity
	 * @return
	 */
	Long updateById(T entity);

	/**
	 * 
	 * @Description 查询-根据ID查询实体对象
	 * @author gsh
	 * @param id
	 * @return
	 */
	T findById(Serializable id);

	/**
	 * 
	 * @Description 查询-根据ID查询实体对象
	 * @author gsh
	 * @param id
	 * @return
	 */
	T findOne(T entity);

	/**
	 * 
	 * @Description 查询-查询所有实体对象
	 * @author gsh
	 * @return
	 */
	List<T> findAll(T entity);

	/**
	 * 
	 * @Description 查询-查询所有实体对象
	 * @author gsh
	 * @return
	 */

	<S extends T> List<S> findAllVo(T entity);

	/**
	 * 
	 * @Description 查询数量-查询所有数量
	 * @author gsh
	 * @return
	 */
	long count();
}
