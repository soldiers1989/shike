/*
 * 文件名称: SKBbrwDetailDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2019-3-4
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.baobei.model.SKBbrwDetail;

/**
 * 任务详情Dao接口类
 * 
 * @author fankd created on 2019-3-4
 * @since 
 */
 @MyBatisRepository
public interface SKBbrwDetailDao extends JSBaseDao<SKBbrwDetail> {
	
	
	public SKBbrwDetail selectOne(Long id);
	
	public List<SKBbrwDetail> selectByIds(Collection<Long> ids);
	
	public List<SKBbrwDetail> selectAll();
	
	public List<SKBbrwDetail> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKBbrwDetail obj);
	
	public boolean insertInBatch(List<SKBbrwDetail> objs);
	
	
	public boolean update(SKBbrwDetail obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
