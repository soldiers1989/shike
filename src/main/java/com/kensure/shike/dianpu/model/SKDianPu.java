/*
 * 文件名称: SKDianPu.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.dianpu.model;

import co.kensure.frame.BaseInfo;;

/**
 * 店铺对象类
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKDianPu extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**用户id*/		
	private Long userid; 

	/**店铺名称*/		
	private String name; 

	/**店铺类型，1是天猫淘宝*/		
	private Long typeid; 

	/**店铺链接*/		
	private String url; 

	/**状态，0是正常，-1是停用*/		
	private Long status; 
	
	/**店铺旺旺*/		
	private String wangwang; 
	
	/**卖家图片*/		
	private String mjtp; 
	
	/**负责人qq*/		
	private String qq; 
	
	/**负责人微信*/		
	private String weixin;
	
	/**负责人手机*/		
	private String phone; 
	
	private String userName;

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
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Long getTypeid() {
		return typeid;
	}

	public String getTypeidStr() {
		String temp = "";
		if(typeid == 1L){
			temp = "天猫/淘宝";
		}
		return temp;
	}
	
	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	
	public String getStatusStr() {
		String temp = "未审核";
		if(status == 9){
			temp = "已审核";
		}
		return temp;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getWangwang() {
		return wangwang;
	}

	public void setWangwang(String wangwang) {
		this.wangwang = wangwang;
	}

	public String getMjtp() {
		return mjtp;
	}

	public void setMjtp(String mjtp) {
		this.mjtp = mjtp;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
