package com.kensure.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kensure.shike.sys.model.SKCMS;
import com.kensure.shike.sys.service.SKCMSService;

/**
 * 商家业务的页面跳转
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "shangjia")
public class ShangJiaPageController {

	@Resource
	private SKCMSService sKCMSService;
	
	// 商家页面，一般模板
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
		regist.add("regist_content.jsp");
		regist.add("bottom1.jsp");
		regist.add("footer.jsp");
	}

	// 注册
	@RequestMapping("regist")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", regist);
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
		List<SKCMS> gg = sKCMSService.selectByTypeId(3);
		List<SKCMS> jq = sKCMSService.selectByTypeId(4);
		req.setAttribute("gg", gg);
		req.setAttribute("jq", jq);
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

	// 活动列表
	@RequestMapping("huodonglist")
	public String huodonglist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/huodong_right.jsp");
		req.setAttribute("bodypage", body);
		String status = req.getParameter("status");
		if(StringUtils.isNotBlank(status)){
			req.setAttribute("status", status);
		}
		return "page/shangjia/index.jsp";
	}

	// 试客试用列表
	@RequestMapping("shikelist")
	public String shikelist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);

		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/shikelist_right.jsp");
		req.setAttribute("bodypage", body);
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		return "page/shangjia/index.jsp";
	}

	@RequestMapping("actedit")
	public String actedit(HttpServletRequest req, HttpServletResponse rep) {
		req.setAttribute("index", indexlist);
		
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/index_right.jsp");
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

	// 关于我们
	@RequestMapping("about")
	public String about(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/shangjia/about.jsp";
	}

	// 用户协议
	@RequestMapping("userdefine")
	public String userdefine(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/shangjia/userdefine.jsp";
	}
	
	// 充值列表
	@RequestMapping("zhanglist")
	public String zhanglist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/zhanglist_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}
	
	// 提现功能
	@RequestMapping("tixian")
	public String tixian(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/tixian_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}
	
	// 改密功能
	@RequestMapping("gaimi")
	public String gaimi(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/gaimi_right.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}
	
	// 店铺新增
	@RequestMapping("addDianPu")
	public String addDianPu(HttpServletRequest req, HttpServletResponse rep, Model model) {
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("index_left.jsp");
		body.add("./manager/dianpu_add.jsp");
		req.setAttribute("bodypage", body);
		return "page/shangjia/index.jsp";
	}
}
