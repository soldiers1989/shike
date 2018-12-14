package com.kensure.shike.zhang.service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.dao.SkUserFansDao;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.model.SkUserFans;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 代言人粉丝流水表服务实现类
 */
@Service
public class SkUserFansService extends JSBaseService {

	@Resource
	private SkUserFansDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SKUserZhangService sKUserZhangService;

	public SkUserFans selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SkUserFans> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SkUserFans> selectAll() {
		return dao.selectAll();
	}

	public List<SkUserFans> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SkUserFans obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user_fans"));
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SkUserFans> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SkUserFans obj) {
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

	// 邀请添加
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void addFans(Long userId, Long refereeId) {
		SKUser skUser = sKUserService.selectOne(refereeId);

		if (skUser == null) {
			return;
		}

		SkUserFans fans = new SkUserFans();

		fans.setUserid(userId);
		fans.setRefereeId(refereeId);
		fans.setBusiid(userId);
		fans.setTypeid(1L);
		fans.setOriginJine(10D);
		fans.setBili(1);
		fans.setJine(fans.getOriginJine() * fans.getBili());
		fans.setStatus(0L);

		insert(fans);
	}

	public List<SkUserFans> getByBusiid(Integer busiid) {
		SKUser user = sKUserService.getUser();

		Map<String, Object> map = MapUtils.genMap("userid", user.getId(), "busiid", busiid);
		return selectByWhere(map);
	}

	public List<SkUserFans> getList(Integer status) {
		SKUser user = sKUserService.getUser();
		Map<String, Object> map = MapUtils.genMap("refereeId", user.getId(), "status", status, "orderBy", "created_time desc");

		List<SkUserFans> list = selectByWhere(map);

		for (SkUserFans fans : list) {
			SKUser skUser = sKUserService.selectOne(fans.getUserid());

			if (skUser != null) {
				fans.setName(skUser.getName());
			}
		}

		return list;
	}

	/**
	 * 新人到账
	 * 
	 * @param userid 新人的id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void newUser(Long userid) {
		Map<String, Object> map = MapUtils.genMap("userid", userid, "typeid", 1);
		List<SkUserFans> list = selectByWhere(map);
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		SkUserFans jb = list.get(0);
		if (jb.getStatus() != 9) {
			jb.setStatus(9L);
			// 新人到账
			SKUserZhang zhang = new SKUserZhang();
			zhang.setUserid(jb.getRefereeId());
			zhang.setBusiid(jb.getUserid());
			zhang.setBusitypeid(6L);
			zhang.setYue(jb.getJine());
			sKUserZhangService.add(zhang);
		}
		update(jb);
	}

	/**
	 * 根据status统计出所有金额
	 * 
	 * @param status
	 * @return
	 */
	public Double sumByStatus(Long status) {
		SKUser user = sKUserService.getUser();

		Map<String, Object> parameters = MapUtils.genMap("refereeId", user.getId());
		if (status != null) {
			parameters.put("status", status);
		}
		List<SkUserFans> list = selectByWhere(parameters);

		Double sum = 0.00;
		for (SkUserFans jinbi : list) {
			sum += jinbi.getJine();
		}

		return sum;
	}

}
