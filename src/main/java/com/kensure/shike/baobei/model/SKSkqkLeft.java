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

import co.kensure.frame.BaseInfo;

import com.kensure.shike.sys.model.SKDict;
import com.kensure.shike.sys.service.SKDictService;

/**
 * 试客情况表对象类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKSkqkLeft extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 主键 */
	private Long id;

	/** 宝贝id */
	private Long bbid;

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
	
	/** 试客电话 */
	private String skphone;
	
	/** 宝贝名称 */
	private String title;
	
	/** 宝贝链接 */
	private String url;
	
	/** 店铺名称 */
	private String dpname;
	
	/** 商家名称 */
	private String sjname;

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

	public String getStatusStr() {
		SKDict dict = SKDictService.getDictCache(6, this.status + "");
		String temp = "";
		if (dict != null) {
			temp = dict.getName();
		}
		return temp;
	}

	public Date getNextTime() {
		return nextTime;
	}

	public void setNextTime(Date nextTime) {
		this.nextTime = nextTime;
	}

	public String getSkphone() {
		return skphone;
	}

	public void setSkphone(String skphone) {
		this.skphone = skphone;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDpname() {
		return dpname;
	}

	public void setDpname(String dpname) {
		this.dpname = dpname;
	}

	public String getSjname() {
		return sjname;
	}

	public void setSjname(String sjname) {
		this.sjname = sjname;
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
