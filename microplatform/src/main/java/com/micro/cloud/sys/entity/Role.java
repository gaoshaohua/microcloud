package com.micro.cloud.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Role implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 角色名称
	 */
	private String roleName;

	/**
	 * 注释: 角色code
	 */
	private String roleCode;

	/**
	 * 注释: 1正常 0删除 -1全部
	 */
	private String status;

	/**
	 * 注释: remark
	 */
	private String remark;

	/**
	 * 注释: create_date
	 */
	private java.util.Date createDate;

	/**
	 * 注释: update_date
	 */
	private java.util.Date updateDate;

	/**
	 * 注释: creator
	 */
	private Long creator;

	/**
	 * 注释: updater
	 */
	private Long updater;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
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
