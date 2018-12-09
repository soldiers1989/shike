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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.ListUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBbrwDao;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.user.service.SKUserService;

/**
 * 宝贝试客任务服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKBbrwService extends JSBaseService {

	@Resource
	private SKBbrwDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SKZjqkService sKZjqkService;

	public SKBbrw selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBbrw> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKBbrw> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	/**
	 * 根据宝贝id，将能抽奖的获取出来
	 * 
	 * @param bbid
	 * @return
	 */
	public List<SKBbrw> selectByBBid(Long bbid) {
		String daydes = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "bigbbnum", 1, "bigdaydes", daydes, "orderby", "daydes");
		List<SKBbrw> list = dao.selectByWhere(parameters);
		return list;
	}

	public boolean insert(SKBbrw obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_bbrw"));
		obj.setStatus(1L);
		obj.setYsqnum(0L);
		if (obj.getBbnum() == null) {
			obj.setBbnum(0L);
		}
		if (obj.getZhuanhua() == null) {
			obj.setZhuanhua("0");
		}
		obj.setYzj(0L);
		return dao.insert(obj);
	}

	/**
	 * 初始化rw相关属性
	 * 
	 * @param obj
	 */
	public void initData(List<SKBbrw> rws, Long hdtypeid, boolean newFlag) {
		Date date = new Date();
		Date now = DateUtils.parse(DateUtils.format(date, DateUtils.DAY_FORMAT), DateUtils.DAY_FORMAT);
		for (SKBbrw obj : rws) {
			Date day = DateUtils.parse(obj.getDaydes(), DateUtils.DAY_FORMAT);
			if (newFlag && day.getTime() < now.getTime()) {
				BusinessExceptionUtil.threwException("时间不能早于今天");
			}
			if (obj.getBbnum() == null) {
				obj.setBbnum(0L);
			}
			int zhuanhua = NumberUtils.parseInteger(obj.getZhuanhua(), 0);
			// 立即申请，没有预热，每天必须有数量，转化率为100
			if (hdtypeid == 4) {
				zhuanhua = 100;
				if (obj.getBbnum() <= 0) {
					BusinessExceptionUtil.threwException("必中任务，每天必须有投放量");
				}
			}

			long sqnum = 0;
			if (zhuanhua != 0) {
				sqnum = obj.getBbnum() * 100 / zhuanhua;
			}
			obj.setSqnum(sqnum);

			obj.setStartTime(DateUtils.parse(DateUtils.formatDateStart(day), DateUtils.DATE_FORMAT_PATTERN));
			obj.setEndTime(DateUtils.parse(DateUtils.formatDateEnd(day), DateUtils.DATE_FORMAT_PATTERN));
		}
	}

	/**
	 * 初始化rw相关属性
	 * 
	 * @param obj
	 */
	public void saveOrUpdateInBatch(List<SKBbrw> rws, Long bbid, boolean newFlag) {
		Map<Long, SKBbrw> oldRwMap = null;
		if (!newFlag) {
			List<SKBbrw> oldRws = this.selectByWhere(MapUtils.genMap("bbid", bbid));
			oldRwMap = ListUtils.listToMap(oldRws, "id");
		}

		// 插入新的或更新旧的
		for (SKBbrw obj : rws) {
			obj.setBbid(bbid);
			if (obj.getId() == null) {
				this.insert(obj);
			} else {
				this.update(obj);
				if (oldRwMap != null) {
					oldRwMap.remove(obj.getId());
				}
			}
		}

		// 删除新列表不存在的
		if (oldRwMap != null && oldRwMap.size() > 0) {
			List<Long> ids = new ArrayList<Long>();
			for (SKBbrw rw : oldRwMap.values()) {
				ids.add(rw.getId());
			}
			this.deleteMulti(ids);
		}
	}

	/**
	 * 初始化rw相关属性
	 * 
	 * @param obj
	 */
	public void add(SKBbrw obj) {
		Date day = DateUtils.parse(obj.getDaydes(), DateUtils.DAY_FORMAT);
		obj.setStartTime(DateUtils.parse(DateUtils.formatDateStart(day), DateUtils.DATE_FORMAT_PATTERN));
		obj.setEndTime(DateUtils.parse(DateUtils.formatDateEnd(day), DateUtils.DATE_FORMAT_PATTERN));
		long sqnum = obj.getBbnum() * 100 / NumberUtils.parseInteger(obj.getZhuanhua(), 0);
		obj.setSqnum(sqnum);
	}

	/**
	 * 任务申请
	 * 
	 * @param bbid
	 */
	public void shenqing(Long bbid, Long hdtypeid) {
		List<SKBbrw> list = getTodayList(bbid);
		if (CollectionUtils.isEmpty(list)) {
			BusinessExceptionUtil.threwException("宝贝今天没有任务");
		}
		SKBbrw rw = list.get(0);
		if (rw.getSqnum() > 0 && rw.getSqnum() <= rw.getYsqnum()) {
			BusinessExceptionUtil.threwException("宝贝今天已经申请完了");
		}
		Map<String, Object> params = MapUtils.genMap("id", rw.getId(), "ysqnumAdd", 1);
		updateByMap(params);
	}

	/**
	 * 获取宝贝今天的任务
	 * 
	 * @param bbid
	 * @return
	 */
	public List<SKBbrw> getTodayList(Long bbid) {
		String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("daydes", todayStr, "bbid", bbid);
		List<SKBbrw> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 获取宝贝所有的任务
	 * 
	 * @param bbid
	 * @return
	 */
	public List<SKBbrw> getBbList(Long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "orderby", "daydes");
		List<SKBbrw> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 获取一个有效的宝贝任务
	 * 
	 * @param bbid
	 * @return
	 */
	public SKBbrw getValidBbrw(Long bbid) {
		ParamUtils.isBlankThrewException(bbid, "bbid不能为空！");
		SKBbrw bbrw = null;
		String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("enddaydes", todayStr, "bbid", bbid, "orderby", "daydes desc");
		List<SKBbrw> list = selectByWhere(parameters);
		if (CollectionUtils.isNotEmpty(list)) {
			bbrw = list.get(0);
		}
		return bbrw;
	}

	public boolean update(SKBbrw obj) {
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	public boolean deleteMulti(Collection<Long> ids) {
		return dao.deleteMulti(ids);
	}

	/**
	 * 增加或减少中奖数
	 * 
	 * @param id
	 * @param yzj
	 *            中奖增量+-
	 * @return
	 */
	public boolean addyzj(Long id, Integer yzjAdd) {
		Map<String, Object> params = MapUtils.genMap("id", id, "yzjAdd", yzjAdd);
		return updateByMap(params);
	}

}
