package com.kensure.shike.tj.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.mem.DateUtils;

import com.kensure.shike.tj.model.SKHDYYZB;
import com.kensure.shike.tj.model.SKSJYYZB;
import com.kensure.shike.tj.model.SKZhiBiao;
import com.kensure.shike.tj.model.SKZhiBiao2;

/**
 * 用户表统计方法 服务实现类
 * 
 * @author fankd created on 2019-03-11
 * @since
 */
@Service
public class ShangJiaTJService extends JSBaseService {
	
	@Resource
	private SKUserStatisticsService sKUserStatisticsService;


	/**
	 * 统计商家运营指标
	 */
	public List<SKSJYYZB> countSJ(Date startTime, Date endTime) {
		List<SKSJYYZB> yyzblist = new ArrayList<SKSJYYZB>();
		// 商家注册
		Map<String, SKZhiBiao> sjzc = sKUserStatisticsService.sjzc(startTime, endTime);
		// 已绑店铺商家数
		Map<String, SKZhiBiao> bddpsj = sKUserStatisticsService.bddpsj(startTime, endTime);
		// 已绑店铺数
		Map<String, SKZhiBiao> bddp = sKUserStatisticsService.bddp(startTime, endTime);
		// 今日登陆商家数
		Map<String, SKZhiBiao> sjdl = sKUserStatisticsService.sjdl(startTime, endTime);
		// 今日编辑活动商家数
		Map<String, SKZhiBiao> bjhdsj = sKUserStatisticsService.sjbjhd(startTime, endTime);
		// 今日发布活动商家数
		Map<String, SKZhiBiao> fbhdsj = sKUserStatisticsService.sjfbhd(startTime, endTime);

		List<String> list = DateUtils.cutDate(startTime, endTime);
		// 合计
		SKSJYYZB heji = new SKSJYYZB();
		heji.setDay("合计");
		yyzblist.add(heji);

		Collections.reverse(list);
		for (String day : list) {
			SKSJYYZB yyzb = new SKSJYYZB();
			yyzb.setDay(day);
			yyzb.setZc(getZB(sjzc.get(day)));
			yyzb.setBddpsj(getZB(bddpsj.get(day)));
			yyzb.setDp(getZB(bddp.get(day)));
			yyzb.setDlsj(getZB(sjdl.get(day)));
			yyzb.setBjhdsj(getZB(bjhdsj.get(day)));
			yyzb.setFbhdsj(getZB(fbhdsj.get(day)));
			heji.setSum(yyzb);
			yyzblist.add(yyzb);
		}
		return yyzblist;
	}
	
	/**
	 * 统计活动运营运营指标
	 */
	public List<SKHDYYZB> countHD(Date startTime, Date endTime) {
		List<SKHDYYZB> yyzblist = new ArrayList<SKHDYYZB>();
		// 发布活动数
		Map<String, SKZhiBiao> fbhd = sKUserStatisticsService.fbhd(startTime, endTime);
		// 发布商品份数
		Map<String, SKZhiBiao> fbsp = sKUserStatisticsService.fbsp(startTime, endTime);
		// 新增服务费收入
		Map<String, SKZhiBiao2> fwfsr = sKUserStatisticsService.fwfsr(startTime, endTime);
		// 服务费结算收入
		Map<String, SKZhiBiao2> fwfjs = sKUserStatisticsService.fwfjs(startTime, endTime);
		// 服务费结算退款
		Map<String, SKZhiBiao2> fwftk = sKUserStatisticsService.fwftk(startTime, endTime);
	

		List<String> list = DateUtils.cutDate(startTime, endTime);
		// 合计
		SKHDYYZB heji = new SKHDYYZB();
		heji.setDay("合计");
		yyzblist.add(heji);

		Collections.reverse(list);
		for (String day : list) {
			SKHDYYZB yyzb = new SKHDYYZB();
			yyzb.setDay(day);
			yyzb.setFbhd(getZB(fbhd.get(day)));
			yyzb.setFbspfs(getZB(fbsp.get(day)));
			yyzb.setFwfsr(getZB(fwfsr.get(day)));
			yyzb.setFwfjs(getZB(fwfjs.get(day)));
			yyzb.setFwftk(getZB(fwftk.get(day)));
			// 冻结押金,已经充值的保证金，但是活动还没结束，还没返款到试客账户的
			Map<String, SKZhiBiao2> fbhdsj = sKUserStatisticsService.yjdj(day);
			yyzb.setYjdj(getZB(fbhdsj.get(day)));
			heji.setSum(yyzb);
			yyzblist.add(yyzb);
		}
		heji.setYjdj(0D);
		return yyzblist;
	}
	
	
	/**
	 * 获取指标，没有返回0
	 */
	public static Integer getZB(SKZhiBiao zb) {
		Integer cnt = 0;
		if (zb != null && zb.getCnt() != null) {
			cnt = zb.getCnt();
		}
		return cnt;
	}
	
	/**
	 * 获取指标，没有返回0
	 */
	public static Double getZB(SKZhiBiao2 zb) {
		Double cnt = 0D;
		if (zb != null && zb.getCnt() != null) {
			cnt = zb.getCnt();
		}
		return cnt;
	}

}
