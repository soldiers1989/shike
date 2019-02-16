/*
 * 文件名称: SKSkqkServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;

import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKSkqk;

/**
 * 试客情况表服务帮助类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
@Service
public class SKSkqkHelper extends JSBaseService {

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBbrwService sKBbrwService;

	/**
	 * 修改流程状态方法方法
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	public boolean updateNextTime(Long id, Long status) {
		SKSkqk sqqk = sKSkqkService.selectOne(id);
		Date now = new Date();
		Date nextTime = null;
		// 需要计算时间了,21是带开奖状态，需要计算他下一次开奖时间
		if (status.intValue() == 21) {
			List<SKBbrw> list = sKBbrwService.selectByBBid(sqqk.getBbid());
			if (CollectionUtils.isEmpty(list)) {

			} else {
				// 拿第一个就行了
				SKBbrw skbbrw = list.get(0);
				Date start = skbbrw.getStartTime();
				Date D10 = DateUtils.getPastHour(start, 10);
				Date D15 = DateUtils.getPastHour(start, 15);
				Date D20 = DateUtils.getPastHour(start, 20);
				Date D22 = DateUtils.getPastHour(start, 22);

				if (skbbrw.getBbnum().longValue() > skbbrw.getYzj().longValue() && now.getTime() < D22.getTime()) {
					if (now.getTime() < D10.getTime()) {
						nextTime = D10;
					} else if (now.getTime() < D15.getTime()) {
						nextTime = D15;
					} else if (now.getTime() < D20.getTime()) {
						nextTime = D20;
					} else if (now.getTime() < D22.getTime()) {
						nextTime = D22;
					}
				} else if (list.size() > 1) {
					skbbrw = list.get(1);
					start = skbbrw.getStartTime();
					nextTime = DateUtils.getPastHour(start, 10);
				}
			}
		} else if (status.intValue() == 51) {
			// 中奖之后，24个小时的下单时间，如果超过24个小时，取消中奖
			nextTime = DateUtils.getPastHour(now, 24);
		} else if (status.intValue() == 61) {
			// 这个是好评时间，好评时间有10天
			nextTime = DateUtils.getPastDay(now, 2);
		} else if (status.intValue() == 71) {
			// 这个是好评时间，好评时间有10天
			nextTime = DateUtils.getPastDay(now, 10);
		} else if (status.intValue() == 81) {
			// 这个是返款时间，好评时间有2天
			nextTime = DateUtils.getPastDay(now, 2);
		}
		if (nextTime != null) {
			Map<String, Object> params = MapUtils.genMap("id", id, "nextTime", nextTime);
			sKSkqkService.updateByMap(params);
		}
		return true;
	}

}
