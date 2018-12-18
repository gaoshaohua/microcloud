package com.micro.cloud.kit.web;

import java.util.Map;

import com.github.pagehelper.PageHelper;

public class WebKit extends com.micro.cloud.frame.kit.web.WebKit {

	private static final Integer PAGE_SIZE = 10; // 默认每页显示10条数据
	private static final Integer PAGE_INDEX = 1; // 默认当前页为第一页

	/**
	 * 通过request构造查询Map模型,自定义分页
	 * 
	 * @param request
	 *            注意数组只能取第一个
	 * @param pageIndex
	 *            当前页
	 * @param pageSize
	 *            每页显示多少条数据
	 * @return
	 */
	public static void setPage(int pageIndex, int pageSize) {
		PageHelper.startPage(pageIndex, pageSize); // 设置分页
	}

	public static void setPage(String pageIndex, String pageSize) {
		PageHelper.startPage(Integer.parseInt(pageIndex),
				Integer.parseInt(pageSize)); // 设置分页
	}

	/**
	 * 字符串转pageIndex
	 */
	public static Integer toPageIndex(Map<String, Object> map) {
		String pageIndex = (String) (map.containsKey("page") ? map.get("page")
				: map.get("pageIndex"));
		if (null == pageIndex || "".equals(pageIndex.trim())) {
			return PAGE_INDEX;
		} else {
			return Integer.parseInt(pageIndex);
		}
	}

	/**
	 * 字符串转pageSize
	 */
	public static Integer toPageSize(Map<String, Object> map) {
		String pageSize = (String) (map.containsKey("rows") ? map.get("rows")
				: map.get("pageSize"));
		if (null == pageSize || "".equals(pageSize.trim())) {
			return PAGE_SIZE;
		} else {
			return Integer.parseInt(pageSize);
		}
	}

}
