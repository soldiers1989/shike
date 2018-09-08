/*
 * 文件名称: SKUserInoutDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.chongzhi.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.chongzhi.model.SKUserInout;

/**
 * 用余额充值和提现记录Dao接口类
 * 
 * @author fankd created on 2018-9-8
 * @since 
 */
 @MyBatisRepository
public interface SKUserInoutDao extends JSBaseDao<SKUserInout> {
	
	
	public SKUserInout selectOne(Long id);
	
	public List<SKUserInout> selectByIds(Collection<Long> ids);
	
	public List<SKUserInout> selectAll();
	
	public List<SKUserInout> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKUserInout obj);
	
	public boolean insertInBatch(List<SKUserInout> objs);
	
	
	public boolean update(SKUserInout obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
