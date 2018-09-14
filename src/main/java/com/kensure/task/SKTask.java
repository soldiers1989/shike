package com.kensure.task;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kensure.shike.baobei.service.SKBbrwService;
import com.kensure.shike.baobei.service.SKSkqkService;

@Service
public class SKTask {

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKSkqkService sKSkqkService;

	/**
	 * add by fankd 每天0点，删除不需要的日志
	 */
	@Scheduled(cron = "0 0 0 1/1 * ?")
	public void deleteLogData() {
		try {
			sKSkqkService.toHaoPin();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			sKSkqkService.toReturnMoney();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * add by fankd 每天8点，抽奖
	 */
	@Scheduled(cron = "0 0 8 1/1 * ?")
	public void choujiang1() {
		sKBbrwService.doChouJiang(false);
	}

	/**
	 * add by fankd 每天15点，抽奖
	 */
	@Scheduled(cron = "0 0 15 1/1 * ?")
	public void choujiang2() {
		sKBbrwService.doChouJiang(false);
	}

	/**
	 * add by fankd 每天20点，抽奖
	 */
	@Scheduled(cron = "0 0 20 1/1 * ?")
	public void choujiang3() {
		sKBbrwService.doChouJiang(true);
	}

}
