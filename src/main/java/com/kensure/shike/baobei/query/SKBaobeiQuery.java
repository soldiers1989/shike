package com.kensure.shike.baobei.query;

import co.kensure.frame.BaseInfo;

/**
 * 活动查询对象
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKBaobeiQuery extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	private Integer status;
	private String title;
	private Integer hdtypeid;
	private Double jiangli;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getHdtypeid() {
		return hdtypeid;
	}

	public void setHdtypeid(Integer hdtypeid) {
		this.hdtypeid = hdtypeid;
	}

	public Double getJiangli() {
		return jiangli;
	}

	public void setJiangli(Double jiangli) {
		this.jiangli = jiangli;
	}
}
