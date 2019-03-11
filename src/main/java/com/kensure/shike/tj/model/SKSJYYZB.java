package com.kensure.shike.tj.model;

import co.kensure.frame.BaseInfo;
import co.kensure.mem.BeanUtils;

/**
 * 商家运营指标
 * 
 * @author fankd created on 2019-02-18
 * @since
 */
public class SKSJYYZB extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 日期 */
	private String day;
	/** 注册数 */
	private Integer zc;
	/** 已绑店铺商家数 */
	private Integer bddpsj;
	/** 绑定店铺数 */
	private Integer dp;
	/** 今日登陆商家数 */
	private Integer dlsj;
	/** 今日编辑活动商家数 */
	private Integer bjhdsj;
	/** 今日发布活动商家数 */
	private Integer fbhdsj;

	/**
	 * Gets the day.
	 *
	 * @return the day
	 */
	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Integer getZc() {
		return zc;
	}

	public void setZc(Integer zc) {
		this.zc = zc;
	}

	public Integer getBddpsj() {
		return bddpsj;
	}

	public void setBddpsj(Integer bddpsj) {
		this.bddpsj = bddpsj;
	}

	public Integer getDp() {
		return dp;
	}

	public void setDp(Integer dp) {
		this.dp = dp;
	}

	public Integer getDlsj() {
		return dlsj;
	}

	public void setDlsj(Integer dlsj) {
		this.dlsj = dlsj;
	}

	public Integer getBjhdsj() {
		return bjhdsj;
	}

	public void setBjhdsj(Integer bjhdsj) {
		this.bjhdsj = bjhdsj;
	}

	public Integer getFbhdsj() {
		return fbhdsj;
	}

	public void setFbhdsj(Integer fbhdsj) {
		this.fbhdsj = fbhdsj;
	}
	
	/**
	 * 合计
	 * @param obj
	 */
	public void setSum(SKSJYYZB obj) {
		// 计算合计
//		setZc(NumberUtils.integerAdd(this.getZc(), obj.getZc()));
//		setBddpsj(NumberUtils.integerAdd(this.getBddpsj(), obj.getBddpsj()));
//		setDp(NumberUtils.integerAdd(this.getDp(), obj.getDp()));
//		setDlsj(NumberUtils.integerAdd(this.getDlsj(), obj.getDlsj()));
//		setBjhdsj(NumberUtils.integerAdd(this.getBjhdsj(), obj.getBjhdsj()));
//		setFbhdsj(NumberUtils.integerAdd(this.getFbhdsj(), obj.getFbhdsj()));
		BeanUtils.beanSum(this, obj);
	}
}
