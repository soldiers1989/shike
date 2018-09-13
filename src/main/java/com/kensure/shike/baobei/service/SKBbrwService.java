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

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBbrwDao;
import com.kensure.shike.baobei.model.SKBbrw;


/**
 * 宝贝试客任务服务实现类
 * @author fankd created on 2018-9-9
 * @since 
 */
@Service
public class SKBbrwService extends JSBaseService{
	
	@Resource
	private SKBbrwDao dao;
    
	@Resource
	private BaseKeyService baseKeyService;
	
    public SKBbrw selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKBbrw> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKBbrw> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKBbrw> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKBbrw obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_bbrw"));
		obj.setStatus(1L);
		obj.setYsqnum(0L);
		return dao.insert(obj);
	}
	
	/**
	 * 初始化rw相关属性
	 * @param obj
	 */
	public void initData(List<SKBbrw> rws){
		for(SKBbrw obj:rws){
			Date day = DateUtils.parse(obj.getDaydes(), DateUtils.DAY_FORMAT);
			obj.setStartTime(DateUtils.parse(DateUtils.formatDateStart(day), DateUtils.DATE_FORMAT_PATTERN)) ;
			obj.setEndTime(DateUtils.parse(DateUtils.formatDateEnd(day), DateUtils.DATE_FORMAT_PATTERN)) ;	
			long sqnum = obj.getBbnum()*100/NumberUtils.parseInteger(obj.getZhuanhua(), 0);
			obj.setSqnum(sqnum);
		}	
	}
	
	/**
	 * 初始化rw相关属性
	 * @param obj
	 */
	public void add(List<SKBbrw> rws,Long bbid){
		for(SKBbrw obj:rws){
			obj.setBbid(bbid);
			insert(obj);
		}	
	}
	
	/**
	 * 初始化rw相关属性
	 * @param obj
	 */
	public void add(SKBbrw obj){
		Date day = DateUtils.parse(obj.getDaydes(), DateUtils.DAY_FORMAT);
		obj.setStartTime(DateUtils.parse(DateUtils.formatDateStart(day), DateUtils.DATE_FORMAT_PATTERN)) ;
		obj.setEndTime(DateUtils.parse(DateUtils.formatDateEnd(day), DateUtils.DATE_FORMAT_PATTERN)) ;	
		long sqnum = obj.getBbnum()*100/NumberUtils.parseInteger(obj.getZhuanhua(), 0);
		obj.setSqnum(sqnum);
	}
	
	/**
	 * 任务申请
	 * @param bbid
	 */
	public void shenqing(Long bbid){
		List<SKBbrw> list = getList(bbid);
		if(CollectionUtils.isEmpty(list)){
			BusinessExceptionUtil.threwException("宝贝今天没有任务");
		}
		
		SKBbrw rw = list.get(0);
		if(rw.getSqnum()<=rw.getYsqnum()){
			BusinessExceptionUtil.threwException("宝贝今天已经申请完了");
		}
		Map<String, Object> params = MapUtils.genMap("id",rw.getId(),"ysqnumAdd",1);
		updateByMap(params);
	}
	
	/**
	 * 获取宝贝今天的任务
	 * @param bbid
	 * @return
	 */
	public List<SKBbrw> getList(Long bbid){
		String todayStr = DateUtils.format(new Date(),DateUtils.DAY_FORMAT);
		Map<String, Object> parameters = MapUtils.genMap("daydes", todayStr, "bbid", bbid);
		List<SKBbrw> list = selectByWhere(parameters);
		return list;
	}
	
	public boolean insertInBatch(List<SKBbrw> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKBbrw obj){
		return dao.update(obj);
	}
    
    public boolean updateByMap(Map<String, Object> params){
		return dao.updateByMap(params);
	}
    
    
	public boolean delete(Long id){
		return dao.delete(id);
	}	
	
    public boolean deleteMulti(Collection<Long> ids){
		return dao.deleteMulti(ids);
	}
    
    public boolean deleteByWhere(Map<String, Object> parameters){
		return dao.deleteByWhere(parameters);
	}
    
    
  

}
