package com.kensure.shike.constant;

/**
 * kv结构
 * 
 * @author fankd created on 2018-3-13
 * @since
 */
public class KVBean {

	private String key;
	private String name;

	public KVBean(){}
	
	public KVBean(String key,String name){
		this.key = key;
		this.name = name;
	}
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
