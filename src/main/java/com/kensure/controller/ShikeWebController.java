package com.kensure.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 试客web端页面
 * 
 */
@Controller
@RequestMapping(value = "skw")
public class ShikeWebController {

	// 好货
	@RequestMapping("haohuo")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/web/haohuo/haohuo.jsp";
	}

	// 详情
	@RequestMapping("detail")
	public String detail(HttpServletRequest req, HttpServletResponse rep, Model model) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "page/web/haohuo/detail.jsp";
	}

	// 详情图
	@RequestMapping("detailpic")
	public String detailpic(HttpServletRequest req, HttpServletResponse rep, Model model) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "page/web/haohuo/detailpic.jsp";
	}
}
