/*
 * 文件名称: SKZjqk.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-31
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;

/**
 * 试客中奖情况统计对象类
 * @author fankd created on 2018-10-31
 * @since
 */
public class SKZjqkCount extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	
	/**用户id*/		
	private Long userid; 

	/**中奖数量*/		
	private Integer cnt;

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	} 

	
	
}
