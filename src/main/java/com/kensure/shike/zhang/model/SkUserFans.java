package com.kensure.shike.zhang.model;

import co.kensure.frame.BaseInfo;

/**
 * 代言人粉丝流水表对象类
 */
public class SkUserFans extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**用户id*/		
	private Long userid; 

	/**推荐人id*/		
	private Long refereeId; 

	/**业务类型id 1:首单奖励，2:下单奖励*/		
	private Long typeid;

	private String typeidStr;

	/**原金额*/		
	private Double originJine;

	/**比例*/		
	private int bili;

	/**金额*/		
	private Double jine;

	/**状态，0是待下单，1是即将到账，9是已到账，-1是作废*/
	private Long status; 

	/**描述*/		
	private String remark; 


	// 粉丝姓名
	private String name;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public Long getRefereeId() {
		return refereeId;
	}

	public void setRefereeId(Long refereeId) {
		this.refereeId = refereeId;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}

	public String getTypeidStr() {
		if (typeid != null) {
			if (typeid == 1) {
				typeidStr =  "10元首单奖";
			} else if (typeid == 2) {
				typeidStr =  "下单奖励";
			}
		}
		return typeidStr;
	}

	public Double getOriginJine() {
		return originJine;
	}

	public void setOriginJine(Double originJine) {
		this.originJine = originJine;
	}
	public int getBili() {
		return bili;
	}

	public void setBili(int bili) {
		this.bili = bili;
	}
	public Double getJine() {
		return jine;
	}

	public void setJine(Double jine) {
		this.jine = jine;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
