package com.kensure.shike.zhang.service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.dao.SkUserFansDao;
import com.kensure.shike.zhang.model.SkUserFans;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;


/**
 * 代言人粉丝流水表服务实现类
 */
@Service
public class SkUserFansService extends JSBaseService{
	
	@Resource
	private SkUserFansDao dao;

	@Resource
	private SKUserService sKUserService;
    
    public SkUserFans selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SkUserFans> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SkUserFans> selectAll(){
		return dao.selectAll();
	}
	
	public List<SkUserFans> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SkUserFans obj){
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SkUserFans> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SkUserFans obj){
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
    
    public List<SkUserFans> getList(Integer status) {
		SKUser user = sKUserService.getUser();
		Map<String, Object> map = MapUtils.genMap("referee_id", user.getId(),
				"status", status,
				"orderBy", "created_time");

        List<SkUserFans> list = selectByWhere(map);

        for(SkUserFans fans : list) {
            SKUser skUser = sKUserService.selectOne(fans.getUserid());

            fans.setName(skUser.getName());
        }

        return list;
	}
  
}
