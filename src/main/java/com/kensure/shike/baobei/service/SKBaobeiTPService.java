/*
 * 文件名称: SKBaobeiTPServiceImpl.java
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
import com.kensure.shike.baobei.dao.SKBaobeiTPDao;
import com.kensure.shike.baobei.model.SKBaobeiTP;

/**
 * 宝贝图片服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKBaobeiTPService extends JSBaseService {

	@Resource
	private SKBaobeiTPDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	public SKBaobeiTP selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBaobeiTP> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKBaobeiTP> selectAll() {
		return dao.selectAll();
	}

	public List<SKBaobeiTP> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBaobeiTP obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_baobeitp"));
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKBaobeiTP> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKBaobeiTP obj) {
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
	 * 获取宝贝的图片列表
	 * @param bbid
	 * @return
	 */
	public List<SKBaobeiTP> getList(Long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "orderby", "disorder");
		List<SKBaobeiTP> list = selectByWhere(parameters);
		return list;
	}

}
