package com.kensure.shike.zhang.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import com.kensure.shike.zhang.model.SkUserJinbi;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 试客金币流水表Dao接口类
 * 
 * @author fankd created on 2018-10-5
 * @since 
 */
 @MyBatisRepository
public interface SkUserJinbiDao extends JSBaseDao<SkUserJinbi> {
	
	
	public SkUserJinbi selectOne(Long id);
	
	public List<SkUserJinbi> selectByIds(Collection<Long> ids);
	
	public List<SkUserJinbi> selectAll();
	
	public List<SkUserJinbi> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SkUserJinbi obj);
	
	public boolean insertInBatch(List<SkUserJinbi> objs);
	
	
	public boolean update(SkUserJinbi obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
