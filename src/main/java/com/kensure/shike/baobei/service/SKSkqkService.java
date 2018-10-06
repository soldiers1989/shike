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

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKSkqkDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;

/**
 * 试客情况表服务实现类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
@Service
public class SKSkqkService extends JSBaseService {

	@Resource
	private SKSkqkDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SKUserZhangService sKUserZhangService;

	@Resource
	private SKJysjService sKJysjService;

	public SKSkqk selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKSkqk> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKSkqk> selectAll() {
		return dao.selectAll();
	}

	public List<SKSkqk> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKSkqk obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_sqqk"));
		obj.setLastStatus(0L);
		obj.setStatus(1L);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKSkqk> objs) {
		return dao.insertInBatch(objs);
	}

	/**
	 * 修改流程状态方法方法
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean updateStatus(Long id, Long status) {
		Map<String, Object> params = MapUtils.genMap("id", id, "status", status);
		if (status > 0) {
			params.put("lastStatus", status);
		}
		updateNextTime(id, status);
		return updateByMap(params);
	}

	/**
	 * 修改流程状态方法方法
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	public boolean updateNextTime(Long id, Long status) {
		SKSkqk sqqk = selectOne(id);
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
			// 中奖之后，是3天的等待时间
			nextTime = DateUtils.getPastHour(now, 3);
		} else if (status.intValue() == 61) {
			// 这个是好评时间，好评时间有10天
			nextTime = DateUtils.getPastDay(now, 10);
		} else if (status.intValue() == 81) {
			// 这个是返款时间，好评时间有2天
			nextTime = DateUtils.getPastDay(now, 2);
		}
		if (nextTime != null) {
			Map<String, Object> params = MapUtils.genMap("id", id, "nextTime", nextTime);
			updateByMap(params);
		}
		return true;
	}

	public boolean updateByMap(Map<String, Object> params) {
		params.put("updatedTime", new Date());
		return dao.updateByMap(params);
	}

	public boolean delete(Long id) {
		return dao.delete(id);
	}

	public boolean deleteMulti(Collection<Long> ids) {
		return dao.deleteMulti(ids);
	}

	public boolean deleteByWhere(Map<String, Object> parameters) {
		return dao.deleteByWhere(parameters);
	}

	public SKSkqk getQkByBBId(long bbid, long userid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "userid", userid);
		List<SKSkqk> list = selectByWhere(parameters);
		if (CollectionUtils.getSize(list) > 1) {
			BusinessExceptionUtil.threwException("你已经申请过该宝贝！");
		}
		SKSkqk sk = null;
		if (CollectionUtils.getSize(list) > 0) {
			sk = list.get(0);
		}
		return sk;
	}

	/**
	 * 查询该用户所有的已中奖的申请数量
	 * 
	 * @param userid
	 * @return
	 */
	public long getQkByByYzj(long userid) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userid, "bigthanstatus", 51, "lessthanstatus", "98");
		return selectCountByWhere(parameters);
	}

	/**
	 * 查询该用户今日的所有申请数量
	 * 
	 * @param userid
	 * @return
	 */
	public long getQkByToday(long userid) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userid, "bigCreatedTime", DateUtils.formatDateStart(new Date()), "lessCreatedTime", DateUtils.formatDateEnd(new Date()));
		return selectCountByWhere(parameters);
	}

	// 获取宝贝中奖情况
	public long getZJNum(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "bigthanstatus", 51);
		return selectCountByWhere(parameters);
	}

	// 获取宝贝试用情况，是给商家展现的
	public List<SKSkqk> getSkqkList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "bigthanstatus", 51);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skskqk : list) {
			List<SKJysj> jylist = sKJysjService.selectByBbidAndUserid(skskqk.getBbid(), skskqk.getUserid());
			skskqk.setJylist(jylist);
		}
		return list;
	}

	private static Map<String, String> sqqkMap = new HashMap<String, String>();

	/**
	 * 申请
	 * 
	 * @param baobei
	 * @param salePrice
	 * @param jiangli
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean saveSQ(SKBaobei baobei, SKUser skuser) {
		String key = skuser.getId() + "";
		try {
			if (sqqkMap.containsKey(key)) {
				BusinessExceptionUtil.threwException("服务器忙，请不要重复提交！");
			}
			sqqkMap.put(key, key);

			if (baobei.getStatus() != 9 || baobei.getIsDel() == 1) {
				BusinessExceptionUtil.threwException("该宝贝失效！");
			}
			SKSkqk qk = getQkByBBId(baobei.getId(), skuser.getId());
			if (qk != null && qk.getStatus() > 1) {
				BusinessExceptionUtil.threwException("你已经申请过该宝贝！");
			}
			// 任务计数
			if (qk == null || qk.getStatus() < 1) {
				sKBbrwService.shenqing(baobei.getId(), baobei.getHdtypeid());
			}
			// 插入试客情况
			if (qk == null) {
				qk = new SKSkqk();
				qk.setBbid(baobei.getId());
				qk.setUserid(skuser.getId());
				qk.setSalePrice(baobei.getSalePrice());
				qk.setJiangli(baobei.getJiangli());
				qk.setNoTaobao(skuser.getNoTaobao());
				insert(qk);
			} else {
				updateStatus(qk.getId(), 1L);
			}
		} finally {
			sqqkMap.remove(key);
		}
		return true;
	}

	/**
	 * 申请后的流程状态保持
	 * 
	 * @param baobei
	 * @param skuser
	 * @return
	 */
	public boolean save(SKBaobei baobei, long status, SKUser skuser) {
		if (baobei.getStatus() < 9 || baobei.getIsDel() == 1) {
			BusinessExceptionUtil.threwException("该宝贝失效！");
		}
		SKSkqk qk = getQkByBBId(baobei.getId(), skuser.getId());
		if (qk.getStatus() >= status) {
			BusinessExceptionUtil.threwException("数据有误！");
		}
		updateStatus(qk.getId(), status);
		return true;
	}

	/**
	 * 获取试客情况列表，只在试客端使用
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	public List<SKSkqk> getSkQKList(long status) {
		SKUser user = sKUserService.getUser();
		SKUserService.checkUserSK(user);
		Map<String, Object> parameters = MapUtils.genMap("userid", user.getId());
		if (status == 51) {
			parameters.put("bigthanstatus", 51);
			parameters.put("lessthanstatus", 81);
		} else if (status == 18) {
			parameters.put("bigthanstatus", 0);
			parameters.put("lessthanstatus", 18);
		} else {
			parameters.put("status", status);
		}
		List<SKSkqk> list = selectByWhere(parameters);
		if (CollectionUtils.isNotEmpty(list)) {
			for (SKSkqk skqk : list) {
				SKBaobei baobei = sKBaobeiService.selectOne(skqk.getBbid());
				skqk.setBaobei(baobei);
			}
		}
		return list;
	}

	/**
	 * 对提交的订单进行轮询，超过3天就是进行好评业务
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void toHaoPin() {
		try {
			Date day = DateUtils.getPastDay(new Date(), -3);
			Map<String, Object> parameters = MapUtils.genMap("status", 61, "lessupdatedTime", day);
			List<SKSkqk> list = selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			for (SKSkqk obj : list) {
				obj.setStatus(71L);
				updateStatus(obj.getId(), 71L);
			}
		} catch (Exception e) {
			BusinessExceptionUtil.threwException(e);
		}
	}

	/**
	 * 好评完成之后的数据，两天后自动返款
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void toReturnMoney() {
		try {
			Date day = DateUtils.getPastDay(new Date(), -2);
			Map<String, Object> parameters = MapUtils.genMap("status", 81, "lessupdatedTime", day);
			List<SKSkqk> list = selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			for (SKSkqk obj : list) {
				userMoney(obj.getId());
			}
		} catch (Exception e) {
			BusinessExceptionUtil.threwException(e);
		}
	}

	// /**
	// * 试客返款的时候，增加的队列,防止重复返款
	// */
	// private Map<String,String> fankuanqk = new HashMap<String, String>();

	/**
	 * 确认返款，进行余额流水增加
	 * 
	 * @param id
	 */
	public void userMoney(long id) {
		SKSkqk obj = selectOne(id);
		if (obj.getStatus() != 81) {
			BusinessExceptionUtil.threwException("无法返款");
		}
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(obj.getUserid());
		zhang.setBusiid(id);
		zhang.setBusitypeid(4L);
		zhang.setYue(obj.getSalePrice());
		sKUserZhangService.add(zhang);
		obj.setStatus(99L);
		updateStatus(obj.getId(), 99L);
	}

	/**
	 * 获取待抽奖用户
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	public List<SKSkqk> getDengChouJiang(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "status", 21);
		List<SKSkqk> list = selectByWhere(parameters);
		return list;
	}
}
