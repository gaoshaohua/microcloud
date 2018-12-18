package com.micro.cloud.frame.kit;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;

public class BeanKit {
	public static void null2Default(Object bean) {
		Field[] field = bean.getClass().getDeclaredFields();
		for (int i = 0; i < field.length; i++) { // 遍历所有属性
			String name = field[i].getName(); // 获取属性的名字
			name = name.substring(0, 1).toUpperCase() + name.substring(1); // 将属性的首字符大写，方便构造get，set方法
			String type = field[i].getGenericType().toString(); // 获取属性的类型
			if (type.equals("class java.lang.Integer")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					Integer value = (Integer) m.invoke(bean);
					if (value == null) {
						m = bean.getClass().getMethod("set" + name,
								Integer.class);
						m.invoke(bean, 0);
					}
				} catch (Exception e) {

				}
			} else if (type.equals("class java.lang.Double")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					Integer value = (Integer) m.invoke(bean);
					if (value == null) {
						m = bean.getClass().getMethod("set" + name,
								Double.class);
						m.invoke(bean, 0);
					}
				} catch (Exception e) {

				}
			} else if (type.equals("class java.lang.Long")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					Integer value = (Integer) m.invoke(bean);
					if (value == null) {
						m = bean.getClass().getMethod("set" + name, Long.class);
						m.invoke(bean, 0);
					}
				} catch (Exception e) {

				}
			} else if (type.equals("class java.lang.String")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					Integer value = (Integer) m.invoke(bean);
					if (value == null) {
						m = bean.getClass().getMethod("set" + name,
								String.class);
						m.invoke(bean, "");
					}
				} catch (Exception e) {

				}
			} else if (type.equals("class java.math.BigDecimal")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					Integer value = (Integer) m.invoke(bean);
					if (value == null) {
						m = bean.getClass().getMethod("set" + name,
								BigDecimal.class);
						m.invoke(bean, new BigDecimal(0));
					}
				} catch (Exception e) {

				}
			}
		}
	}

	public static void empty2Null(Object bean) {
		Field[] field = bean.getClass().getDeclaredFields();
		for (int i = 0; i < field.length; i++) { // 遍历所有属性
			String name = field[i].getName(); // 获取属性的名字
			name = name.substring(0, 1).toUpperCase() + name.substring(1); // 将属性的首字符大写，方便构造get，set方法
			String type = field[i].getGenericType().toString(); // 获取属性的类型
			if (type.equals("class java.lang.String")) {
				try {
					Method m = bean.getClass().getMethod("get" + name);
					String value = (String) m.invoke(bean);
					if (StringKit.isEmpty(value)) {
						m = bean.getClass().getMethod("set" + name,
								String.class);
						m.invoke(bean, null);
					}
				} catch (Exception e) {

				}
			}
		}
	}
}
