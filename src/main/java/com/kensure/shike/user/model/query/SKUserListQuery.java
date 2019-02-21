package com.kensure.shike.user.model.query;

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 试客用户查询对象
 * 
 */
public class SKUserListQuery extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 用户类型 */
	private Integer type;

	/** id */
	private Long id;

	/** 试客电话 */
	private String phone;

	/** QQ账号 */
	private String noQq;

	/** 支付宝账号 */
	private String noAlipay;

	/** 淘宝账号 */
	private String noTaobao;

	/** 推荐人id */
	private String refereeId;

	/** 审核状态 */
	private Integer auditStatus;
	/**
	 * 创建时间开始
	 */
	private Date startCreatedTime;

	/**
	 * 创建时间结束
	 */
	private Date endCreatedTime;
	
	/**
	 * 初次完成任务时间开始
	 */
	private Date startFirstShoptime;

	/**
	 * 初次完成任务时间结束
	 */
	private Date endFirstShoptime;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNoQq() {
		return noQq;
	}

	public void setNoQq(String noQq) {
		this.noQq = noQq;
	}

	public String getNoAlipay() {
		return noAlipay;
	}

	public void setNoAlipay(String noAlipay) {
		this.noAlipay = noAlipay;
	}

	public String getNoTaobao() {
		return noTaobao;
	}

	public void setNoTaobao(String noTaobao) {
		this.noTaobao = noTaobao;
	}

	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getRefereeId() {
		return refereeId;
	}

	public void setRefereeId(String refereeId) {
		this.refereeId = refereeId;
	}

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

	public Date getStartFirstShoptime() {
		return startFirstShoptime;
	}

	public void setStartFirstShoptime(Date startFirstShoptime) {
		this.startFirstShoptime = startFirstShoptime;
	}

	public Date getEndFirstShoptime() {
		return endFirstShoptime;
	}

	public void setEndFirstShoptime(Date endFirstShoptime) {
		this.endFirstShoptime = endFirstShoptime;
	}
	
}
