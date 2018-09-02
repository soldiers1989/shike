/*
 * 文件名称: SKSmsServiceImpl.java
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

import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.Utils;
import co.kensure.sms.SMSClient;

import com.kensure.shike.user.dao.SKSmsDao;
import com.kensure.shike.user.model.SKSms;
import com.kensure.shike.user.model.SKUser;

/**
 * 短信表服务实现类
 * 
 * @author fankd created on 2018-9-2
 * @since
 */
@Service
public class SKSmsService extends JSBaseService {

	@Resource
	private SKSmsDao dao;

	@Resource
	private SKUserService sKUserService;

	public SKSms selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKSms> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKSms> selectAll() {
		return dao.selectAll();
	}

	public List<SKSms> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKSms obj) {
		super.beforeInsert(obj);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKSms> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKSms obj) {
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
	 * 根据电话号码和用户类型找用户验证码
	 * 
	 * @param mobile
	 * @param type
	 *            1是试客，2是商家，3是管理员
	 * @return
	 */
	public SKSms selectByMobile(String mobile, int type) {
		Map<String, Object> parameters = MapUtils.genMap("mobile", mobile, "type", type);
		List<SKSms> userlist = selectByWhere(parameters);
		SKSms u = null;
		if (CollectionUtils.isNotEmpty(userlist)) {
			u = userlist.get(0);
		}
		return u;
	}

	/**
	 * 发送验证码逻辑，type表示不同的验证码
	 * 
	 * @param mobile
	 * @param type
	 *            1是试客，2是商家，3是管理员
	 * @return
	 */
	public void sendQRSms(String mobile, int type) {
		if(type != 1 || type !=2){
			BusinessExceptionUtil.threwException("传参错误。");
		}	
		SKUser user = sKUserService.selectByMobile(mobile, type);
		if(user != null){
			BusinessExceptionUtil.threwException("用户已注册。");
		}

		SKSms smsinfo = selectByMobile(mobile,type);
		if (smsinfo == null) {
			smsinfo = new SKSms();
			smsinfo.setType(type);
			smsinfo.setMobile(mobile);
			smsinfo.setQrcode(Utils.randomSMSCode());
			insert(smsinfo);
		} else {
			update(smsinfo);
		}

		try {
			SMSClient.sendSMSMessage(mobile, smsinfo.getQrcode(), 30);
		} catch (Exception e) {
			BusinessExceptionUtil.threwException("发送短信失败");
		}
	}
	
	public void sendSucess(SKSms obj){
		obj.setFscount(obj.getFscount()+1);
		obj.setStatus(1L);
		update(obj);
	}

}
