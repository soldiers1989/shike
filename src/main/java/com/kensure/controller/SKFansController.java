package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SkUserFans;
import com.kensure.shike.zhang.service.SkUserFansService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 代言人流水
 * 
 *
 */
@Controller
@RequestMapping(value = "fans")
public class SKFansController {

	@Resource
	private SkUserFansService skUserFansService;

	@Resource
	private SKUserService sKUserService;

	/**
	 * 获取粉丝流水明细列表
	 */
	@ResponseBody
	@RequestMapping(value = "fanslslist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo fanslslist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Integer status = json.getInteger("status");

		List<SkUserFans> list = skUserFansService.getList(status);
		return new ResultRowsInfo(list);
	}

}
