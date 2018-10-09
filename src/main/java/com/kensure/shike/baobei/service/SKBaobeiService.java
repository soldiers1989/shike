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

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.ArithmeticUtils;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.PageInfo;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBaobeiDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBaobeiTP;
import com.kensure.shike.baobei.model.SKBaobeiZT;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKGroupStatus;
import com.kensure.shike.baobei.model.SKJindian;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.model.SKPayInfo;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.dianpu.service.SKDianPuService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;

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
	private SKBaobeiZTService sKBaobeiZTService;

	@Resource
	private SKBbrwService sKBbrwService;

	@Resource
	private SKJindianService sKJindianService;

	@Resource
	private SKWordService sKWordService;

	@Resource
	private SKSkqkService sKSkqkService;

	@Resource
	private SKUserZhangService sKUserZhangService;

	@Resource
	private SKDianPuService sKDianPuService;

	@Resource
	private SKJysjService sKJysjService;

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
		if (obj.getXinyongka() == null) {
			obj.setXinyongka(0);
		}
		if (obj.getHuabei() == null) {
			obj.setHuabei(0);
		}
		if (obj.getShaitu() == null) {
			obj.setShaitu(0);
		}
		if (obj.getWangwang() == null) {
			obj.setWangwang(0);
		}
		obj.setYsqnum(0L);
		obj.setIsDel(0L);
		obj.setStatus(0L);
		obj.setZjnum(0L);
		obj.setYingshou(0D);
		obj.setShishou(0D);
		obj.setTuikuan(0D);

		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKBaobei> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKBaobei obj) {
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
		sKBbrwService.initData(rws, obj.getHdtypeid());
		Long bbnum = 0L;
		Long sqnum = 0L;
		Date starttime = null;
		Date endtime = null;
		for (SKBbrw rw : rws) {
			bbnum += rw.getBbnum();
			sqnum += rw.getSqnum();
			if (starttime == null) {
				starttime = rw.getStartTime();
			}
			endtime = rw.getEndTime();
		}
		obj.setStartTime(starttime);
		obj.setEndTime(endtime);
		obj.setBbnum(bbnum);
		obj.setSqnum(sqnum);
		// 校验金额
		checkMoney(obj);
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
		int n = 0;
		for (SKJindian jd : jds) {
			if (NumberUtils.isZero(jd.getBili())) {
				continue;
			}
			jd.setBbid(obj.getId());
			sKJindianService.insert(jd);
			n += jd.getBili();
		}
		if (n != 100) {
			BusinessExceptionUtil.threwException("比例之和必须为100");
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
		zt.setBbid(obj.getId());
		zt.setContent(content);
		sKBaobeiZTService.insert(zt);

		return true;
	}

	/**
	 * 检验基本数据
	 * 
	 * @param obj
	 */
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
	 * 检验金额
	 * 
	 * @param obj
	 */
	private void checkMoney(SKBaobei obj) {
		Long hdtypeid = obj.getHdtypeid();
		Double salePrice = obj.getSalePrice();
		Long bbnum = obj.getBbnum();
		if (hdtypeid == 1 || hdtypeid == 2) {
			// 爆款打造
			// 效果建议投放单期总份数：
			// 小于50元客单（0-50元）≥20份
			// 50-100元客单≥10份
			// 100-300元客单≥5份
			// 高于300元客单≥1份
			if (salePrice < 50) {
				if (bbnum < 20) {
					BusinessExceptionUtil.threwException("小于50元客单（0-50元）≥20份");
				}
			} else if (salePrice < 100) {
				if (bbnum < 10) {
					BusinessExceptionUtil.threwException("50-100元客单≥10份");
				}
			} else if (salePrice < 300) {
				if (bbnum < 5) {
					BusinessExceptionUtil.threwException("100-300元客单≥5份");
				}
			} else {
				if (bbnum < 1) {
					BusinessExceptionUtil.threwException("高于300元客单≥1份");
				}
			}
		} else if (hdtypeid == 3) {
			if (salePrice < 300) {
				BusinessExceptionUtil.threwException("高于300元客单≥1份");
			} else if (bbnum < 1) {
				BusinessExceptionUtil.threwException("高于300元客单≥1份");
			}
		} else if (hdtypeid == 3) {
			double jine = salePrice * bbnum;
			if (jine < 500) {
				BusinessExceptionUtil.threwException("总货值不低于500元");
			}
		}
	}

	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public List<SKBaobei> getList(Integer status, String title, Integer hdtypeid, PageInfo page) {
		Map<String, Object> parameters = getListMapper(status, title, hdtypeid, page);
		List<SKBaobei> list = selectByWhere(parameters);
		SKUser skuser = sKUserService.getUser();
		if (skuser.getType() == 3 && CollectionUtils.isNotEmpty(list)) {
			for (SKBaobei skbaobei : list) {
				SKDianPu dianp = sKDianPuService.selectOne(skbaobei.getDpid());
				SKUser user = sKUserService.selectOne(skbaobei.getUserid());
				skbaobei.setDpname(dianp.getName());
				skbaobei.setUserName(user.getName());
			}
		}
		return list;
	}
	
	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public long getListCount(Integer status, String title, Integer hdtypeid,PageInfo page) {
		Map<String, Object> parameters = getListMapper(status, title, hdtypeid, page);
		long count = selectCountByWhere(parameters);
		return count;
	}
	
	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	private Map<String, Object> getListMapper(Integer status, String title, Integer hdtypeid,PageInfo page) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(),"isDel",0, "orderby", "created_time desc");
		if (status != null) {
			parameters.put("status", status);
		}
		if (skuser.getType() == 3) {
			parameters.remove("userid");
		}
		if (StringUtils.isNotBlank(title)) {
			parameters.put("titleLike", title);
		}
		if (hdtypeid != null) {
			parameters.put("hdtypeid", hdtypeid);
		}
		MapUtils.putPageInfo(parameters, page);
		return parameters;
	}
	
	

	/**
	 * 根据用户活动信息,计算应收项目
	 * 
	 * @return
	 */
	public List<SKPayInfo> payYingShouinfo(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		SKBaobei sk = selectOne(id);
		List<SKPayInfo> list = new ArrayList<SKPayInfo>();
		Long num = sk.getBbnum();
		Double price = sk.getSalePrice();
		String d1 = num + "*" + price;
		double xiaoji1 = ArithmeticUtils.mul(num, price, 1);
		SKPayInfo info1 = new SKPayInfo("本金", d1, xiaoji1);

		String d2 = d1 + "*2%";
		double xiaoji2 = ArithmeticUtils.mul(xiaoji1, 0.02, 1);
		SKPayInfo info2 = new SKPayInfo("转账手续费", d2, xiaoji2);

		String d3 = num + "*2";
		double xiaoji3 = ArithmeticUtils.mul(num, 2, 1);
		SKPayInfo info3 = new SKPayInfo("佣金", d3, xiaoji3);

		String d4 = "10元/次";
		double xiaoji4 = 10.00D;
		SKPayInfo info4 = new SKPayInfo("天秤平台", d4, xiaoji4);

		double leiji = ArithmeticUtils.add(xiaoji1, xiaoji2, xiaoji3, xiaoji4);
		SKPayInfo info5 = new SKPayInfo("合计", "", leiji);
		list.add(info1);
		list.add(info2);
		list.add(info3);
		list.add(info4);
		list.add(info5);
		return list;
	}
	
	/**
	 * 根据用户活动信息,设置应收
	 * 
	 * @return
	 */
	public void setYingShouinfo() {
		List<SKBaobei> bblist = selectAll();
		for(SKBaobei bb:bblist){
			long id = bb.getId();
			List<SKPayInfo> list = payYingShouinfo(id);
			SKPayInfo p = list.get(list.size() - 1);
			bb.setYingshou(p.getXiaoji());
			update(bb);
		}
	}
	

	/**
	 * 根据用户活动信息,设置实收项目，如果是全部完成，全额收，如果是部分完成，退还未出货本金+服务费，天秤平台照样收
	 * 
	 * @return
	 */
	public void setShiShouinfo(Long id) {
		SKBaobei sk = selectOne(id);
		double shishou = sk.getYingshou();
		double tuikuan = 0D;
		if (sk.getBbnum().compareTo(sk.getZjnum()) != 0) {
			// 任务没完成，只收20%的服务费
			Long num = sk.getBbnum();
			Double price = sk.getSalePrice();
			// 所有本金
			double xiaoji1 = ArithmeticUtils.mul(num, price, 1);
			// 转账手续费
			double xiaoji2 = ArithmeticUtils.mul(xiaoji1, 0.02, 1);
			// 佣金
			double xiaoji3 = ArithmeticUtils.mul(num, 2, 1);

			// 服务费 =（转账手续费+佣金）*0.2
			double yongjin = ArithmeticUtils.mul((xiaoji2 + xiaoji3), 0.2, 1);
			// 实收本金
			double shishoubenj = ArithmeticUtils.mul(sk.getZjnum(), price, 1);
			// 天秤平台
			double tiancheng = 10.00D;

			shishou = ArithmeticUtils.add(yongjin, shishoubenj, tiancheng);
			tuikuan = ArithmeticUtils.sub(sk.getYingshou(), shishou);
			
			//进行退款 增加活动退款流水
			SKUserZhang zhang = new SKUserZhang();
			zhang.setUserid(sk.getUserid());
			zhang.setBusiid(id);
			zhang.setBusitypeid(5L);
			zhang.setYue(tuikuan);
			sKUserZhangService.add(zhang);
		}
		sk.setShishou(shishou);
		sk.setTuikuan(tuikuan);
		update(sk);
	}

	/**
	 * 对活动进行支付
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void pay(Long id) {
		List<SKPayInfo> list = payYingShouinfo(id);
		SKPayInfo p = list.get(list.size() - 1);
		SKBaobei sk = selectOne(id);
		if (sk.getStatus() != 0) {
			BusinessExceptionUtil.threwException("已经支付");
		}
		sk.setStatus(1L);
		sk.setYingshou(p.getXiaoji());
		update(sk);

		// 增加流水
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(sk.getUserid());
		zhang.setBusiid(id);
		zhang.setBusitypeid(3L);
		zhang.setYue(p.getXiaoji());
		sKUserZhangService.add(zhang);
	}

	/**
	 * 审核通过
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void tongguo(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		SKBaobei sk = selectOne(id);
		if (sk.getStatus() >= 9) {
			BusinessExceptionUtil.threwException("已经通过审核");
		}
		sk.setStatus(9L);
		update(sk);
		// 修改账户信息
		sKUserZhangService.commit(sk.getUserid(), 3L, sk.getId());
	}
	
	/**
	 * 不通过，同时退钱
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void untongguo(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		SKBaobei baobei = selectOne(id);
		if(baobei.getStatus() != 1){
			BusinessExceptionUtil.threwException("非审核中宝贝，无法拒绝！");
		}
		baobei.setStatus(2L);
		setShiShouinfo(id);
	}

	/**
	 * 试客查看的活动列表,根据关键字和活动类型查询
	 * 
	 * @return
	 */
	public List<SKBaobei> getSKList(Integer typeid, String title, String order, String sort, String minprice, String maxprice, Integer hdtypeid) {
		Date start = new Date();
		Map<String, Object> parameters = MapUtils.genMap("is_del", 0, "lessStartTime", start, "status", 9);
		if (typeid != null) {
			parameters.put("typeid", typeid);
		}
		if (StringUtils.isNotBlank(title)) {
			parameters.put("titleLike", title);
		}
		if (StringUtils.isNotBlank(maxprice)) {
			parameters.put("lessSalePrice", maxprice);
		}
		if (StringUtils.isNotBlank(minprice)) {
			parameters.put("bigSalePrice", minprice);
		}
		if (hdtypeid != null && hdtypeid != 1) {
			parameters.put("hdtypeid", hdtypeid);
		}
		if (hdtypeid != null && hdtypeid == 1) {
			parameters.put("hdtypeidNot", "4");
		}
		if (StringUtils.isNotBlank(order)) {
			parameters.put("orderby", order + " " + sort);
		}
		List<SKBaobei> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 试客查看一个活动的详情 包括三张从表
	 * 
	 * @return
	 */
	public SKBaobei getSKBaobei(Long id) {
		SKBaobei skbaobei = selectOne(id);
		List<SKBaobeiTP> tplist = sKBaobeiTPService.getList(id);
		SKBaobeiZT detail = sKBaobeiZTService.getDetail(id);
		SKDianPu dianp = sKDianPuService.selectOne(skbaobei.getDpid());

		skbaobei.setTplist(tplist);
		skbaobei.setXiangqing(detail);
		skbaobei.setDpname(dianp.getName());
		return skbaobei;
	}

	/**
	 * 申请
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void shenqing(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserSK(skuser);
		SKBaobei baobei = selectOne(id);
		if (baobei.getStatus() < 9) {
			BusinessExceptionUtil.threwException("宝贝未通过审核");
		}

        sKSkqkService.saveSQ(baobei, skuser);
		Map<String, Object> params = MapUtils.genMap("id", id, "ysqnumAdd", 1);
		updateByMap(params);
	}

	/**
	 * 申请后的加购物车等流程数据
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void liucheng(Long id, long status, List<SKJysj> jysjList) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserSK(skuser);
		SKBaobei baobei = getSKBaobei(id);
		if (baobei.getStatus() < 9) {
			BusinessExceptionUtil.threwException("宝贝未通过审核");
		}

		// status=21(关注收藏) 并且 活动类型为"必中商品"时，直接中奖
		if (status == 21 && baobei.getHdtypeid() != null && baobei.getHdtypeid() == 4) {

			Map<String, Object> params = MapUtils.genMap("id", id, "zjnumAdd", 1);
			updateByMap(params);

			sKBbrwService.zhongjiang(baobei.getId());

			sKSkqkService.save(baobei, 51, skuser);
		} else {

			sKSkqkService.save(baobei, status, skuser);
		}

		sKJysjService.save(baobei, status, jysjList);
	}
	
	
	
	/**
	 * 宝贝下线，管理员将活动下线
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void xiaxian(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		SKBaobei baobei = selectOne(id);
		if(baobei.getStatus() != 9){
			BusinessExceptionUtil.threwException("非进行中活动，无需下线！");
		}
		baobei.setStatus(-1L);
		setShiShouinfo(id);
	}

	/**
	 * 核对宝贝的淘口令
	 * 
	 * @return
	 */
	public void checkTKL(Long id, String tkl) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserSK(skuser);
		SKBaobei baobei = selectOne(id);
		String url = baobei.getUrl();

		String taobaoid = TaoBaoService.getContentId(url);
		if (StringUtils.isBlank(taobaoid)) {
			BusinessExceptionUtil.threwException("口令验证错误！");
		}
		String tklid = TaoBaoService.parseTKL(tkl);
		if (!taobaoid.equalsIgnoreCase(tklid)) {
			BusinessExceptionUtil.threwException("口令验证错误！！");
		}
	}

	/**
	 * 核对宝贝的店铺名称
	 * 
	 * @return
	 */
	public void checkDPName(Long id, String dpname) {
		if (StringUtils.isBlank(dpname)) {
			BusinessExceptionUtil.threwException("店铺名称错误！");
		}
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserSK(skuser);
		SKBaobei baobei = getSKBaobei(id);
		String dpname1 = baobei.getDpname();

		if (!dpname.equalsIgnoreCase(dpname1)) {
			BusinessExceptionUtil.threwException("店铺名称错误！！");
		}
	}

	/**
	 * 宝贝任务结束
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void endBaobei() {
		Map<String, Object> parameters = MapUtils.genMap("bigEndTime", new Date(), "status", 9);
		List<SKBaobei> list = selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		// 修改状态
		for (SKBaobei bb : list) {
			bb.setStatus(10L);
			Map<String, Object> params = MapUtils.genMap("id", bb.getId(), "status", 10);
			updateByMap(params);
		}
		// 设置实收和返款,如果活动未达到预期目的，需要退款
		for (SKBaobei bb : list) {
			setShiShouinfo(bb.getId());
		}
	}

	/**
	 * 对状态进行统计
	 * 
	 * @return
	 */
	public List<SKGroupStatus> groubByStatus() {
		SKUser skuser = sKUserService.getUser();
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId());
		List<SKGroupStatus> list = dao.groubByStatus(parameters);
		return list;
	}
}
