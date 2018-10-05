package com.kensure.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kensure.mem.NumberUtils;

import com.kensure.shike.sys.model.SKCMS;
import com.kensure.shike.sys.service.SKCMSService;
import com.kensure.shike.sys.service.SKDictService;

/**
 * 商家业务的页面跳转
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "help")
public class HelpController {

	@Resource
	private SKDictService sKDictService;
	
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


	// 首页
	@RequestMapping("{id}")
	public String index(@PathVariable String id,HttpServletRequest req, HttpServletResponse rep, Model model){
		req.setAttribute("index", indexlist);
		List<String> body = new ArrayList<String>();
		body.add("./gl/help.jsp");
		req.setAttribute("bodypage", body);
		req.setAttribute("id", id);
		
		SKCMS obj = sKCMSService.get(NumberUtils.parseLong(id, 0L));
		List<SKCMS> sj = sKCMSService.selectByTypeId(1);
		List<SKCMS> sk = sKCMSService.selectByTypeId(2);
		req.setAttribute("obj", obj);
		req.setAttribute("sj", sj);
		req.setAttribute("sk", sk);
		return "page/shangjia/index.jsp";
	}

	

}
