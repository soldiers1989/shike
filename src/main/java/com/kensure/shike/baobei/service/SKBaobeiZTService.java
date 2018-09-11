/*
 * 文件名称: SKBaobeiZTServiceImpl.java
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
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBaobeiZTDao;
import com.kensure.shike.baobei.model.SKBaobeiZT;

/**
 * 宝贝详情页面服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKBaobeiZTService extends JSBaseService {

	@Resource
	private SKBaobeiZTDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	public SKBaobeiZT selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBaobeiZT> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKBaobeiZT> selectAll() {
		return dao.selectAll();
	}

	public List<SKBaobeiZT> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBaobeiZT obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_baobeizt"));
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKBaobeiZT> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKBaobeiZT obj) {
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
	 * 获取宝贝详情
	 * 
	 * @param bbid
	 * @return
	 */
	public SKBaobeiZT getDetail(Long bbid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid, "orderby", "disorder");
		List<SKBaobeiZT> list = selectByWhere(parameters);
		SKBaobeiZT detail = null;
		if (CollectionUtils.isNotEmpty(list)) {
			detail = list.get(0);
		}
		String tag = "tfsContent : '";
		StringBuffer sb = new StringBuffer();
		if(detail.getContent().contains(tag)){
			String c1 = detail.getContent().substring(detail.getContent().indexOf(tag)+tag.length());
			c1 = c1.substring(0,c1.indexOf("',"));
			String[] c2 = c1.split("src=\"");
			for(String c3:c2){
				if(c3.contains("\"")){
					String c4 = c3.substring(0, c3.indexOf("\""));
					if(c4.indexOf("_!!") != -1){
						sb.append(c4).append("sktag");
					}
				}		
			}
		}
		detail.setContent(sb.toString());
		return detail;
	}

}
