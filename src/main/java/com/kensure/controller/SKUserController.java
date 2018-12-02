package com.kensure.controller;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import co.kensure.mem.PageInfo;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.service.SKTaobaoService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.user.model.query.SKUserListQuery;
import com.kensure.shike.user.service.SKLoginService;
import com.kensure.shike.user.service.SKSmsService;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.service.SKUserYueService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

	@Resource
	private SKUserYueService sKUserYueService;
	
	@Resource
	private SKTaobaoService sKTaobaoService;

	/**
	 * 验证码发送，包括试客、商家
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "sms.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo smsuser(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String mobile = json.getString("mobile");
		int type = json.getInteger("type");
		Integer mobileType = json.getInteger("mobileType");
		sKSmsService.sendQRSms(mobile, type, mobileType);
		return new ResultRowInfo();
	}

	/**
	 * 商家数据保存
	 */
	@ResponseBody
	@RequestMapping(value = "saveshangjia.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo adduser(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String qrcode = json.getString("qrcode");
		SKUser sKUser = JSONObject.parseObject(json.toJSONString(), SKUser.class);
		sKUserService.addSJOrSk(sKUser, qrcode);
		return new ResultRowInfo();
	}

	/**
	 * 试客注册并且登陆
	 */
	@ResponseBody
	@RequestMapping(value = "addsk.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo addsk(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String qrcode = json.getString("qrcode");
		SKUser sKUser = JSONObject.parseObject(json.toJSONString(), SKUser.class);
		sKUser.setName(sKUser.getPhone());
		SKUserSession session = sKUserService.addSkAndLogin(sKUser, qrcode, req);
		return new ResultRowInfo(session);
	}

	/**
	 * 商家登录名称核对
	 */
	@ResponseBody
	@RequestMapping(value = "checkname.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo checkname(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String param = json.getString("param");
		SKUser u = sKUserService.selectByName(param, 2);
		if (u != null) {
			BusinessExceptionUtil.threwException("用户已经存在");
		}
		return new ResultRowInfo();
	}
	
	/**
	 * 根据会话获取用户信息
	 */
	@ResponseBody
	@RequestMapping(value = "getuser.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo getuser(HttpServletRequest req, HttpServletResponse rep) {
		SKUser u = sKUserService.getUser();	
		u.setPassword(null);
		return new ResultRowInfo(u);
	}

	/**
	 * 商家手机号核对
	 */
	@ResponseBody
	@RequestMapping(value = "checkphone.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo checkphone(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String param = json.getString("param");
		SKUser u = sKUserService.selectByMobile(param, 2);
		if (u != null) {
			BusinessExceptionUtil.threwException("手机已绑定");
		}
		return new ResultRowInfo();
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "login.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo login(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String mobile = json.getString("mobile");
		String password = json.getString("password");
		int type = json.getInteger("type");
		SKUserSession userSession = sKLoginService.login(mobile, password, type, req);
		return new ResultRowInfo(userSession);
	}

	/**
	 * 账户余额
	 */
	@ResponseBody
	@RequestMapping(value = "getzhyue.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo getzhyue(HttpServletRequest req, HttpServletResponse rep) {
		SKUserYue u = sKUserYueService.selectByUser();
		return new ResultRowInfo(u);
	}
	
	/**
	 * 用户列表
	 */
	@ResponseBody
	@RequestMapping(value = "userlist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo userlist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKUserListQuery userQuery = JSONObject.parseObject(json.toJSONString(), SKUserListQuery.class);

        PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);

		List<SKUser> list = sKUserService.selectList(userQuery, page);

        long cont = sKUserService.selectListCount(userQuery);
        return new ResultRowsInfo(list, cont);
	}

	/**
	 * 修改用户资料
	 * 
	 * @param req
	 * @param rep
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateuser.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo updateuser(HttpServletRequest req, HttpServletResponse rep) {
		// JSONObject json = RequestUtils.paramToJson(req);
		// String sessionid = json.getString("sessionid");
		// UserLogin userse = userLoginService.selectBySessionId(sessionid);
		//
		// UserInfo user = userInfoService.selectOne(userse.getUserid());
		//
		// UserInfo usertemp = JSONObject.parseObject(json.toJSONString(),
		// UserInfo.class);
		//
		// Date date = new Date();
		// usertemp.setUpdateDate(date);
		// user.setName(usertemp.getName());
		// user.setCard(usertemp.getCard());
		// user.setQq(usertemp.getQq());
		// user.setZhimafen(usertemp.getZhimafen());
		// user.setHuabeiedu(usertemp.getHuabeiedu());
		// user.setJiebeiedu(usertemp.getJiebeiedu());
		// user.setJiedaibao(usertemp.getJiedaibao());
		// user.setYear(usertemp.getYear());
		// user.setXb(usertemp.getXb());
		// userInfoService.update(user);

		return new ResultRowInfo();
	}

	/**
	 * 修改用户资料
	 */
	@ResponseBody
	@RequestMapping(value = "update.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo update(HttpServletRequest req, HttpServletResponse rep) {

		JSONObject json = RequestUtils.paramToJson(req);
		String type = json.getString("type");

		// 修改手机号码
		if ("1".equals(type)) {
			String newPhone = json.getString("newPhone");
			String verifyCode = json.getString("verifyCode");
			sKUserService.updatePhone(newPhone, verifyCode);
		}
		// 修改支付宝账号
		else if ("2".equals(type)) {
			String noAlipay = json.getString("noAlipay");
			String realname = json.getString("realname");
			sKUserService.updateAlipay(noAlipay, realname);
		}
		// 修改淘宝账号
		else if ("3".equals(type)) {
			String noTaobao = json.getString("noTaobao");
			String taobaoImg = json.getString("taobaoImg");
			sKUserService.updateTabobao(noTaobao, taobaoImg);
		}
		// 修改qq账号
		else if ("4".equals(type)) {
			String noQq = json.getString("noQq");
			sKUserService.updateQq(noQq);
		}
		// 修改登录密码
		else if ("5".equals(type)) {
			String oldPassword = json.getString("oldPassword");
			String newPassword = json.getString("newPassword");
			sKUserService.updateLoginPwd(oldPassword, newPassword);
		}// 修改支付密码
		else if ("6".equals(type)) {
			String oldPassword = json.getString("oldPassword");
			String newPassword = json.getString("newPassword");
			sKUserService.updatePayPwd(oldPassword, newPassword);
		}

		return new ResultRowInfo();
	}

	/**
	 * 忘记密码
	 */
	@ResponseBody
	@RequestMapping(value = "wjpwd.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo wjpwd(HttpServletRequest req, HttpServletResponse rep) {

		JSONObject json = RequestUtils.paramToJson(req);
		String phone = json.getString("phone");
		String type = json.getString("type");
		String verifyCode = json.getString("verifyCode");
		String newPassword = json.getString("newPassword");

		sKUserService.updateLoginPwd(phone, new Integer(type), verifyCode, newPassword);

		return new ResultRowInfo();
	}

	/**
	 * 我的粉丝列表
	 */
	@ResponseBody
	@RequestMapping(value = "fensilist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo fensilist(HttpServletRequest req, HttpServletResponse rep) {
		List<SKUser> list = sKUserService.getListByRefereeId();
		return new ResultRowsInfo(list);
	}
	
	
	/**
	 * 我的粉丝列表
	 */
	@ResponseBody
	@RequestMapping(value = "flash.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo flash(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		String sessionId = json.getString("sid");
		sKTaobaoService.flash(sessionId);
		return new ResultRowInfo();
	}

	/**
	 * 用户账号审核接口
	 */
	@ResponseBody
	@RequestMapping(value = "audit.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo audit(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Integer status = json.getInteger("status");
		String remark = json.getString("remark");

		sKUserService.auditUser(id, status, remark);

		return new ResultRowInfo();
	}

	/**
	 * 更新商家来源
	 */
	@ResponseBody
	@RequestMapping(value = "updateSource.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo updateSource(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String source = json.getString("source");

		sKUserService.updateUserSource(id, source);
		return new ResultRowInfo();
	}


	/**
	 * 更新淘气值
	 */
	@ResponseBody
	@RequestMapping(value = "updateTaoqizhi.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo updateTaoqizhi(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Integer taoqizhi = json.getInteger("taoqizhi");

		sKUserService.updateTaoqizhi(id, taoqizhi);

		return new ResultRowInfo();
	}
	
}
