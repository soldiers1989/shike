/*
 * 文件名称: SKBaobeiServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.ArithmeticUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBaobeiDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBaobeiTP;
import com.kensure.shike.baobei.model.SKBaobeiZT;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKJindian;
import com.kensure.shike.baobei.model.SKPayInfo;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

/**
 * 商品活动表服务实现类
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
@Service
public class SKBaobeiService extends JSBaseService {

	@Resource
	private SKBaobeiDao dao;

	@Resource
	private SKUserService sKUserService;

	@Resource
	private BaseKeyService baseKeyService;

	@Resource
	private SKBaobeiTPService sKBaobeiTPService;

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKJindianService sKJindianService;

	@Resource
	private SKWordService sKWordService;
	
	@Resource
	private SKBaobeiZTService sKBaobeiZTService;

	public SKBaobei selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKBaobei> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKBaobei> selectAll() {
		return dao.selectAll();
	}

	public List<SKBaobei> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBaobei obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_baobei"));
		if(obj.getXinyongka() == null){
			obj.setXinyongka(0);
		}
		if(obj.getHuabei() == null){
			obj.setHuabei(0);
		}
		if(obj.getShaitu() == null){
			obj.setShaitu(0);
		}
		if(obj.getWangwang() == null){
			obj.setWangwang(0);
		}
		obj.setIsDel(0L);
		obj.setStatus(0L);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKBaobei> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKBaobei obj) {
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
	 * 新增宝贝信息
	 * 
	 * @param obj
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean addBaobei(SKBaobei obj) {
		invalid(obj);
		SKUser user = sKUserService.getUser();
		SKUserService.checkUser(user);

		obj.setUserid(user.getId());
		obj.setYingshou(0D);
		obj.setDisorder(System.currentTimeMillis());

		// 任务初始化
		List<SKBbrw> rws = obj.getBbrwlist();
		sKBbrwService.initData(rws);
		Long bbnum = 0L;
		Long sqnum = 0L;
		Date starttime = null;
		Date endtime = null;
		for (SKBbrw rw : rws) {
			bbnum += rw.getBbnum();
			sqnum += rw.getSqnum();
			if(starttime == null){
				starttime = rw.getStartTime();
			}
			endtime = rw.getEndTime();
		}
		obj.setStartTime(starttime);
		obj.setEndTime(endtime);
		obj.setBbnum(bbnum);
		obj.setSqnum(sqnum);
		insert(obj);

		// 任务保存
		sKBbrwService.add(rws, obj.getId());

		// 图片
		List<SKBaobeiTP> tps = obj.getTplist();
		Long i = 1L;
		for (SKBaobeiTP tp : tps) {
			tp.setBbid(obj.getId());
			tp.setDisorder(i);
			sKBaobeiTPService.insert(tp);
			i++;
		}

		// 进店路径
		List<SKJindian> jds = obj.getJdlist();
		for (SKJindian jd : jds) {
			jd.setBbid(obj.getId());
			sKJindianService.insert(jd);
		}

		// 关键字
		List<SKWord> words = obj.getWordlist();
		for (SKWord word : words) {
			word.setBbid(obj.getId());
			sKWordService.insert(word);
		}

		// 宝贝详情
		SKBaobeiZT zt = new SKBaobeiZT();
		zt.setUrl(obj.getUrl());
		String content = TaoBaoService.getContent(obj.getUrl());
		zt.setContent(content);
		sKBaobeiZTService.insert(zt);	
		
		return true;
	}

	private void invalid(SKBaobei obj) {
		ParamUtils.isBlankThrewException(obj.getTitle(), "标题不能为空");
		ParamUtils.isBlankThrewException(obj.getDpid(), "店铺不能为空");
		ParamUtils.isBlankThrewException(obj.getUrl(), "链接不能为空");
		ParamUtils.isBlankThrewException(obj.getTypeid(), "类型不能为空");
		ParamUtils.isBlankThrewException(obj.getZturl(), "主图不能为空");
		ParamUtils.isBlankThrewException(obj.getNoQq(), "qq不能为空");
		ParamUtils.isBlankThrewException(obj.getSalePrice(), "价格不能为空");
		if (obj.getSalePrice() < 1) {
			BusinessExceptionUtil.threwException("价格必须大于1");
		}
		ParamUtils.isBlankThrewException(obj.getTitle(), "标题不能为空");
	}

	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public List<SKBaobei> getList(Integer status) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "status", status, "orderby", "created_time desc");
		List<SKBaobei> list = selectByWhere(parameters);
		return list;
	}
	
	
	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public List<SKPayInfo> payinfo(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		SKBaobei sk = selectOne(id);
		if(sk.getUserid() != skuser.getId()){
			BusinessExceptionUtil.threwException("权限异常");
		}	
		List<SKPayInfo> list = new ArrayList<SKPayInfo>(); 
		Long num = sk.getBbnum();
		Double price = sk.getSalePrice();
		String d1 = num+"*"+price;
		double xiaoji1 = ArithmeticUtils.mul(num, price,1);
		SKPayInfo info1 = new SKPayInfo("本金",d1,xiaoji1);
		
		String d2 = d1+"*2%";
		double xiaoji2 = ArithmeticUtils.mul(xiaoji1, 0.02,1);
		SKPayInfo info2 = new SKPayInfo("平台服务费",d2,xiaoji2);
		double leiji = ArithmeticUtils.add(xiaoji1, xiaoji2);
		SKPayInfo info3 = new SKPayInfo("合计","",leiji);
		list.add(info1);
		list.add(info2);
		list.add(info3);
		return list;
	}
	
	
	
	
	
}
