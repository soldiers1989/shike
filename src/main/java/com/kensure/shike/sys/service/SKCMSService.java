/*
 * 文件名称: SKCMSServiceImpl.java
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

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.sys.dao.SKCMSDao;
import com.kensure.shike.sys.model.SKCMS;
import com.kensure.shike.sys.model.SKCMSText;


/**
 * 消息数据服务实现类
 * @author fankd created on 2018-10-5
 * @since 
 */
@Service
public class SKCMSService extends JSBaseService{
	
	@Resource
	private SKCMSDao dao;
    
	@Resource
	private BaseKeyService baseKeyService;
	
	@Resource
	private SKCMSTextService sKCMSTextService;
	
    public SKCMS selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKCMS> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKCMS> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKCMS> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	public List<SKCMS> selectByTypeId(Integer typeid){
		Map<String, Object> parameters = MapUtils.genMap("typeid",typeid,"orderby","disorder");
		return selectByWhere(parameters);
	}
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKCMS obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_cms"));
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKCMS> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKCMS obj){
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
    
    public boolean add(SKCMS obj){
    	ParamUtils.isBlankThrewException(obj.getTitle(), "标题不能为空");
    	if(obj.getId() != null){
    		update(obj);
    		SKCMSText t = new SKCMSText();
        	t.setId(obj.getId());
        	t.setContent(obj.getContent());
        	sKCMSTextService.update(t);
    	}else{
    		insert(obj);
        	SKCMSText t = new SKCMSText();
        	t.setId(obj.getId());
        	t.setContent(obj.getContent());
        	sKCMSTextService.insert(t);
    	}  	
		return true;
	}  
    
    public SKCMS get(Long id){
    	ParamUtils.isBlankThrewException(id, "标题不能为空");
    	SKCMS obj = selectOne(id);
    	SKCMSText objt = sKCMSTextService.selectOne(id);
    	obj.setContent(objt.getContent());
		return obj;
	}  
}
