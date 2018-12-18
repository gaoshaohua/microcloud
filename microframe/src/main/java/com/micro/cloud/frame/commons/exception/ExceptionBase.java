package com.micro.cloud.frame.commons.exception;

import com.micro.cloud.frame.commons.enums.ExceptionEnums;

/**
 * 
 * @Description 异常信息基类
 * @author gsh
 * @date 2017年9月13日 下午4:45:53
 */
public class ExceptionBase extends RuntimeException {

	/** @Fields serialVersionUID: */
	private static final long serialVersionUID = 6701471349069658945L;
	/** 错误码 **/
	private Integer errCode;
	/** 错误消息 **/
	private String errMsg;

	public ExceptionBase(ExceptionEnums exceptionEnums) {
		this.errCode = exceptionEnums.getResCode();
		this.errMsg = exceptionEnums.getResMsg();
	}

	public Integer getErrCode() {
		return errCode;
	}

	public void setErrCode(Integer errCode) {
		this.errCode = errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

}
