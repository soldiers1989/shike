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

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKSkqkDao;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.service.SKSkqkService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

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
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKSkqk> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKSkqk obj) {
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

	public SKSkqk getQkByBBId(long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid);
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
	 * 申请
	 * @param bbrw
	 * @param salePrice
	 * @param jiangli
	 * @return
	 */
	public boolean saveSQ(SKBbrw bbrw,double salePrice,double jiangli){
		SKSkqk qk = getQkByBBId(bbrw.getBbid());
		if(qk != null){
			BusinessExceptionUtil.threwException("你已经申请过该宝贝！");
		}
		qk = new SKSkqk();
		qk.setBbid(bbrw.getBbid());
		qk.setRwid(bbrw.getId());
		qk.setSalePrice(salePrice);
		qk.setJiangli(jiangli);	
		return insert(qk);
	}

	/**
	 * 
	 * @param bbrw
	 * @param status
	 * @param jysjList
	 * @return
	 */
	public boolean save(SKBbrw bbrw,long status,List<SKJysj> jysjList){
		SKSkqk qk = getQkByBBId(bbrw.getBbid());
		//1是开始,-1是手动取消,-2是自动取消,11是货比三家，21是收藏关注加购物车宝贝,51是中奖，61是确认宝贝、提交付款订单，71反馈好评晒图,99是完成任务
		if(qk.getStatus() > status){
			
		}
    	if(status == 21){
    		if(qk != null){
    			BusinessExceptionUtil.threwException("你已经申请过该宝贝！");
    		}
    		qk = new SKSkqk();
    		qk.setBbid(bbrw.getBbid());
    		qk.setRwid(bbrw.getId());
    	
    	}
    	
		return insert(qk);
	}

}
