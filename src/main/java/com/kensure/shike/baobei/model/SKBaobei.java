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
import java.util.List;

import co.kensure.frame.BaseInfo;
import co.kensure.mem.DateUtils;
import co.kensure.mem.StringKSUtils;

/**
 * 商品活动表对象类
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKBaobei extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/** 主键 */
	private Long id;

	/** 用户id */
	private Long userid;
	
	/** 用户名称 */
	private String userName;

	/** 店铺id */
	private Long dpid;
	
	/** 店铺名称 */
	private String dpname;
	
	/** 宝贝标题 */
	private String title;

	/** 宝贝链接 */
	private String url;

	/** 淘口令 */
	private String taokl;

	/** 宝贝主图链接 */
	private String zturl;

	/** 宝贝单价 */
	private Double salePrice;

	/** 宝贝奖励 */
	private Double jiangli;

	/** 宝贝数量 */
	private Long bbnum;

	/** 申请数量 */
	private Long sqnum;

	/** 已经申请数量 */
	private Long ysqnum;
	
	/** 中奖数量 */
	private Long zjnum;
	
	/** 转换率 */
	private String zhuanhua;

	/** 联系qq账号 */
	private String noQq;

	/** 商品规格 */
	private String guige;

	/** 宝贝分类 */
	private String typedes;

	/** 宝贝分类id */
	private Long typeid;

	/** 是否包邮，1是包邮，0是不包邮 */
	private Long baoyou;

	/** 是否有增值服务，0是没有，1是有 */
	private Long zengzhi;

	/** 应付款项 */
	private Double yingshou;

	/** 流程状态，0是正常，1是申请，2是拒绝通过，9是申请通过 ,10是活动结束*/
	private Long status;

	/** 状态，0是正在活动，1是删除 */
	private Long isDel;

	/** 活动类型id */
	private Long hdtypeid;

	/** 活动开始时间 */
	private Date startTime;

	/** 活动结束时间 */
	private Date endTime;

	/** 排序 */
	private Long disorder;

	/** 允许使用信用卡 1是允许，0是不允许 */
	private Integer xinyongka;

	/** 允许使用花呗 1是允许，0是不允许 */
	private Integer huabei;

	/** 是否需要晒图 1是需要，0是不用 */
	private Integer shaitu;

	/** 是否需要旺旺聊天 1是需要，0是不用 */
	private Integer wangwang;

	/** 宝贝详情 */
	private SKBaobeiZT xiangqing;

	/** 图片列表 */
	private List<SKBaobeiTP> tplist;

	/** 进店路径 */
	private List<SKJindian> jdlist;

	/** 查询关键字 */
	private List<SKWord> wordlist;

	/** 宝贝任务 */
	private List<SKBbrw> bbrwlist;

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

	public Double getYingshou() {
		return yingshou;
	}

	public void setYingshou(Double yingshou) {
		this.yingshou = yingshou;
	}

	public Long getStatus() {
		return status;
	}
	/** 流程状态，0是正常，1是申请，2是拒绝通过，9是申请通过 ,10是活动结束*/
	public String getStatusStr() {
		String temp = "";
		if(status == 0){
			temp = "未付款";
		}else if(status == 1){
			temp = "已付款";
		}else if(status == 2){
			temp = "拒绝通过";
		}else if(status == 9){
			temp = "通过申请";
		}else if(status == 10){
			temp = "活动结束";
		}	
		return temp;
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
	
	public String getStartTimeStr() {
		return DateUtils.format(startTime,DateUtils.DAY_FORMAT);
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
	
	public String getEndTimeStr() {
		return DateUtils.format(endTime,DateUtils.DAY_FORMAT);
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

	public SKBaobeiZT getXiangqing() {
		return xiangqing;
	}

	public void setXiangqing(SKBaobeiZT xiangqing) {
		this.xiangqing = xiangqing;
	}

	public List<SKBaobeiTP> getTplist() {
		return tplist;
	}

	public void setTplist(List<SKBaobeiTP> tplist) {
		this.tplist = tplist;
	}

	public List<SKJindian> getJdlist() {
		return jdlist;
	}

	public void setJdlist(List<SKJindian> jdlist) {
		this.jdlist = jdlist;
	}

	public List<SKWord> getWordlist() {
		return wordlist;
	}

	public void setWordlist(List<SKWord> wordlist) {
		this.wordlist = wordlist;
	}

	public List<SKBbrw> getBbrwlist() {
		return bbrwlist;
	}

	public void setBbrwlist(List<SKBbrw> bbrwlist) {
		this.bbrwlist = bbrwlist;
	}

	public Long getYsqnum() {
		return ysqnum;
	}

	public void setYsqnum(Long ysqnum) {
		this.ysqnum = ysqnum;
	}

	public String getDpname() {
		return dpname;
	}

	public void setDpname(String dpname) {
		this.dpname = dpname;
	}

	public String getDpnameS() {
		return StringKSUtils.doMedDouble(dpname);
	}

	public Long getZjnum() {
		return zjnum;
	}

	public void setZjnum(Long zjnum) {
		this.zjnum = zjnum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
