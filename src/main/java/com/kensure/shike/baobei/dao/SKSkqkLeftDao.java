/*
 * 文件名称: SKSkqkDao.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.dao;
import java.util.List;
import java.util.Map;

import co.kensure.annotation.MyBatisRepository;
import co.kensure.frame.JSBaseDao;

import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKSkqkLeft;

/**
 * 试客情况表Dao接口类，用于链表查询
 * 
 * @author fankd created on 2018-9-11
 * @since 
 */
 @MyBatisRepository
public interface SKSkqkLeftDao extends JSBaseDao<SKSkqk> {
		
	public List<SKSkqkLeft> selectByWhere(Map<String, Object> parameters);
	
	public long selectCountByWhere(Map<String, Object> parameters);
	
}
