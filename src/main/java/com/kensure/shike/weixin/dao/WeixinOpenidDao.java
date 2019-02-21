/*
 * 文件名称: WeixinOpenidDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2019-2-20
 * 修改内容: 
 */
package com.kensure.shike.weixin.dao;
import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;
import java.util.List;
import java.util.Collection;
import java.util.Map;
import com.kensure.shike.weixin.model.WeixinOpenid;

/**
 * 微信openid关联表Dao接口类
 * 
 * @author fankd created on 2019-2-20
 * @since 
 */
 @MyBatisRepository
public interface WeixinOpenidDao extends JSBaseDao<WeixinOpenid> {
	
	
	public WeixinOpenid selectOne(String id);
	
	public List<WeixinOpenid> selectByIds(Collection<String> ids);
	
	public List<WeixinOpenid> selectAll();
	
	public List<WeixinOpenid> selectByWhere(Map<String, Object> parameters);
	
	
	public long selectCount();
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
	
	public boolean insert(WeixinOpenid obj);
	
	public boolean insertInBatch(List<WeixinOpenid> objs);
	
	
	public boolean update(WeixinOpenid obj);
    
    public boolean updateByMap(Map<String, Object> params);
    
    
	public boolean delete(String id);	
	
    public boolean deleteMulti(Collection<String> ids);
    
    public boolean deleteByWhere(Map<String, Object> parameters);
	
	
}
