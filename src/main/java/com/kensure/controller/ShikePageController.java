package com.kensure.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 试客业务的页面跳转
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "shike")
public class ShikePageController {

	// 用户页面，一般模板
	private static List<String> indexlist = new ArrayList<String>();
	static {
		indexlist.add("top1.jsp");
		indexlist.add("banner.jsp");
		indexlist.add("banner1.jsp");
		indexlist.add("index_content.jsp");
		indexlist.add("footer.jsp");
	}

	// 商家用户登录模板
	private static List<String> regist = new ArrayList<String>();
	static {
		regist.add("top1.jsp");
		regist.add("banner.jsp");
		regist.add("regist_skcontent.jsp");	
		regist.add("footer.jsp");
	}

	// 注册
	@RequestMapping("regist")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", regist);
		return "page/shangjia/regist.jsp";
	}

	// 用户登录页面
	@RequestMapping("login")
	public String loginht(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/shangjia/loginht.jsp";
	}

	// 首页
	@RequestMapping("index")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("./manager/listchongzhi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 充值列表
	@RequestMapping("chongzhilist")
	public String chongzhilist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("./gl/listchongzhi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 店铺管理
	@RequestMapping("dianpulist")
	public String dianpulist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/dianpu_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 活动列表
	@RequestMapping("huodonglist")
	public String huodonglist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/huodong_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 支付页面
	@RequestMapping("payinfo")
	public String payinfo(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/payinfo_right.jsp");
		req.setAttribute("bodypage", body);
		req.setAttribute("id", req.getParameter("id"));
		return "page/shangjia/index.jsp";
	}
}
