package com.micro.cloud.frame.commons.result;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.micro.cloud.frame.commons.enums.ExceptionEnums;

public class BaseResult {

	private Integer code = ExceptionEnums.SYS_SUCCESS.getResCode();

	private String msg = ExceptionEnums.SYS_SUCCESS.getResMsg();

	private Map<String, Object> data = new HashMap<String, Object>();

	public BaseResult() {
	}

	public BaseResult(ExceptionEnums emsException) {
		this.code = emsException.getResCode();
		this.msg = emsException.getResMsg();
	}

	public BaseResult(Integer code, String msg,
			Map<String, Object> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	

	public void setResData(List<?> rows, long total) {
		this.data.put("rows", rows);
		this.data.put("total", total);
	}

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
