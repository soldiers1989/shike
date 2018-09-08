/*
 * 文件名称: SKBaobei.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import java.util.Date;

import co.kensure.frame.BaseInfo;

/**
 * 商品活动表对象类
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKBaobei extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**用户id*/		
	private Long userid; 

	/**店铺id*/		
	private Long dpid; 

	/**宝贝标题*/		
	private String title; 

	/**宝贝链接*/		
	private String url; 

	/**淘口令*/		
	private String taokl; 

	/**宝贝主图链接*/		
	private String zturl; 

	/**宝贝单价*/		
	private java.math.BigDecimal salePrice; 

	/**宝贝奖励*/		
	private java.math.BigDecimal jiangli; 

	/**宝贝数量*/		
	private Long bbnum; 

	/**申请数量*/		
	private Long sqnum; 

	/**转换率*/		
	private String zhuanhua; 

	/**联系qq账号*/		
	private String noQq; 

	/**商品规格*/		
	private String guige; 

	/**宝贝分类*/		
	private String typedes; 

	/**宝贝分类id*/		
	private Long typeid; 

	/**是否包邮，1是包邮，0是不包邮*/		
	private Long baoyou; 

	/**是否有增值服务，0是没有，1是有*/		
	private Long zengzhi; 

	/**应付款项*/		
	private java.math.BigDecimal yingshou; 

	/**流程状态，0是正常，1是申请，2是拒绝通过，9是申请通过*/		
	private Long status; 

	/**状态，1是正在活动，-1是删除，2是活动结束*/		
	private Long isDel; 

	/**活动类型id*/		
	private Long hdtypeid; 

	/**活动开始时间*/		
	private Date startTime; 

	/**活动结束时间*/		
	private Date endTime; 

	/**排序*/		
	private Long disorder; 

	/**允许使用信用卡 1是允许，0是不允许*/		
	private Integer xinyongka; 

	/**允许使用花呗 1是允许，0是不允许*/		
	private Integer huabei; 

	/**是否需要晒图 1是需要，0是不用*/		
	private Integer shaitu; 

	/**是否需要旺旺聊天 1是需要，0是不用*/		
	private Integer wangwang; 

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
	public Long getDpid() {
		return dpid;
	}

	public void setDpid(Long dpid) {
		this.dpid = dpid;
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
	public String getTaokl() {
		return taokl;
	}

	public void setTaokl(String taokl) {
		this.taokl = taokl;
	}
	public String getZturl() {
		return zturl;
	}

	public void setZturl(String zturl) {
		this.zturl = zturl;
	}
	public java.math.BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(java.math.BigDecimal salePrice) {
		this.salePrice = salePrice;
	}
	public java.math.BigDecimal getJiangli() {
		return jiangli;
	}

	public void setJiangli(java.math.BigDecimal jiangli) {
		this.jiangli = jiangli;
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
	public String getNoQq() {
		return noQq;
	}

	public void setNoQq(String noQq) {
		this.noQq = noQq;
	}
	public String getGuige() {
		return guige;
	}

	public void setGuige(String guige) {
		this.guige = guige;
	}
	public String getTypedes() {
		return typedes;
	}

	public void setTypedes(String typedes) {
		this.typedes = typedes;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public Long getBaoyou() {
		return baoyou;
	}

	public void setBaoyou(Long baoyou) {
		this.baoyou = baoyou;
	}
	public Long getZengzhi() {
		return zengzhi;
	}

	public void setZengzhi(Long zengzhi) {
		this.zengzhi = zengzhi;
	}
	public java.math.BigDecimal getYingshou() {
		return yingshou;
	}

	public void setYingshou(java.math.BigDecimal yingshou) {
		this.yingshou = yingshou;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getIsDel() {
		return isDel;
	}

	public void setIsDel(Long isDel) {
		this.isDel = isDel;
	}
	public Long getHdtypeid() {
		return hdtypeid;
	}

	public void setHdtypeid(Long hdtypeid) {
		this.hdtypeid = hdtypeid;
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
	public Long getDisorder() {
		return disorder;
	}

	public void setDisorder(Long disorder) {
		this.disorder = disorder;
	}
	public Integer getXinyongka() {
		return xinyongka;
	}

	public void setXinyongka(Integer xinyongka) {
		this.xinyongka = xinyongka;
	}
	public Integer getHuabei() {
		return huabei;
	}

	public void setHuabei(Integer huabei) {
		this.huabei = huabei;
	}
	public Integer getShaitu() {
		return shaitu;
	}

	public void setShaitu(Integer shaitu) {
		this.shaitu = shaitu;
	}
	public Integer getWangwang() {
		return wangwang;
	}

	public void setWangwang(Integer wangwang) {
		this.wangwang = wangwang;
	}
	
}
