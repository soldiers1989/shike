/*
 * 文件名称: SKCMS.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-5
 * 修改内容: 
 */
package com.kensure.shike.sys.model;

import co.kensure.frame.BaseInfo;;

/**
 * 消息数据对象类
 * @author fankd created on 2018-10-5
 * @since
 */
public class SKCMS extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**类型id，1是消息中心*/		
	private Long typeid; 

	/**标题*/		
	private String title; 

	/**链接*/		
	private String url; 

	/**排序*/		
	private Long disorder; 
	
	/**内容*/		
	private String content; 

	/**状态，0是正在活动，1是删除*/		
	private Long isDel; 


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public Long getDisorder() {
		return disorder;
	}

	public void setDisorder(Long disorder) {
		this.disorder = disorder;
	}

	public Long getIsDel() {
		return isDel;
	}

	public void setIsDel(Long isDel) {
		this.isDel = isDel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
