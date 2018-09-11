/*
 * 文件名称: SKJysjServiceImpl.java
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
import com.kensure.shike.baobei.dao.SKJysjDao;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.service.SKJysjService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;


/**
 * 试客校验数据表服务实现类
 * @author fankd created on 2018-9-11
 * @since 
 */
@Service
public class SKJysjService extends JSBaseService{
	
	@Resource
	private SKJysjDao dao;
	
	@Resource
	private BaseKeyService baseKeyService;
    
    public SKJysj selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKJysj> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKJysj> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKJysj> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKJysj obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_jysj"));
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKJysj> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKJysj obj){
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
    
    
    public boolean save(SKBbrw bbrw,long status,List<SKJysj> jysjList){
    	
		return false;
	}
    
  

}
