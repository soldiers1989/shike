/*
 * 文件名称: SKWord.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;;

/**
 * 关键词对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKWord extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝活动id*/		
	private Long bbid; 

	/**关键词*/		
	private String word; 

	/**排序方式*/		
	private Integer ordermethod; 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getBbid() {
		return bbid;
	}

	public void setBbid(Long bbid) {
		this.bbid = bbid;
	}
	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	public Integer getOrdermethod() {
		return ordermethod;
	}

	public void setOrdermethod(Integer ordermethod) {
		this.ordermethod = ordermethod;
	}

}
