/*
 * 文件名称: SKLogin.java
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

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 登录表对象类
 * @author fankd created on 2018-9-2
 * @since
 */
public class SKLogin extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**令牌id*/		
	private String sessionid; 

	/**用户id*/		
	private Long userid; 

	/**设备信息*/		
	private String agentno; 

	/**设备类型*/		
	private String agentnoType; 

	/**最终ip*/		
	private String cip; 

	/**直接ip*/		
	private String dip; 

	/**状态，0是正常，-1是停用*/		
	private Long status; 

	/**失效时间*/		
	private Date invalidTime; 


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getAgentno() {
		return agentno;
	}

	public void setAgentno(String agentno) {
		this.agentno = agentno;
	}
	public String getAgentnoType() {
		return agentnoType;
	}

	public void setAgentnoType(String agentnoType) {
		this.agentnoType = agentnoType;
	}
	public String getCip() {
		return cip;
	}

	public void setCip(String cip) {
		this.cip = cip;
	}
	public String getDip() {
		return dip;
	}

	public void setDip(String dip) {
		this.dip = dip;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Date getInvalidTime() {
		return invalidTime;
	}

	public void setInvalidTime(Date invalidTime) {
		this.invalidTime = invalidTime;
	}
}
