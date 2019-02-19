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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.PageInfo;

import com.kensure.basekey.BaseKeyService;
import com.kensure.mycom.config.service.MyConfigService;
import com.kensure.shike.dianpu.dao.SKDianPuDao;
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.user.model.SKRole;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKRoleService;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;

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
	
	@Resource
	private SKUserZhangService sKUserZhangService;

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
		obj.setJihuo(0);
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
		ParamUtils.isBlankThrewException(obj.getWangwang(), "旺旺不能为空");
		ParamUtils.isBlankThrewException(obj.getMjtp(), "卖家中心图片不能为空");
		ParamUtils.isBlankThrewException(obj.getPhone(), "负责人手机不能为空");
		obj.setUserid(user.getId());
		SKRole role = sKRoleService.selectRoleByCode(user.getLevelCode());
		List<SKDianPu> dianpulist = selectByUserId(user.getId());
		if (role.getDianpushu() <= CollectionUtils.getSize(dianpulist)) {
			BusinessExceptionUtil.threwException("店铺数超过上限，请联系客服升级会员");
		}
		obj.setName(obj.getName().trim());
		insert(obj);
		return true;
	}
	
	
	/**
	 * 新增店铺
	 * 
	 * @return
	 */
	public boolean tongguo(Long id) {
		SKDianPu one = selectOne(id);
		one.setStatus(9L);
		update(one);
		return true;
	}

	/**
	 * 根据用户获取店铺记录
	 * 
	 * @return
	 */
	public List<SKDianPu> getList(Long status,PageInfo page) {
		Map<String, Object> parameters = param(status, page);
		List<SKDianPu> list = selectByWhere(parameters);
		return list;
	}
	
	/**
	 * 根据用户获取店铺记录
	 * 
	 * @return
	 */
	public long getListCount(Long status,PageInfo page) {
		Map<String, Object> parameters = param(status, page);
		return selectCountByWhere(parameters);
	}
	
	/**
	 * 组装参数
	 * @param status
	 * @param page
	 * @return
	 */
	private Map<String, Object> param(Long status,PageInfo page){
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		Map<String, Object> parameters = MapUtils.genMap("orderby", "created_time desc");    
		if (skuser.getType() == 3) {	
			 MapUtils.putPageInfo(parameters, page);
		} else {
			parameters.put("userid", skuser.getId());
			if(status != null){
				parameters.put("status", status);
			}		
		}
		return parameters;
	}
	
	
	
	
	/**
	 * 根据用户获取店铺记录
	 * 
	 * @return
	 */
	public List<SKDianPu> getUserList(Integer jihuo) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);		
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "orderby", "created_time");
		if(jihuo != null){
			parameters.put("jihuo", jihuo);
		}
		List<SKDianPu> list = selectByWhere(parameters);		
		return list;
	}

	/**
	 * 获取店铺记录
	 * 
	 * @return
	 */
	public List<SKDianPu> getAllList(Long status) {
		Map<String, Object> parameters = MapUtils.genMap("orderby", "created_time desc");
		if(status != null){
			parameters.put("status", status);
		}
		List<SKDianPu> list = selectByWhere(parameters);
		for(SKDianPu dp:list){
			SKUser u = sKUserService.selectOne(dp.getUserid());
			dp.setUserName(u.getName());
		}
		return list;
	}
	
	/**
	 * 激活店铺
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean jihuo(Long id) {
		ParamUtils.isBlankThrewException(id, "请选择店铺");
		SKDianPu one = selectOne(id);
		if(one.getJihuo() == 1){
			BusinessExceptionUtil.threwException("店铺已经激活，请勿重复激活");
		}	
		one.setJihuo(1);
		update(one);
		
		Double yue = NumberUtils.parseDouble(MyConfigService.getMyConfig("dianpu_jihuo").getVal(), 0D);
		
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(one.getUserid());
		zhang.setBusiid(id);
		zhang.setBusitypeid(9L);
		zhang.setYue(yue);
		zhang.setRemark("激活金额:" + zhang.getYue());
		sKUserZhangService.add(zhang);
		
		return true;
	}

}
