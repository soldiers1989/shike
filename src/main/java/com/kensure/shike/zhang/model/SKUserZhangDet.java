/*
 * 文件名称: SKUserZhangDet.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.zhang.model;

import co.kensure.frame.BaseInfo;;

/**
 * 用户余额流水明细对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKUserZhangDet extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**用户id*/		
	private Long userid; 

	/**业务id*/		
	private Long busiid; 

	/**流水分类id,商品押金,2是佣金，3是商家转账手续费，4是保证金*/		
	private Long typeid; 

	/**余额*/		
	private Double yue; 

	/**金币*/		
	private Double jinbi; 

	/**描述*/		
	private String remark; 

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
	public Long getBusiid() {
		return busiid;
	}

	public void setBusiid(Long busiid) {
		this.busiid = busiid;
	}
	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}
	public Double getYue() {
		return yue;
	}

	public void setYue(Double yue) {
		this.yue = yue;
	}
	public Double getJinbi() {
		return jinbi;
	}

	public void setJinbi(Double jinbi) {
		this.jinbi = jinbi;
	}
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
