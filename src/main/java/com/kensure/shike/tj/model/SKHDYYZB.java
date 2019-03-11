package com.kensure.shike.tj.model;

import co.kensure.frame.BaseInfo;
import co.kensure.mem.BeanUtils;

/**
 * 商家运营指标
 * 
 * @author fankd created on 2019-02-18
 * @since
 */
public class SKHDYYZB extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 日期 */
	private String day;
	/** 发布活动数 */
	private Integer fbhd;
	/** 发布商品份数 */
	private Integer fbspfs;
	/** 新增服务费收入 */
	private Double fwfsr;
	/** 服务费结算收入 */
	private Double fwfjs;
	/** 服务费结算退款 */
	private Double fwftk;
	/** 冻结押金 */
	private Double yjdj;

	
	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public Integer getFbhd() {
		return fbhd;
	}


	public void setFbhd(Integer fbhd) {
		this.fbhd = fbhd;
	}


	public Integer getFbspfs() {
		return fbspfs;
	}


	public void setFbspfs(Integer fbspfs) {
		this.fbspfs = fbspfs;
	}


	public Double getFwfsr() {
		return fwfsr;
	}


	public void setFwfsr(Double fwfsr) {
		this.fwfsr = fwfsr;
	}


	public Double getFwfjs() {
		return fwfjs;
	}


	public void setFwfjs(Double fwfjs) {
		this.fwfjs = fwfjs;
	}


	public Double getFwftk() {
		return fwftk;
	}


	public void setFwftk(Double fwftk) {
		this.fwftk = fwftk;
	}


	public Double getYjdj() {
		return yjdj;
	}


	public void setYjdj(Double yjdj) {
		this.yjdj = yjdj;
	}


	/**
	 * 合计
	 */
	public void setSum(SKHDYYZB obj) {
		BeanUtils.beanSum(this, obj);
	}
}
