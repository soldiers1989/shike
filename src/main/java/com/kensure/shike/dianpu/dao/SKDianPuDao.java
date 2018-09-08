/*
 * 文件名称: SKDianPuDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.dianpu.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.dianpu.model.SKDianPu;

/**
 * 试客店铺Dao接口类
 * 
 * @author fankd created on 2018-9-8
 * @since 
 */
 @MyBatisRepository
public interface SKDianPuDao extends JSBaseDao<SKDianPu> {
	
	
	public SKDianPu selectOne(Long id);
	
	public List<SKDianPu> selectByIds(Collection<Long> ids);
	
	public List<SKDianPu> selectAll();
	
	public List<SKDianPu> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(SKDianPu obj);
	
	public boolean insertInBatch(List<SKDianPu> objs);
	
	
	public boolean update(SKDianPu obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(Long id);	
	
    public boolean deleteMulti(Collection<Long> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
