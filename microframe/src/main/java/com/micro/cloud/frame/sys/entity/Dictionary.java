package com.micro.cloud.frame.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Dictionary implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 标签
	 */
	private String label;

	/**
	 * 注释: 值
	 */
	private String value;

	/**
	 * 注释: 是否默认选中 1是 0否
	 */
	private Boolean selected;

	/**
	 * 注释: parent_id
	 */
	private Long parentId;

	/**
	 * 注释: 类型
	 */
	private String type;

	/**
	 * 注释: 创建者
	 */
	private Long creator;

	/**
	 * 注释: 更新者
	 */
	private Long updater;

	/**
	 * 注释: 创建时间
	 */
	private java.util.Date createDate;

	/**
	 * 注释: 更新时间
	 */
	private java.util.Date updateDate;

	/**
	 * 注释: 1正常 0删除 -1全部
	 */
	private String status;

	/**
	 * 注释: 描述
	 */
	private String remark;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public Long getUpdater() {
		return updater;
	}

	public void setUpdater(Long updater) {
		this.updater = updater;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
