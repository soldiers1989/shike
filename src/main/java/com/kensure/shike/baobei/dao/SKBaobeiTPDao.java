/*
 * 文件名称: SKBaobeiTPDao.java
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

import com.kensure.shike.baobei.model.SKBaobeiTP;

/**
 * 宝贝图片Dao接口类
 * 
 * @author fankd created on 2018-9-9
 * @since 
 */
 @MyBatisRepository
public interface SKBaobeiTPDao extends JSBaseDao<SKBaobeiTP> {
	
	
	public SKBaobeiTP selectOne(Long id);
	
	public List<SKBaobeiTP> selectByIds(Collection<Long> ids);
	
	public List<SKBaobeiTP> selectAll();
	
	public List<SKBaobeiTP> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKBaobeiTP obj);
	
	public boolean insertInBatch(List<SKBaobeiTP> objs);
	
	
	public boolean update(SKBaobeiTP obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
