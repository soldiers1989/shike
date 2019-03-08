package com.kensure.shike.user.dao;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.tj.model.SKZhiBiao;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserTuiJian;

/**
 * 用户表Dao接口类,统计方法
 * 
 * @author fankd created on 2018-9-2
 * @since 
 */
 @MyBatisRepository
public interface SKUserStatisticsDao extends JSBaseDao<SKUser> {
	
	/**
	 * 推荐人统计
	 */
	public List<SKUserTuiJian> selectTuiJian(Map<String, Object> parameters);
	/**
	 * 推荐人统计计数
	 */
	public long selectCountTuiJian(Map<String, Object> parameters);
	
	/**
	 * 商家\试客 统计
	 */
	public List<SKZhiBiao> countUser(Map<String, Object> parameters);

}
