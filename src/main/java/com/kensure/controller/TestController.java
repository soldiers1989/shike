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
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.service.SKChouJiangService;

/**
 * 测试
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "test")
public class TestController {

	@Resource
	private SKChouJiangService sKChouJiangService;

	/**
	 * 有效试客申请
	 */
	@ResponseBody
	@RequestMapping(value = "yxlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo liucheng(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKSkqk> list = sKChouJiangService.searchYouXiaoYongHu(id);
		return new ResultRowsInfo(list);
	}

}
