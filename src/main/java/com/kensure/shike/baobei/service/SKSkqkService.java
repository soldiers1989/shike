/*
 * 文件名称: SKSkqkServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.baobei.dao.SKSkqkDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

/**
 * 试客情况表服务实现类
 * 
 * @author fankd created on 2018-9-11
 * @since
 */
@Service
public class SKSkqkService extends JSBaseService {

	@Resource
	private SKSkqkDao dao;

	@Resource
	private BaseKeyService baseKeyService;
	
	@Resource
	private SKBbrwService sKBbrwService;
	
	@Resource
	private SKBaobeiService sKBaobeiService;
	
	@Resource
	private SKUserService sKUserService;
	
	public SKSkqk selectOne(Long id) {
		return dao.selectOne(id);
	}

	public List<SKSkqk> selectByIds(Collection<Long> ids) {
		return dao.selectByIds(ids);
	}

	public List<SKSkqk> selectAll() {
		return dao.selectAll();
	}

	public List<SKSkqk> selectByWhere(Map<String, Object> parameters) {
		return dao.selectByWhere(parameters);
	}

	public long selectCount() {
		return dao.selectCount();
	}

	public long selectCountByWhere(Map<String, Object> parameters) {
		return dao.selectCountByWhere(parameters);
	}

	public boolean insert(SKSkqk obj) {
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_sqqk"));
		obj.setLastStatus(0L);
		obj.setStatus(1L);
		return dao.insert(obj);
	}

	public boolean insertInBatch(List<SKSkqk> objs) {
		return dao.insertInBatch(objs);
	}

	public boolean update(SKSkqk obj) {
		super.beforeUpdate(obj);
		if(obj.getStatus() >= 0){
			obj.setLastStatus(obj.getStatus());
		}		
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

	public SKSkqk getQkByBBId(long bbid,long userid) {
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid,"userid",userid);
		List<SKSkqk> list = selectByWhere(parameters);
		if (CollectionUtils.getSize(list) > 1) {
			BusinessExceptionUtil.threwException("你已经申请过该宝贝！");	
		}
		SKSkqk sk = null;
		if (CollectionUtils.getSize(list) > 0) {
			sk = list.get(0);
		}
		return sk;
	}

	//获取宝贝中奖情况
	public long getZJNum(long bbid){
		Map<String, Object> parameters = MapUtils.genMap("bbid", bbid,"bigthanstatus",51);
		return selectCountByWhere(parameters);
	}

	/**
	 * 申请
	 * @param baobei
	 * @param salePrice
	 * @param jiangli
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean saveSQ(SKBaobei baobei,SKUser skuser){
		if(baobei.getStatus() != 9 || baobei.getIsDel() == 1){
			BusinessExceptionUtil.threwException("该宝贝失效！");
		}
		SKSkqk qk = getQkByBBId(baobei.getId(),skuser.getId());
		if(qk != null && qk.getStatus() > 1){
			BusinessExceptionUtil.threwException("你已经申请过该宝贝！");
		}
		//任务计数
		if(qk ==  null || qk.getStatus() < 1){
			sKBbrwService.shenqing(baobei.getId());
		}
		if(qk == null){
			qk = new SKSkqk();
			qk.setBbid(baobei.getId());
			qk.setUserid(skuser.getId());
			qk.setSalePrice(baobei.getSalePrice());
			qk.setJiangli(baobei.getJiangli());	
			insert(qk);
		}else{
			qk.setStatus(1L);
			update(qk);
		}
		return true;
	}

	/**
	 * 申请后的流程状态保持
	 * @param baobei
	 * @param skuser
	 * @return
	 */
	public boolean save(SKBaobei baobei,long status,SKUser skuser){
		if(baobei.getStatus() != 9 || baobei.getIsDel() == 1){
			BusinessExceptionUtil.threwException("该宝贝失效！");
		}
		SKSkqk qk = getQkByBBId(baobei.getId(),skuser.getId());
		if(qk.getStatus()>= status){
			BusinessExceptionUtil.threwException("数据有误！");
		}
		qk.setStatus(status);
		update(qk);
		return true;
	}

	/**
	 * 获取试客情况列表
	 * @param bbid
	 * @param userid
	 * @return
	 */
	public List<SKSkqk> getSkQKList(long status) {
		SKUser user = sKUserService.getUser();
		SKUserService.checkUserSK(user);
		Map<String, Object> parameters = MapUtils.genMap("userid", user.getId(),"status",status);
		List<SKSkqk> list = selectByWhere(parameters);
		if(CollectionUtils.isNotEmpty(list)){
			for(SKSkqk skqk:list){
				SKBaobei baobei = sKBaobeiService.selectOne(skqk.getBbid());
				skqk.setBaobei(baobei);
			}		
		}
		return list;
	}
}
