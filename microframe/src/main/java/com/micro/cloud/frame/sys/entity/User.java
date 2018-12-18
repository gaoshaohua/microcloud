package com.micro.cloud.frame.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class User implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: 用户编号
	 */
	private String userNo;

	/**
	 * 注释: 用户名
	 */
	private String username;

	/**
	 * 注释: 用户姓名
	 */
	private String name;

	/**
	 * 注释: 昵称
	 */
	private String nickname;

	/**
	 * 注释: 密码
	 */
	private String password;

	/**
	 * 注释: 登录ip
	 */
	private String loginIp;

	/**
	 * 注释: 最后一次登录时间
	 */
	private java.util.Date loginDate;

	/**
	 * 注释: 用户头像
	 */
	private String photo;

	/**
	 * 注释: 联系电话
	 */
	private String phone;

	/**
	 * 注释: 邮箱
	 */
	private String email;

	/**
	 * 注释: 生日
	 */
	private java.util.Date birthday;

	/**
	 * 注释: 性别 1男 2女
	 */
	private Integer geneder;

	/**
	 * 注释: 部门id
	 */
	private Integer deptId;

	/**
	 * 注释: 是否锁定 1锁定 0未锁定
	 */
	private Boolean locked;

	/**
	 * 注释: 描述
	 */
	private String remark;

	/**
	 * 注释: 1正常 0删除 -1全部
	 */
	private String status;

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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public java.util.Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(java.util.Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public java.util.Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	public Integer getGeneder() {
		return geneder;
	}

	public void setGeneder(Integer geneder) {
		this.geneder = geneder;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
}
