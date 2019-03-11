package com.kensure.shike.tj.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;

import com.kensure.shike.tj.dao.SKBaobeiStatisticsDao;
import com.kensure.shike.tj.dao.SKDianpuStatisticsDao;
import com.kensure.shike.tj.dao.SKLoginStatisticsDao;
import com.kensure.shike.tj.dao.SKUserStatisticsDao;
import com.kensure.shike.tj.model.SKUserTuiJian;
import com.kensure.shike.tj.model.SKZhiBiao;
import com.kensure.shike.tj.model.SKZhiBiao2;

/**
 * 用户表统计方法 服务实现类
 * 
 * @author fankd created on 2019-03-11
 * @since
 */
@Service
public class SKUserStatisticsService extends JSBaseService {

	@Resource
	private SKUserStatisticsDao dao;

	@Resource
	private SKDianpuStatisticsDao dpdao;

	@Resource
	private SKLoginStatisticsDao logindao;

	@Resource
	private SKBaobeiStatisticsDao baobeidao;

	/**
	 * 推荐人统计
	 */
	public List<SKUserTuiJian> selectTuiJian(Map<String, Object> parameters) {
		return dao.selectTuiJian(parameters);
	}

	public long selectCountTuiJian(Map<String, Object> parameters) {
		return dao.selectCountTuiJian(parameters);
	}

	
	/**
	 * 商家注册数
	 * 
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Map<String, SKZhiBiao> sjzc(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("isTest", 0, "type", 2);
		if (startTime != null) {
			parameters.put("startCreatedTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endCreatedTime", endTime);
		}
		List<SKZhiBiao> list = dao.countUser(parameters);
		return listToMap(list);
	}

	/**
	 * 已绑店铺商家数
	 * 
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Map<String, SKZhiBiao> bddpsj(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap();
		if (startTime != null) {
			parameters.put("startCreatedTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endCreatedTime", endTime);
		}
		List<SKZhiBiao> list = dpdao.countDPUser(parameters);
		return listToMap(list);
	}

	/**
	 * 已绑店铺数
	 */
	public Map<String, SKZhiBiao> bddp(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap();
		if (startTime != null) {
			parameters.put("startCreatedTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endCreatedTime", endTime);
		}
		List<SKZhiBiao> list = dpdao.countDP(parameters);
		return listToMap(list);
	}

	/**
	 * 今日编辑活动商家数
	 */
	public Map<String, SKZhiBiao> sjbjhd(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2);
		if (startTime != null) {
			parameters.put("startCreatedTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endCreatedTime", endTime);
		}
		List<SKZhiBiao> list = baobeidao.countBaobeiEditUser(parameters);
		return listToMap(list);
	}

	/**
	 * 今日发布活动商家数
	 */
	public Map<String, SKZhiBiao> sjfbhd(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "isPublic", 1);
		if (startTime != null) {
			parameters.put("startStartTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endStartTime", endTime);
		}
		List<SKZhiBiao> list = baobeidao.countBaobeiPublishUser(parameters);
		return listToMap(list);
	}

	/**
	 * 今日登陆商家数
	 * @return
	 */
	public Map<String, SKZhiBiao> sjdl(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2);
		if (startTime != null) {
			parameters.put("startCreatedTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endCreatedTime", endTime);
		}
		List<SKZhiBiao> list = logindao.countLoginUser(parameters);
		return listToMap(list);
	}
	
	
	
	
	/** 页面2
	 * 发布活动数 
	 */
	public Map<String, SKZhiBiao> fbhd(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "isPublic", 1);
		if (startTime != null) {
			parameters.put("startStartTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endStartTime", endTime);
		}
		List<SKZhiBiao> list = baobeidao.countBaobeiPublish(parameters);
		return listToMap(list);
	}
	
	/** 页面2
	 * 发布活动数 
	 */
	public Map<String, SKZhiBiao> fbsp(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "isPublic", 1);
		if (startTime != null) {
			parameters.put("startStartTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endStartTime", endTime);
		}
		List<SKZhiBiao> list = baobeidao.sumBaobeiNumPublish(parameters);
		return listToMap(list);
	}
	
	/** 页面2
	 * 新增服务费收入
	 */
	public Map<String, SKZhiBiao2> fwfsr(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "isPublic", 1);
		if (startTime != null) {
			parameters.put("startStartTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endStartTime", endTime);
		}
		List<SKZhiBiao2> list = baobeidao.sumBaobeiFwfSr(parameters);
		return list2ToMap(list);
	}
	
	/** 页面2
	 *  服务费结算收入
	 */
	public Map<String, SKZhiBiao2> fwfjs(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "status", 20);
		if (startTime != null) {
			parameters.put("startJiesuanTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endJiesuanTime", endTime);
		}
		List<SKZhiBiao2> list = baobeidao.sumBaobeiFwfJs(parameters);
		return list2ToMap(list);
	}
	
	/** 页面2
	 *  服务费结算退款
	 */
	public Map<String, SKZhiBiao2> fwftk(Date startTime, Date endTime) {
		Map<String, Object> parameters = MapUtils.genMap("type", 2, "status", 20);
		if (startTime != null) {
			parameters.put("startJiesuanTime", startTime);
		}
		if (endTime != null) {
			parameters.put("endJiesuanTime", endTime);
		}
		List<SKZhiBiao2> list = baobeidao.sumBaobeiFwfTk(parameters);
		return list2ToMap(list);
	}
	
	/** 页面2
	 *  冻结押金
	 */
	public Map<String, SKZhiBiao2> yjdj(String nowTime) {
		Map<String, Object> parameters = MapUtils.genMap("nowTime", nowTime,"nowTimeEnd",nowTime+" 23:59:59");
		List<SKZhiBiao2> list = baobeidao.sumBaobeiYjDj(parameters);
		return list2ToMap(list);
	}

	private Map<String, SKZhiBiao> listToMap(List<SKZhiBiao> list) {
		Map<String, SKZhiBiao> map = new HashMap<String, SKZhiBiao>();
		for (SKZhiBiao zb : list) {
			map.put(zb.getDay(), zb);
		}
		return map;
	}
	
	private Map<String, SKZhiBiao2> list2ToMap(List<SKZhiBiao2> list) {
		Map<String, SKZhiBiao2> map = new HashMap<String, SKZhiBiao2>();
		for (SKZhiBiao2 zb : list) {
			map.put(zb.getDay(), zb);
		}
		return map;
	}

}
