package com.micro.cloud.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Resources implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 资源名称
	 */
	private String name;

	/**
	 * 注释: 资源地址
	 */
	private String url;

	/**
	 * 注释: parent_id
	 */
	private Long parentId;

	/**
	 * 注释: 权限编码
	 */
	private String permCode;

	/**
	 * 注释: 资源图标
	 */
	private String iconCls;

	/**
	 * 注释: 资源级别
	 */
	private Integer level;

	/**
	 * 注释: 排序
	 */
	private Integer sort;

	/**
	 * 注释: 1菜单 2 权限
	 */
	private String type;

	/**
	 * 注释: 描述
	 */
	private String remark;

	/**
	 * 注释: 创建时间
	 */
	private java.util.Date createDate;

	/**
	 * 注释: 更新时间
	 */
	private java.util.Date updateDate;

	/**
	 * 注释: 更新者
	 */
	private Long updater;

	/**
	 * 注释: 创建者
	 */
	private Long creator;

	/**
	 * 注释: 1正常 0删除 -1全部
	 */
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getPermCode() {
		return permCode;
	}

	public void setPermCode(String permCode) {
		this.permCode = permCode;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public java.util.Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.util.Date updateDate) {
		this.updateDate = updateDate;
	}

	public Long getUpdater() {
		return updater;
	}

	public void setUpdater(Long updater) {
		this.updater = updater;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
