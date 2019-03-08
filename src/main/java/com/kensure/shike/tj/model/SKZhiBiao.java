package com.kensure.shike.tj.model;

import co.kensure.frame.BaseInfo;

/**
 * 统计用的一个对象
 * @author fankd created on 2019-02-18
 * @since
 */
public class SKZhiBiao extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**日期*/		
	private String day;

	/**个数*/		
	private Integer cnt;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
}
