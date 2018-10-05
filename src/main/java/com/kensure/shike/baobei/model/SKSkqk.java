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

import java.util.Date;
import java.util.List;

import co.kensure.frame.BaseInfo;

/**
 * 试客情况表对象类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKSkqk extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 主键 */
	private Long id;

	/** 宝贝id */
	private Long bbid;

	/** 任务id */
	private Long rwid;

	/** 用户id */
	private Long userid;

	/**
	 * 0是未中奖,1是开始,-1是手动取消,-2是自动取消,11是货比三家，18是加购物车宝贝
	 * 21是收藏关注,51是中奖，61是确认宝贝、提交付款订单，71收到货了， 81反馈好评晒图,99是完成任务
	 */
	private Long status;

	/** status最后为正值的状态 */
	private Long lastStatus;

	/** 使用金币数量 */
	private Long jinbi;

	/** 宝贝单价 */
	private Double salePrice;

	/** 宝贝奖励 */
	private Double jiangli;

	/**
	 * 下一步限制的时间
	 */
	private Date nextTime;

	/** 宝贝 */
	private SKBaobei baobei;

	/** 额外奖励 */
	private Double ewai;

	/** 淘宝账号 */
	private String noTaobao;

	/** 校验数据 */
	private List<SKJysj> jylist;

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

	public String getNoTaobao() {
		return noTaobao;
	}

	public void setNoTaobao(String noTaobao) {
		this.noTaobao = noTaobao;
	}

	public List<SKJysj> getJylist() {
		return jylist;
	}

	public void setJylist(List<SKJysj> jylist) {
		this.jylist = jylist;
	}

	public String getStatusStr() {
		String temp = "";
		if (81 == this.status) {
			temp = "已经好评";
		} else if (99 == this.status) {
			temp = "已经返款";
		}
		return temp;
	}

	public Date getNextTime() {
		return nextTime;
	}

	public void setNextTime(Date nextTime) {
		this.nextTime = nextTime;
	}

	public String getNextTimeStr() {
        if (nextTime == null) {
            return null;
        }
		Date now = new Date();
		String time = "";
		if (now.getTime() < nextTime.getTime()) {
			// 分钟
			long fenzhong = (nextTime.getTime() - now.getTime()) / 1000 / 60;
			time = fenzhong % 60 + "分钟";
			if (fenzhong >= 60) {
				long xiaoshi = fenzhong / 60;
				time = xiaoshi % 24 + "小时" + time;
				if (xiaoshi >= 24) {
					long tian = xiaoshi / 24;
					time = tian + "天" + time;
				}
			}
		}
		return time;
	}
}
