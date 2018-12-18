package com.micro.cloud.frame.commons.result;

import com.micro.cloud.frame.commons.enums.ExceptionEnums;

public class ResultUtils {

	public static BaseResult success() {
		return new BaseResult();
	}

	public static BaseResult fail() {
		return new BaseResult(ExceptionEnums.SYS_ERROR);
	}
}
