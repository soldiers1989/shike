/*
 * 文件名称: SKCMSTextDao.java
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
import com.kensure.shike.sys.model.SKCMSText;

/**
 * 消息数据文本Dao接口类
 * 
 * @author fankd created on 2018-10-5
 * @since 
 */
 @MyBatisRepository
public interface SKCMSTextDao extends JSBaseDao<SKCMSText> {
	
	
	public SKCMSText selectOne(Long id);
	
	public List<SKCMSText> selectByIds(Collection<Long> ids);
	
	public List<SKCMSText> selectAll();
	
	public List<SKCMSText> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKCMSText obj);
	
	public boolean insertInBatch(List<SKCMSText> objs);
	
	
	public boolean update(SKCMSText obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
