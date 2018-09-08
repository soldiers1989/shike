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
@RequestMapping(value = "shangjia")
public class ShangJiaPageController {

	// 商家页面，一般模板
	private static List<String> indexlist = new ArrayList<String>();
	static {
		indexlist.add("top1.jsp");
		indexlist.add("banner.jsp");
		indexlist.add("banner1.jsp");
		indexlist.add("index_content.jsp");
		indexlist.add("footer.jsp");
	}

	// 注册
	@RequestMapping("regist")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/shangjia/regist.jsp";
	}

	// 登录
	@RequestMapping("login")
	public String login(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/shangjia/login.jsp";
	}

	// 首页
	@RequestMapping("index")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("index_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 商品管理页面
	@RequestMapping("manageradd")
	public String manager(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/index_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 充值页面
	@RequestMapping("chongzhi")
	public String chongzhi(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/chongzhi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 充值列表
	@RequestMapping("chongzhilist")
	public String chongzhilist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/listchongzhi_right.jsp");
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
}
