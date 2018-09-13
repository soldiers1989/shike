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

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKJysjDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;


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
	
	@Resource
	private SKUserService sKUserService;	
	
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
    
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public boolean save(SKBaobei baobei,long status,List<SKJysj> jysjList){
    	//加购物车
    	SKUser user = sKUserService.getUser();
    	SKUserService.checkUser(user);
    	checkJysj(jysjList, status, baobei, user);
    	for (SKJysj jysj:jysjList) {
    		insert(jysj);
		}
		return true;
	}
    
    /**
     * 组装和校验数据
     * @param jysjList
     * @param status
     * @param user
     */
    private void checkJysj(List<SKJysj> jysjList,Long status,SKBaobei baobei,SKUser user){
    	int size = CollectionUtils.getSize(jysjList);
    	if(status == 18){
    		//加购物车
    		SKJysj jysj = jysjList.get(0);
    		jysj.setStatus(status);
    		jysj.setBbid(baobei.getId());
    		jysj.setUserid(user.getId());
    		jysj.setTypeid(2L);
    		jysj.setBusitype("dpm");
    		if(size != 1){
    			BusinessExceptionUtil.threwException("数据不正确");
    		}
    		if(!jysj.getContent().equals(baobei.getDpname())){
    			BusinessExceptionUtil.threwException("请输入正确的店铺名");
    		}	
    	}else if(status == 21){
    		//收藏关注图
    		if(size != 2){
    			BusinessExceptionUtil.threwException("数据不正确2");
    		}
    		for(SKJysj jysj:jysjList){
    			jysj.setStatus(status);
        		jysj.setBbid(baobei.getId());
        		jysj.setUserid(user.getId());
        		jysj.setTypeid(3L);
        		if(StringUtils.isBlank(jysj.getContent())){
        			BusinessExceptionUtil.threwException("请上传图片");
        		}	
    		}    	
    	}else if(status == 61){
    		//订单
    		if(size != 2){
    			BusinessExceptionUtil.threwException("数据不正确2");
    		}
    		for(SKJysj jysj:jysjList){
    			jysj.setStatus(status);
        		jysj.setBbid(baobei.getId());
        		jysj.setUserid(user.getId());
        		if(StringUtils.isBlank(jysj.getContent())){
        			BusinessExceptionUtil.threwException("请填写数据");
        		}	
    		}    	
    	}else if(status == 81){
    		//订单
    		if(size != 2){
    			BusinessExceptionUtil.threwException("数据不正确2");
    		}
    		for(SKJysj jysj:jysjList){
    			jysj.setStatus(status);
        		jysj.setBbid(baobei.getId());
        		jysj.setUserid(user.getId());
        		if(StringUtils.isBlank(jysj.getContent())){
        			BusinessExceptionUtil.threwException("请填写数据");
        		}	
    		}    	
    	}else{
    		BusinessExceptionUtil.threwException("数据不正确1");
    	}
    }
  

}
