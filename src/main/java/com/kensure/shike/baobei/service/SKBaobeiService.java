package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.ArithmeticUtils;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.ListUtils;
import co.kensure.mem.MapUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.PageInfo;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKBaobeiDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBaobeiTP;
import com.kensure.shike.baobei.model.SKBaobeiZT;
import com.kensure.shike.baobei.model.SKBbrw;
import com.kensure.shike.baobei.model.SKBbrwDetail;
import com.kensure.shike.baobei.model.SKGroupStatus;
import com.kensure.shike.baobei.model.SKHbsj;
import com.kensure.shike.baobei.model.SKJindian;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.model.SKPayInfo;
import com.kensure.shike.baobei.model.SKShiShou;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.baobei.model.SKYingShou;
import com.kensure.shike.baobei.query.SKBaobeiQuery;
import com.kensure.shike.baobei.query.SKBaobeiQuery1;
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
	public static Logger logger = Logger.getLogger(SKBaobeiService.class);
	
	@Resource
	private SKBaobeiDao dao;
	@Resource
	private BaseKeyService baseKeyService;
	@Resource
	private SKUserService sKUserService;
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
	@Resource
	private SKHbsjService sKHbsjService;
	@Resource
	private SKChouJiangService sKChouJiangService;
	@Resource
	private SKBbrwDetailService sKBbrwDetailService;
	@Resource
	private SKBaobeiHelper sKBaobeiHelper;

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

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKBaobei obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_baobei"));
		SKBaobeiHelper.insertInit(obj);
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

	/**
	 * 判断店铺下的活动是否已经完成。 如果只有未付款、已驳回、已完结，表示店铺下的都已经完成了
	 */
	public void checkBaobeiIsFinish(Long dpid) {
		Map<String, Object> parameters = MapUtils.genMap("dpid", dpid);
		List<SKBaobei> list = selectByWhere(parameters);
		if(CollectionUtils.isEmpty(list)){
			return;
		}
		for(SKBaobei bb:list){
			if(bb.getStatus() == 0 || bb.getStatus() == 2 || bb.getStatus() == 20){
				continue;
			}
			BusinessExceptionUtil.threwException("您的店铺有活动未完成。");
		}	
	}

	/**
	 * 新增宝贝信息
	 * 
	 * @param obj
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean saveBaoBei(SKBaobei obj) {
		SKBaobei oldBaoBei = null;
		boolean newFlag = true;
		if (obj.getId() != null) {
			oldBaoBei = this.selectOne(obj.getId());
			if (oldBaoBei == null) {
				BusinessExceptionUtil.threwException("修改记录不存在");
			}
			newFlag = false;
		}
		sKBaobeiHelper.invalid(obj, oldBaoBei);

		SKDianPu dianp = sKDianPuService.selectOne(obj.getDpid());
		if (dianp.getJihuo() != 1) {
			BusinessExceptionUtil.threwException("请激活店铺");
		}

		if (newFlag) {
			SKUser user = sKUserService.getUser();
			SKUserService.checkUser(user);

			obj.setUserid(user.getId());
			if (obj.getYingshou() == null) {
				obj.setYingshou(0D);
			}
			if (obj.getDisorder() == null) {
				obj.setDisorder(1000L);
			}
		}

		// 任务初始化
		List<SKBbrw> rws = obj.getBbrwlist();
		sKBbrwService.initData(rws, obj.getHdtypeid(), newFlag);
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
		sKBaobeiHelper.checkMoney(obj);

		// 有没有增值服务
		// 货比三家
		SKHbsj hbsj = obj.getHbsj();
		if (hbsj != null) {
			obj.setZengzhi(1L);
		}

		if (obj.getId() == null) {
			this.insert(obj);
		} else {
			if (oldBaoBei.getStatus() == 2) {
				obj.setStatus(0L);
			}
			this.update(obj);
		}

		if (hbsj != null) {
			hbsj.setId(obj.getId());
			sKHbsjService.save(hbsj);
		}

		// 任务保存,并删除无效的旧数据
		sKBbrwService.saveOrUpdateInBatch(rws, obj.getId());

		// 图片
		List<SKBaobeiTP> tps = obj.getTplist();
		Long i = 1L;
		for (SKBaobeiTP tp : tps) {
			tp.setBbid(obj.getId());
			tp.setDisorder(i);
			if (tp.getId() == null) {
				this.sKBaobeiTPService.insert(tp);
			} else {
				this.sKBaobeiTPService.update(tp);
			}
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
			if (jd.getId() == null) {
				this.sKJindianService.insert(jd);
			} else {
				this.sKJindianService.update(jd);
			}
			n += jd.getBili();
		}
		if (n != 100) {
			BusinessExceptionUtil.threwException("比例之和必须为100");
		}

		// 关键字处理
		Map<Long, SKWord> oldKeyWordMap = null;
		if (!newFlag) {
			List<SKWord> oldKeyWords = this.sKWordService.getList(obj.getId());
			oldKeyWordMap = ListUtils.listToMap(oldKeyWords, "id");
		}

		List<SKWord> words = obj.getWordlist();
		for (SKWord word : words) {
			word.setBbid(obj.getId());
			if (word.getId() == null) {
				this.sKWordService.insert(word);
			} else {
				this.sKWordService.update(word);
				if (oldKeyWordMap != null) {
					oldKeyWordMap.remove(word.getId());
				}
			}
		}

		if (oldKeyWordMap != null && oldKeyWordMap.size() > 0) {
			List<Long> ids = new ArrayList<>();
			for (SKWord word : oldKeyWordMap.values()) {
				ids.add(word.getId());
			}
			this.sKWordService.deleteMulti(ids);
		}

		return true;
	}

	private void saveContent(long bbid, String url) {
		// 宝贝详情
		SKBaobeiZT one = sKBaobeiZTService.getDetail(bbid);
		if (one != null) {
			return;
		}
		SKBaobeiZT zt = new SKBaobeiZT();
		zt.setUrl(url);
		String content = TaoBaoService.getContent(url);
		zt.setBbid(bbid);
		zt.setContent(content);
		this.sKBaobeiZTService.insert(zt);
	}

	public void saveBody(long bbid, String body) {
		// 宝贝详情
		SKBaobeiZT one = sKBaobeiZTService.getDetail(bbid);
		SKBaobei bb = selectOne(bbid);
		SKBaobeiZT zt = new SKBaobeiZT();
		zt.setUrl(bb.getUrl());
		String content = TaoBaoService.parseBody(body);
		zt.setBbid(bbid);
		zt.setContent(content);
		if (one != null) {
			this.sKBaobeiZTService.update(zt);
		} else {
			this.sKBaobeiZTService.insert(zt);
		}
	}

	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public List<SKBaobei> getList(SKBaobeiQuery query, PageInfo page) {
		Map<String, Object> parameters = getListMapper(query, page);
		List<SKBaobei> list = selectByWhere(parameters);
		SKUser skuser = sKUserService.getUser();
		if (skuser.getType() == 3 && CollectionUtils.isNotEmpty(list)) {
			for (SKBaobei skbaobei : list) {
				SKDianPu dianp = sKDianPuService.selectOne(skbaobei.getDpid());
				SKUser user = sKUserService.selectOne(skbaobei.getUserid());
				skbaobei.setUserName(user.getName());
				skbaobei.setDianpu(dianp);
				if (dianp != null) {
					skbaobei.setDpname(dianp.getName());				
				}
			}
		}
		return list;
	}

	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	public long getListCount(SKBaobeiQuery query, PageInfo page) {
		Map<String, Object> parameters = getListMapper(query, page);
		long count = selectCountByWhere(parameters);
		return count;
	}

	/**
	 * 根据用户活动信息
	 * 
	 * @return
	 */
	private Map<String, Object> getListMapper(SKBaobeiQuery query, PageInfo page) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUser(skuser);
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "isDel", 0, "orderby", "created_time desc");
		if (query.getStatus() != null) {
			parameters.put("status", query.getStatus());
		}
		if (skuser.getType() == 3) {
			parameters.remove("userid");
		}
		if (StringUtils.isNotBlank(query.getTitle())) {
			parameters.put("titleLike", query.getTitle());
		}
		if (query.getHdtypeid() != null) {
			parameters.put("hdtypeid", query.getHdtypeid());
		}
		if (query.getJiangli() != null) {
			parameters.put("startjiangli", query.getJiangli());
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
		if (sk.getZengzhi() != null && sk.getZengzhi() == 1) {
			sk.setHbsj(sKHbsjService.selectOne(id));
		}
		SKYingShou yingshou = new SKYingShou(sk);
		return yingshou.getList();
	}

	/**
	 * 根据用户活动信息,设置应收
	 * 
	 * @return
	 */
	public void setYingShouinfo() {
		List<SKBaobei> bblist = selectAll();
		for (SKBaobei bb : bblist) {
			long id = bb.getId();
			SKBaobei sk = selectOne(id);
			if (sk.getZengzhi() != null && sk.getZengzhi() == 1) {
				sk.setHbsj(sKHbsjService.selectOne(id));
			}
			SKYingShou yingshou = new SKYingShou(sk);
			bb.setYingshou(yingshou.getLeiji().getXiaoji());
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
		if (sk.getZengzhi() != null && sk.getZengzhi() == 1) {
			sk.setHbsj(sKHbsjService.selectOne(id));
		}
		double shishou = sk.getYingshou();
		double tuikuan = 0D;
		if (sk.getBbnum().compareTo(sk.getZjnum()) != 0) {
			SKShiShou ss = new SKShiShou(sk);
			shishou = ss.getLeiji().getXiaoji();
			tuikuan = ArithmeticUtils.sub(sk.getYingshou(), shishou);
			// 进行退款 增加活动退款流水
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
	 * 活动全额返款，一般在活动驳回的时候使用
	 * 
	 * @return
	 */
	public void setAllBack(Long id) {
		SKBaobei sk = selectOne(id);
		double shishou = sk.getYingshou();

		// 进行活动驳回 增加活动驳回流水
		SKUserZhang zhang = new SKUserZhang();
		zhang.setUserid(sk.getUserid());
		zhang.setBusiid(id);
		zhang.setBusitypeid(8L);
		zhang.setYue(shishou);
		sKUserZhangService.add(zhang);

		sk.setShishou(0D);
		sk.setTuikuan(shishou);
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

		// 判断店铺是否通过审核
		SKDianPu dianp = sKDianPuService.selectOne(sk.getDpid());
		if (dianp != null && dianp.getStatus() != 9) {
			BusinessExceptionUtil.threwException("需要审核店铺!");
		}
		// 修改账户信息
		sKUserZhangService.commit(sk.getUserid(), 3L, sk.getId());
		saveContent(id, sk.getUrl());
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
		if (baobei.getStatus() != 1) {
			BusinessExceptionUtil.threwException("非审核中宝贝，无法拒绝！");
		}
		baobei.setStatus(2L);
		setAllBack(id);
	}

	/**
	 * 试客查看的活动列表,根据关键字和活动类型查询
	 * 
	 * @return
	 */
	public List<SKBaobei> getSKList(SKBaobeiQuery1 query) {
		Date start = new Date();
		Map<String, Object> parameters = MapUtils.genMap("is_del", 0, "lessStartTime", start, "status", 9);
		if (query.getTypeid() != null) {
			parameters.put("typeid", query.getTypeid());
		}
		if (StringUtils.isNotBlank(query.getTitle())) {
			parameters.put("titleLike", query.getTitle());
		}
		if (StringUtils.isNotBlank(query.getMaxprice())) {
			parameters.put("endSalePrice", query.getMaxprice());
		}
		if (StringUtils.isNotBlank(query.getMinprice())) {
			parameters.put("startSalePrice", query.getMinprice());
		}
		if (query.getHdtypeid() != null && query.getHdtypeid() != 1) {
			parameters.put("hdtypeid", query.getHdtypeid());
		}
		if (query.getHdtypeid() != null && query.getHdtypeid() == 1) {
			parameters.put("hdtypeidNot", "4");
		}
		if (StringUtils.isNotBlank(query.getOrder())) {
			parameters.put("orderby", query.getOrder() + " " + query.getSort());
		}
		if (query.getJiangli() != null) {
			parameters.put("startjiangli", query.getJiangli());
		}
		List<SKBaobei> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 试客查看一个活动的详情 包括三张从表,还有增值服务
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
		if (skbaobei.getZengzhi() != null && skbaobei.getZengzhi() == 1) {
			skbaobei.setHbsj(sKHbsjService.selectOne(id));
		}
		return skbaobei;
	}

	/**
	 * 获取完整的宝贝信息
	 * 
	 * @param id
	 * @return
	 */
	public SKBaobei getBaoBeiFull(Long id) {
		SKBaobei baobei = this.getSKBaobei(id);
		// 进店方式
		List<SKJindian> jdList = this.sKJindianService.getList(id);
		baobei.setJdlist(jdList);

		// 关键词
		List<SKWord> wordList = sKWordService.getList(id);
		baobei.setWordlist(wordList);

		// 任务列表
		List<SKBbrw> bbrwList = sKBbrwService.selectByWhere(MapUtils.genMap("bbid", id));
		baobei.setBbrwlist(bbrwList);
		for (SKBbrw bbrw : bbrwList) {
			List<SKBbrwDetail> details = sKBbrwDetailService.selectByBbrwid(bbrw.getId());
			if (CollectionUtils.isNotEmpty(details)) {
				bbrw.setDetails(details);
			}
		}
		// 货币三家
		baobei.setHbsj(sKHbsjService.selectOne(id));

		return baobei;
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
		// 虚拟宝贝可以申请，但是不会中奖
		// if (baobei.getIsXuni() == 1) {
		// BusinessExceptionUtil.threwException("该宝贝今日已经申请完");
		// }

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
	public void liucheng(Long id, long status, String notaobao, List<SKJysj> jysjList) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserSK(skuser);
		SKBaobei baobei = getSKBaobei(id);

		// status=21(关注收藏),如果用户没有淘宝账号提示他填写淘宝账号
		if (status == 21 && StringUtils.isBlank(skuser.getNoTaobao())) {
			if (StringUtils.isBlank(notaobao)) {
				BusinessExceptionUtil.threwException("请输入你的淘宝账号");
			}
			sKUserService.updateTaobaoNo(skuser.getId(), notaobao);
		}

		if (status == 21 && baobei.getHdtypeid() != null && baobei.getHdtypeid() == 4) {
			if (baobei.getStatus() < 9) {
				BusinessExceptionUtil.threwException("宝贝未通过审核");
			}
			if (!sKUserService.isInvalid(skuser.getId())) {
				BusinessExceptionUtil.threwException("您的信息不完整，请填写完整");
			}
			Map<String, Object> params = MapUtils.genMap("id", id, "zjnumAdd", 1);
			updateByMap(params);

			sKChouJiangService.zhongjiang(baobei.getId());

			sKSkqkService.save(baobei, 51, skuser);
		} else {
			// 必中校验
			if (status == 18 && baobei.getHdtypeid() != null && baobei.getHdtypeid() == 4) {
				sKChouJiangService.bizhongjiaoyan(baobei.getId());
			}
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
		if (baobei.getStatus() != 9) {
			BusinessExceptionUtil.threwException("非进行中活动，无需下线！");
		}
		baobei.setStatus(-1L);
		update(baobei);
		// 已经下线的商品，把那边中奖前的都干掉
		sKSkqkService.zuoFei(baobei.getId());
	}

	/**
	 * 宝贝虚拟
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void xuni(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		SKBaobei baobei = selectOne(id);
		baobei.setIsXuni(1);
		update(baobei);
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
			sKSkqkService.zuoFei(bb.getId());
		}
	}

	/**
	 * 宝贝结算，和商家算钱，看下是否需要退还给他们钱
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void jieSuanBaobei() {
		Map<String, Object> parameters = MapUtils.genMap("status", 10);
		List<SKBaobei> list = selectByWhere(parameters);
		if (CollectionUtils.isEmpty(list)) {
			return;
		}
		// 修改状态
		for (SKBaobei bb : list) {
			// 有未完成和挂起的，都不结算
			List<SKSkqk> sqlist = sKSkqkService.getWaitList(bb.getId());
			if (CollectionUtils.isNotEmpty(sqlist)) {
				continue;
			}
			sqlist = sKSkqkService.getHumpList(bb.getId());
			if (CollectionUtils.isNotEmpty(sqlist)) {
				continue;
			}
			jieSuanBaobei(bb);
		}
	}

	/**
	 * 宝贝结算，和商家算钱，看下是否需要退还给他们钱
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void jieSuanBaobei(Long id) {
		SKBaobei bb = selectOne(id);
		jieSuanBaobei(bb);
	}

	/**
	 * 宝贝结算，和商家算钱，看下是否需要退还给他们钱
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	private void jieSuanBaobei(SKBaobei bb) {
		bb.setStatus(20L);
		Map<String, Object> params = MapUtils.genMap("id", bb.getId(), "status", 20);
		updateByMap(params);
		// 让一些垃圾申请作废掉
		sKSkqkService.zuoFei(bb.getId());
		// 设置实收和返款,如果活动未达到预期目的，需要退款
		setShiShouinfo(bb.getId());
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

	/**
	 * 增加申请数
	 * 
	 * @return
	 */
	public void addsqs(Long id, Long sqs) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		Map<String, Object> params = MapUtils.genMap("id", id, "ysqnumAdd", sqs);
		updateByMap(params);
	}

	/**
	 * 设置排序
	 * 
	 * @return
	 */
	public void addpaixu(Long id, Long disorder) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		Map<String, Object> params = MapUtils.genMap("id", id, "disorder", disorder);
		updateByMap(params);
	}

	/**
	 * 取消限制
	 * 
	 * @return
	 */
	public void cancelLimit(Long id) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		Map<String, Object> params = MapUtils.genMap("id", id, "isLimit", 0);
		updateByMap(params);
	}

	/**
	 * 增加中奖数
	 * 
	 * @return
	 */
	public void addzjs(Long id, Integer zjs) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		addZjsNum(id, zjs);
	}

	/**
	 * 增加或减少中奖数数量 +-
	 * 
	 * @return
	 */
	public void addZjsNum(Long id, Integer zjs) {
		Map<String, Object> params = MapUtils.genMap("id", id, "zjnumAdd", zjs);
		updateByMap(params);
	}

	/**
	 * 获取商家未结算的活动列表
	 * 
	 * @return
	 */
	public List<SKBaobei> getUnJiesuan() {
		SKUser skuser = sKUserService.getUser();
		List<Integer> statuslist = new ArrayList<Integer>();
		statuslist.add(9);
		statuslist.add(10);
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "statuslist", statuslist);
		List<SKBaobei> list = selectByWhere(parameters);
		return list;
	}

	/**
	 * 获取商家结算的活动列表
	 * 
	 * @return
	 */
	public List<SKBaobei> getJiesuan() {
		SKUser skuser = sKUserService.getUser();
		Map<String, Object> parameters = MapUtils.genMap("userid", skuser.getId(), "status", 20);
		List<SKBaobei> list = selectByWhere(parameters);
		return list;
	}
}
