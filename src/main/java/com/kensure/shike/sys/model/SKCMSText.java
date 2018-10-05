/*
 * 文件名称: SKCMSText.java
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
 * 消息数据文本对象类
 * @author fankd created on 2018-10-5
 * @since
 */
public class SKCMSText extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝详情*/		
	private String content; 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
