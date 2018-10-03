/*
 * 文件名称: SKDianPuServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.dianpu.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.dianpu.dao.SKDianPuDao;
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.user.model.SKRole;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKRoleService;
import com.kensure.shike.user.service.SKUserService;

/**
 * 试客店铺服务实现类
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
@Service
public class SKDianPuService extends JSBaseService {

	@Resource
	private SKDianPuDao dao;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKRoleService sKRoleService;

	public SKDianPu selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKDianPu> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKDianPu> selectAll() {
		return dao.selectAll();
	}

	public List<SKDianPu> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKDianPu obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_dianpu"));
		obj.setTypeid(1L);
		obj.setStatus(0L);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKDianPu> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKDianPu obj) {
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

	public List<SKDianPu> selectByUserId(Long userid) {
		Map<String, Object> parameters = MapUtils.genMap("userid", userid);
		List<SKDianPu> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 新增店铺
	 * 
	 * @return
	 */
	public boolean addDianPu(SKDianPu obj) {
		SKUser user = sKUserService.getUser();
		SKUserService.checkUser(user);
		ParamUtils.isBlankThrewException(obj.getName(), "名称不能为空");
		ParamUtils.isBlankThrewException(obj.getUrl(), "链接不能为空");
		obj.setUserid(user.getId());
		SKRole role = sKRoleService.selectRoleByCode(user.getLevelCode());
		List<SKDianPu> dianpulist = selectByUserId(user.getId());
		if (role.getDianpushu() <= CollectionUtils.getSize(dianpulist)) {
			BusinessExceptionUtil.threwException("店铺数超过上限，请联系客服升级会员");
		}

		insert(obj);
		return true;
	}

	/**
	 * 根据用户获取店铺记录
	 * 
	 * @return
	 */
	public List<SKDianPu> getList() {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		List<SKDianPu> list = null;
		if (skuser.getType() == 3) {
			list = getAllList();
		} else {
			Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "status", 0L, "orderby", "created_time");
			list = selectByWhere(parameters);
		}
		return list;
	}

	/**
	 * 获取店铺记录
	 * 
	 * @return
	 */
	public List<SKDianPu> getAllList() {
		Map<String, Object> parameters = MapUtils.genMap("orderby", "created_time desc");
		List<SKDianPu> list = selectByWhere(parameters);
		for(SKDianPu dp:list){
			SKUser u = sKUserService.selectOne(dp.getUserid());
			dp.setUserName(u.getName());
		}
		return list;
	}

}
