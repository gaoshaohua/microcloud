package com.micro.cloud.frame.commons.enums;

/**
 * 
 * @Description 异常信息的枚举
 * @author gsh
 * @date 2017年9月13日 下午4:03:08
 */
public enum ExceptionEnums {

	/**
	 * 请求状态
	 */
	SYS_SUCCESS(200, "请求成功"), SYS_ERROR(400, "请求失败!"), NOT_FOUND(404, "对应的资源不存在"),
	/**
	 * 错误的请求
	 */
	SERVER_ERROR(500, "系统繁忙，请稍候再试"),

	/**
	 * 空问题
	 */
	PARAM_NOT_NULL(101, "请求参数不能为空"), ID_NOT_NULL(102, "ID不能为空!"), IDS_NOT_NULL(103, "IDS数组不能为空"), USERNAME_NOT_NULL(104, "用户名不能为空"), PWD_NOT_NULL(105, "密码不能为空"), KAPTCHA_NOT_NULL(106, "验证码不能为空"), KAPTCHA_ERROR(107, "验证码错误"),
	/**
	 * 不合法问题
	 */
	TOKEN_NOLEGAL(201, "不合法的token或token过期"), DATE_NOLEGAL(202, "不合法的日期格式!"), REQ_NOLEGAL(203, "不合法的请求参数"), FILE_SIZE_NOLEGAL(204, "不合法的文件大小"),

	/**
	 * 权限问题
	 */
	NOT_PERMISSION(403, "无资源访问权限"),
	/**
	 * 账户问题
	 */
	USER_NOT_LOGIN(407, "用户未登录"), USER_ALREADY_REG(408, "该用户已经注册"), NO_THIS_USER(409, "没有此用户"), USER_NOT_EXISTED(410, "没有此用户"), ACCOUNT_FREEZED(401, "账号被冻结"), OLD_PWD_NOT_RIGHT(402, "原密码不正确"), TWO_PWD_NOT_MATCH(407, "两次输入密码不一致"), USER_PWD_ERROR(406, "用户名或密码不对"),

	/**
	 * 获取数据成功
	 */
	QUERY_SUCCESS(501, "查询成功"),
	/**
	 * 获取数据失败
	 */
	QUERY_ERROR(502, "查询失败"),
	/**
	 * 保存数据成功
	 */
	INSERT_SUCCESS(503, "保存成功"),
	/**
	 * 保存数据失败
	 */
	INSERT_ERROR(504, "保存失败"),
	/**
	 * 删除数据成功
	 */
	DELETE_SUCCESS(505, "删除成功"),
	/**
	 * 删除数据失败
	 */
	DELETE_ERROR(506, "删除失败"),
	/**
	 * 更新数据成功
	 */
	UPDATE_SUCCESS(507, "更新成功"),
	/**
	 * 更新数据失败
	 */
	UPDATE_ERROR(508, "更新失败"),
	/**
	 * 批量删除数据成功
	 */
	BATCH_DELETE_SUCCESS(509, "批量删除成功"),
	/**
	 * 批量删除数据失败
	 */
	BATCH_DELETE_ERROR(510, "批量删除失败"),
	/**
	 * 批量添加数据成功
	 */
	BATCH_INSERT_SUCCESS(511, "批量添加成功"),
	/**
	 * 批量添加数据失败
	 */
	BATCH_INSERT_ERROR(512, "批量添加失败"),
	/**
	 * 批量更新数据成功
	 */
	BATCH_UPDATE_SUCCESS(513, "批量更新成功"),
	/**
	 * 批量更新数据失败
	 */
	BATCH_UPDATE_ERROR(514, "批量更新失败");

	ExceptionEnums(Integer resCode, String resMsg) {
		this.resCode = resCode;
		this.resMsg = resMsg;
	}

	/**
	 * 错误信息
	 */
	private String resMsg;
	/**
	 * 错误码 0：成功 非0：失败
	 */
	private Integer resCode;

	public String getResMsg() {
		return resMsg;
	}

	public void setResMsg(String resMsg) {
		this.resMsg = resMsg;
	}

	public Integer getResCode() {
		return resCode;
	}

	public void setResCode(Integer resCode) {
		this.resCode = resCode;
	}

}
