package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;

/**
 * 状态类方法
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKGroupStatus extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 状态编码 */
	private Integer status;

	/** 统计数量 */
	private Integer cnt;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

}
