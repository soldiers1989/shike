package com.kensure.shike.user.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import com.kensure.shike.user.model.SkYijian;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 意见反馈表Dao接口类
 * 
 */
 @MyBatisRepository
public interface SkYijianDao extends JSBaseDao<SkYijian> {
	
	
	public SkYijian selectOne(Long id);
	
	public List<SkYijian> selectByIds(Collection<Long> ids);
	
	public List<SkYijian> selectAll();
	
	public List<SkYijian> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SkYijian obj);
	
	public boolean insertInBatch(List<SkYijian> objs);
	
	
	public boolean update(SkYijian obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
