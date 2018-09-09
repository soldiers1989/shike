/*
 * 文件名称: SKWordServiceImpl.java
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
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKWordDao;
import com.kensure.shike.baobei.model.SKWord;


/**
 * 关键词服务实现类
 * @author fankd created on 2018-9-9
 * @since 
 */
@Service
public class SKWordService extends JSBaseService{
	
	@Resource
	private SKWordDao dao;
    
	@Resource
	private BaseKeyService baseKeyService;
    
    public SKWord selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKWord> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKWord> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKWord> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKWord obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_word"));
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKWord> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKWord obj){
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
