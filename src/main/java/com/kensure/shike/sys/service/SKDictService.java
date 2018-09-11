/*
 * 文件名称: SKDictServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-11
 * 修改内容: 
 */
package com.kensure.shike.sys.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;

import com.kensure.shike.sys.dao.SKDictDao;
import com.kensure.shike.sys.model.SKDict;


/**
 * 字典表服务实现类
 * @author fankd created on 2018-9-11
 * @since 
 */
@Service
public class SKDictService extends JSBaseService{
	
	@Resource
	private SKDictDao dao;
    
    
    public SKDict selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKDict> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKDict> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKDict> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKDict obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKDict> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKDict obj){
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
	 * 获取某个字典的列表
	 * @param bbid
	 * @return
	 */
	public List<SKDict> getList(Integer typeid) {
		Map<String, Object> parameters = MapUtils.genMap("typeid", typeid, "orderby", "id");
		List<SKDict> list = selectByWhere(parameters);
		return list;
	}
  

}
