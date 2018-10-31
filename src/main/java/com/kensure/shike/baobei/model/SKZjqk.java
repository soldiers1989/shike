/*
 * 文件名称: SKZjqk.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-31
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import com.kensure.shike.user.model.SKUser;

import co.kensure.frame.BaseInfo;;

/**
 * 试客中奖情况对象类
 * @author fankd created on 2018-10-31
 * @since
 */
public class SKZjqk extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝id*/		
	private Long bbid; 

	/**用户id*/		
	private Long userid; 

	/**申请id*/		
	private Long sqqkid; 

	/**日期描述，查询用*/		
	private String daydes; 

	/**短息状态，0是未发，1是发送成功，-1是发送失败*/		
	private Long status; 

	private SKUser user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getBbid() {
		return bbid;
	}

	public void setBbid(Long bbid) {
		this.bbid = bbid;
	}
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public Long getSqqkid() {
		return sqqkid;
	}

	public void setSqqkid(Long sqqkid) {
		this.sqqkid = sqqkid;
	}
	public String getDaydes() {
		return daydes;
	}

	public void setDaydes(String daydes) {
		this.daydes = daydes;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public SKUser getUser() {
		return user;
	}

	public void setUser(SKUser user) {
		this.user = user;
	}
	
}
