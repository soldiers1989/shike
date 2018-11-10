package com.kensure.shike.baobei.query;

import co.kensure.frame.BaseInfo;

/**
 * 前端试客活动查询对象
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
public class SKBaobeiQuery1 extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	private Integer typeid;
	private String title;
	private Integer hdtypeid;
	private Double jiangli;

	private String order;
	private String sort;
	private String minprice;
	private String maxprice;

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
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

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getMinprice() {
		return minprice;
	}

	public void setMinprice(String minprice) {
		this.minprice = minprice;
	}

	public String getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}

}
