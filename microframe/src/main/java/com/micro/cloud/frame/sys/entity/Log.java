package com.micro.cloud.frame.sys.entity;

import java.io.Serializable;

/**
 * 
 * @author gsh
 * @version 1.0
 * @date 2018年05月31日 05:22:29
 */
public class Log implements Serializable {

	/**
	 * 注释: id
	 */
	private Long id;

	/**
	 * 注释: ip地址
	 */
	private String ip;

	/**
	 * 注释: 操作系统
	 */
	private String userAgent;

	/**
	 * 注释: 是否成功 0否 1是
	 */
	private Boolean reqOk;

	/**
	 * 注释: 请求方法
	 */
	private String reqMethod;

	/**
	 * 注释: 请求参数
	 */
	private String reqParam;

	/**
	 * 注释: 请求地址
	 */
	private String reqUrl;

	/**
	 * 注释: 返回值
	 */
	private String resParam;

	/**
	 * 注释: 记录人
	 */
	private Long creator;

	/**
	 * 注释: 记录时间
	 */
	private java.util.Date createDate;

	/**
	 * 注释: 描述
	 */
	private String remark;

	/**
	 * 注释: 耗时
	 */
	private String timeConsuming;

	/**
	 * 注释: 异常信息
	 */
	private String exception;

	/**
	 * 注释: 1正常 0禁用
	 */
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public Boolean getReqOk() {
		return reqOk;
	}

	public void setReqOk(Boolean reqOk) {
		this.reqOk = reqOk;
	}

	public String getReqMethod() {
		return reqMethod;
	}

	public void setReqMethod(String reqMethod) {
		this.reqMethod = reqMethod;
	}

	public String getReqParam() {
		return reqParam;
	}

	public void setReqParam(String reqParam) {
		this.reqParam = reqParam;
	}

	public String getReqUrl() {
		return reqUrl;
	}

	public void setReqUrl(String reqUrl) {
		this.reqUrl = reqUrl;
	}

	public String getResParam() {
		return resParam;
	}

	public void setResParam(String resParam) {
		this.resParam = resParam;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTimeConsuming() {
		return timeConsuming;
	}

	public void setTimeConsuming(String timeConsuming) {
		this.timeConsuming = timeConsuming;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
