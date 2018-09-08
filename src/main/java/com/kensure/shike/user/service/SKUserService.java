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

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.dao.SKUserDao;
import com.kensure.shike.user.model.SKLogin;
import com.kensure.shike.user.model.SKSms;
import com.kensure.shike.user.model.SKUser;

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
	 * 商家注册
	 * 
	 * @param phone
	 * @param type
	 *            1是试客，2是商家，3是管理员
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SKUser addShangJia(SKUser sKUser, String QRCode) {
		sKUser.setType(2);
		invalidShangJia(sKUser);
		addUser(sKUser, QRCode);
		return sKUser;
	}

	/**
	 * 通过验证码，新增用户
	 */
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
	}

	/**
	 * 简单校验
	 * 
	 * @param sKUser
	 */
	private void invalidShangJia(SKUser sKUser) {
		ParamUtils.isBlankThrewException(sKUser.getName(), "用户名不能为空");
		ParamUtils.isBlankThrewException(sKUser.getPassword(), "密码不能为空");
		ParamUtils.isBlankThrewException(sKUser.getPhone(), "手机号不能为空");
		ParamUtils.isBlankThrewException(sKUser.getNoQq(), "qq不能为空");
		MobileUtils.checkMobile(sKUser.getPhone());
	}

	/**
	 * 校验用户的类型
	 */
	public static void rangeType(int type) {
		if (type < 1 || type > 2) {
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
		}
		return tokenId;
	}

	/**
	 * 校验用户会话信息
	 * @param user
	 */
	public static void checkUser(SKUser user){
		if(user == null){
			BusinessExceptionUtil.threwException("用户为空,请重新登录");
		}
	}
}
