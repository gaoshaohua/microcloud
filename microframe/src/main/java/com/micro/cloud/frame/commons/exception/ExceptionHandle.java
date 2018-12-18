package com.micro.cloud.frame.commons.exception;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.micro.cloud.frame.commons.result.BaseResult;
import com.micro.cloud.frame.commons.result.ResultUtils;

@ControllerAdvice
public class ExceptionHandle {

	private Logger log = LogManager.getLogger(ExceptionHandle.class);

	@ExceptionHandler(Exception.class)
	@ResponseBody
	public BaseResult Exception(Exception e) {
		log.error("请求异常:" + ExceptionUtils.getStackTrace(e));
		BaseResult result = ResultUtils.fail();
		result.setResMsg(e.getMessage());
		return result;
	}

	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public BaseResult RuntimeException(Exception e) {
		log.error("请求异常:" + ExceptionUtils.getStackTrace(e));
		BaseResult result = ResultUtils.fail();
		result.setResMsg(e.getMessage());
		return result;
	}

	@ExceptionHandler(ExceptionBase.class)
	@ResponseBody
	public BaseResult baseException(ExceptionBase e) {
		log.error("请求异常:" + ExceptionUtils.getStackTrace(e));
		BaseResult result = ResultUtils.fail();
		result.setResCode(e.getErrCode());
		result.setResMsg(e.getErrMsg());
		return result;
	}

	@ExceptionHandler(ExceptionParam.class)
	@ResponseBody
	public BaseResult paramException(ExceptionParam e) {
		log.error("请求异常:" + ExceptionUtils.getStackTrace(e));
		BaseResult result = ResultUtils.fail();
		result.setResCode(e.getErrCode());
		result.setResMsg(e.getErrMsg() + "(" + e.getParamName() + " is "
				+ e.getParamValue() + ")");
		return result;
	}

}
