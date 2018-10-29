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
import co.kensure.mem.PageInfo;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKSkqkLeft;
import com.kensure.shike.baobei.query.SKSkqkLeftQuery;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKBbrwService;
import com.kensure.shike.baobei.service.SKSkqkService;
import com.kensure.shike.baobei.service.TaoBaoService;

/**
 * 试客的相关信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "skqk")
public class SKSkqkController {

	@Resource
	private TaoBaoService taoBaoService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBbrwService sKBbrwService;

	/**
	 * 试客使用情况列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKSkqkLeftQuery skqk = JSONObject.parseObject(json.toJSONString(), SKSkqkLeftQuery.class);
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKSkqkLeft> list = sKSkqkService.getList(skqk, page);
		long cont = sKSkqkService.getListCount(skqk);
		return new ResultRowsInfo(list, cont);
	}

	/**
	 * 试客试用详情
	 */
	@ResponseBody
	@RequestMapping(value = "getdetail.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getdetail(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKSkqk skqk = sKSkqkService.getSkqkDetail(id);
		return new ResultRowInfo(skqk);
	}
}
