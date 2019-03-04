package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;

;

/**
 * 任务详情对象类
 * 
 * @author fankd created on 2019-3-4
 * @since
 */
public class SKBbrwDetail extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 主键 */
	private Long id;

	/** 宝贝任务id */
	private Long bbrwid;

	/** 宝贝id */
	private Long bbid;

	/** 宝贝数量 */
	private Long bbnum;

	/** 已中奖数量 */
	private Long yzj;

	/** 限制小时开始 */
	private Long hour1;

	/** 限制小时结束 */
	private Long hour2;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getBbrwid() {
		return bbrwid;
	}

	public void setBbrwid(Long bbrwid) {
		this.bbrwid = bbrwid;
	}

	public Long getBbid() {
		return bbid;
	}

	public void setBbid(Long bbid) {
		this.bbid = bbid;
	}

	public Long getBbnum() {
		return bbnum;
	}

	public void setBbnum(Long bbnum) {
		this.bbnum = bbnum;
	}

	public Long getYzj() {
		return yzj;
	}

	public void setYzj(Long yzj) {
		this.yzj = yzj;
	}

	public Long getHour1() {
		return hour1;
	}

	public void setHour1(Long hour1) {
		this.hour1 = hour1;
	}

	public Long getHour2() {
		return hour2;
	}

	public void setHour2(Long hour2) {
		this.hour2 = hour2;
	}
	
}
