package com.kensure.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kensure.mem.NumberUtils;

import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.TaoBaoService;

/**
 * 商家业务的页面跳转
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "gl")
public class GLPageController {

	@Resource
	private SKBaobeiService sKBaobeiService;
	// 商家页面，一般模板
	private static List<String> indexlist = new ArrayList<String>();
	static {
		indexlist.add("top1.jsp");
		indexlist.add("./gl/index_content.jsp");
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
		body.add("listchongzhi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 充值列表
	@RequestMapping("chongzhilist")
	public String chongzhilist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("listchongzhi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 试客使用详情
	@RequestMapping("skqkdetail")
	public String skqkdetail(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("skqkdetail_right.jsp");
		req.setAttribute("bodypage", body);
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "page/shangjia/index.jsp";
	}
	
	// 商品中奖情况
	@RequestMapping("zjqk")
	public String zjqk(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("zjqk_right.jsp");
		req.setAttribute("bodypage", body);
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "page/shangjia/index.jsp";
	}

	// 提现列表
	@RequestMapping("tixianlist")
	public String tixianlist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("tixian_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 活动列表
	@RequestMapping("huodonglist")
	public String huodonglist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("huodong_right.jsp");
		req.setAttribute("bodypage", body);
		String status = req.getParameter("status");
		if (StringUtils.isNotBlank(status)) {
			req.setAttribute("status", status);
		}
		return "page/shangjia/index.jsp";
	}

	// 商家列表
	@RequestMapping("sjlist")
	public String sjlist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("sjlist_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 店铺列表
	@RequestMapping("dplist")
	public String dplist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("dplist_right.jsp");
		req.setAttribute("bodypage", body);
		String status = req.getParameter("status");
		if (StringUtils.isNotBlank(status)) {
			req.setAttribute("status", status);
		}
		return "page/shangjia/index.jsp";
	}

	// 用户列表
	@RequestMapping("sklist")
	public String sklist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("sklist_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}

	// 消息中心
	@RequestMapping("cms")
	public String cms(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("cmslist_right.jsp");
		req.setAttribute("bodypage", body);
		String typeid = req.getParameter("typeid");
		req.setAttribute("typeid", typeid);
		return "page/shangjia/index.jsp";
	}

	// 消息中心
	@RequestMapping("cmsedit")
	public String cmsedit(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("cmsedit_right.jsp");
		req.setAttribute("bodypage", body);
		String typeid = req.getParameter("typeid");
		req.setAttribute("typeid", typeid);
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			req.setAttribute("id", id);
		}
		return "page/shangjia/index.jsp";
	}

	// 跳转到淘宝详情页面
	@RequestMapping("xiangqing")
	public String xiangqing(HttpServletRequest req, HttpServletResponse rep) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("taobao_right.jsp");
		req.setAttribute("bodypage", body);
		
		Long id = NumberUtils.parseLong(req.getParameter("id"), null);
		SKBaobei bb = sKBaobeiService.selectOne(id);
		String itemid = TaoBaoService.getContentId(bb.getUrl());
		req.setAttribute("id", req.getParameter("id"));
		req.setAttribute("itemid", itemid);
		return "page/shangjia/index.jsp";
	}

	// 试客活动列表
	@RequestMapping("skqklist")
	public String skqklist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("indexht_left.jsp");
		body.add("skqk_right.jsp");
		req.setAttribute("bodypage", body);
		String bbid = req.getParameter("bbid");
		if (StringUtils.isBlank(bbid)) {
			bbid = "";
		}
		req.setAttribute("bbid", bbid);
		return "page/shangjia/index.jsp";
	}

}
