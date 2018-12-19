package com.micro.cloud.kit;

import java.util.List;

import com.google.common.collect.Lists;
import com.micro.cloud.frame.commons.enums.CacheEnums;
import com.micro.cloud.frame.kit.CacheKit;
import com.micro.cloud.frame.kit.Constant;
import com.micro.cloud.frame.kit.SpringKit;
import com.micro.cloud.sys.entity.Dictionary;
import com.micro.cloud.sys.service.IDictionaryService;
import com.micro.cloud.sys.service.impl.DictionaryServiceImpl;

/**
 * 字典工具
 * 
 * @Description
 * @author gsh
 * @date 2018年6月25日 下午4:24:26
 */
public class DicKit {
	private static IDictionaryService dictionaryService = SpringKit
			.getBean(DictionaryServiceImpl.class);

	/**
	 * 获取所有字典
	 */
	@SuppressWarnings("unchecked")
	public static List<Dictionary> getDicts() {
		List<Dictionary> dictionarys = (List<Dictionary>) CacheKit
				.get(CacheEnums.sysDictCache, Constant.SYS_DICT_CACHE);
		if (dictionarys == null) {
			dictionarys = dictionaryService.findAll(null);
			CacheKit.put(CacheEnums.sysDictCache, Constant.SYS_DICT_CACHE,
					dictionarys);
		}
		return dictionarys == null ? Lists.newArrayList() : dictionarys;
	}

	/**
	 * 根据type获取所有字典
	 */
	public static List<Dictionary> getDicts(String type) {
		List<Dictionary> dictionarys = getDicts();
		List<Dictionary> dicts = Lists.newArrayList();
		for (Dictionary dict : dictionarys) {
			if (dict.getType().startsWith(type)) {
				dicts.add(dict);
			}
		}
		return dicts;
	}

	/**
	 * 根据type,value获取数据字典
	 */
	public static Dictionary getDict(String type, String value) {
		List<Dictionary> dictionarys = getDicts();
		Dictionary dictionary = null;
		for (Dictionary dict : dictionarys) {
			if (dict.getType().startsWith(type)
					&& dict.getValue().equals(value)) {
				dictionary = dict;
				break;
			}
		}
		return dictionary;
	}

	/**
	 * 根据type获取label
	 */
	public static String getDictLabel(String type, String value) {
		Dictionary dict = getDict(type, value);
		return dict == null ? "" : dict.getLabel();
	}

	/**
	 * 根据type,value获取value
	 */
	public static String getDictValue(String type, String value) {
		Dictionary dict = getDict(type, value);
		return dict == null ? "" : dict.getValue();
	}
}
