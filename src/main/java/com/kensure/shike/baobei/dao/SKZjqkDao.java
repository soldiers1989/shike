/*
 * 文件名称: SKZjqkDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-31
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.baobei.model.SKZjqk;

/**
 * 试客中奖情况Dao接口类
 * 
 * @author fankd created on 2018-10-31
 * @since 
 */
 @MyBatisRepository
public interface SKZjqkDao extends JSBaseDao<SKZjqk> {
	
	
	public SKZjqk selectOne(Long id);
	
	public List<SKZjqk> selectByIds(Collection<Long> ids);
	
	public List<SKZjqk> selectAll();
	
	public List<SKZjqk> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKZjqk obj);
	
	public boolean insertInBatch(List<SKZjqk> objs);
	
	
	public boolean update(SKZjqk obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
