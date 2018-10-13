package com.kensure.task;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKBbrwService;
import com.kensure.shike.baobei.service.SKSkqkService;

@Service
public class SKTask {

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	/**
	 * add by fankd 每天0点，设置好评\返款\结束活动\结算活动
	 */
	@Scheduled(cron = "0 0 0 1/1 * ?")
	public void deleteLogData() {
		try {
			sKSkqkService.toHaoPin();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKSkqkService.toReturnMoney();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKBaobeiService.endBaobei();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			sKBaobeiService.jiesuanBaobei();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天10点，抽奖
	 */
	@Scheduled(cron = "0 0 10 1/1 * ?")
	public void choujiang1() {
		try {
			sKBbrwService.doChouJiang(false);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天15点，抽奖
	 */
	@Scheduled(cron = "0 0 15 1/1 * ?")
	public void choujiang2() {
		try {

			sKBbrwService.doChouJiang(false);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天20点，抽奖
	 */
	@Scheduled(cron = "0 0 20 1/1 * ?")
	public void choujiang3() {
		try {
			sKBbrwService.doChouJiang(true);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每10分钟调度一次，取消一些数据
	 */
	@Scheduled(cron = "0 0/10 * * * ?")
	public void quxiao() {
		try {
			sKSkqkService.quxiao();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

}
