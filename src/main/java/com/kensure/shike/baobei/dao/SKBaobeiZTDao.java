/*
 * 文件名称: SKBaobeiZTDao.java
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

import com.kensure.shike.baobei.model.SKBaobeiZT;

/**
 * 宝贝详情页面Dao接口类
 * 
 * @author fankd created on 2018-9-9
 * @since 
 */
 @MyBatisRepository
public interface SKBaobeiZTDao extends JSBaseDao<SKBaobeiZT> {
	
	
	public SKBaobeiZT selectOne(Long id);
	
	public List<SKBaobeiZT> selectByIds(Collection<Long> ids);
	
	public List<SKBaobeiZT> selectAll();
	
	public List<SKBaobeiZT> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKBaobeiZT obj);
	
	public boolean insertInBatch(List<SKBaobeiZT> objs);
	
	
	public boolean update(SKBaobeiZT obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
