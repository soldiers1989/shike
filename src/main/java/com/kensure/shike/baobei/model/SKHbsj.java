/*
 * 文件名称: SKHbsj.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-11-5
 * 修改内容: 
 */
package com.kensure.shike.baobei.model;

import co.kensure.frame.BaseInfo;;

/**
 * 货比三家对象类
 * @author fankd created on 2018-11-5
 * @since
 */
public class SKHbsj extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**主键*/		
	private Long id; 

	/**淘口令1*/		
	private String tkl1; 

	/**淘口令2*/		
	private String tkl2; 

	/**淘口令3*/		
	private String tkl3; 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getTkl1() {
		return tkl1;
	}

	public void setTkl1(String tkl1) {
		this.tkl1 = tkl1;
	}
	public String getTkl2() {
		return tkl2;
	}

	public void setTkl2(String tkl2) {
		this.tkl2 = tkl2;
	}
	public String getTkl3() {
		return tkl3;
	}

	public void setTkl3(String tkl3) {
		this.tkl3 = tkl3;
	}
}
