package com.micro.cloud.frame.kit;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

/**
 * map工具类，避免从map中拿值报空指针
 * 
 * @Description
 * @author gsh
 * @date 2018年6月8日 下午2:57:03
 */
public class MapKit {

	/**
	 * 返回Double类型，不存在key则返回0
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	public static Double getDouble(Map<String, Object> map, String key) {
		if (map.get(key) != null) {
			if (map.get(key) instanceof Double) {
				return (Double) map.get(key);
			} else {
				return 0.0;
			}
		} else {
			return 0.00;
		}
	}

	/**
	 * 返回String类型，不存在key则返回0
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	public static String getString(Map<String, Object> map, String key) {
		if (map.get(key) != null) {
			if (map.get(key) instanceof String) {
				return (String) map.get(key);
			} else {
				return null;
			}
		} else {
			return "";
		}
	}

	/**
	 * 返回Date类型，不存在key则返回null
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	public static Date getDate(Map<String, Object> map, String key) {
		if (map.get(key) != null) {
			if (map.get(key) instanceof Date) {
				return (Date) map.get(key);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * 返回Integer类型，不存在key则返回0
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	public static Integer getInteger(Map<String, Object> map, String key) {
		if (map.get(key) != null) {
			if (map.get(key) instanceof Integer) {
				return (Integer) map.get(key);
			} else {
				return null;
			}
		} else {
			return 0;
		}
	}

	/**
	 * 返回Map类型，不存在key则返回null
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> getMap(Map<String, Object> map,
			String key) {
		if (map.get(key) != null) {
			if (map.get(key) instanceof Map) {
				return (Map<String, String>) map.get(key);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * 返回BigDecimal类型，不存在key则返回0
	 * 
	 * @Description
	 * @author gsh
	 * @param map
	 * @param key
	 * @return
	 */
	public static BigDecimal getBigDecimal(Map<String, Object> map,
			String key) {
		if (map.containsKey(key)) {
			if (map.get(key) instanceof BigDecimal) {
				return (BigDecimal) map.get(key);
			} else {
				return new BigDecimal(0);
			}
		} else {
			return new BigDecimal(0);
		}
	}
}
