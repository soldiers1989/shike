package com.kensure.shike.tj.dao;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.tj.model.SKZhiBiao;
import com.kensure.shike.user.model.SKUser;

/**
 * 用户表Dao接口类,统计方法
 * 
 * @author fankd created on 2018-9-2
 * @since 
 */
 @MyBatisRepository
public interface SKDianpuStatisticsDao extends JSBaseDao<SKUser> {
	
	
	/**
	 * 绑定店铺商家
	 */
	public List<SKZhiBiao> countDPUser(Map<String, Object> parameters);
	
	/**
	 * 绑定店铺数
	 */
	public List<SKZhiBiao> countDP(Map<String, Object> parameters);

}
