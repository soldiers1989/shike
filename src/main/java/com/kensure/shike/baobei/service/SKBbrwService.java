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
import co.kensure.mem.NumberUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBbrwDao;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKSkqk;

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

	public SKBbrw selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBbrw> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKBbrw> selectAll() {
		return dao.selectAll();
	}

	public List<SKBbrw> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBbrw obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_bbrw"));
		obj.setStatus(1L);
		obj.setYsqnum(0L);
		if(obj.getBbnum() == null){
			obj.setBbnum(0L);
		}
		if(obj.getZhuanhua() == null){
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
	public void initData(List<SKBbrw> rws,Long hdtypeid) {
		Date date = new Date();
		Date now = DateUtils.parse(DateUtils.format(date,DateUtils.DAY_FORMAT), DateUtils.DAY_FORMAT);
		for (SKBbrw obj : rws) {
			Date day = DateUtils.parse(obj.getDaydes(), DateUtils.DAY_FORMAT);
			if(day.getTime() < now.getTime()){
				BusinessExceptionUtil.threwException("时间不能早于今天");
			}
			if(obj.getBbnum() == null){
				obj.setBbnum(0L);
			}
			int zhuanhua = NumberUtils.parseInteger(obj.getZhuanhua(), 0);
			//立即申请，没有预热，每天必须有数量，转化率为100
			if(hdtypeid == 4){
				zhuanhua = 100;
				if(obj.getBbnum() > 0){
					BusinessExceptionUtil.threwException("必中任务，每天必须有投放量");
				}
			}
				
			long sqnum = 0;
			if(zhuanhua != 0){
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
	public void add(List<SKBbrw> rws, Long bbid) {
		for (SKBbrw obj : rws) {
			obj.setBbid(bbid);
			insert(obj);
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
	public void shenqing(Long bbid,Long hdtypeid) {
		List<SKBbrw> list = getList(bbid);
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
	public List<SKBbrw> getList(Long bbid) {
		String todayStr = DateUtils.format(new Date(), DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("daydes", todayStr, "bbid", bbid);
		List<SKBbrw> list = selectByWhere(parameters);
		return list;
	}

	public boolean insertInBatch(List<SKBbrw> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKBbrw obj) {
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
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
			List<SKBbrw> list = selectByWhere(parameters);
			if (CollectionUtils.isEmpty(list)) {
				return;
			}
			for (SKBbrw bbrw : list) {
				doOneRwCJ(bbrw, isEnd);
			}

		} catch (Exception e) {
			BusinessExceptionUtil.threwException(e);;
		}

	}

	/**
	 * 对每个宝贝的待抽奖人选进行抽奖
	 * 
	 * @param bbrw
	 */
	private void doOneRwCJ(SKBbrw bbrw, boolean isEnd) {
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
		if(cjsl == 0){
			return;
		}

		List<SKSkqk> list = sKSkqkService.getDengChouJiang(bbid);
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		if (list.size() <= cjsl) {
			// 奖比人多，全部中奖
			for (SKSkqk skqk : list) {
				skqk.setStatus(51L);
				sKSkqkService.update(skqk);
			}
			bbrw.setYzj(list.size()+bbrw.getYzj());
		} else {
			// 人多，需要进行抽
			List<SKSkqk> zjrlist = poolBean((int)cjsl, list);
			for (SKSkqk skqk : zjrlist) {
				skqk.setStatus(51L);
				sKSkqkService.update(skqk);
			}
			bbrw.setYzj(zjrlist.size()+bbrw.getYzj());
			
		}
		update(bbrw);
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

}
