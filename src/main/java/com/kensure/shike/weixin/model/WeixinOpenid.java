package com.kensure.shike.weixin.model;

import co.kensure.frame.BaseInfo;;

/**
 * 微信openid关联表对象类
 * @author fankd created on 2019-2-20
 * @since
 */
public class WeixinOpenid extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**微信openid*/		
	private String id; 

	/**令牌id*/		
	private String sessionid; 

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
}
