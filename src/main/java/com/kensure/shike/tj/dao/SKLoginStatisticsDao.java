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
public interface SKLoginStatisticsDao extends JSBaseDao<SKUser> {
	
	
	/**
	 * 登陆商家数
	 */
	public List<SKZhiBiao> countLoginUser(Map<String, Object> parameters);
	
	

}
