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
	private SKSkqkHelper sKSkqkHelper;

	public SKSkqk selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKSkqk> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKSkqk> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}
	
	public boolean delete(Long id) {
		return dao.delete(id);
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

	/**
	 * 根据试客情况获取他的详情
	 * @param id
	 * @return
	 */
	public SKSkqk getSkqkDetail(long id){
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
		if (qk.getStatus() < 0) {
			BusinessExceptionUtil.threwException("错误操作！");
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
		long size = selectCountByWhere(parameters);
		return size;
	}

	/**
	 * 对提交的订单进行轮询，超过3天就是进行好评业务
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void toHaoPin() {
		try {
			Date day = new Date();
			Map<String, Object> parameters = MapUtils.genMap("status", 61, "lessNextTime", day);
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
		return list;
	}

	/**
	 * 获取宝贝未完成的申请
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	public List<SKSkqk> getWaitList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "lessthanstatus", 98, "bigthanstatus", 0);
		List<SKSkqk> list = selectByWhere(parameters);
		return list;
	}
	
	/**
	 * 获取宝贝挂起的申请
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	public List<SKSkqk> getHumpList(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "status", -3);
		List<SKSkqk> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 取消一些申请的数据
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void quxiao() {
		Date now = new Date();
		// 先处理0-51状态的数据
		Map<String, Object> parameters = MapUtils.genMap("lessNextTime", now, "lessthanstatus", 80, "bigthanstatus", 51);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skqk : list) {
			if (skqk.getStatus() < 51) {
				// 如果是中将前，没啥问题
				continue;
			} else if (skqk.getStatus() == 61) {
				// 等待收货好评的状态，遇到了跳过去
				continue;
			} else {
				long bbid = skqk.getBbid();
				List<SKBbrw> bbrwl = sKBbrwService.getList(bbid);
				if (CollectionUtils.isNotEmpty(bbrwl)) {
					SKBbrw bbrw = bbrwl.get(0);
					bbrw.setYzj(bbrw.getYzj() - 1);
					sKBbrwService.update(bbrw);
				}

				// 修改已中奖数量
				SKBaobei baobei = sKBaobeiService.selectOne(bbid);

				SKBaobei obj = new SKBaobei();
				obj.setId(baobei.getId());
				obj.setZjnum(baobei.getZjnum() - 1);
				sKBaobeiService.update(obj);
			}
			// 自动取消
			updateStatus(skqk.getId(), -2L);
		}
	}
		
	/**
	 * 挂起某个申请
	 * @param id 申请id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void hump(long id) {
		SKSkqk sqqk = selectOne(id);
		if(sqqk.getStatus() >= 99){
			BusinessExceptionUtil.threwException("已经返款的申请无法挂起");
		}
		updateStatus(id, -3L);
	}
	
	/**
	 * 取消 某个申请的挂起
	 * @param id 申请id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void unhump(long id) {
		SKSkqk sqqk = selectOne(id);
		if(sqqk.getStatus() != -3){
			BusinessExceptionUtil.threwException("该申请没有挂起，无法取消");
		}
		updateStatus(id, sqqk.getLastStatus());
	}
	
	/**
	 * 取消一些结束活动的申请的数据
	 * 
	 * @param bbid
	 * @param userid
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void endquxiao(long bbid) {
		// 先处理0-51状态的数据
		Map<String, Object> parameters = MapUtils.genMap("bbid",bbid,"lessthanstatus", 50,"bigthanstatus",0);
		List<SKSkqk> list = selectByWhere(parameters);
		for (SKSkqk skqk : list) {
			// 自动取消
			updateStatus(skqk.getId(), -2L);
		}
	}
}
