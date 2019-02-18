package com.kensure.shike.user.model;

import co.kensure.frame.BaseInfo;

/**
 * 用户推荐统计
 * @author fankd created on 2019-02-18
 * @since
 */
public class SKUserTuiJian extends BaseInfo{

	private static final long serialVersionUID = 3545276994084105527L;
	
	/**推荐人id*/		
	private Long refereeId;

	/**被推荐人个数*/		
	private Integer cnt;

	public Long getRefereeId() {
		return refereeId;
	}

	public void setRefereeId(Long refereeId) {
		this.refereeId = refereeId;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	} 

}
