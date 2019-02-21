package com.kensure.task;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import co.kensure.frame.Const;

import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKBbrwService;
import com.kensure.shike.baobei.service.SKChouJiangService;
import com.kensure.shike.baobei.service.SKSkqkService;

@Service
public class SKTask {

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKChouJiangService sKChouJiangService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	/**
	 * add by fankd 每天0点，\结束活动\结算活动
	 */
	@Scheduled(cron = "0 0 0 1/1 * ?")
	public void deleteLogData() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKBaobeiService.endBaobei();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKBaobeiService.jieSuanBaobei();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天10点，抽奖
	 */
	@Scheduled(cron = "0 0 10 1/1 * ?")
	public void choujiang1() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKChouJiangService.doChouJiang(false);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天15点，抽奖
	 */
	@Scheduled(cron = "0 0 15 1/1 * ?")
	public void choujiang2() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKChouJiangService.doChouJiang(false);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天20点，抽奖
	 */
	@Scheduled(cron = "0 0 20 1/1 * ?")
	public void choujiang3() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKChouJiangService.doChouJiang(true);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天22点，补充抽奖
	 */
	@Scheduled(cron = "0 0 22 1/1 * ?")
	public void choujiang4() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKChouJiangService.doChouJiang(true);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每10分钟调度一次，设置好评\返款\取消一些数据
	 */
	@Scheduled(cron = "0 4/10 * * * ? ")
	public void quxiao() {
		if (!Const.isStart()) {
			System.out.println("定时任务未开启");
			return;
		}
		try {
			sKSkqkService.kaiQiHaoPin();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKSkqkService.moRenHaoPin();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKSkqkService.toReturnMoney();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKSkqkService.quXiaoZhongJiang();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

}
