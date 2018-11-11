/*
 * 文件名称: SKTaobaoDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-11-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.baobei.model.SKTaobao;

/**
 * 淘宝账号信息Dao接口类
 * 
 * @author fankd created on 2018-11-11
 * @since 
 */
 @MyBatisRepository
public interface SKTaobaoDao extends JSBaseDao<SKTaobao> {
	
	
	public SKTaobao selectOne(String id);
	
	public List<SKTaobao> selectByIds(Collection<String> ids);
	
	public List<SKTaobao> selectAll();
	
	public List<SKTaobao> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKTaobao obj);
	
	public boolean insertInBatch(List<SKTaobao> objs);
	
	
	public boolean update(SKTaobao obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(String id);	
	
    public boolean deleteMulti(Collection<String> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
