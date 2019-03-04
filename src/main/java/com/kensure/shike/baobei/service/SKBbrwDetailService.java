package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBbrwDetailDao;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKBbrwDetail;

/**
 * 任务详情服务实现类
 * 
 * @author fankd created on 2019-3-4
 * @since
 */
@Service
public class SKBbrwDetailService extends JSBaseService {

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKBbrwDetailDao dao;

	public SKBbrwDetail selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBbrwDetail> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	private List<SKBbrwDetail> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}
	
	public List<SKBbrwDetail> selectByBbrwid(long bbrwid) {
		Map<String, Object> parameters = MapUtils.genMap("bbrwid",bbrwid);
		return dao.selectByWhere(parameters);
	}
	

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBbrwDetail obj) {
		return dao.insert(obj);
	}

	private boolean insertInBatch(List<SKBbrwDetail> objs) {
		for (SKBbrwDetail obj : objs) {
			super.beforeInsert(obj);
			obj.setYzj(0L);
			obj.setId(baseKeyService.getKey("sk_bbrw_detail"));
		}
		return dao.insertInBatch(objs);
	}

	private boolean update(SKBbrwDetail obj) {
		super.beforeUpdate(obj);
		return dao.update(obj);
	}

	public boolean updateYzj(SKBbrwDetail obj) {
		obj.setYzj(obj.getYzj()+1);
		return update(obj);
	}
	
	private boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	private boolean deleteMulti(Collection<Long> ids) {
		return dao.deleteMulti(ids);
	}

	public void addBatch(SKBbrw bbrw) {
		List<SKBbrwDetail> objs = bbrw.getDetails();
		if(CollectionUtils.isNotEmpty(objs)){
			for (SKBbrwDetail obj : objs) {
				obj.setBbid(bbrw.getBbid());
				obj.setBbrwid(bbrw.getId());
			}
			insertInBatch(objs);
		}
	}

	public void deleteBatch(long bbid) {
		// 删除旧的
		List<SKBbrwDetail> oldRws = this.selectByWhere(MapUtils.genMap("bbid", bbid));
		if (CollectionUtils.isNotEmpty(oldRws)) {
			List<Long> deleteIds = new ArrayList<Long>();
			for (SKBbrwDetail rw : oldRws) {
				deleteIds.add(rw.getId());
			}
			this.deleteMulti(deleteIds);
		}
	}

}
