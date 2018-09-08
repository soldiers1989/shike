package com.kensure.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.http.RequestUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.user.service.SKLoginService;
import com.kensure.shike.user.service.SKSmsService;
import com.kensure.shike.user.service.SKUserService;

/**
 * 用户的逻辑处理
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "user")
public class SKUserController {

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SKSmsService sKSmsService;

	@Resource
	private SKLoginService sKLoginService;

	/**
	 * 验证码发送，包括试客、商家
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sms.do", method = { RequestMethod.POST,RequestMethod.GET}, produces = "application/json;charset=UTF-8")
	public ResultInfo smsuser(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);		
		String mobile = json.getString("mobile");
		int type = json.getInteger("type");
		sKSmsService.sendQRSms(mobile, type);		
		return new ResultRowInfo();
	}

	/**
	 * 商家数据保存
	 */
	@ResponseBody
	@RequestMapping(value = "saveshangjia.do", method = { RequestMethod.POST,RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo adduser(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String qrcode = json.getString("qrcode");
		SKUser sKUser = JSONObject.parseObject(json.toJSONString(), SKUser.class);
		sKUserService.addShangJia(sKUser, qrcode);
		return new ResultRowInfo();
	}
	
	/**
	 * 商家登录名称核对
	 */
	@ResponseBody
	@RequestMapping(value = "checkname.do", method = { RequestMethod.POST,RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo checkname(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String param = json.getString("param");
		SKUser u = sKUserService.selectByName(param, 2);
		if(u != null){
			BusinessExceptionUtil.threwException("用户已经存在");
		}
		return new ResultRowInfo();
	}

	
	/**
	 * 商家手机号核对
	 */
	@ResponseBody
	@RequestMapping(value = "checkphone.do", method = { RequestMethod.POST,RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo checkphone(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String param = json.getString("param");
		SKUser u = sKUserService.selectByMobile(param, 2);
		if(u != null){
			BusinessExceptionUtil.threwException("手机已绑定");
		}
		return new ResultRowInfo();
	}

	
	/**
	 * 用户登录
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "login.do", method = { RequestMethod.POST,RequestMethod.GET}, produces = "application/json;charset=UTF-8")
	public ResultInfo login(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);		
		String mobile = json.getString("mobile");
		String password = json.getString("password");
		int type = json.getInteger("type");
		SKUserSession userSession = sKLoginService.login(mobile, password, type, req);		
		return new ResultRowInfo(userSession);
	}

	/**
	 * 修改用户资料
	 * 
	 * @param req
	 * @param rep
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateuser.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo updateuser(HttpServletRequest req, HttpServletResponse rep) {
//		JSONObject json = RequestUtils.paramToJson(req);
//		String sessionid = json.getString("sessionid");
//		UserLogin userse = userLoginService.selectBySessionId(sessionid);
//
//		UserInfo user = userInfoService.selectOne(userse.getUserid());
//
//		UserInfo usertemp = JSONObject.parseObject(json.toJSONString(), UserInfo.class);
//
//		Date date = new Date();
//		usertemp.setUpdateDate(date);
//		user.setName(usertemp.getName());
//		user.setCard(usertemp.getCard());
//		user.setQq(usertemp.getQq());
//		user.setZhimafen(usertemp.getZhimafen());
//		user.setHuabeiedu(usertemp.getHuabeiedu());
//		user.setJiebeiedu(usertemp.getJiebeiedu());
//		user.setJiedaibao(usertemp.getJiedaibao());
//		user.setYear(usertemp.getYear());
//		user.setXb(usertemp.getXb());
//		userInfoService.update(user);

		return new ResultRowInfo();
	}





}
