/*
 * 文件名称: SKBaobeiDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.baobei.model.SKBaobei;

/**
 * 商品活动表Dao接口类
 * 
 * @author fankd created on 2018-9-8
 * @since 
 */
 @MyBatisRepository
public interface SKBaobeiDao extends JSBaseDao<SKBaobei> {
	
	
	public SKBaobei selectOne(Long id);
	
	public List<SKBaobei> selectByIds(Collection<Long> ids);
	
	public List<SKBaobei> selectAll();
	
	public List<SKBaobei> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKBaobei obj);
	
	public boolean insertInBatch(List<SKBaobei> objs);
	
	
	public boolean update(SKBaobei obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
