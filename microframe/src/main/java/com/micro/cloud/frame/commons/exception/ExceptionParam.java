package com.micro.cloud.frame.commons.exception;

import com.micro.cloud.frame.commons.enums.ExceptionEnums;

public class ExceptionParam extends ExceptionBase {

	/** @Fields serialVersionUID: */
	private static final long serialVersionUID = 5317967005293213133L;

	private String paramName;

	private Object paramValue;

	public ExceptionParam(ExceptionEnums exceptionEnums) {
		super(exceptionEnums);
	}

	public ExceptionParam(ExceptionEnums exceptionEnums, String paramName,
			Object paramValue) {
		super(exceptionEnums);
		this.paramName = paramName;
		this.paramValue = paramValue;
	}

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public Object getParamValue() {
		return paramValue;
	}

	public void setParamValue(Object paramValue) {
		this.paramValue = paramValue;
	}

}
