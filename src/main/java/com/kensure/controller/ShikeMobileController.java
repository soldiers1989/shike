package com.kensure.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kensure.http.RequestUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.service.SKBaobeiService;

/**
 * 试客手机端页面
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "skm")
public class ShikeMobileController {

	@Resource
	private SKBaobeiService sKBaobeiService;

	// 好货页面
	@RequestMapping("haohuo")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuo/haohuo.jsp";
	}

	// 详情页面
	@RequestMapping("detail")
	public String detail(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		return "page/mobile/mobile/detail.jsp";
	}
}
