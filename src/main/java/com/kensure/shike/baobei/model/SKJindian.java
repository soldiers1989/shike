/*
 * 文件名称: SKJindian.java
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
 * 活动进店路径对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKJindian extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝活动id*/		
	private Long bbid; 

	/**类型 1是关键词，2是淘口令，3是二维码*/		
	private Integer typeid; 

	/**比例，3个加起来必须是100*/		
	private Long bili; 

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
	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Long getBili() {
		return bili;
	}

	public void setBili(Long bili) {
		this.bili = bili;
	}
}
