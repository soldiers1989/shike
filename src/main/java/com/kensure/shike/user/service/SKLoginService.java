/*
 * 文件名称: SKLoginServiceImpl.java
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

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.http.RequestUtils;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.Utils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.user.dao.SKLoginDao;
import com.kensure.shike.user.model.SKLogin;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.weixin.model.WeixinOpenid;
import com.kensure.shike.weixin.service.WeixinOpenidService;

/**
 * 试客登录表服务实现类
 * 
 * @author fankd created on 2018-9-2
 * @since
 */
@Service
public class SKLoginService extends JSBaseService {

	@Resource
	private SKLoginDao dao;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private WeixinOpenidService weixinOpenidService;

	public SKLogin selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKLogin> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKLogin obj) {
		obj.setId(baseKeyService.getKey("sk_login"));
		obj.setStatus(0L);
		super.beforeInsert(obj);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKLogin> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKLogin obj) {
		super.beforeUpdate(obj);
		return dao.update(obj);
	}

	public boolean updateByMap(Map<String, Object> params) {
		return dao.updateByMap(params);
	}

	/**
	 * 根据令牌拿到用户登录信息 tokenid = sessionid
	 * 
	 * @return
	 */
	public SKLogin selectByTokenId(String tokenid) {
		Map<String, Object> parameters = MapUtils.genMap("sessionid", tokenid);
		List<SKLogin> loginlist = selectByWhere(parameters);
		SKLogin u = null;
		if (CollectionUtils.isNotEmpty(loginlist)) {
			u = loginlist.get(0);
		}
		return u;
	}

	/**
	 * 登录逻辑
	 * 
	 * @param mobile
	 * @param password
	 * @param type
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SKUserSession login(String mobile, String password, int type,String openid, HttpServletRequest request) {
		// MobileUtils.checkMobile(mobile);
		SKUserService.rangeType(type);

		SKUser u = sKUserService.selectByMobile(mobile, type);
		if (u == null) {
			u = sKUserService.selectByName(mobile, type);
		}

		if (u == null) {
			BusinessExceptionUtil.threwException("用户不存在");
		}
		if (!u.getPassword().equalsIgnoreCase(password)) {
			BusinessExceptionUtil.threwException("用户或者密码无效");
		}

		if (u != null && u.getStatus() == -1) {
			BusinessExceptionUtil.threwException("账号已停用");
		}

		// 会话id
		String uuid = Utils.getUUID();
		SKLogin sklogin = new SKLogin();
		sklogin.setSessionid(uuid);
		sklogin.setUserid(u.getId());

		// 设备信息
		String agentno = RequestUtils.getAgent(request);
		// 获取客户ip
		String cip = RequestUtils.getClientIp(request);
		String dip = RequestUtils.getDip(request);
		sklogin.setAgentno(agentno);
		sklogin.setCip(cip);
		sklogin.setDip(dip);

		insert(sklogin);

		SKUserSession sKUserSession = new SKUserSession();
		sKUserSession.setTokenId(uuid);
		sKUserSession.setName(u.getName());
		sKUserSession.setPhone(u.getPhone());
		sKUserSession.setType(u.getType());
		//如果openid不为空，保存关系
		if(StringUtils.isNotBlank(openid)){
			weixinOpenidService.saveOpen(openid, sKUserSession.getTokenId());
		}
		return sKUserSession;
	}

	/**
	 * 试客根据openid获取登录信息
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SKUserSession getLoginByOpenid(String openid) {
		SKUserSession sKUserSession = null;
		if(StringUtils.isBlank(openid)){
			return null;
		}
		WeixinOpenid open = weixinOpenidService.getOpenByOpenid(openid);
		if (open != null) {
			String tokenid = open.getSessionid();
			SKLogin token = selectByTokenId(tokenid);
			if (token != null) {
				SKUser user = sKUserService.selectOne(token.getUserid());
				if (user != null) {
					sKUserSession = new SKUserSession();
					sKUserSession.setTokenId(token.getSessionid());
					sKUserSession.setName(user.getName());
					sKUserSession.setPhone(user.getPhone());
					sKUserSession.setType(user.getType());
				}
			}
		}
		return sKUserSession;
	}

}
