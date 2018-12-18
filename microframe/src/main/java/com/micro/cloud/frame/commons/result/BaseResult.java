package com.micro.cloud.frame.commons.result;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.micro.cloud.frame.commons.enums.ExceptionEnums;

public class BaseResult {

	private Integer resCode = ExceptionEnums.SYS_SUCCESS.getResCode();

	private String resMsg = ExceptionEnums.SYS_SUCCESS.getResMsg();

	private Map<String, Object> resData = new HashMap<String, Object>();

	public BaseResult() {
	}

	public BaseResult(ExceptionEnums emsException) {
		this.resCode = emsException.getResCode();
		this.resMsg = emsException.getResMsg();
	}

	public BaseResult(Integer resCode, String resMsg,
			Map<String, Object> resData) {
		super();
		this.resCode = resCode;
		this.resMsg = resMsg;
		this.resData = resData;
	}

	public Integer getResCode() {
		return resCode;
	}

	public void setResCode(Integer resCode) {
		this.resCode = resCode;
	}

	public String getResMsg() {
		return resMsg;
	}

	public void setResMsg(String resMsg) {
		this.resMsg = resMsg;
	}

	public Map<String, Object> getResData() {
		return resData;
	}

	public void setResData(Map<String, Object> resData) {
		this.resData = resData;
	}

	public void setResData(List<?> rows, long total) {
		this.resData.put("rows", rows);
		this.resData.put("total", total);
	}
}
