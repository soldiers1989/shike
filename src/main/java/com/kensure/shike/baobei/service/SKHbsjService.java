/*
 * 文件名称: SKHbsjServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-11-5
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import com.kensure.shike.baobei.dao.SKHbsjDao;
import com.kensure.shike.baobei.model.SKHbsj;
import com.kensure.shike.baobei.service.SKHbsjService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import co.kensure.frame.JSBaseService;


/**
 * 货比三家服务实现类
 * @author fankd created on 2018-11-5
 * @since 
 */
@Service
public class SKHbsjService extends JSBaseService{
	
	@Resource
	private SKHbsjDao dao;   
    
    public SKHbsj selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKHbsj> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKHbsj> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKHbsj> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKHbsj obj){
		super.beforeInsert(obj);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKHbsj> objs){
		return dao.insertInBatch(objs);
	}
	
	/**
	 * 保存货比三家
	 * @param obj
	 */
	public void save(SKHbsj obj){
		SKHbsj one = selectOne(obj.getId());
		if(one == null){
			insert(obj);
		}else{
			update(obj);
		}
	}
	
	public boolean update(SKHbsj obj){
		super.beforeUpdate(obj);
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
