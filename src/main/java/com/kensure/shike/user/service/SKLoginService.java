/*
 * 文件名称: SKLoginServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-2
 * 修改内容: 
 */
package com.kensure.shike.user.service;

import com.kensure.shike.user.dao.SKLoginDao;
import com.kensure.shike.user.model.SKLogin;
import com.kensure.shike.user.service.SKLoginService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import co.kensure.frame.JSBaseService;


/**
 * 试客登录表服务实现类
 * @author fankd created on 2018-9-2
 * @since 
 */
@Service
public class SKLoginService extends JSBaseService{
	
	@Resource
	private SKLoginDao dao;
    
    
    public SKLogin selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKLogin> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKLogin> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKLogin> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKLogin obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKLogin> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKLogin obj){
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
