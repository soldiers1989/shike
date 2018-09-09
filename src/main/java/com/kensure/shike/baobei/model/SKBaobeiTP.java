/*
 * 文件名称: SKBaobeiTP.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;;

/**
 * 宝贝图片对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKBaobeiTP extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝id*/		
	private Long bbid; 

	/**图片url*/		
	private String url; 

	/**排序*/		
	private Long disorder; 

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
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public Long getDisorder() {
		return disorder;
	}

	public void setDisorder(Long disorder) {
		this.disorder = disorder;
	}

}
