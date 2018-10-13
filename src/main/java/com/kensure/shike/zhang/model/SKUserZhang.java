/*
 * 文件名称: SKUserZhang.java
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

import com.kensure.shike.sys.model.SKDict;
import com.kensure.shike.sys.service.SKDictService;

import co.kensure.frame.BaseInfo;;

/**
 * 用户余额流水对象类
 * @author fankd created on 2018-9-9
 * @since
 */
public class SKUserZhang extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/***/		
	private Long id;

	/**用户id*/		
	private Long userid; 

	/**业务id*/		
	private Long busiid; 

	/**业务类型id,1是商家充值，2是试客提现，3是活动费用*/		
	private Long busitypeid; 

	/**余额*/		
	private Double yue; 

	/**金币*/		
	private Double jinbi; 

	/**对这个用户流进还是流出,1是进，-1是出*/		
	private Long inorout; 

	/**状态，1是正常，0是未生效，-1是作废*/		
	private Long status; 

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
	public Long getBusitypeid() {
		return busitypeid;
	}
	public String getBusitypeidStr() {
		SKDict dict = SKDictService.getDictCache(5, this.status + "");
		String temp = "";
		if (dict != null) {
			temp = dict.getName();
		}
		return temp;
	}
	
	public void setBusitypeid(Long busitypeid) {
		this.busitypeid = busitypeid;
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
	public Long getInorout() {
		return inorout;
	}

	public void setInorout(Long inorout) {
		this.inorout = inorout;
	}
	public Long getStatus() {
		return status;
	}

	public String getStatusStr() {
		String temp = "";
		if(status == 0){
			temp = "等待审核";
		}else if(status == 1){
			temp = "成功";
		}else if(status == -1){
			temp = "拒绝通过";
		}
		return temp;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
