package com.kensure.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kensure.http.RequestUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKWordService;

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
	
	@Resource
	private SKWordService sKWordService;
	
	

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
		return "page/mobile/detail/detail.jsp";
	}

	// 登陆页面
	@RequestMapping("login")
	public String login(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/login/login.jsp";
	}
	
	// 注册
	@RequestMapping("regist")
	public String regist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/login/regist.jsp";
	}
	
	//申请页面
	@RequestMapping("gouwuche")
	public String gouwuche(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		List<SKWord> words = sKWordService.getList(id);
		req.setAttribute("baobei", baobei);
		req.setAttribute("words", words);	
		return "page/mobile/lc/gouwuche.jsp";
	}
	
	//收藏关注页面
	@RequestMapping("scgz")
	public String scgz(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		List<SKWord> words = sKWordService.getList(id);
		req.setAttribute("baobei", baobei);
		req.setAttribute("words", words);	
		return "page/mobile/lc/scgz.jsp";
	}
	
	//我的活动页面
	@RequestMapping("wdhd")
	public String wdhd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuo/wdhd.jsp";
	}
	
}
