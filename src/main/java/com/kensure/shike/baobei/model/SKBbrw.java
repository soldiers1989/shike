/*
 * 文件名称: SKBbrw.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 宝贝试客任务对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKBbrw extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝id*/		
	private Long bbid; 

	/**0是未开始，1是开始,-1是结束*/		
	private Long status; 

	/**宝贝数量*/		
	private Long bbnum; 

	/**申请数量*/		
	private Long sqnum; 

	/**转换率*/		
	private String zhuanhua; 

	/**日期描述，查询用*/		
	private String daydes; 

	/**已申请数量*/		
	private Long ysqnum; 

	/**活动开始时间*/		
	private Date startTime; 

	/**活动结束时间*/		
	private Date endTime; 

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
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getBbnum() {
		return bbnum;
	}

	public void setBbnum(Long bbnum) {
		this.bbnum = bbnum;
	}
	public Long getSqnum() {
		return sqnum;
	}

	public void setSqnum(Long sqnum) {
		this.sqnum = sqnum;
	}
	public String getZhuanhua() {
		return zhuanhua;
	}

	public void setZhuanhua(String zhuanhua) {
		this.zhuanhua = zhuanhua;
	}
	public String getDaydes() {
		return daydes;
	}

	public void setDaydes(String daydes) {
		this.daydes = daydes;
	}
	public Long getYsqnum() {
		return ysqnum;
	}

	public void setYsqnum(Long ysqnum) {
		this.ysqnum = ysqnum;
	}
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}
