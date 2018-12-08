package com.kensure.shike.baobei.dao;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.baobei.model.SKZjqkCount;

/**
 * 试客中奖情况统计Dao接口类
 * 
 * @author fankd created on 2018-10-31
 * @since 
 */
 @MyBatisRepository
public interface SKZjqkCountDao extends JSBaseDao<SKZjqkCount> {
	 
	public List<SKZjqkCount> selectByWhere(Map<String, Object> parameters);

}
