package com.kensure.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.chongzhi.model.SKUserInout;
import com.kensure.shike.chongzhi.service.SKUserInoutService;

/**
 * 用户的充值、体现流水逻辑
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "inout")
public class SKInoutController {

	@Resource
	private SKUserInoutService sKUserInoutService;

	/**
	 * 商家充值保存
	 */
	@ResponseBody
	@RequestMapping(value = "savein.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savein(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数 fangshi 充值方式，1是支付宝，2是银行卡 jiaoyihao 支付宝交易号 zhm 打款方账户名 jine 金额
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SKUserInout obj = JSONObject.parseObject(json.toJSONString(), SKUserInout.class);
		sKUserInoutService.saveIn(obj);
		return new ResultRowInfo();
	}

	/**
	 * 获取充值列表
	 */
	@ResponseBody
	@RequestMapping(value = "chongzhilist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo chongzhilist(HttpServletRequest req, HttpServletResponse rep) {
		List<SKUserInout> list = sKUserInoutService.getChongZhiList();
		return new ResultRowsInfo(list);
	}

}
