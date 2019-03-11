package com.kensure.shike.tj.dao;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.tj.model.SKZhiBiao;
import com.kensure.shike.tj.model.SKZhiBiao2;
import com.kensure.shike.user.model.SKUser;

/**
 * 用户表Dao接口类,统计方法
 * 
 * @author fankd created on 2018-9-2
 * @since 
 */
 @MyBatisRepository
public interface SKBaobeiStatisticsDao extends JSBaseDao<SKUser> {
	
	
	/**
	 * 今日编辑活动商家数
	 */
	public List<SKZhiBiao> countBaobeiEditUser(Map<String, Object> parameters);
	
	/**
	 * 今日发布活动商家数
	 */
	public List<SKZhiBiao> countBaobeiPublishUser(Map<String, Object> parameters);
	
	/**
	 * 发布活动数 
	 */
	public List<SKZhiBiao> countBaobeiPublish(Map<String, Object> parameters);
	
	/**
	 * 发布商品份数
	 */
	public List<SKZhiBiao> sumBaobeiNumPublish(Map<String, Object> parameters);
	
	/**
	 * 新增服务费收入
	 */
	public List<SKZhiBiao2> sumBaobeiFwfSr(Map<String, Object> parameters);
	
	/**
	 * 服务费结算收入
	 */
	public List<SKZhiBiao2> sumBaobeiFwfJs(Map<String, Object> parameters);
	
	/**
	 * 服务费结算退款
	 */
	public List<SKZhiBiao2> sumBaobeiFwfTk(Map<String, Object> parameters);
	
	/**
	 * 冻结押金,已经充值的保证金，但是活动还没结束，还没返款到试客账户的
	 */
	public List<SKZhiBiao2> sumBaobeiYjDj(Map<String, Object> parameters);
	

}
