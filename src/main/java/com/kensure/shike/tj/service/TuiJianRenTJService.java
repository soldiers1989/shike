package com.kensure.shike.tj.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.PageInfo;

import com.kensure.shike.tj.model.SKUserTuiJian;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.query.SKUserTJQuery;
import com.kensure.shike.user.service.SKUserService;

/**
 * 用户表统计方法 服务实现类
 * 
 * @author fankd created on 2019-03-11
 * @since
 */
@Service
public class TuiJianRenTJService extends JSBaseService {

	@Resource
	private SKUserService sKUserService;
	
	@Resource
	private SKUserStatisticsService sKUserStatisticsService;

	

	/**
	 * 推荐人统计
	 */
	public List<SKUserTuiJian> tuiJianList(SKUserTJQuery userQuery, PageInfo page) {
		Map<String, Object> parameters = MapUtils.genMap("refereeIdIsNotNull", 1, "orderby", "cnt desc");
		if (userQuery.getStartCreatedTime() != null) {
			parameters.put("startCreatedTime", userQuery.getStartCreatedTime());
		}
		if (userQuery.getEndCreatedTime() != null) {
			parameters.put("endCreatedTime", userQuery.getEndCreatedTime());
		}
		MapUtils.putPageInfo(parameters, page);
		List<SKUserTuiJian> list = sKUserStatisticsService.selectTuiJian(parameters);
		if (CollectionUtils.isNotEmpty(list)) {
			for (SKUserTuiJian tj : list) {
				SKUser user = sKUserService.selectOne(tj.getRefereeId());
				tj.setUser(user);
			}
		}
		return list;
	}

	/**
	 * 推荐人统计
	 */
	public long tuiJianCount(SKUserTJQuery userQuery) {
		Map<String, Object> parameters = MapUtils.genMap("refereeIdIsNotNull", 1, "orderby", "cnt desc");
		if (userQuery.getStartCreatedTime() != null) {
			parameters.put("startCreatedTime", userQuery.getStartCreatedTime());
		}
		if (userQuery.getEndCreatedTime() != null) {
			parameters.put("endCreatedTime", userQuery.getEndCreatedTime());
		}
		return sKUserStatisticsService.selectCountTuiJian(parameters);
	}

	
	

}
