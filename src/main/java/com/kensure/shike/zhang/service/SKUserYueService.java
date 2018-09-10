/*
 * 文件名称: SKUserYueServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-9
 * 修改内容: 
 */
package com.kensure.shike.zhang.service;

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
import co.kensure.mem.ArithmeticUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.dao.SKUserYueDao;
import com.kensure.shike.zhang.model.SKUserYue;

/**
 * 用户余额服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKUserYueService extends JSBaseService {

	@Resource
	private SKUserYueDao dao;

	@Resource
	private BaseKeyService baseKeyService;
	
	@Resource
	private SKUserService sKUserService;

	public SKUserYue selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKUserYue> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKUserYue> selectAll() {
		return dao.selectAll();
	}

	public List<SKUserYue> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKUserYue obj) {
		super.beforeInsert(obj);
		if (obj.getJinbi() == null) {
			obj.setJinbi(0D);
		}
		if (obj.getYue() == null) {
			obj.setYue(0D);
		}
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKUserYue> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKUserYue obj) {
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
	 * 查询用户余额
	 * @return
	 */
	public SKUserYue selectByUser() {
		SKUser user = sKUserService.getUser();
		SKUserService.checkUser(user);
		SKUserYue s = selectOne(user.getId());
		return s;
	}
	
	/**
	 * 通过账单修改余额
	 * 
	 * @param obj
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean updateYue(Long userid, Double jine, Double jinbi) {
		ParamUtils.isBlankThrewException(userid, "用户为空");
		SKUserYue sksy = selectOne(userid);
		if (jine == null) {
			jine = 0D;
		}
		if (jinbi == null) {
			jinbi = 0D;
		}
		if (sksy == null) {
			sksy = new SKUserYue();
			sksy.setDbyue(0D);
			sksy.setJinbi(0D);
			sksy.setYue(0D);
		}
		double y = ArithmeticUtils.add(jine, sksy.getYue());
		double j = ArithmeticUtils.add(jinbi, sksy.getJinbi());
		if (y < 0) {
			BusinessExceptionUtil.threwException("用户余额不足");
		}
		if (j < 0) {
			BusinessExceptionUtil.threwException("用户金币不足");
		}
		sksy.setYue(y);
		sksy.setJinbi(j);	
		if (sksy.getId() == null) {
			sksy.setId(userid);
			insert(sksy);
		} else {
			update(sksy);
		}

		return true;
	}

}
