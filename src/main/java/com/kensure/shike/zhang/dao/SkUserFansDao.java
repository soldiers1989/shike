package com.kensure.shike.zhang.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import com.kensure.shike.zhang.model.SkUserFans;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 代言人粉丝流水表Dao接口类
 * 
 */
 @MyBatisRepository
public interface SkUserFansDao extends JSBaseDao<SkUserFans> {
	
	
	public SkUserFans selectOne(Long id);
	
	public List<SkUserFans> selectByIds(Collection<Long> ids);
	
	public List<SkUserFans> selectAll();
	
	public List<SkUserFans> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SkUserFans obj);
	
	public boolean insertInBatch(List<SkUserFans> objs);
	
	
	public boolean update(SkUserFans obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
