/*
 * 文件名称: SKCMSTextServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-5
 * 修改内容: 
 */
package com.kensure.shike.sys.service;

import com.kensure.shike.sys.dao.SKCMSTextDao;
import com.kensure.shike.sys.model.SKCMSText;
import com.kensure.shike.sys.service.SKCMSTextService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import co.kensure.frame.JSBaseService;


/**
 * 消息数据文本服务实现类
 * @author fankd created on 2018-10-5
 * @since 
 */
@Service
public class SKCMSTextService extends JSBaseService{
	
	@Resource
	private SKCMSTextDao dao;
    
    
    public SKCMSText selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKCMSText> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKCMSText> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKCMSText> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKCMSText obj){
		super.beforeInsert(obj);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKCMSText> objs){	
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKCMSText obj){
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
