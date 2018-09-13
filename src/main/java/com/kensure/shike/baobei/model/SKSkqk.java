/*
 * 文件名称: SKSkqk.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;;

/**
 * 试客情况表对象类
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKSkqk extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝id*/		
	private Long bbid; 

	/**任务id*/		
	private Long rwid; 
	
	/**用户id*/	
	private Long userid; 

	/**1是开始,-1是手动取消,-2是自动取消,11是货比三家，21是收藏关注加购物车宝贝,51是中奖，61是确认宝贝、提交付款订单，71反馈好评晒图,99是完成任务*/		
	private Long status; 

	/**status最后为正值的状态*/		
	private Long lastStatus; 

	/**使用金币数量*/		
	private Long jinbi; 

	/**宝贝单价*/		
	private Double salePrice; 

	/**宝贝奖励*/		
	private Double jiangli; 
	
	/**宝贝*/		
	private SKBaobei baobei; 

	/**额外奖励*/		
	private Double ewai; 

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
	public Long getRwid() {
		return rwid;
	}

	public void setRwid(Long rwid) {
		this.rwid = rwid;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getLastStatus() {
		return lastStatus;
	}

	public void setLastStatus(Long lastStatus) {
		this.lastStatus = lastStatus;
	}
	public Long getJinbi() {
		return jinbi;
	}

	public void setJinbi(Long jinbi) {
		this.jinbi = jinbi;
	}
	public Double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}
	public Double getJiangli() {
		return jiangli;
	}

	public void setJiangli(Double jiangli) {
		this.jiangli = jiangli;
	}
	public Double getEwai() {
		return ewai;
	}

	public void setEwai(Double ewai) {
		this.ewai = ewai;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public SKBaobei getBaobei() {
		return baobei;
	}

	public void setBaobei(SKBaobei baobei) {
		this.baobei = baobei;
	}
}
