package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;

/**
 * 支付信息
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKPayInfo extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 主键 */
	private Long id;

	/** 费用名称 */
	private String name;

	/** 费用明细 */
	private String detail;

	/** 小计 */
	private Double xiaoji;

	public SKPayInfo() {
	}

	public SKPayInfo(String name, String detail, Double xiaoji) {
		this.name = name;
		this.detail = detail;
		this.xiaoji = xiaoji;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Double getXiaoji() {
		return xiaoji;
	}

	public void setXiaoji(Double xiaoji) {
		this.xiaoji = xiaoji;
	}

}
