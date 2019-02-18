package com.kensure.shike.user.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;

import com.kensure.shike.user.dao.SKUserStatisticsDao;
import com.kensure.shike.user.model.SKUserTuiJian;

/**
 * 用户表统计方法 服务实现类
 * 
 * @author fankd created on 2018-9-2
 * @since
 */
@Service
public class SKUserStatisticsService extends JSBaseService {

	@Resource
	private SKUserStatisticsDao dao;

	/**
	 * 推荐人统计
	 */
	public List<SKUserTuiJian> selectByWhere(Map<String, Object> parameters) {
		return dao.selectTuiJian(parameters);
	}

	public long selectCountTuiJian(Map<String, Object> parameters) {
		return dao.selectCountTuiJian(parameters);
	}


}
