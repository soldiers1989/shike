/*
 * 文件名称: SKJysj.java
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

import co.kensure.frame.BaseInfo;;

/**
 * 试客校验数据表对象类
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKJysj extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**宝贝id*/		
	private Long bbid; 

	/**任务id*/		
	private Long rwid; 
	
	/**用户id*/	
	private Long userid; 

	/**这个和sk_bbrw中对应*/		
	private Long status; 

	/**1是淘口令，2是名字，3是图片路径*/		
	private Long typeid; 

	/**业务类型，比如sc:是收藏图片，gz:关注图片*/		
	private String busitype; 

	/**具体口令、名称、图片路径*/		
	private String content; 

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
	public Long getRwid() {
		return rwid;
	}

	public void setRwid(Long rwid) {
		this.rwid = rwid;
	}
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public String getBusitype() {
		return busitype;
	}

	public void setBusitype(String busitype) {
		this.busitype = busitype;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

}
