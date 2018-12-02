/*
 * 文件名称: SKTaobao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-11-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;;

/**
 * 淘宝账号信息对象类
 * @author fankd created on 2018-11-11
 * @since
 */
public class SKTaobao extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private String id;

	/**是否实名认证，1实名，2未实名*/		
	private String shiming; 

	/**注册时间*/		
	private String regTime; 

	/**总计买了几单*/		
	private Integer buyerTotalPoint; 

	/**每周几单*/		
	private String weekAvg; 

	/**好评率*/		
	private Integer sellerGoodRate; 

	/**会员等级*/		
	private Integer vip; 

	/**男号女号*/		
	private String sex; 

	/**活跃度点数*/		
	private Integer activePoint; 

	/**活跃度等级*/		
	private Integer activeLevel;

	/**淘气值*/
	private Integer taoqizhi;

	/**是否获取信息，0是未同步，1是已经同步,-1是同步失败*/		
	private Integer flag; 

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getShiming() {
		return shiming;
	}

	public void setShiming(String shiming) {
		this.shiming = shiming;
	}
	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public Integer getBuyerTotalPoint() {
		return buyerTotalPoint;
	}

	public void setBuyerTotalPoint(Integer buyerTotalPoint) {
		this.buyerTotalPoint = buyerTotalPoint;
	}
	public String getWeekAvg() {
		return weekAvg;
	}

	public void setWeekAvg(String weekAvg) {
		this.weekAvg = weekAvg;
	}
	public Integer getSellerGoodRate() {
		return sellerGoodRate;
	}

	public void setSellerGoodRate(Integer sellerGoodRate) {
		this.sellerGoodRate = sellerGoodRate;
	}
	public Integer getVip() {
		return vip;
	}

	public void setVip(Integer vip) {
		this.vip = vip;
	}
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getActivePoint() {
		return activePoint;
	}

	public void setActivePoint(Integer activePoint) {
		this.activePoint = activePoint;
	}
	public Integer getActiveLevel() {
		return activeLevel;
	}

	public void setActiveLevel(Integer activeLevel) {
		this.activeLevel = activeLevel;
	}
	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Integer getTaoqizhi() {
		return taoqizhi;
	}

	public void setTaoqizhi(Integer taoqizhi) {
		this.taoqizhi = taoqizhi;
	}
}
