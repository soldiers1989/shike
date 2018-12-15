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

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;
import co.kensure.sms.SMSClient;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKZjqk;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 宝贝抽奖
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKChouJiangService extends JSBaseService {

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SKZjqkService sKZjqkService;

	@Resource
	private SKBbrwService sKBbrwService;
	
	@Resource
	private SKChouJiangLimitService sKChouJiangLimitService;
	

	/**
	 * 抽奖逻辑 是否要结束
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void doChouJiang(boolean isEnd) {
		try {
			String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
			Map<String, Object> parameters = MapUtils.genMap("daydes", todayStr, "status", 1);
			List<SKBbrw> list = sKBbrwService.selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			
			//先缓存数据 
			sKChouJiangLimitService.intCache();
			for (SKBbrw bbrw : list) {
				doOneRwCJ(bbrw, isEnd);
			}

		} catch (Exception e) {
			BusinessExceptionUtil.threwException(e);
		}
	}

	/**
	 * 对每个宝贝的待抽奖人选进行抽奖
	 * 
	 * @param bbrw
	 */
	private void doOneRwCJ(SKBbrw bbrw, boolean isEnd) {

        SKBaobei baobei = sKBaobeiService.selectOne(bbrw.getBbid());
        // 拼团，不需要参加定时器抽奖
        if (baobei.getHdtypeid() == 6L) {
            return;
        }

		Long bbid = bbrw.getBbid();
		Long bbnum = bbrw.getBbnum();
		Long yzj = bbrw.getYzj();
		// 抽奖数量
		long cjsl = 0L;
		if (isEnd) {
			// 全部抽完
			cjsl = bbnum - yzj;
		} else {
			cjsl = (bbnum - yzj) / 2;
		}

		List<SKSkqk> list = sKSkqkService.getDengChouJiang(bbid);
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		List<SKSkqk> zjrlist = null;
		if (list.size() <= cjsl) {
			// 奖比人多，全部中奖
			zjrlist = list;
			for (SKSkqk skqk : zjrlist) {
				skqk.setStatus(51L);
				sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());
			}
			bbrw.setYzj(zjrlist.size() + bbrw.getYzj());
		} else {
			// 人多，需要进行抽
			zjrlist = poolBean((int) cjsl, list);
			for (SKSkqk skqk : list) {
				skqk.setStatus(21L);
				sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());
			}
			for (SKSkqk skqk : zjrlist) {
				skqk.setStatus(51L);
				sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());
			}
			bbrw.setYzj(zjrlist.size() + bbrw.getYzj());
		}
		sKBbrwService.update(bbrw);

		baobei.setZjnum(baobei.getZjnum() + CollectionUtils.getSize(zjrlist));
		sKBaobeiService.update(baobei);
		sendSMS(zjrlist);

	}

	/**
	 * 发送短信
	 * 
	 * @param zjrlist
	 */
	private void sendSMS(List<SKSkqk> zjrlist) {
		if (CollectionUtils.isEmpty(zjrlist)) {
			return;
		}
		for (SKSkqk skqk : zjrlist) {
			SKZjqk zjqk = sKZjqkService.add(skqk);
			try {
				long uid = skqk.getUserid();
				sKChouJiangLimitService.add(uid);
				long bbid = skqk.getBbid();
				SKUser user = sKUserService.selectOne(uid);
				SKBaobei baobei = sKBaobeiService.selectOne(bbid);
				SMSClient.sendZhongJiang(user.getPhone(), baobei.getTitle(), "2小时");
				sKZjqkService.commit(zjqk);
			} catch (Exception e) {
				e.printStackTrace();
				sKZjqkService.rollback(zjqk);
			}
		}
	}

	/**
	 * 抽奖算法
	 * 
	 * @param jps
	 *            奖品数
	 * @param cjlist
	 *            抽奖人列表
	 * @return
	 */
	private List<SKSkqk> poolBean(int jps, List<SKSkqk> cjlist) {
		Random rand = new Random();
		// 中奖人列表
		List<SKSkqk> zjrlist = new ArrayList<SKSkqk>();
		for (int i = 0; i < jps; i++) {
			// 获取随机数
			int total = cjlist.size();
			int random = rand.nextInt(total);
			zjrlist.add(cjlist.get(random));
			cjlist.remove(random);
		}
		return zjrlist;

	}

	/**
	 * 中奖 （必中）
	 *
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void zhongjiang(Long bbid) {
		String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "daydes", todayStr, "status", 1);
		List<SKBbrw> list = sKBbrwService.selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			BusinessExceptionUtil.threwException("该宝贝今天没有任务");
		}
		SKBbrw skBbrw = list.get(0);
		Date now = new Date();
		int hour = DateUtils.getHour(now);
		int bbnum = skBbrw.getBbnum().intValue();
		int yzj = skBbrw.getYzj().intValue();
		// 当前时间最大中奖数量
		int maxzj = 0;

		if (hour >= 19) {
			// 19点，放100%
			maxzj = bbnum;
		} else if (hour >= 14) {
			// 14点，放60%
			maxzj = bbnum * 6 / 10;
		} else if (hour >= 7) {
			// 7点，放30%
			maxzj = bbnum * 3 / 10;
		}
		if (yzj >= maxzj) {
			BusinessExceptionUtil.threwException("宝贝该时间段已经放完！");
		}
		// 今日任务中奖人数+1
		Map<String, Object> param = MapUtils.genMap("id", skBbrw.getId(), "yzjAdd", 1);
		sKBbrwService.updateByMap(param);
	}

	/**
	 * 中奖 （指定）
	 *
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void zhiding(Long id) {

        SKSkqk skqk = sKSkqkService.selectOne(id);
        if (skqk == null) {
            BusinessExceptionUtil.threwException("申请不存在");
        }

        String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("bbid", skqk.getBbid(), "daydes", todayStr, "status", 1);
		List<SKBbrw> list = sKBbrwService.selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			BusinessExceptionUtil.threwException("该宝贝今天没有任务");
		}

		SKBbrw skBbrw = list.get(0);
		int bbnum = skBbrw.getBbnum().intValue();
		int yzj = skBbrw.getYzj().intValue();
		// 当前时间最大中奖数量

		if (yzj >= bbnum) {
			BusinessExceptionUtil.threwException("宝贝该时间段已经放完！");
		}

		// 更新中奖申请
        skqk.setStatus(51L);
        sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());

		// 今日任务中奖人数+1
		Map<String, Object> param = MapUtils.genMap("id", skBbrw.getId(), "yzjAdd", 1);
		sKBbrwService.updateByMap(param);
	}

}
