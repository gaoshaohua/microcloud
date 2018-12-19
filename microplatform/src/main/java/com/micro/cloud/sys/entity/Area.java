package com.micro.cloud.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Area implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 城市code
	 */
	private String areaCode;

	/**
	 * 注释: 区域名称
	 */
	private String areaName;

	/**
	 * 注释: parent_id
	 */
	private Long parentId;

	/**
	 * 注释: 简称
	 */
	private String shortName;

	/**
	 * 注释: 经度
	 */
	private String lng;

	/**
	 * 注释: 维度
	 */
	private String lat;

	/**
	 * 注释: 级数
	 */
	private Integer level;

	/**
	 * 注释: 排序
	 */
	private Integer sort;

	/**
	 * 注释: 1正常 0删除
	 */
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
