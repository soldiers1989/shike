/*
 * 文件名称: SKZjqkServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-31
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.DateUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKZjqkCountDao;
import com.kensure.shike.baobei.dao.SKZjqkDao;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKZjqk;
import com.kensure.shike.baobei.model.SKZjqkCount;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;


/**
 * 试客中奖情况服务实现类
 * @author fankd created on 2018-10-31
 * @since 
 */
@Service
public class SKZjqkService extends JSBaseService{
	
	@Resource
	private SKZjqkDao dao;
	
	@Resource
	private SKZjqkCountDao countDao;
    
	@Resource
	private BaseKeyService baseKeyService;
	
	@Resource
	private SKUserService sKUserService;
    
    public SKZjqk selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKZjqk> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKZjqk> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	public boolean insert(SKZjqk obj){
		super.beforeInsert(obj);
		obj.setDaydes(DateUtils.format(obj.getCreatedTime(), DateUtils.DAY_FORMAT));
		obj.setId(baseKeyService.getKey("sk_zjqk"));
		obj.setStatus(0L);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKZjqk> objs){
		return dao.insertInBatch(objs);
	}	
	
	public boolean update(SKZjqk obj){
		super.beforeUpdate(obj);
		return dao.update(obj);
	}
    
    public boolean updateByMap(Map<String, Object> params){
		return dao.updateByMap(params);
	}

    /**
     * 试客中奖时增加记录,status必须为51
     * @param obj
     */
    public SKZjqk add(SKSkqk obj){
    	if(obj.getStatus() != 51){
    		return null;
    	}
		super.beforeInsert(obj);
		SKZjqk skzjqk = new SKZjqk();
		skzjqk.setSqqkid(obj.getId());
		skzjqk.setBbid(obj.getBbid());
		skzjqk.setUserid(obj.getUserid());
		insert(skzjqk);
		return skzjqk;
	}
    
    
    /**
     * 中奖人，把status改成1，变成短信发送成功
     * @param obj
     */
    public void commit(SKZjqk obj){
    	if(obj == null){
    		return;
    	}
    	obj.setStatus(1L);
    	update(obj);
	}
    
    /**
     * 中奖人，把status改成-1，变成短信发送失败
     * @param obj
     */
    public void rollback(SKZjqk obj){
    	if(obj == null){
    		return;
    	}
    	obj.setStatus(-1L);
    	update(obj);
	}
    
	public List<SKZjqk> selectByBbid(Long bbid){
		Map<String, Object> parameters = MapUtils.genMap("bbid",bbid,"orderby","id");
		List<SKZjqk> list = selectByWhere(parameters);
		for(SKZjqk zjqk:list){
			SKUser user = sKUserService.selectOne(zjqk.getUserid());
			zjqk.setUser(user);
		}
		return list;
	}
	
	/**
	 * 是否新人，如果没有中过奖，就是新人
	 */
	public boolean isNew(Long userid){
		Map<String, Object> parameters = MapUtils.genMap("userid", userid);	
		long count = dao.selectCountByWhere(parameters);
		return count==0;
	}
	
	
	/**
	 * 试客一段时间的中奖情况统计
	 * @param userid
	 * @param startCreatedTime
	 * @param endCreatedTime
	 * @return
	 */
	public List<SKZjqkCount> groupByUserid(Long userid,Date startCreatedTime,Date endCreatedTime){
		Map<String, Object> parameters = MapUtils.genMap("startCreatedTime",startCreatedTime,"endCreatedTime",endCreatedTime);
		if(userid != null){
			parameters.put("userid", userid);
		}
		List<SKZjqkCount> list = countDao.selectByWhere(parameters);
		return list;
	}
	
}
