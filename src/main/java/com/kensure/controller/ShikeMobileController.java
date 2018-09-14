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

	// 首页
	@RequestMapping("index")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuo/haohuo.jsp";
	}

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

	// 申请页面
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

	// 收藏关注页面
	@RequestMapping("scgz")
	public String scgz(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		return "page/mobile/lc/scgz.jsp";
	}

	// 我的活动页面
	@RequestMapping("wdhd")
	public String wdhd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuo/wdhd.jsp";
	}

	// 订单页面
	@RequestMapping("ddan")
	public String ddan(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		return "page/mobile/lc/ddan.jsp";
	}

	// 订单页面
	@RequestMapping("haop")
	public String haop(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		return "page/mobile/lc/haop.jsp";
	}
	
	// 提现页面
	@RequestMapping("tixian")
	public String tixian(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/lc/tixian.jsp";
	}
	
	// 明细页面
	@RequestMapping("mingxi")
	public String mingxi(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/lc/mingxi.jsp";
	}	
	
	// 即将到账页面
	@RequestMapping("jjdz")
	public String jjdz(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/lc/jjdz.jsp";
	}	
		
	
	// 首页
	@RequestMapping("mine")
	public String mine(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuo/mine.jsp";
	}
}
