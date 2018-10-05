package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.http.RequestUtils;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.zhang.model.SkUserJinbi;
import com.kensure.shike.zhang.service.SkUserJinbiService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户的金币流水
 * 
 *
 */
@Controller
@RequestMapping(value = "jinbi")
public class SKJinbiController {

	@Resource
	private SkUserJinbiService skUserJinbiService;

	/**
	 * 签到
	 */
	@ResponseBody
	@RequestMapping(value = "qiandao.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savein(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数 fangshi 充值方式，1是支付宝，2是银行卡 jiaoyihao 支付宝交易号 jine 金额
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SkUserJinbi obj = JSONObject.parseObject(json.toJSONString(), SkUserJinbi.class);

		skUserJinbiService.qiandao(obj);
		return new ResultRowInfo();
	}


//	/**
//	 * 获取帐列表
//	 */
//	@ResponseBody
//	@RequestMapping(value = "zhanglist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
//	public ResultInfo zhanglist(HttpServletRequest req, HttpServletResponse rep) {
//		SKUser user = sKUserService.getUser();
//		JSONObject json = RequestUtils.paramToJson(req);
//		Integer inorout = json.getInteger("inorout");
//		Integer status = json.getInteger("status");
//		Integer yueOrJinbi = json.getInteger("yueOrJinbi");
//
//		if (yueOrJinbi == null) {
//            yueOrJinbi = 1;
//        }
//
//		List<SKUserZhang> list = sKUserZhangService.selectByUser(user, inorout, status, yueOrJinbi);
//		return new ResultRowsInfo(list);
//	}

}
