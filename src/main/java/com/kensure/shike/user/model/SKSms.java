/*
 * 文件名称: SKSms.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-2
 * 修改内容: 
 */
package com.kensure.shike.user.model;

import co.kensure.frame.BaseInfo;;

/**
 * 短信表对象类
 * @author fankd created on 2018-9-2
 * @since
 */
public class SKSms extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**手机号码*/		
	private String mobile; 

	/**用id*/		
	private Long userid; 

	/**验证码*/		
	private String qrcode; 

	/**1是验证码*/		
	private Integer type; 

	/**状态，0是未使用，1已经使用*/		
	private Long status; 

	/**发送状态*/		
	private Long fscount; 


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getFscount() {
		return fscount;
	}

	public void setFscount(Long fscount) {
		this.fscount = fscount;
	}
}
