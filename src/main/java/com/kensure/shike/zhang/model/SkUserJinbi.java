package com.kensure.shike.zhang.model;

import co.kensure.frame.BaseInfo;
import com.kensure.shike.sys.model.SKDict;
import com.kensure.shike.sys.service.SKDictService;

/**
 * 试客金币流水对象类
 * 
 * @author fankd created on 2018-10-5
 * @since
 */
public class SkUserJinbi extends BaseInfo {

	private static final long serialVersionUID = 3545276994084105527L;

	/***/
	private Long id;

	/** 用户id */
	private Long userid;

	/** 业务类型id 1:签到，2:购物奖励 */
	private Long typeid;

	private String typeidStr;

	/** 金币 */
	private Long jinbi;

	/** 对这个用户流进还是流出,1是进，-1是出 */
	private Long inorout;

	/** 状态，1是正常，0是未生效，-1是作废 */
	private Long status;

	private String statusStr;

	/** 描述 */
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

	public Long getTypeid() {
		return typeid;
	}

	public void setTypeid(Long typeid) {
		this.typeid = typeid;
	}

	public String getTypeidStr() {
		SKDict dict = SKDictService.getDictCache(7, this.typeid + "");
		String temp = "";
		if (dict != null) {
			temp = dict.getName();
		}
		return temp;
	}

	public Long getJinbi() {
		return jinbi;
	}

	public void setJinbi(Long jinbi) {
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

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getStatusStr() {
		String temp = "";
		if (status == 0) {
			temp = "等待审核";
		} else if (status == 1) {
			temp = "成功";
		} else if (status == -1) {
			temp = "拒绝通过";
		}
		return temp;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
