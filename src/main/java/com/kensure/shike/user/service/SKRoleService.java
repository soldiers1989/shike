/*
 * 文件名称: SKRoleServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.user.service;

import com.kensure.shike.user.dao.SKRoleDao;
import com.kensure.shike.user.model.SKRole;
import com.kensure.shike.user.service.SKRoleService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;


/**
 * 角色表服务实现类
 * @author fankd created on 2018-9-8
 * @since 
 */
@Service
public class SKRoleService extends JSBaseService{
	
	@Resource
	private SKRoleDao dao;
    
    
    public SKRole selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKRole> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKRole> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKRole> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKRole obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKRole> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKRole obj){
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
    
    /**
     * 根据编码寻找角色
     * @param code
     * @return
     */
    public SKRole selectRoleByCode(String code){
    	Map<String, Object> parameters = MapUtils.genMap("levelCode",code);
    	List<SKRole> list = selectByWhere(parameters);
    	SKRole role = null;
    	if(CollectionUtils.isNotEmpty(list)){
    		role = list.get(0);
    	}
		return role;
	}
    
}
