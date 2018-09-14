package com.kensure.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 商家业务的页面跳转
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "gl")
public class GLPageController {

	// 商家页面，一般模板
	private static List<String> indexlist = new ArrayList<String>();
	static {
		indexlist.add("top1.jsp");
		indexlist.add("banner.jsp");
		indexlist.add("banner1.jsp");
		indexlist.add("index_content.jsp");
		indexlist.add("footer.jsp");
	}

	// 后台登录页面
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

	// 提现列表
	@RequestMapping("tixianlist")
	public String tixianlist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("./gl/tixian_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 活动列表
	@RequestMapping("huodonglist")
	public String huodonglist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("./gl/huodong_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

}
