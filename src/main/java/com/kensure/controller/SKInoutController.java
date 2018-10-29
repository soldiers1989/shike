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
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;

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

	@Resource
	private SKUserZhangService sKUserZhangService;

	@Resource
	private SKUserService sKUserService;

	/**
	 * 商家充值保存
	 */
	@ResponseBody
	@RequestMapping(value = "savein.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savein(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数 fangshi 充值方式，1是支付宝，2是银行卡 jiaoyihao 支付宝交易号 jine 金额
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SKUserInout obj = JSONObject.parseObject(json.toJSONString(), SKUserInout.class);
		sKUserInoutService.saveIn(obj);
		return new ResultRowInfo();
	}

	/**
	 * 提现保存
	 */
	@ResponseBody
	@RequestMapping(value = "saveout.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo saveout(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 打款方账户名 jine 金额
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SKUserInout obj = JSONObject.parseObject(json.toJSONString(), SKUserInout.class);
		sKUserInoutService.saveOut(obj);
		return new ResultRowInfo();
	}
	
	/**
	 * 提现保存,同时需要校验支付密码
	 */
	@ResponseBody
	@RequestMapping(value = "saveoutser.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo saveoutser(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 打款方账户名 jine 金额
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		String paypassword = json.getString("paypassword");
		SKUserInout obj = JSONObject.parseObject(json.toJSONString(), SKUserInout.class);
		sKUserInoutService.saveOutSer(obj,paypassword);
		return new ResultRowInfo();
	}

	/**
	 * 获取充值列表
	 */
	@ResponseBody
	@RequestMapping(value = "chongzhilist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo chongzhilist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Integer status = json.getInteger("status");
		List<SKUserInout> list = sKUserInoutService.getInoutList(1,status);
		return new ResultRowsInfo(list);
	}

	/**
	 * 获取提现列表
	 */
	@ResponseBody
	@RequestMapping(value = "tixianlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tixianlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Integer status = json.getInteger("status");
		List<SKUserInout> list = sKUserInoutService.getInoutList(2,status);
		return new ResultRowsInfo(list);
	}

	/**
	 * 通过
	 */
	@ResponseBody
	@RequestMapping(value = "tongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKUserInoutService.tongguo(id);
		return new ResultRowInfo();
	}
	
	/**
	 * 不通过
	 */
	@ResponseBody
	@RequestMapping(value = "untongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo untongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String remark = json.getString("remark");
		sKUserInoutService.untongguo(id,remark);
		return new ResultRowInfo(id);
	}

	/**
	 * 提现通过
	 */
	@ResponseBody
	@RequestMapping(value = "tongguoout.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tongguoout(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKUserInoutService.tongguoOut(id);
		return new ResultRowInfo();
	}

	/**
	 * 获取帐列表
	 */
	@ResponseBody
	@RequestMapping(value = "zhanglist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo zhanglist(HttpServletRequest req, HttpServletResponse rep) {
		SKUser user = sKUserService.getUser();
		JSONObject json = RequestUtils.paramToJson(req);
		Integer inorout = json.getInteger("inorout");
		Integer status = json.getInteger("status");

		List<SKUserZhang> list = sKUserZhangService.selectByUser(user, inorout, status);
		return new ResultRowsInfo(list);
	}

}
