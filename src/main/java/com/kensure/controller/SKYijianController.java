package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.http.RequestUtils;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.user.service.SkYijianService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户意见反馈
 * 
 */
@Controller
@RequestMapping(value = "yijian")
public class SKYijianController {

	@Resource
	private SkYijianService skYijianService;

	@Resource
	private SKUserService sKUserService;

	/**
	 * 提交意见
	 */
	@ResponseBody
	@RequestMapping(value = "add.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo add(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long typeId = json.getLong("typeId");
		String phone = json.getString("phone");
		String content = json.getString("content");
		String pictureUrl = json.getString("pictureUrl");

		skYijianService.add(typeId, phone, content, pictureUrl);
		return new ResultInfo();
	}

}
