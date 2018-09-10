/*
 * 文件名称: SKJindianDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.baobei.model.SKJindian;

/**
 * 活动进店路径Dao接口类
 * 
 * @author fankd created on 2018-9-9
 * @since 
 */
 @MyBatisRepository
public interface SKJindianDao extends JSBaseDao<SKJindian> {
	
	
	public SKJindian selectOne(Long id);
	
	public List<SKJindian> selectByIds(Collection<Long> ids);
	
	public List<SKJindian> selectAll();
	
	public List<SKJindian> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKJindian obj);
	
	public boolean insertInBatch(List<SKJindian> objs);
	
	
	public boolean update(SKJindian obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
