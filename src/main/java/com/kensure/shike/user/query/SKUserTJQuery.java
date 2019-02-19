package com.kensure.shike.user.query;

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 用户推荐情况查询对象
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKUserTJQuery extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;
	
	private Date startCreatedTime;
	
	private Date endCreatedTime;

	
	public Date getStartCreatedTime() {
		return startCreatedTime;
	}

	public void setStartCreatedTime(Date startCreatedTime) {
		this.startCreatedTime = startCreatedTime;
	}

	public Date getEndCreatedTime() {
		return endCreatedTime;
	}

	public void setEndCreatedTime(Date endCreatedTime) {
		this.endCreatedTime = endCreatedTime;
	}

}
