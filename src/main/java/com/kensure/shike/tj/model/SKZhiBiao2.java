package com.kensure.shike.tj.model;

import co.kensure.frame.BaseInfo;

/**
 * 统计用的一个对象
 * @author fankd created on 2019-02-18
 * @since
 */
public class SKZhiBiao2 extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**日期*/		
	private String day;

	/**金额*/		
	private Double cnt = 0D;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Double getCnt() {
		return cnt;
	}

	public void setCnt(Double cnt) {
		this.cnt = cnt;
	}
}
