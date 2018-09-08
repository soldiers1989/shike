/*
 * 文件名称: SKRole.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.user.model;

import co.kensure.frame.BaseInfo;;

/**
 * 角色表对象类
 * @author fankd created on 2018-9-8
 * @since
 */
public class SKRole extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**等级*/		
	private Integer level; 

	/**等级编码*/		
	private String levelCode; 

	/**角色名称*/		
	private String name; 

	/**提现费率*/		
	private Integer feilv; 

	/**允许店铺数*/		
	private Integer dianpushu; 

	/**类型，1是试客，2是商家，3是管理员*/		
	private Integer type; 

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getLevelCode() {
		return levelCode;
	}

	public void setLevelCode(String levelCode) {
		this.levelCode = levelCode;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getFeilv() {
		return feilv;
	}

	public void setFeilv(Integer feilv) {
		this.feilv = feilv;
	}
	public Integer getDianpushu() {
		return dianpushu;
	}

	public void setDianpushu(Integer dianpushu) {
		this.dianpushu = dianpushu;
	}
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
