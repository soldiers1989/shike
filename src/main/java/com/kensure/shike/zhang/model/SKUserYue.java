/*
 * 文件名称: SKUserYue.java
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
 * 用户余额对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKUserYue extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**用户id*/		
	private Long id; 

	/**余额*/		
	private Double yue; 

	/**担保余额*/		
	private Double dbyue; 

	/**金币*/		
	private Double jinbi; 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Double getYue() {
		return yue;
	}

	public void setYue(Double yue) {
		this.yue = yue;
	}
	public Double getDbyue() {
		return dbyue;
	}

	public void setDbyue(Double dbyue) {
		this.dbyue = dbyue;
	}
	public Double getJinbi() {
		return jinbi;
	}

	public void setJinbi(Double jinbi) {
		this.jinbi = jinbi;
	}

}
