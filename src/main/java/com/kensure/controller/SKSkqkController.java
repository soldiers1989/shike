package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import co.kensure.mem.PageInfo;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKSkqkLeft;
import com.kensure.shike.baobei.model.SKZjqk;
import com.kensure.shike.baobei.query.SKSkqkLeftQuery;
import com.kensure.shike.baobei.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 试客的相关信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "skqk")
public class SKSkqkController {

	@Resource
	private TaoBaoService taoBaoService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKZjqkService sKZjqkService;

	/**
	 * 试客使用情况列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKSkqkLeftQuery skqk = JSONObject.parseObject(json.toJSONString(), SKSkqkLeftQuery.class);
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKSkqkLeft> list = sKSkqkService.getList(skqk, page);
		long cont = sKSkqkService.getListCount(skqk);
		return new ResultRowsInfo(list, cont);
	}
	
	
	/**
	 * 商家查看 试客使用情况列表
	 */
	@ResponseBody
	@RequestMapping(value = "list1.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo list1(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Integer jiesuanstatus = json.getInteger("jiesuanstatus");
		SKSkqkLeftQuery skqk = JSONObject.parseObject(json.toJSONString(), SKSkqkLeftQuery.class);
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKSkqkLeft> list = sKSkqkService.getList1(skqk,jiesuanstatus, page);
		long cont = sKSkqkService.getListCount1(skqk,jiesuanstatus);
		return new ResultRowsInfo(list, cont);
	}

	/**
	 * 试客试用详情
	 */
	@ResponseBody
	@RequestMapping(value = "getdetail.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getdetail(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKSkqk skqk = sKSkqkService.getSkqkDetail(id);
		return new ResultRowInfo(skqk);
	}

	/**
	 * 任务概览
	 */
	@ResponseBody
	@RequestMapping(value = "getbbrw.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getbbrw(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKBbrw> bbrw = sKBbrwService.getBbList(id);
		return new ResultRowsInfo(bbrw);
	}

	/**
	 * 中奖情况概览
	 */
	@ResponseBody
	@RequestMapping(value = "getzjqk.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getzjqk(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKZjqk> zjqk = sKZjqkService.selectByBbid(id);
		return new ResultRowsInfo(zjqk);
	}
	
	/**
	 * 商家让某个申请挂起
	 */
	@ResponseBody
	@RequestMapping(value = "hump.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo hump(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String remark = json.getString("remark");
		sKSkqkService.hump(id, remark);
		return new ResultRowInfo();
	}
	
	/**
	 * 无效申请
	 */
	@ResponseBody
	@RequestMapping(value = "wuxiao.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo wuxiao(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKSkqkService.userQuxiao(id);
		return new ResultRowInfo();
	}
	
	
	
	/**
	 * 商家取消某个申请挂起
	 */
	@ResponseBody
	@RequestMapping(value = "unhump.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo unhump(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKSkqkService.unhump(id);
		return new ResultRowInfo();
	}

	/**
	 * 管理端查看 试客使用情况列表
	 */
	@ResponseBody
	@RequestMapping(value = "sksqlist.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo sksqlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKSkqkLeft> list = sKSkqkService.getList2(id, page);
		long cont = sKSkqkService.getListCount2(id, page);
		return new ResultRowsInfo(list, cont);
	}

}
