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
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.dianpu.service.SKDianPuService;

/**
 * 用户的店铺信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "dianpu")
public class SKDianPuController {

	@Resource
	private SKDianPuService sKDianPuService;

	/**
	 * 商家新增店铺
	 */
	@ResponseBody
	@RequestMapping(value = "add.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savein(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数 name 名称， url 链接
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SKDianPu obj = JSONObject.parseObject(json.toJSONString(), SKDianPu.class);
		sKDianPuService.addDianPu(obj);
		return new ResultRowInfo();
	}

	/**
	 * 获取店铺列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long status = json.getLong("status");
		List<SKDianPu> list = sKDianPuService.getList(status);
		return new ResultRowsInfo(list);
	}
	
	/**
	 * 店铺通过审核
	 */
	@ResponseBody
	@RequestMapping(value = "gongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo gongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKDianPuService.tongguo(id);
		return new ResultRowInfo();
	}

}
