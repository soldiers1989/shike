/*
 * 文件名称: SKUserZhangDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.zhang.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.zhang.model.SKUserZhang;

/**
 * 用户余额流水Dao接口类
 * 
 * @author fankd created on 2018-9-9
 * @since 
 */
 @MyBatisRepository
public interface SKUserZhangDao extends JSBaseDao<SKUserZhang> {
	
	
	public SKUserZhang selectOne(Long id);
	
	public List<SKUserZhang> selectByIds(Collection<Long> ids);
	
	public List<SKUserZhang> selectAll();
	
	public List<SKUserZhang> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKUserZhang obj);
	
	public boolean insertInBatch(List<SKUserZhang> objs);
	
	
	public boolean update(SKUserZhang obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
