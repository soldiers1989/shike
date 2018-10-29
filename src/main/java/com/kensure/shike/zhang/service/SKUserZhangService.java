/*
 * 文件名称: SKUserZhangServiceImpl.java
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

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.zhang.dao.SKUserZhangDao;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;

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
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

/**
 * 用户余额流水服务实现类
 * 
 * @author fankd created on 2018-9-9
 * @since
 */
@Service
public class SKUserZhangService extends JSBaseService {

	@Resource
	private SKUserZhangDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKUserYueService sKUserYueService;

	public SKUserZhang selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKUserZhang> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKUserZhang> selectAll() {
		return dao.selectAll();
	}

	public List<SKUserZhang> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKUserZhang obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user_zhang"));
		if (obj.getJinbi() == null) {
			obj.setJinbi(0D);
		}
		if (obj.getYue() == null) {
			obj.setYue(0D);
		}
		if (obj.getBillno() == null) {
			obj.setBillno("0");
		}
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKUserZhang> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKUserZhang obj) {
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
	 * 用户帐
	 * 
	 * @return
	 */
	public List<SKUserZhang> selectByUser(SKUser user, Integer inorout, Integer status) {
		Map<String, Object> parameters = MapUtils.genMap("userid", user.getId(), "orderby", "created_time desc");
		if (inorout != null) {
			parameters.put("inorout", inorout);
		}
		if (status != null) {
			parameters.put("status", status);
		}
		return dao.selectByWhere(parameters);
	}

	/**
	 * 新增账款
	 * 
	 * @param obj
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean add(SKUserZhang obj) {
		ParamUtils.isBlankThrewException(obj.getUserid(), "用户不能为空");
		if (obj.getYue() <= 0) {
			BusinessExceptionUtil.threwException("金额必须大约0");
		}
		// 业务类型id,1是充值，2是提现，3是活动费用,4是试客返款，5是活动返款,6是新人首单;7是金币抽奖，8是活动驳回
		if (obj.getBusitypeid() == 1) {
			obj.setInorout(1L);
			obj.setStatus(1L);
		} else if (obj.getBusitypeid() == 2) {
			obj.setInorout(-1L);
			obj.setStatus(0L);
		} else if (obj.getBusitypeid() == 3) {
			obj.setInorout(-1L);
			obj.setStatus(0L);
			obj.setBillno(""+System.currentTimeMillis());
		} else if (obj.getBusitypeid() == 4) {
			obj.setInorout(1L);
			obj.setStatus(1L);
		} else if (obj.getBusitypeid() == 5) {
			obj.setInorout(1L);
			obj.setStatus(1L);
		} else if (obj.getBusitypeid() == 6) {
			obj.setInorout(1L);
			obj.setStatus(1L);
		} else if (obj.getBusitypeid() == 7) {
			obj.setInorout(1L);
			obj.setStatus(1L);
		} else if (obj.getBusitypeid() == 8) {
			obj.setInorout(1L);
			obj.setStatus(1L);
			obj.setBillno(""+System.currentTimeMillis());
		} else {
			BusinessExceptionUtil.threwException("未知类型");
		}

		updateYue(obj);
		insert(obj);
		return true;
	}

	/**
	 * 提交账款，让他把状态变成1
	 * 
	 * @param userid
	 *            用户id
	 * @param busitypeid
	 *            业务类型
	 * @param busiid
	 *            业务id
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean commit(Long userid, Long busitypeid, Long busiid) {
		SKUserZhang zhang = getBusi(userid, busitypeid, busiid);
		zhang.setStatus(1L);
		return update(zhang);
	}

	/**
	 * 根据业务主键获取用户帐
	 * 
	 * @return
	 */
	private SKUserZhang getBusi(Long userid, Long busitypeid, Long busiid) {
		SKUserZhang zhang = null;
		Map<String, Object> parameters = MapUtils.genMap("userid", userid, "busiid", busiid, "busitypeid", busitypeid,"billno","0");
		List<SKUserZhang> list = selectByWhere(parameters);
		if (CollectionUtils.isNotEmpty(list)) {
			zhang = list.get(0);
		}
		return zhang;
	}

	/**
	 * 通过账单修改余额
	 * 
	 * @param obj
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	private boolean updateYue(SKUserZhang obj) {
		SKUserZhang zhang = getBusi(obj.getUserid(), obj.getBusitypeid(), obj.getBusiid());
		if (zhang != null) {
			BusinessExceptionUtil.threwException("重复提交");
		}
		double y = ArithmeticUtils.mul(obj.getYue(), obj.getInorout());
		sKUserYueService.updateYue(obj.getUserid(), y, 0D);
		return true;
	}

}
