/*
 * 文件名称: SKBbrwServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.DateUtils;

import com.kensure.shike.baobei.model.SKZjqkCount;

/**
 * 宝贝抽奖
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKChouJiangLimitService extends JSBaseService {

	@Resource
	private SKZjqkService sKZjqkService;

	// 日限制
	private static Map<String, Integer> dayMap = new HashMap<String, Integer>();
	// 周限制
	private static Map<String, Integer> weekMap = new HashMap<String, Integer>();
	// 月限制
	private static Map<String, Integer> monthMap = new HashMap<String, Integer>();

	/**
	 * 为了性能考虑先开始缓存
	 */
	public void intCache() {
		initDay();
		initWeek();
		initMonth();
	}

	private void initDay() {
		dayMap.clear();
		Date endtime = new Date();
		// 日统计
		Date starttime = DateUtils.getPastDay(endtime, -1);
		List<SKZjqkCount> dayList = sKZjqkService.groupByUserid(null, starttime, endtime);
		if (dayList != null) {
			for (SKZjqkCount zjqk : dayList) {
				dayMap.put(zjqk.getUserid().longValue() + "", zjqk.getCnt());
			}
		}
	}

	private void initWeek() {
		weekMap.clear();
		// 周统计
		Date endtime = new Date();
		Date starttime = DateUtils.getPastDay(endtime, -7);
		List<SKZjqkCount> weekList = sKZjqkService.groupByUserid(null, starttime, endtime);
		if (weekList != null) {
			for (SKZjqkCount zjqk : weekList) {
				weekMap.put(zjqk.getUserid().longValue() + "", zjqk.getCnt());
			}
		}
	}

	private void initMonth() {
		monthMap.clear();
		Date endtime = new Date();
		// 月统计
		Date starttime = DateUtils.getPastDay(endtime, -30);
		List<SKZjqkCount> monthList = sKZjqkService.groupByUserid(null, starttime, endtime);
		if (monthList != null) {
			for (SKZjqkCount zjqk : monthList) {
				monthMap.put(zjqk.getUserid().longValue() + "", zjqk.getCnt());
			}
		}
	}

	// 日3周5月15
	private static final int daylimit = 3;
	private static final int weeklimit = 5;
	private static final int monthlimit = 15;

	/**
	 * 是否ok，该用是否符合抽奖规则
	 * 
	 * @return
	 */
	public boolean isOk(Long userId) {
		String key = userId.longValue() + "";

		Integer day = dayMap.get(key);
		if (day == null) {
			dayMap.put(key, 0);
		} else if (day >= daylimit) {
			return false;
		}

		Integer week = weekMap.get(key);
		if (week == null) {
			weekMap.put(key, 0);
		} else if (week >= weeklimit) {
			return false;
		}

		Integer month = monthMap.get(key);
		if (month == null) {
			monthMap.put(key, 0);
		} else if (month >= monthlimit) {
			return false;
		}

		return true;
	}

	/**
	 * 中奖了，加一次
	 * 
	 * @return
	 */
	public void add(Long userId) {
		String key = userId.longValue() + "";

		Integer day = dayMap.get(key);
		if (day == null) {
			day = 0;
		}
		dayMap.put(key, ++day);

		Integer week = weekMap.get(key);
		if (week == null) {
			week = 0;
		}
		weekMap.put(key, ++week);

		Integer month = monthMap.get(key);
		if (month == null) {
			month = 0;
		}
		monthMap.put(key, ++month);
	}
}
