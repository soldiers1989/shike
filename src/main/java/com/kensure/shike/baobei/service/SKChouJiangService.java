package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;
import co.kensure.sms.SMSClient;

import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKBbrwDetail;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKZjqk;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

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
	private SKBbrwDetailService sKBbrwDetailService;

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
			System.out.println("抽奖开始==" + todayStr);
			Map<String, Object> parameters = MapUtils.genMap("daydes", todayStr, "status", 1);
			List<SKBbrw> list = sKBbrwService.selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			// 先缓存数据
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
		if (baobei.getHdtypeid() != null && baobei.getHdtypeid() == 6L) {
			return;
		}
		// 已经下线的商品，把那边中奖前的都干掉
		if (baobei.getStatus() == -1) {
			sKSkqkService.zuoFei(baobei.getId());
			return;
		}
		// 不是进行中的，不用抽奖了
		if (baobei.getStatus() != 9) {
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
		// 所有的试客
		List<SKSkqk> alllist = sKSkqkService.getDengChouJiang(bbid);
		if (CollectionUtils.isEmpty(alllist)) {
			return;
		}
		// 先更新下一次抽奖时间，在进行更新
		for (SKSkqk skqk : alllist) {
			skqk.setStatus(21L);
			sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());
		}
		// 虚拟的商品自动增加中奖数和申请数
		if (baobei.getIsXuni() == 1) {
			long cj = baobei.getZjnum() + cjsl;
			if (cj > baobei.getBbnum()) {
				cj = baobei.getBbnum();
			}
			baobei.setZjnum(cj);
			baobei.setSqnum(baobei.getSqnum() + cjsl * 2);
			sKBaobeiService.update(baobei);
			return;
		}
		// 有效人数
		List<SKSkqk> yxlist = sKSkqkService.getYXSK(alllist, bbid);

		List<SKSkqk> zjrlist = null;
		if (yxlist.size() <= cjsl) {
			// 奖比人多，全部中奖
			zjrlist = yxlist;
			for (SKSkqk skqk : zjrlist) {
				skqk.setStatus(51L);
				sKSkqkService.updateStatus(skqk.getId(), skqk.getStatus());
			}
			bbrw.setYzj(zjrlist.size() + bbrw.getYzj());
		} else {
			// 人多，需要进行抽
			zjrlist = poolBean((int) cjsl, yxlist);
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
				SMSClient.sendZhongJiang(user.getPhone(), baobei.getTitle(), "24小时");
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
	public synchronized void zhongjiang(Long bbid) {
		SKBbrwDetail thisdetail = bizhongjiaoyan(bbid);
		// 详情加1
		sKBbrwDetailService.updateYzj(thisdetail);
		// 今日任务中奖人数+1
		Map<String, Object> param = MapUtils.genMap("id", thisdetail.getBbrwid(), "yzjAdd", 1);
		sKBbrwService.updateByMap(param);
	}

	/**
	 * 必中校验
	 * @param bbid
	 */
	public SKBbrwDetail bizhongjiaoyan(Long bbid) {
		String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "daydes", todayStr, "status", 1);
		List<SKBbrw> list = sKBbrwService.selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			BusinessExceptionUtil.threwException("该宝贝今天没有任务");
		}
		SKBbrw skBbrw = list.get(0);
		Date now = new Date();
		int hour = DateUtils.getHour(now);

		List<SKBbrwDetail> detailslist = sKBbrwDetailService.selectByBbrwid(skBbrw.getId());
		SKBbrwDetail thisdetail = null;
		for (SKBbrwDetail detail : detailslist) {
			// 说明还有商品
			if (detail.getYzj() < detail.getBbnum()) {
				// 现在的时间，1、比结束时间大的，那是可以的，2比开始时间大，比结束时间小，也是可以的
				if (hour > detail.getHour2() || (hour >= detail.getHour1() && hour < detail.getHour2())) {
					thisdetail = detail;
					break;
				}
			}
		}
		if (thisdetail == null) {
			BusinessExceptionUtil.threwException("宝贝该时间段已经放完！");
		}
		return thisdetail;
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
