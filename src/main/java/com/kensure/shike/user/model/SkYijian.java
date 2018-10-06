package com.kensure.shike.user.model;

import co.kensure.frame.BaseInfo;;

/**
 * 意见反馈表对象类
 */
public class SkYijian extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**用户id*/		
	private Long userid; 

	/**手机号码*/		
	private String phone;

	/**qq*/		
	private String qq; 

	/**微信*/		
	private String wchat; 

	/**类型 1:新功能建议 2:功能异常 3:体验问题 4:服务投诉 5:活动问题 6:其他*/		
	private Long typeid; 

	/**描述内容*/		
	private String content; 

	/**图片url*/		
	private String pictureUrl; 

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
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWchat() {
		return wchat;
	}

	public void setWchat(String wchat) {
		this.wchat = wchat;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
}
