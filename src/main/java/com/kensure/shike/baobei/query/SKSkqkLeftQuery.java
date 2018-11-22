package com.kensure.shike.baobei.query;

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 试客情况查询对象
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKSkqkLeftQuery extends BaseInfo {

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

	/** 淘宝账号 */
	private String noTaobao;
	
	/** 试客电话 */
	private String skphone;
	
	/** 宝贝名称 */
	private String title;
	
	/** 店铺名称 */
	private String dpname;
	
	/** 商家名称 */
	private String sjname;
	
	private Date startCreatedTime;
	
	private Date endCreatedTime;

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



	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	
	public String getNoTaobao() {
		return noTaobao;
	}

	public void setNoTaobao(String noTaobao) {
		this.noTaobao = noTaobao;
	}

	public Date getStartCreatedTime() {
		return startCreatedTime;
	}

	public void setStartCreatedTime(Date startCreatedTime) {
		this.startCreatedTime = startCreatedTime;
	}

	public Date getEndCreatedTime() {
		return endCreatedTime;
	}

	public void setEndCreatedTime(Date endCreatedTime) {
		this.endCreatedTime = endCreatedTime;
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

	
}
