package com.micro.cloud.sys.user.entity;

import javax.persistence.Table;

/**
 * @desc 实体类
 * @author gsh
 * @version 1.0
 * @date 2019年01月15日 05:10:49
 */
@Table(name="sys_user")
public class User{

	 /**
	  * desc: id
	  */
	  private Integer id;
     
	 /**
	  * desc: 用户编号
	  */
	  private String userNo;
     
	 /**
	  * desc: 用户名
	  */
	  private String username;
     
	 /**
	  * desc: 用户姓名
	  */
	  private String name;
     
	 /**
	  * desc: 昵称
	  */
	  private String nickname;
     
	 /**
	  * desc: 密码
	  */
	  private String password;
     
	 /**
	  * desc: 登录ip
	  */
	  private String loginIp;
     
	 /**
	  * desc: 最后一次登录时间
	  */
	  private java.util.Date loginDate;
     
	 /**
	  * desc: 用户头像
	  */
	  private String photo;
     
	 /**
	  * desc: 联系电话
	  */
	  private String phone;
     
	 /**
	  * desc: 邮箱
	  */
	  private String email;
     
	 /**
	  * desc: 生日
	  */
	  private java.util.Date birthday;
     
	 /**
	  * desc: 性别  1男  2女
	  */
	  private Integer geneder;
     
	 /**
	  * desc: 部门id
	  */
	  private Integer deptId;
     
	 /**
	  * desc: 是否锁定 1锁定 0未锁定
	  */
	  private Integer locked;
     
	 /**
	  * desc: 描述
	  */
	  private String remark;
     
	 /**
	  * desc: 1正常  0删除 -1全部
	  */
	  private String status;
     
	 /**
	  * desc: 创建者
	  */
	  private Integer creator;
     
	 /**
	  * desc: 更新者
	  */
	  private Integer updater;
     
	 /**
	  * desc: 创建时间
	  */
	  private java.util.Date createDate;
     
	 /**
	  * desc: 更新时间
	  */
	  private java.util.Date updateDate;
     

	public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }
	public String getUserNo(){
        return userNo;
    }

    public void setUserNo(String userNo){
        this.userNo = userNo;
    }
	public String getUsername(){
        return username;
    }

    public void setUsername(String username){
        this.username = username;
    }
	public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }
	public String getNickname(){
        return nickname;
    }

    public void setNickname(String nickname){
        this.nickname = nickname;
    }
	public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }
	public String getLoginIp(){
        return loginIp;
    }

    public void setLoginIp(String loginIp){
        this.loginIp = loginIp;
    }
	public java.util.Date getLoginDate(){
        return loginDate;
    }

    public void setLoginDate(java.util.Date loginDate){
        this.loginDate = loginDate;
    }
	public String getPhoto(){
        return photo;
    }

    public void setPhoto(String photo){
        this.photo = photo;
    }
	public String getPhone(){
        return phone;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }
	public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }
	public java.util.Date getBirthday(){
        return birthday;
    }

    public void setBirthday(java.util.Date birthday){
        this.birthday = birthday;
    }
	public Integer getGeneder(){
        return geneder;
    }

    public void setGeneder(Integer geneder){
        this.geneder = geneder;
    }
	public Integer getDeptId(){
        return deptId;
    }

    public void setDeptId(Integer deptId){
        this.deptId = deptId;
    }
	public Integer getLocked(){
        return locked;
    }

    public void setLocked(Integer locked){
        this.locked = locked;
    }
	public String getRemark(){
        return remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }
	public String getStatus(){
        return status;
    }

    public void setStatus(String status){
        this.status = status;
    }
	public Integer getCreator(){
        return creator;
    }

    public void setCreator(Integer creator){
        this.creator = creator;
    }
	public Integer getUpdater(){
        return updater;
    }

    public void setUpdater(Integer updater){
        this.updater = updater;
    }
	public java.util.Date getCreateDate(){
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate){
        this.createDate = createDate;
    }
	public java.util.Date getUpdateDate(){
        return updateDate;
    }

    public void setUpdateDate(java.util.Date updateDate){
        this.updateDate = updateDate;
    }
}
