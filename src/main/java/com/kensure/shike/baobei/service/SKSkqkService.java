package com.kensure.shike.baobei.service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.*;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKSkqkDao;
import com.kensure.shike.baobei.dao.SKSkqkLeftDao;
import com.kensure.shike.baobei.model.*;
import com.kensure.shike.baobei.query.SKSkqkLeftQuery;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;
import com.kensure.shike.zhang.service.SkUserFansService;
import com.kensure.shike.zhang.service.SkUserJinbiService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.*;

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
	private SKSkqkLeftDao leftdao;

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
	private SkUserFansService skUserFansService;

	@Resource
	private SKJysjService sKJysjService;

	@Resource
	private SkUserJinbiService skUserJinbiService;

	@Resource
	private SKChouJiangLimitService sKChouJiangLimitService;

	@Resource
	private SKSkqkHelper sKSkqkHelper;

	public SKSkqk selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKSkqk> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	private List<SKSkqk> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public boolean delete(Long id) {
		return dao.delete(id);
	}

	private long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKSkqk obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_sqqk"));
		obj.setLastStatus(0L);
		obj.setStatus(1L);
		return dao.insert(obj);
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
		return sKSkqkHelper.updateNextTime(id, status);
	}

	public boolean updateByMap(Map<String, Object> params) {
		params.put("updatedTime", new Date());
		return dao.updateByMap(params);
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
		Map<String, Object> parameters = MapUtils.genMap("userid", userid, "startStatus", 51, "endStatus", "98");
		return selectCountByWhere(parameters);
	}

	/**
	 * 查询该用户今日的所有申请数量
	 * 
	 * @param userid
	 * @return
	 */
	public long getQkByToday(long userid) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userid, "startCreatedTime", DateUtils.formatDateStart(new Date()), "endCreatedTime", DateUtils.formatDateEnd(new Date()));
		return selectCountByWhere(parameters);
	}

	// 获取宝贝中奖情况
	public long getZJNum(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "startStatus", 51);
		return selectCountByWhere(parameters);
	}

	// 获取宝贝试用情况，是给商家展现的
	public List<SKSkqk> getSkqkList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "startStatus", 51);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skskqk : list) {
			List<SKJysj> jylist = sKJysjService.selectByBbidAndUserid(skskqk.getBbid(), skskqk.getUserid());
			skskqk.setJylist(jylist);
		}
		return list;
	}

	/**
	 * 根据试客情况获取他的详情
	 * 
	 * @param id
	 * @return
	 */
	public SKSkqk getSkqkDetail(long id) {
		SKSkqk skqk = selectOne(id);
		List<SKJysj> jylist = sKJysjService.selectByBbidAndUserid(skqk.getBbid(), skqk.getUserid());
		skqk.setJylist(jylist);
		return skqk;
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

				// 单日申请10次 赠送200
				long todaySq = getQkByToday(skuser.getId());
				if (todaySq == 10) {
					skUserJinbiService.addDrsq(skuser.getId());
				}
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
		if (qk.getStatus() == -3) {
			BusinessExceptionUtil.threwException("该申请已经被申诉，请和商家联系！");
		}
		if (qk.getStatus() == -1) {
			BusinessExceptionUtil.threwException("该申请是无效申请！");
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
		Map<String, Object> parameters = MapUtils.genMap("userid", user.getId(), "orderby", "updated_time desc");
		if (status == 51) {
			parameters.put("startStatus", 51);
			parameters.put("endStatus", 81);
		} else if (status == 18) {
			parameters.put("startStatus", 0);
			parameters.put("endStatus", 18);
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
	 * 管理端，查询试客情况
	 * 
	 * @return
	 */
	public List<SKSkqkLeft> getList(SKSkqkLeftQuery skqkquery, PageInfo page) {
		Map<String, Object> parameters = MapUtils.bean2Map(skqkquery, true);
		MapUtils.putPageInfo(parameters, page);
		parameters.put("orderby", "t.created_time desc");
		List<SKSkqkLeft> list = leftdao.selectByWhere(parameters);
		return list;
	}

	/**
	 * 管理端，查询试客情况总计
	 * 
	 * @return
	 */
	public Long getListCount(SKSkqkLeftQuery skqkquery) {
		Map<String, Object> parameters = MapUtils.bean2Map(skqkquery, true);
		long size = leftdao.selectCountByWhere(parameters);
		return size;
	}

	/**
	 * 商家端，查询试客情况 status 0是进行中的活动，1是已结算活动
	 * 
	 * @return
	 */
	public List<SKSkqkLeft> getList1(SKSkqkLeftQuery skqkquery, Integer status, PageInfo page) {
		List<SKBaobei> baobeilist = null;
		if (status == 1) {
			baobeilist = sKBaobeiService.getJiesuan();
		} else {
			baobeilist = sKBaobeiService.getUnJiesuan();
		}

		if (CollectionUtils.isEmpty(baobeilist)) {
			return null;
		}

		List<Long> ids = new ArrayList<Long>();
		for (SKBaobei bb : baobeilist) {
			ids.add(bb.getId());
		}
		Map<String, Object> parameters = MapUtils.bean2Map(skqkquery, true);
		MapUtils.putPageInfo(parameters, page);
		parameters.put("bbidlist", ids);
		parameters.put("shangjiastatus", 1);
		parameters.put("orderby", "t.created_time desc");
		List<SKSkqkLeft> list = leftdao.selectByWhere(parameters);
		return list;
	}

	/**
	 * 商家端，查询试客情况 status 0是进行中的活动，1是已结算活动
	 * 
	 * @return
	 */
	public Long getListCount1(SKSkqkLeftQuery skqkquery, Integer status) {
		List<SKBaobei> baobeilist = null;
		if (status == 1) {
			baobeilist = sKBaobeiService.getJiesuan();
		} else {
			baobeilist = sKBaobeiService.getUnJiesuan();
		}

		if (CollectionUtils.isEmpty(baobeilist)) {
			return 0L;
		}

		List<Long> ids = new ArrayList<Long>();
		for (SKBaobei bb : baobeilist) {
			ids.add(bb.getId());
		}
		Map<String, Object> parameters = MapUtils.bean2Map(skqkquery, true);
		parameters.put("bbidlist", ids);
		parameters.put("shangjiastatus", 1);
		long count = leftdao.selectCountByWhere(parameters);
		return count;
	}

	/**
	 * 管理端端，查询试客情况
	 *
	 * @return
	 */
	public List<SKSkqkLeft> getList2(Long bbid, PageInfo page) {
		Map<String, Object> parameters = MapUtils.bean2Map(page, true);
		MapUtils.putPageInfo(parameters, page);
		parameters.put("bbid", bbid);
		parameters.put("orderby", "t.created_time desc");
		List<SKSkqkLeft> list = leftdao.selectByWhere(parameters);
		return list;
	}

	/**
	 * 管理端端，查询试客情况
	 *
	 * @return
	 */
	public Long getListCount2(Long id, PageInfo page) {
		List<Long> ids = new ArrayList<Long>();
		ids.add(id);

		Map<String, Object> parameters = MapUtils.bean2Map(page, true);
		parameters.put("bbidlist", ids);
		parameters.put("shangjiastatus", 1);
		long count = leftdao.selectCountByWhere(parameters);
		return count;
	}

	/**
	 * 对提交的订单进行轮询，超过3天就是开启好评业务
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void kaiQiHaoPin() {
		try {
			Date day = new Date();
			Map<String, Object> parameters = MapUtils.genMap("status", 61, "endNextTime", day);
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
	 * 默认好评，对超过时间的就那些默认好评
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void moRenHaoPin() {
		try {
			Date day = new Date();
			Map<String, Object> parameters = MapUtils.genMap("status", 71, "endNextTime", day);
			List<SKSkqk> list = selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			for (SKSkqk obj : list) {
				Map<String, Object> params = MapUtils.genMap("id", obj.getId(), "remark", obj.getRemark()+" 默认好评");
				updateByMap(params);
				updateStatus(obj.getId(), 81L);
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
			Map<String, Object> parameters = MapUtils.genMap("status", 81, "endUpdatedTime", day);
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

	/**
	 * 确认返款，进行余额流水增加
	 * 
	 * @param id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void userMoney(long id) {
		SKSkqk obj = selectOne(id);
		if (obj.getStatus() != 81) {
			BusinessExceptionUtil.threwException("无法返款");
		}
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(obj.getUserid());
		zhang.setBusiid(id);
		zhang.setBusitypeid(4L);
		double yue = ArithmeticUtils.add(obj.getSalePrice(), obj.getJiangli());
		zhang.setYue(yue);
		zhang.setRemark("本金:" + obj.getSalePrice() + "；奖励：" + obj.getJiangli());
		sKUserZhangService.add(zhang);
		obj.setStatus(99L);
		// 新人到账
		skUserFansService.newUser(obj.getUserid());

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
		// 去掉没有审核通过的试客
		List<SKSkqk> ilist = new ArrayList<>();
		SKBaobei baobei = sKBaobeiService.selectOne(bbid);

		for (SKSkqk skqk : list) {
			boolean flag = sKUserService.isInvalid(skqk.getUserid());
			if (flag) {
				if (baobei.isLimit()) {
					flag = sKChouJiangLimitService.isOk(skqk.getUserid());
				}
				if (flag) {
					ilist.add(skqk);
				}
			}
		}
		return ilist;
	}

	/**
	 * 获取宝贝未完成的申请
	 */
	public List<SKSkqk> getWaitList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "startStatus", 51, "endStatus", 98);
		List<SKSkqk> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 获取宝贝挂起的申请
	 */
	public List<SKSkqk> getHumpList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "status", -3);
		List<SKSkqk> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 只要取消中奖数据就好了
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void quXiaoZhongJiang() {
		Date now = new Date();
		Map<String, Object> parameters = MapUtils.genMap("endNextTime", now, "status", 51);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skqk : list) {
			long bbid = skqk.getBbid();
			quxiaoDev(bbid);
			// 自动取消
			updateStatus(skqk.getId(), -2L);
		}
	}

	/**
	 * 作废宝贝中奖前的申请信息,一般是在活动结算时调用
	 * 
	 * @param bbid
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void zuoFei(long bbid) {
		// 先处理-2-50状态的数据
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "startStatus", -2, "endStatus", 50);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skqk : list) {
			// 作废掉
			updateStatus(skqk.getId(), -10L);
		}
	}

	/**
	 * 手动取消申请按钮
	 * 
	 * @param skqkid
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void userQuxiao(Long skqkid) {
		SKSkqk skqk = selectOne(skqkid);
		if (skqk.getStatus() != -3) {
			BusinessExceptionUtil.threwException("只有申诉的申请才能设为无效");
		}
		quxiaoDev(skqk.getBbid());
		// 手动取消
		updateStatus(skqk.getId(), -1L);

	}

	/**
	 * 取消一个中奖后的申请，需要做的事情
	 */
	private void quxiaoDev(Long bbid) {
		SKBbrw bbrw = sKBbrwService.getValidBbrw(bbid);
		if (bbrw != null) {
			sKBbrwService.addyzj(bbrw.getId(), -1);
		}
		// 修改已中奖数量
		sKBaobeiService.addZjsNum(bbid, -1);
	}

	/**
	 * 挂起某个申请
	 * 
	 * @param id
	 *            申请id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void hump(long id, String remark) {
		SKSkqk sqqk = selectOne(id);
		if (sqqk.getStatus() >= 99) {
			BusinessExceptionUtil.threwException("已经返款的申请无法挂起");
		}
		Map<String, Object> params = MapUtils.genMap("id", id, "remark", remark);
		updateByMap(params);
		updateStatus(id, -3L);
	}

	/**
	 * 取消 某个申请的挂起
	 * 
	 * @param id
	 *            申请id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void unhump(long id) {
		SKSkqk sqqk = selectOne(id);
		if (sqqk.getStatus() != -3) {
			BusinessExceptionUtil.threwException("该申请没有挂起，无法取消");
		}
		updateStatus(id, sqqk.getLastStatus());
	}

	/**
	 * 获取该用户有效的申请数
	 * 
	 * @param userId
	 * @return
	 */
	public long getSkqkCountByUserId(Long userId) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userId);
		return selectCountByWhere(parameters);
	}

	/**
	 * 获取该用户活动中奖数数
	 * 
	 * @param userId
	 * @return
	 */
	public long getSkqkZjCountByUserId(Long userId) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userId, "startStatus", 51);
		return selectCountByWhere(parameters);
	}
}
