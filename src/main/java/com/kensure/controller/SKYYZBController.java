package com.kensure.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import co.kensure.mem.PageInfo;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.tj.model.SKHDYYZB;
import com.kensure.shike.tj.model.SKSJYYZB;
import com.kensure.shike.tj.model.SKUserTuiJian;
import com.kensure.shike.tj.service.ShangJiaTJService;
import com.kensure.shike.tj.service.TuiJianRenTJService;
import com.kensure.shike.user.query.SKUserTJQuery;

/**
 * 运营指标统计
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "yyzb")
public class SKYYZBController {
	@Resource
	private TuiJianRenTJService tuiJianRenTJService;
	@Resource
	private ShangJiaTJService shangJiaTJService;

	/**
	 * 统计用户推荐
	 */
	@ResponseBody
	@RequestMapping(value = "tjtj.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tjtj(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKUserTJQuery userQuery = JSONObject.parseObject(json.toJSONString(), SKUserTJQuery.class);
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKUserTuiJian> list = tuiJianRenTJService.tuiJianList(userQuery, page);
		long cont = tuiJianRenTJService.tuiJianCount(userQuery);
		return new ResultRowsInfo(list, cont);
	}

	/**
	 * 商家指标统计
	 */
	@ResponseBody
	@RequestMapping(value = "sjzb.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo sjzb(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Date startTime = json.getDate("startTime");
		Date endTime = json.getDate("endTime");
		List<SKSJYYZB> list = shangJiaTJService.countSJ(startTime, endTime);
		return new ResultRowsInfo(list);
	}
	
	/**
	 * 活动指标统计
	 */
	@ResponseBody
	@RequestMapping(value = "hdzb.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo hdzb(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Date startTime = json.getDate("startTime");
		Date endTime = json.getDate("endTime");
		List<SKHDYYZB> list = shangJiaTJService.countHD(startTime, endTime);
		return new ResultRowsInfo(list);
	}
	
}
