/*
 * 文件名称: SKUserYueServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.zhang.service;

import com.kensure.shike.zhang.dao.SKUserYueDao;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.service.SKUserYueService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import co.kensure.frame.JSBaseService;


/**
 * 用户余额服务实现类
 * @author fankd created on 2018-9-9
 * @since 
 */
@Service
public class SKUserYueService extends JSBaseService{
	
	@Resource
	private SKUserYueDao dao;
    
    
    public SKUserYue selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKUserYue> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKUserYue> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKUserYue> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKUserYue obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKUserYue> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKUserYue obj){
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
