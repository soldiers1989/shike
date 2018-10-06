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
import com.kensure.shike.sys.model.SKCMS;
import com.kensure.shike.sys.model.SKDict;
import com.kensure.shike.sys.service.SKCMSService;
import com.kensure.shike.sys.service.SKDictService;

/**
 * 系统级别的数据获取，比如字典
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "sys")
public class SKSysController {

	@Resource
	private SKCMSService sKCMSService;
	
	
	/**
	 * 字典列表
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "dictlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo dictlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		int typeid = json.getInteger("typeid");
		List<SKDict> list = SKDictService.getListCache(typeid);
		return new ResultRowsInfo(list);
	}

	/**
	 * 消息列表
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "cmslist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo cmslist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		int typeid = json.getInteger("typeid");
		List<SKCMS> list = sKCMSService.selectByTypeId(typeid);
		return new ResultRowsInfo(list);
	}
	
	/**
	 * 消息个体
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getcms.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo getcms(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKCMS one = sKCMSService.get(id);
		return new ResultRowInfo(one);
	}
	
	/**
	 * 保存消息个体
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "savecms.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savecms(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKCMS obj = JSONObject.parseObject(json.toJSONString(), SKCMS.class);	
		sKCMSService.add(obj);
		return new ResultRowInfo();
	}
}
