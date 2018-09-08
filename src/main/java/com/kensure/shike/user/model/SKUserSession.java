
package com.kensure.shike.user.model;

import co.kensure.frame.BaseInfo;;

/**
 * 用户会话信息
 * @author fankd created on 2018-9-2
 * @since
 */
public class SKUserSession extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;


	/**会话id*/		
	private String tokenId; 

	/**用户账号名称*/		
	private String name;

	public String getTokenId() {
		return tokenId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	} 

	

}
