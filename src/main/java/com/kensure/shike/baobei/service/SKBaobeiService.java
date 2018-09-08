/*
 * 文件名称: SKBaobeiServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import com.kensure.shike.baobei.dao.SKBaobeiDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.service.SKBaobeiService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import co.kensure.frame.JSBaseService;


/**
 * 商品活动表服务实现类
 * @author fankd created on 2018-9-8
 * @since 
 */
@Service
public class SKBaobeiService extends JSBaseService{
	
	@Resource
	private SKBaobeiDao dao;
    
    
    public SKBaobei selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKBaobei> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKBaobei> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKBaobei> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKBaobei obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKBaobei> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKBaobei obj){
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
