package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.http.RequestUtils;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.service.SKJysjService;
import com.kensure.shike.user.service.SKUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 校验类数据
 * 
 */
@Controller
@RequestMapping(value = "jysj")
public class SKJysjController {

	@Resource
	private SKJysjService skJysjService;

	@Resource
	private SKUserService sKUserService;

	/**
	 * 更新修改关注图片信息
	 */
	@ResponseBody
	@RequestMapping(value = "updatescgz.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo updatescgz(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long gzId = json.getLong("gzId");
		String gzImg = json.getString("gzImg");
		Long scId = json.getLong("scId");
		String scImg = json.getString("scImg");

		SKJysj gz = new SKJysj();
		gz.setId(gzId);
		gz.setContent(gzImg);
		skJysjService.update(gz);

		SKJysj sc = new SKJysj();
		sc.setId(scId);
		sc.setContent(scImg);
		skJysjService.update(sc);

		return new ResultInfo();
	}

	/**
	 * 更新修改订单信息
	 */
	@ResponseBody
	@RequestMapping(value = "updatedd.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo updatedd(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long ddhId = json.getLong("ddhId");
		String ddh = json.getString("ddh");
		Long ddId = json.getLong("ddId");
		String ddImg = json.getString("ddImg");

		SKJysj ddhSk = new SKJysj();
		ddhSk.setId(ddhId);
		ddhSk.setContent(ddh);
		skJysjService.update(ddhSk);

		SKJysj dd = new SKJysj();
		dd.setId(ddId);
		dd.setContent(ddImg);
		skJysjService.update(dd);

		return new ResultInfo();
	}

	/**
	 * 更新修改好评信息
	 */
	@ResponseBody
	@RequestMapping(value = "updatehp.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo updatehp(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long hpyId = json.getLong("hpyId");
		String hpy = json.getString("hpy");
		Long hpId = json.getLong("hpId");
		String hpImg = json.getString("hpImg");

		SKJysj hpySk = new SKJysj();
        hpySk.setId(hpyId);
        hpySk.setContent(hpy);
		skJysjService.update(hpySk);

		SKJysj hp = new SKJysj();
        hp.setId(hpId);
        hp.setContent(hpImg);
		skJysjService.update(hp);

		return new ResultInfo();
	}

}
