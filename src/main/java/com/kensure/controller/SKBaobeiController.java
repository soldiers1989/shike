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
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.service.TaoBaoService;

/**
 * 活动信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "baobei")
public class SKBaobeiController {

	@Resource
	private TaoBaoService taoBaoService;

	/**
	 * 根据url获取商品的详情
	 */
	@ResponseBody
	@RequestMapping(value = "gettaobaoinfo.do", method = { RequestMethod.POST}, produces = "application/json;charset=UTF-8")
	public ResultInfo getTaoBaoInfo(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数， url 淘宝链接
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		String url = json.getString("url");
		List<String> list = taoBaoService.getPicList(url);
		return new ResultRowsInfo(list);
	}

	/**
	 * 获取店铺列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String url = json.getString("url");
		List<String> list = taoBaoService.getPicList(url);
		return new ResultRowsInfo(list);
	}

}
