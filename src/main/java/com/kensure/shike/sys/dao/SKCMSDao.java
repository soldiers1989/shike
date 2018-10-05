/*
 * 文件名称: SKCMSDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-10-5
 * 修改内容: 
 */
package com.kensure.shike.sys.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.sys.model.SKCMS;

/**
 * 消息数据Dao接口类
 * 
 * @author fankd created on 2018-10-5
 * @since 
 */
 @MyBatisRepository
public interface SKCMSDao extends JSBaseDao<SKCMS> {
	
	
	public SKCMS selectOne(Long id);
	
	public List<SKCMS> selectByIds(Collection<Long> ids);
	
	public List<SKCMS> selectAll();
	
	public List<SKCMS> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKCMS obj);
	
	public boolean insertInBatch(List<SKCMS> objs);
	
	
	public boolean update(SKCMS obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
