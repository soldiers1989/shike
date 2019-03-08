package com.kensure.shike.user.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.user.model.SKUser;

/**
 * 用户表Dao接口类
 * 
 * @author fankd created on 2018-9-2
 * @since 
 */
 @MyBatisRepository
public interface SKUserDao extends JSBaseDao<SKUser> {
	
	
	public SKUser selectOne(Long id);
	
	public List<SKUser> selectByIds(Collection<Long> ids);
	
	public List<SKUser> selectByWhere(Map<String, Object> parameters);
	
	
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKUser obj);
	
	
	public boolean update(SKUser obj);
    
    public boolean updateByMap(Map<String, Object> params);
    	
}
