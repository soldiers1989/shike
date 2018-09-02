package com.kensure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 商家业务的页面跳转
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "shangjia")
public class ShangJiaPageController {

	@RequestMapping("regist")
	public String home(HttpServletRequest req, HttpServletResponse rep,Model model) {
		return "page/shangjia/index.jsp";
	}

	
}
