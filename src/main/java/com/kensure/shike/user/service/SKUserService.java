package com.kensure.shike.user.service;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.MobileUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.PageInfo;
import co.kensure.sms.SMSClient;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.model.SKTaobao;
import com.kensure.shike.baobei.service.SKSkqkService;
import com.kensure.shike.baobei.service.SKTaobaoService;
import com.kensure.shike.user.dao.SKUserDao;
import com.kensure.shike.user.model.SKLogin;
import com.kensure.shike.user.model.SKSms;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.user.model.query.SKUserListQuery;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.service.SKUserYueService;
import com.kensure.shike.zhang.service.SkUserFansService;
import com.kensure.shike.zhang.service.SkUserJinbiService;

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

	@Resource
	private SKTaobaoService sKTaobaoService;

	@Resource
	private SKSkqkService skSkqkService;

	/**
	 * 是否有效用户
	 */
	public boolean isInvalid(Long userId) {
		boolean result = false;
		SKUser skuser = selectOne(userId);
		// 审批通过，就认为是有效用户
		if (skuser != null) {
			result = skuser.getAuditStatus() == 1;
		}
		return result;
	}

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
		obj.setAuditStatus(0);
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

	/**
	 * 查询用户
	 * 
	 * @param parameters
	 * @return
	 */
	public List<SKUser> selectList(SKUserListQuery userQuery, PageInfo page) {
		Map<String, Object> parameters = MapUtils.bean2Map(userQuery, true);
		MapUtils.putPageInfo(parameters, page);
		parameters.put("orderby", "created_time desc");

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
			if (StringUtils.isNotBlank(u.getNoTaobao())) {
				u.setsKTaobao(sKTaobaoService.selectOne(u.getNoTaobao()));
			}
			// 推荐人信息
			if (!NumberUtils.isZero(u.getRefereeId())) {
				SKUser refereeUser = selectOne(u.getRefereeId());
				u.setRefereeUser(refereeUser);
			}
			if (userQuery.getType() != null && userQuery.getType() == 1) {
				// 活动申请数
				long sqNum = skSkqkService.getSkqkCountByUserId(u.getId());
				u.setSqNum(sqNum);

				// 活动中奖数
				long zjNum = skSkqkService.getSkqkZjCountByUserId(u.getId());
				u.setZjNum(zjNum);
			}
		}
		return list;
	}

	public long selectListCount(SKUserListQuery userQuery) {
		Map<String, Object> parameters = MapUtils.bean2Map(userQuery, true);
		long count = dao.selectCountByWhere(parameters);
		return count;
	}

	/**
	 * 获取试客信息
	 * 
	 * @return
	 */
	public List<SKUser> selectSKList() {
		Map<String, Object> parameters = MapUtils.genMap("type", 1);
		List<SKUser> list = dao.selectByWhere(parameters);
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
		addSJOrSk(sKUser, QRCode);
		SKUserSession session = sKLoginService.login(sKUser.getPhone(), sKUser.getPassword(), sKUser.getType(), null, request);
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
		// 设置支付密码（默认为登录密码）
		sKUser.setPaypassword(sKUser.getPassword());
		sKUser.setLevelCode("0001");
		// 插入数据
		insert(sKUser);
		// 验证成功
		sKSmsService.sendSucess(code);

		// 注册奖励
		skUserJinbiService.addZcjl(sKUser.getId());

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
		MobileUtils.checkMobile(sKUser.getPhone());
	}

	/**
	 * 校验用户的类型
	 */
	public static void rangeType(int type) {
		if (type < 1 || type > 5) {
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
	public void updateAlipay(String noAlipay, String realname) {
		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);

		ParamUtils.isBlankThrewException(noAlipay, "支付宝账户不能为空");
		ParamUtils.isBlankThrewException(realname, "支付宝实名不能为空");

		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setNoAlipay(noAlipay);
		user.setRealname(realname);
		update(user);
	}

	/**
	 * 更新自己的淘宝账号
	 */
	public void updateTabobao(String noTaobao, String taobaoImg) {
		SKUser skuser = getUser();
		SKUserService.checkUserSK(skuser);
		ParamUtils.isBlankThrewException(noTaobao, "淘宝账户不能为空");
		ParamUtils.isBlankThrewException(taobaoImg, "淘宝截图不能为空");
		if (skuser.getAuditStatus() == 1) {
			// 审批过后的淘宝账号，且原来的账号不为空，不允许自己修改淘宝账号
			if (StringUtils.isNotBlank(skuser.getNoTaobao()) && skuser.getNoTaobao().equals(noTaobao)) {
				BusinessExceptionUtil.threwException("该账号已经审核通过，不允许再修改淘宝账号，如果有误,请联系管理员！");
			}
		}
		updateNoTaobao(skuser.getId(), noTaobao);
		SKUser user = new SKUser();
		user.setId(skuser.getId());
		user.setTaobaoImg(taobaoImg);
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
	 * 更新登录密码（忘记密码用） type 1是试客，2是商家
	 */
	public void updateLoginPwd(String phone, Integer type, String verifyCode, String newPassword) {
		ParamUtils.isBlankThrewException(phone, "手机号码不能为空");
		ParamUtils.isBlankThrewException(newPassword, "新密码不能为空");
		ParamUtils.isBlankThrewException(verifyCode, "验证码不能为空");
		int smstype = 4;
		if (type == 1) {
			smstype = 3;
		}
		SKSms skSms = sKSmsService.selectByMobile(phone, smstype);
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
	public void checkAndUpdate(String payPassWord, String noAlipay, String realname) {
		checkPayPwd(payPassWord);
		update(noAlipay, realname);
	}

	/**
	 * 通过推荐人获取用户列表
	 * 
	 * @return
	 */
	public List<SKUser> getListByRefereeId() {
		SKUser skuser = getUser();

		// String refereeId = ("000000" + skuser.getId()).substring(-6);
		Map<String, Object> parameters = MapUtils.genMap("refereeId", skuser.getId());
		List<SKUser> skUsers = selectByWhere(parameters);
		return skUsers;
	}

	/**
	 * 审核用户账号
	 * 
	 * @param id
	 * @param status
	 * @param remark
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void auditUser(Long id, Integer status, String remark) {
		if (status == null || id == null) {
			BusinessExceptionUtil.threwException("数据为空");
		}

		SKUser user = selectOne(id);
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空");
		}

		SKUser skUser = new SKUser();
		skUser.setId(id);
		skUser.setAuditStatus(status);
		skUser.setRemark(remark);
		skUser.setUpdatedTime(new Date());
		if (status == 2) {
			//发送短信，告诉试客错误原因
			try {
				SMSClient.sendSMSTaobao(user.getPhone());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (status == 1) {
			//审核通过
			skUserFansService.yqUser(id);
		}

		update(skUser);
	}

	/**
	 * 更新商家来源
	 * 
	 * @param id
	 * @param source
	 */
	public void updateUserSource(Long id, String source) {
		ParamUtils.isBlankThrewException(source, "来源不能为空");

		SKUser user = selectOne(id);
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空");
		}
		SKUser skUser = new SKUser();
		skUser.setId(id);
		skUser.setSource(source);
		skUser.setUpdatedTime(new Date());
		update(skUser);
	}

	/**
	 * 更新商家备注
	 * 
	 * @param id
	 * @param source
	 */
	public void updateUserRemark(Long id, String remark) {
		ParamUtils.isBlankThrewException(remark, "不能为空");
		SKUser user = selectOne(id);
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空");
		}
		SKUser skUser = new SKUser();
		skUser.setId(id);
		skUser.setRemark(remark);
		skUser.setUpdatedTime(new Date());
		update(skUser);
	}

	/**
	 * 更新淘气值
	 * 
	 * @param id
	 * @param taoqizhi
	 */
	public void updateTaoqizhi(Long id, Integer taoqizhi) {
		ParamUtils.isBlankThrewException(taoqizhi, "淘气值不能为空");
		SKUser user = selectOne(id);
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空");
		}
		SKTaobao skTaobao = sKTaobaoService.selectOne(user.getNoTaobao());
		if (skTaobao == null) {
			BusinessExceptionUtil.threwException("淘宝信息为空");
		}
		skTaobao.setTaoqizhi(taoqizhi);
		sKTaobaoService.update(skTaobao);
	}

	/**
	 * 更新淘宝账号
	 * 
	 * @param id
	 * @param taoqizhi
	 */
	public void updateTaobaoNo(Long id, String noTaobao) {
		updateNoTaobao(id, noTaobao);
	}

	/**
	 * 更新淘宝账号,同时更新未下单之前的订单
	 */
	private void updateNoTaobao(Long id, String noTaobao) {
		// 淘宝账号更新逻辑
		ParamUtils.isBlankThrewException(noTaobao, "淘宝账号不能为空");
		SKUser user = selectOne(id);
		if (user == null) {
			BusinessExceptionUtil.threwException("用户为空");
		}
		checkNoTaobao(id, noTaobao);

		user.setNoTaobao(noTaobao);
		update(user);
		// 更新相应的申请单的淘宝账号
		skSkqkService.updateSkqkNoTaobao(user.getId(), noTaobao);
	}

	/**
	 * 根据淘宝账号，获取试客列表
	 */
	private List<SKUser> selectByNoTaobao(String noTaobao) {
		Map<String, Object> parameters = MapUtils.genMap("noTaobao", noTaobao);
		List<SKUser> userlist = selectByWhere(parameters);
		return userlist;
	}

	/**
	 * 判断淘宝账号是否唯一
	 */
	private void checkNoTaobao(Long id, String noTaobao) {
		// 如果为空，不进行校验
		if (StringUtils.isBlank(noTaobao)) {
			return;
		}
		List<SKUser> userlist = selectByNoTaobao(noTaobao);
		// 没有这个淘宝账号，校验通过
		if (CollectionUtils.isEmpty(userlist)) {
			return;
		}
		// 如果id为空，就是新增
		if (id == null) {
			BusinessExceptionUtil.threwException("淘宝账号【" + noTaobao + "】不允许重复，请换一个淘宝账号");
		} else {
			SKUser myuser = selectOne(id);
			// 如果不是自己的淘宝账号，校验不通过;
			if (!noTaobao.equals(myuser.getNoTaobao())) {
				BusinessExceptionUtil.threwException("淘宝账号【" + noTaobao + "】不允许重复，请换一个淘宝账号");
			}
		}
	}

}
