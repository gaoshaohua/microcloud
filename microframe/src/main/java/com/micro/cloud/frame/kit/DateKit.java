package com.micro.cloud.frame.kit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

public class DateKit {

	private static String[] parsePatterns = { "yyyy-MM-dd",
			"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy/MM/dd",
			"yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm" };

	private static String PATTERN_DEFAULT = "yyyy-MM-dd HH:mm:ss";

	private static String PATTERN_DATE = "yyyy-MM-dd";

	private static String PATTERN_TIME = "HH:mm:ss";

	public static String formatDate(Date date, String... pattern) {
		if (pattern != null && pattern.length > 0) {
			return DateFormatUtils.format(date, pattern[0]);
		} else {
			return DateFormatUtils.format(date, PATTERN_DEFAULT);
		}
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}

	/**
	 * 日期型字符串转化为日期 格式 { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm",
	 * "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm" }
	 */
	public static Date parseDate(String str) {
		if (str == null || str.trim().equals("")) {
			return null;
		}
		try {
			return DateUtils.parseDate(str.toString(), parsePatterns);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime() - date.getTime();
		return t / (24 * 60 * 60 * 1000);
	}

	/**
	 * 生成时间随机数
	 * 
	 * @return
	 */
	public static String getDateRandom() {
		String s = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		return s;
	}

	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * 
	 * @param timeMillis
	 * @return
	 */
	public static String formatDateTime(long timeMillis) {
		StringBuffer buffer = new StringBuffer();
		long day = timeMillis / (24 * 60 * 60 * 1000);
		long hour = (timeMillis / (60 * 60 * 1000) - day * 24);
		long min = ((timeMillis / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (timeMillis / 1000 - day * 24 * 60 * 60 - hour * 60 * 60
				- min * 60);
		long sss = (timeMillis - day * 24 * 60 * 60 * 1000
				- hour * 60 * 60 * 1000 - min * 60 * 1000 - s * 1000);
		if (day > 0) {
			buffer.append(day + ",");
		}
		if (hour > 0) {
			buffer.append(hour + ":");
		}
		if (min > 0) {
			buffer.append(min + ":");
		}
		if (s > 0) {
			buffer.append(s + ".");
		}
		if (sss > 0) {
			buffer.append(sss);
		}
		return buffer.toString();
	}

	public static void main(String[] args) throws ParseException {
		Date date = DateUtils.parseDate("2018-06-08",
				new String[] { "yyyy/MM/dd", "yyyy-MM-dd" });
		System.out.println(formatDate(date));
	}
}
