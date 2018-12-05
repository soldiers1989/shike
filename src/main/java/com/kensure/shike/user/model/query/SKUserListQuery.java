package com.kensure.shike.user.model.query;

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
	
	/**审核状态*/
	private Integer auditStatus;

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
	
}
