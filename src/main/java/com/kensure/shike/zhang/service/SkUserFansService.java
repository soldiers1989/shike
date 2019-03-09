package com.kensure.shike.zhang.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.mycom.config.service.MyConfigService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.dao.SkUserFansDao;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.model.SkUserFans;

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

	public List<SkUserFans> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	private boolean insert(SkUserFans obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user_fans"));
		return dao.insert(obj);
	}

	public boolean update(SkUserFans obj) {
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	// 邀请添加
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void addFans(Long userId, Long refereeId) {
		SKUser skUser = sKUserService.selectOne(refereeId);
		if (skUser == null) {
			return;
		}
		// 活动-首单奖励金额
		String hd_sdjl = MyConfigService.getMyConfig("hd_sdjl").getVal();
		Double sdjl = NumberUtils.parseDouble(hd_sdjl, 0D);

		SkUserFans fans = new SkUserFans();
		fans.setUserid(userId);
		fans.setRefereeId(refereeId);
		fans.setBusiid(userId);
		fans.setTypeid(1L);
		fans.setOriginJine(sdjl);
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
	 * @param userid
	 *            新人的id
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
	 * 被邀请人，审核通过，给邀请人的奖励
	 * 
	 * @param userid
	 *            新人的id
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void yqUser(Long userid) {
		// 如果邀请人为空，不用给钱
		SKUser user = sKUserService.selectOne(userid);
		if (user == null || user.getRefereeId() == null) {
			return;
		}
		// 如果给过钱了，也不用给了
		Map<String, Object> map = MapUtils.genMap("userid", userid, "typeid", 3);
		List<SkUserFans> list = selectByWhere(map);
		if (CollectionUtils.isNotEmpty(list)) {
			return;
		}
		// 活动-试客邀请奖励金额
		String hd_skyq = MyConfigService.getMyConfig("hd_skyq").getVal();
		//如果是0元，不进行返回
		if("0".equals(hd_skyq)){
			return;
		}
		
		Double skyq = NumberUtils.parseDouble(hd_skyq, 0D);
		SkUserFans fans = new SkUserFans();
		fans.setUserid(userid);
		fans.setRefereeId(user.getRefereeId());
		fans.setBusiid(userid);
		fans.setTypeid(3L);
		fans.setOriginJine(skyq);
		fans.setBili(1);
		fans.setJine(fans.getOriginJine() * fans.getBili());
		fans.setStatus(9L);
		insert(fans);

		// 活动-试客邀请奖励金额
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(user.getRefereeId());
		zhang.setBusiid(userid);
		zhang.setBusitypeid(10L);
		zhang.setYue(fans.getJine());
		sKUserZhangService.add(zhang);
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
