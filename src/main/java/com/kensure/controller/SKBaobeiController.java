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

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKPayInfo;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.TaoBaoService;

/**
 * 活动信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "baobei")
public class SKBaobeiController {

	@Resource
	private TaoBaoService taoBaoService;

	@Resource
	private SKBaobeiService sKBaobeiService;

	/**
	 * 根据url获取商品的详情
	 */
	@ResponseBody
	@RequestMapping(value = "gettaobaoinfo.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getTaoBaoInfo(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数， url 淘宝链接
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		String url = json.getString("url");
		List<String> list = taoBaoService.getPicList(url);
		return new ResultRowsInfo(list);
	}

	/**
	 * 保存宝贝
	 */
	@ResponseBody
	@RequestMapping(value = "save.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo save(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKBaobei obj = JSONObject.parseObject(json.toJSONString(), SKBaobei.class);

		/**
		 * `dpid` '店铺id', `title` '宝贝标题', `url` '宝贝链接', `taokl` '淘口令', `zturl`
		 * '宝贝主图链接', `sale_price` '宝贝单价', `jiangli` '宝贝奖励', `no_qq` '联系qq账号',
		 * `guige` '商品规格', `typeid` '宝贝分类id', `hdtypeid` '活动类型id', `xinyongka`
		 * TINYINT(3) NOT NULL COMMENT '允许使用信用卡 1是允许，0是不允许', `huabei` TINYINT(3)
		 * NOT NULL COMMENT '允许使用花呗 1是允许，0是不允许', `shaitu` TINYINT(3) NOT NULL
		 * COMMENT '是否需要晒图 1是需要，0是不用', `wangwang` TINYINT(3) NOT NULL COMMENT
		 * '是否需要旺旺聊天 1是需要，0是不用',
		 * 
		 * tplist 图片列表[{url:}] jdlist 进店路径[{typeid:,bili:}] wordlist
		 * 关键字[{word:,ordermethod:}] bbrwlist 宝贝任务[{bbnum:,zhuanhua:,daydes:,}]
		 */
		sKBaobeiService.addBaobei(obj);
		return new ResultRowInfo();
	}

	/**
	 * 活动列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Integer status = json.getInteger("status");
		List<SKBaobei> list = sKBaobeiService.getList(status);
		return new ResultRowsInfo(list);
	}
	
	/**
	 * 支付信息
	 */
	@ResponseBody
	@RequestMapping(value = "payinfo.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo payinfo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKPayInfo> list = sKBaobeiService.payinfo(id);
		return new ResultRowsInfo(list);
	}

	/**
	 * 支付数据入库
	 */
	@ResponseBody
	@RequestMapping(value = "pay.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo pay(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKPayInfo> list = sKBaobeiService.payinfo(id);
		return new ResultRowsInfo(list);
	}
}
