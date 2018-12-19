package com.micro.cloud.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Department implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 部门名称
	 */
	private String deptName;

	/**
	 * 注释: 部门地址
	 */
	private String deptAddress;

	/**
	 * 注释: 部门电话
	 */
	private String deptPhone;

	/**
	 * 注释: 类型 1公司 2公司领导 3部门 0其它
	 */
	private String type;

	/**
	 * 注释: parent_id
	 */
	private Long parentId;

	/**
	 * 注释: remark
	 */
	private String remark;

	/**
	 * 注释: 创建时间
	 */
	private java.util.Date createDate;

	/**
	 * 注释: 1正常 0删除 -1全部
	 */
	private String status;

	/**
	 * 注释: 更新时间
	 */
	private java.util.Date updateDate;

	/**
	 * 注释: 创建者
	 */
	private Long creator;

	/**
	 * 注释: 更新者
	 */
	private Long updater;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptAddress() {
		return deptAddress;
	}

	public void setDeptAddress(String deptAddress) {
		this.deptAddress = deptAddress;
	}

	public String getDeptPhone() {
		return deptPhone;
	}

	public void setDeptPhone(String deptPhone) {
		this.deptPhone = deptPhone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public java.util.Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.util.Date updateDate) {
		this.updateDate = updateDate;
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
}
