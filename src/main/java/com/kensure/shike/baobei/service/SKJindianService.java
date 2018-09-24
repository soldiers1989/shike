/*
 * 文件名称: SKJindianServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKJindianDao;
import com.kensure.shike.baobei.model.SKJindian;

/**
 * 活动进店路径服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKJindianService extends JSBaseService {

	@Resource
	private SKJindianDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	public SKJindian selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKJindian> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKJindian> selectAll() {
		return dao.selectAll();
	}

	public List<SKJindian> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKJindian obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_jindian"));
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKJindian> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKJindian obj) {
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	public boolean delete(Long id) {
		return dao.delete(id);
	}

	public boolean deleteMulti(Collection<Long> ids) {
		return dao.deleteMulti(ids);
	}

	public boolean deleteByWhere(Map<String, Object> parameters) {
		return dao.deleteByWhere(parameters);
	}
	
	/**
	 * 进店路径
	 * 
	 * @return
	 */
	public List<SKJindian> getList(Long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid);
		List<SKJindian> list = selectByWhere(parameters);
		return list;
	}

}
