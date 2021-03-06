package com.kensure.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.PageInfo;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.dianpu.service.SKDianPuService;
import com.kensure.shike.user.service.SKUserService;

/**
 * 用户的店铺信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "dianpu")
public class SKDianPuController {

	@Resource
	private SKDianPuService sKDianPuService;
	@Resource
	private SKUserService sKUserService;
	@Resource
	private SKBaobeiService sKBaobeiService;

	/**
	 * 商家新增店铺
	 */
	@ResponseBody
	@RequestMapping(value = "add.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savein(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数 name 名称， url 链接
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		SKDianPu obj = JSONObject.parseObject(json.toJSONString(), SKDianPu.class);
		sKDianPuService.addDianPu(obj);
		return new ResultRowInfo();
	}

	/**
	 * 管理员获取店铺列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long status = json.getLong("status");
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKDianPu> list = sKDianPuService.getList(status,page);
		long count = sKDianPuService.getListCount(status,page);
		return new ResultRowsInfo(list,count);
	}
	
	
	/**
	 * 商家后台管理获取店铺列表
	 */
	@ResponseBody
	@RequestMapping(value = "sjlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo sjlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long status = json.getLong("status");
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKDianPu> list = sKDianPuService.getSJList(status,page);
		long count = sKDianPuService.getSJListCount(status,page);
		return new ResultRowsInfo(list,count);
	}
	
	/**
	 * 获取商家激活的店铺列表，一般在商家发布任务的时候使用
	 */
	@ResponseBody
	@RequestMapping(value = "userlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo userlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long baobeid = json.getLong("baobeid");
		Long userid = null;
		//获取宝贝的用户
		if(!NumberUtils.isZero(baobeid)){
			SKBaobei baobei = sKBaobeiService.selectOne(baobeid);
			if(baobei != null){
				userid = baobei.getUserid();
			}	
		}
		//没有，就获取当前用户
		if(userid == null){
			userid = sKUserService.getUser().getId();
		}	
		List<SKDianPu> list = sKDianPuService.getListByUserId(userid);
		return new ResultRowsInfo(list);
	}
	
	/**
	 * 店铺通过审核
	 */
	@ResponseBody
	@RequestMapping(value = "gongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo gongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKDianPuService.tongguo(id);
		return new ResultRowInfo();
	}

	/**
	 * 店铺激活
	 */
	@ResponseBody
	@RequestMapping(value = "jihuo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo jihuo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKDianPuService.jihuo(id);
		return new ResultRowInfo();
	}
	
	
	/**
	 * 店铺删除
	 */
	@ResponseBody
	@RequestMapping(value = "delete.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo delete(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKDianPuService.delete(id);
		return new ResultRowInfo();
	}

	
	
}
