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

	@Resource
	private SKHbsjService sKHbsjService;

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
		obj.setIsXuni(0);
		if (obj.getZengzhi() == null) {
			obj.setZengzhi(0L);
		}
		if (obj.getJiangli() == null) {
			obj.setJiangli(0D);
		}

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
		invalid(obj, oldBaoBei);
		if (newFlag) {
			SKUser user = sKUserService.getUser();
			SKUserService.checkUser(user);

			obj.setUserid(user.getId());
			if (obj.getYingshou() == null) {
				obj.setYingshou(0D);
			}
			if (obj.getDisorder() == null) {
				obj.setDisorder(System.currentTimeMillis());
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
		checkMoney(obj);

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
		sKBbrwService.saveOrUpdateInBatch(rws, obj.getId(), newFlag);

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
	 * 检验基本数据
	 * 
	 * @param obj
	 */
	private void invalid(SKBaobei obj, SKBaobei oldBaoBei) {
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
		if (oldBaoBei != null && oldBaoBei.getStatus() != 0 && oldBaoBei.getStatus() != 2) {
			BusinessExceptionUtil.threwException("活动状态不正确，不允许修改");
		}
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
				BusinessExceptionUtil.threwException("高于300元");
			} else if (bbnum < 1) {
				BusinessExceptionUtil.threwException("高于300元客单≥1份");
			}
		} else if (hdtypeid == 4) {
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
	public List<SKBaobei> getList(SKBaobeiQuery query, PageInfo page) {
		Map<String, Object> parameters = getListMapper(query, page);
		List<SKBaobei> list = selectByWhere(parameters);
		SKUser skuser = sKUserService.getUser();
		if (skuser.getType() == 3 && CollectionUtils.isNotEmpty(list)) {
			for (SKBaobei skbaobei : list) {
				SKDianPu dianp = sKDianPuService.selectOne(skbaobei.getDpid());
				SKUser user = sKUserService.selectOne(skbaobei.getUserid());
				skbaobei.setDianpu(dianp);
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
		if (baobei.getIsXuni() == 1) {
			BusinessExceptionUtil.threwException("该宝贝今日已经申请完");
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
		if (baobei.getStatus() != 9) {
			BusinessExceptionUtil.threwException("非进行中活动，无需下线！");
		}
		baobei.setStatus(-1L);
		update(baobei);
		setShiShouinfo(id);
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
			sKSkqkService.endquxiao(bb.getId());
		}
	}

	/**
	 * 宝贝结算，和商家算钱，看下是否需要退还给他们钱
	 * 
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public void jiesuanBaobei() {
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
			bb.setStatus(20L);
			Map<String, Object> params = MapUtils.genMap("id", bb.getId(), "status", 20);
			updateByMap(params);

			// 设置实收和返款,如果活动未达到预期目的，需要退款
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
	 * 增加中奖数
	 * 
	 * @return
	 */
	public void addzjs(Long id, Long zjs) {
		SKUser skuser = sKUserService.getUser();
		SKUserService.checkUserAdmin(skuser);
		SKBaobei one = selectOne(id);
		if (one.getIsXuni() != 1) {
			BusinessExceptionUtil.threwException("该商品无法增加中奖数！！");
		}
		one.setZjnum(one.getZjnum() + zjs);
		update(one);
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
