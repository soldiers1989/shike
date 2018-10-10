/*
 * 文件名称: SKUserServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-2
 * 修改内容: 
 */
package com.kensure.shike.user.service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.MobileUtils;
import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.dao.SKUserDao;
import com.kensure.shike.user.model.SKLogin;
import com.kensure.shike.user.model.SKSms;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.service.SKUserYueService;
import com.kensure.shike.zhang.service.SkUserFansService;
import com.kensure.shike.zhang.service.SkUserJinbiService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 用户表服务实现类
 * 
 * @author fankd created on 2018-9-2
 * @since
 */
@Service
public class SKUserService extends JSBaseService {

	@Resource
	private SKUserDao dao;

	@Resource
	private SKSmsService sKSmsService;

	@Resource
	private SKLoginService sKLoginService;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKUserYueService sKUserYueService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private SkUserFansService skUserFansService;

	@Resource
	private SkUserJinbiService skUserJinbiService;

	public SKUser selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKUser> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKUser> selectAll() {
		return dao.selectAll();
	}

	public List<SKUser> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKUser obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user"));
		obj.setStatus(1);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKUser> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKUser obj) {
		super.beforeUpdate(obj);
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	public boolean delete(Long id) {
		return dao.delete(id);
	}

	public boolean deleteMulti(Collection<Long> ids) {
		return dao.deleteMulti(ids);
	}

	public boolean deleteByWhere(Map<String, Object> parameters) {
		return dao.deleteByWhere(parameters);
	}

	/**
	 * 查询用户
	 * 
	 * @param parameters
	 * @return
	 */
	public List<SKUser> selectList(Integer type) {
		Map<String, Object> parameters = MapUtils.genMap("type", type);
		List<SKUser> list = dao.selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		for (SKUser u : list) {
			SKUserYue yue = sKUserYueService.selectOne(u.getId());
			if (yue != null) {
				u.setYue(yue.getYue());
			} else {
				u.setYue(0D);
			}
		}
		return list;
	}

	/**
	 * 根据电话号码和用户类型找用户
	 * 
	 * @param phone
	 * @param type
	 *            1是试客，2是商家，3是管理员
	 * @return
	 */
	public SKUser selectByMobile(String phone, int type) {
		Map<String, Object> parameters = MapUtils.genMap("phone", phone, "type", type);
		List<SKUser> userlist = selectByWhere(parameters);
		SKUser u = null;
		if (CollectionUtils.isNotEmpty(userlist)) {
			u = userlist.get(0);
		}
		return u;
	}

	/**
	 * 根据登录号，用户
	 * 
	 * @param name
	 * @param type
	 *            1是试客，2是商家，3是管理员
	 * @return
	 */
	public SKUser selectByName(String name, int type) {
		Map<String, Object> parameters = MapUtils.genMap("name", name, "type", type);
		List<SKUser> userlist = selectByWhere(parameters);
		SKUser u = null;
		if (CollectionUtils.isNotEmpty(userlist)) {
			u = userlist.get(0);
		}
		return u;
	}

	/**
	 * 商家和试客注册
	 * 
	 * @param SKUser
	 * @param QRCode
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SKUser addSJOrSk(SKUser sKUser, String QRCode) {
		Integer type = sKUser.getType();
		if (type < 1 || type > 2) {
			BusinessExceptionUtil.threwException("传参错误。");
		}
		invalidUser(sKUser);
		addUser(sKUser, QRCode);
		return sKUser;
	}

	/**
	 * 试客注册同时登陆
	 * 
	 * @param SKUser
	 * @param QRCode
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SKUserSession addSkAndLogin(SKUser sKUser, String QRCode, HttpServletRequest request) {
		invalidSKUser(sKUser);
		addSJOrSk(sKUser, QRCode);
		SKUserSession session = sKLoginService.login(sKUser.getPhone(), sKUser.getPassword(), sKUser.getType(), request);
		return session;
	}

	/**
	 * 通过验证码，新增用户
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	private void addUser(SKUser sKUser, String QRCode) {
		int type = sKUser.getType();
		// 字段校验
		ParamUtils.isBlankThrewException(QRCode, "验证码不能为空");
		// 逻辑校验
		SKUser user = selectByMobile(sKUser.getPhone(), type);
		if (user != null) {
			BusinessExceptionUtil.threwException("手机已注册。");
		}
		user = selectByName(sKUser.getName(), type);
		if (user != null) {
			BusinessExceptionUtil.threwException("用户名已注册。");
		}
		// 逻辑校验验证码
		SKSms code = sKSmsService.selectByMobile(sKUser.getPhone(), type);
		if (code == null || !QRCode.equalsIgnoreCase(code.getQrcode())) {
			BusinessExceptionUtil.threwException("验证码校验错误。");
		} else if (code.getStatus() != 0) {
			BusinessExceptionUtil.threwException("验证码过期。");
		}
		sKUser.setLevel(1);
		sKUser.setLevelCode("0001");
		// 插入数据
		insert(sKUser);
		// 验证成功
		sKSmsService.sendSucess(code);

		// 记录代言人的粉丝奖励流水；并发送金币奖励
		if (sKUser.getRefereeId() != null) {
			skUserFansService.addFans(sKUser.getId(), sKUser.getRefereeId());

			skUserJinbiService.addYqjl(sKUser.getRefereeId());
		}
	}

	/**
	 * 简单校验
	 * 
	 * @param sKUser
	 */
	private void invalidUser(SKUser sKUser) {
		ParamUtils.isBlankThrewException(sKUser.getName(), "用户名不能为空");
		ParamUtils.isBlankThrewException(sKUser.getPassword(), "密码不能为空");
		ParamUtils.isBlankThrewException(sKUser.getPhone(), "手机号不能为空");
		ParamUtils.isBlankThrewException(sKUser.getNoQq(), "qq不能为空");
		MobileUtils.checkMobile(sKUser.getPhone());
	}

	/**
	 * 校验试客的数据
	 * 
	 * @param sKUser
	 */
	private void invalidSKUser(SKUser sKUser) {
		// ParamUtils.isBlankThrewException(sKUser.getNoAlipay(), "支付宝账户不能为空");
		ParamUtils.isBlankThrewException(sKUser.getNoTaobao(), "淘宝账户不能为空");
	}

	/**
	 * 校验用户的类型
	 */
	public static void rangeType(int type) {
		if (type < 1 || type > 3) {
			BusinessExceptionUtil.threwException("传参错误。");
		}
	}

	/**
	 * 通过spring的本地线程变量获取req,然后获取sessionid，获取变量,如果没有，返回null
	 */
	public SKUser getUser() {
		String tokenId = getTokenId();
		if (StringUtils.isBlank(tokenId)) {
			return null;
		}
		SKLogin sKLogin = sKLoginService.selectByTokenId(tokenId);
		if (sKLogin == null) {
			return null;
		}
		SKUser user = selectOne(sKLogin.getUserid());
		return user;
	}

	/**
	 * add by fankd 用spring的框架在本地线程变量中获取 token,有可能获取不到
	 * 
	 * @return
	 */
	private static String getTokenId() {
		String tokenId = null;
		RequestAttributes ras = RequestContextHolder.getRequestAttributes();
		if (ras != null) {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			if (request != null) {
				tokenId = request.getHeader("tokenid");
			}
			if (tokenId == null) {
				// 获取所有Cookie
				Cookie[] cookies = request.getCookies();
				// 如果浏览器中存在Cookie
				if (cookies != null && cookies.length > 0) {
					// 遍历所有Cookie
					for (Cookie cookie : cookies) {
						// 找到name为city的Cookie
						if (cookie.getName().equals("mdtokenid")) {
							tokenId = cookie.getValue();
						}
					}
				}
			}
		}

		return tokenId;
	}

	/**
	 * 校验用户会话信息
	 * 
	 * @param user
	 */
	public static void checkUser(SKUser user) {
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空,请重新登录");
		}
	}

	/**
	 * 校验用户会话信息
	 * 
	 * @param user
	 */
	public static void checkUserAdmin(SKUser user) {
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空,请重新登录");
		}
		if (user.getType() != 3) {
			BusinessExceptionUtil.threwException("用户权限错误");
		}
	}

	/**
	 * 校验用户会话信息
	 * 
	 * @param user
	 */
	public static void checkUserSK(SKUser user) {
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空,请重新登录");
		}
		if (user.getType() != 1) {
			BusinessExceptionUtil.threwException("用户权限错误");
		}
	}

	/**
	 * 更新手机号码
	 * 
	 * @param newPhone
	 * @param verifyCode
	 */
	public void updatePhone(String newPhone, String verifyCode) {

		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);

		ParamUtils.isBlankThrewException(newPhone, "手机号码不能为空");
		ParamUtils.isBlankThrewException(verifyCode, "验证码不能为空");

		SKSms skSms = sKSmsService.selectByMobile(newPhone, 1);

		ParamUtils.isErrorThrewException(skSms != null && verifyCode.equals(skSms.getQrcode()), "验证码不正确");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setPhone(newPhone);
		update(user);
	}

	/**
	 * 更新支付宝账号
	 */
	public void updateAlipay(String noAlipay) {
		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);

		ParamUtils.isBlankThrewException(noAlipay, "支付宝账户不能为空");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setNoAlipay(noAlipay);
		update(user);
	}

	/**
	 * 更新淘宝账号
	 */
	public void updateTabobao(String noTaobao) {
		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);

		ParamUtils.isBlankThrewException(noTaobao, "淘宝账户不能为空");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setNoTaobao(noTaobao);
		update(user);
	}

	/**
	 * 更新qq账号
	 */
	public void updateQq(String noQq) {
		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);

		ParamUtils.isBlankThrewException(noQq, "qq账户不能为空");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setNoQq(noQq);
		update(user);
	}

	/**
	 * 更新登录密码
	 */
	public void updateLoginPwd(String oldPassword, String newPassword) {
		SKUser skuser = getUser();

		ParamUtils.isBlankThrewException(oldPassword, "原密码不能为空");
		ParamUtils.isBlankThrewException(newPassword, "新密码不能为空");

		ParamUtils.isErrorThrewException(oldPassword.equals(skuser.getPassword()), "原密码错误");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setPassword(newPassword);
		update(user);
	}

	/**
	 * 更新登录密码（忘记密码用）
	 */
	public void updateLoginPwd(String phone, Integer type, String verifyCode, String newPassword) {
		ParamUtils.isBlankThrewException(phone, "手机号码不能为空");
		ParamUtils.isBlankThrewException(newPassword, "新密码不能为空");
		ParamUtils.isBlankThrewException(verifyCode, "验证码不能为空");

		SKSms skSms = sKSmsService.selectByMobile(phone, type);

		ParamUtils.isErrorThrewException(skSms != null && verifyCode.equals(skSms.getQrcode()), "验证码不正确");

        SKUser skUser = sKUserService.selectByMobile(phone, type);

        SKUser user = new SKUser();
		user.setId(skUser.getId());
		user.setPassword(newPassword);
		update(user);
	}

	/**
	 * 更新支付密码
	 */
	public void updatePayPwd(String oldPassword, String newPassword) {
		SKUser skuser = getUser();

		ParamUtils.isBlankThrewException(oldPassword, "原密码不能为空");
		ParamUtils.isBlankThrewException(newPassword, "新密码不能为空");
		String pa = skuser.getPaypassword();
		// 支付密码为空，使用登录密码
		if (StringUtils.isBlank(pa)) {
			pa = skuser.getPassword();
		}

		ParamUtils.isErrorThrewException(oldPassword.equals(pa), "原密码错误");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setPaypassword(newPassword);
		update(user);
	}

	/**
	 * 验证支付密码
	 */
	public void checkPayPwd(String payPassWord) {
		SKUser skuser = getUser();
		ParamUtils.isBlankThrewException(payPassWord, "支付密码不能为空");
		String pa = skuser.getPaypassword();
		// 支付密码为空，使用登录密码
		ParamUtils.isBlankThrewException(pa, "支付密码还未设置，请去账户安全中进行设置");
		ParamUtils.isErrorThrewException(payPassWord.equals(pa), "支付密码错误");
	}

	/**
	 * 更新支付宝账号和真实姓名
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void update(String noAlipay, String realname) {
		SKUser skuser = getUser();
		ParamUtils.isBlankThrewException(noAlipay, "支付宝账号不能为空");
		ParamUtils.isBlankThrewException(realname, "真实姓名不能为空");
		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setNoAlipay(noAlipay);
		user.setRealname(realname);
		update(user);
	}
	
	/**
	 * 验证支付密码，同时修改用户支付信息
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void checkAndUpdate(String payPassWord,String noAlipay, String realname) {
		checkPayPwd(payPassWord);
		update(noAlipay, realname);
	}

	/**
	 * 通过推荐人获取用户列表
	 * @return
	 */
	public List<SKUser> getListByRefereeId() {
		SKUser skuser = getUser();

//		String refereeId = ("000000" + skuser.getId()).substring(-6);
		Map<String, Object> parameters = MapUtils.genMap("refereeId", skuser.getId());
        List<SKUser> skUsers = selectByWhere(parameters);
        return skUsers;
	}
}
