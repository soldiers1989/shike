/*
 * 文件名称: SKUserInout.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.chongzhi.model;

import co.kensure.frame.BaseInfo;

/**
 * 用余额充值和提现记录对象类
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKUserInout extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**用户id*/		
	private Long userid; 

	/**商家充值 1 用户提现 2*/		
	private Long typeid; 

	/**充值方式，1是支付宝，2是银行卡*/		
	private Long fangshi; 

	/**支付宝交易号，打款方账户名*/		
	private String jiaoyihao; 

	/**金额*/		
	private Double jine; 

	/**流程状态，1是已提交，-1是核对不通过，9是已确认*/		
	private Long status; 

	/**提现或者充值账号*/		
	private String zhanghao; 

	/**描述*/		
	private String remark; 

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
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public Long getFangshi() {
		return fangshi;
	}

	public void setFangshi(Long fangshi) {
		this.fangshi = fangshi;
	}
	public String getJiaoyihao() {
		return jiaoyihao;
	}

	public void setJiaoyihao(String jiaoyihao) {
		this.jiaoyihao = jiaoyihao;
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
	
	public String getStatusStr() {
		String temp = "";
		switch(status.intValue()){
		case 1:
			temp = "申请中";
		    break;
		case -1:
			temp = "核对不通过";
		    break;
		case 9:
			temp = "已入账";
		    break;
		default:
		    break;
		}
		return temp;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public String getZhanghao() {
		return zhanghao;
	}

	public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
	}
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
