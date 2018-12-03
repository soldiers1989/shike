/*
 * 文件名称: SKTaobaoServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-11-11
 * 修改内容: 
 */
package com.kensure.shike.baobei.service;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.dao.SKTaobaoDao;
import com.kensure.shike.baobei.model.SKTaobao;
import com.kensure.shike.baobei.service.SKTaobaoService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.CollectionUtils;
import co.kensure.mem.MapUtils;


/**
 * 淘宝账号信息服务实现类
 * @author fankd created on 2018-11-11
 * @since 
 */
@Service
public class SKTaobaoService extends JSBaseService{
	
	@Resource
	private SKTaobaoDao dao;
    
	@Resource
	private SKUserService sKUserService;
	
	@Resource
	private TaoBaoService taoBaoService;
	
    public SKTaobao selectOne(String id){
    	return dao.selectOne(id);
    }
	
	public List<SKTaobao> selectByIds(Collection<String> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKTaobao> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKTaobao> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKTaobao obj){
		super.beforeInsert(obj);
		obj.setFlag(0);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKTaobao> objs){		
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKTaobao obj){
		super.beforeUpdate(obj);
		return dao.update(obj);
	}
    
    public boolean updateByMap(Map<String, Object> params){
		return dao.updateByMap(params);
	}
    
    
	public boolean delete(String id){
		return dao.delete(id);
	}	
	
    public boolean deleteMulti(Collection<String> ids){
		return dao.deleteMulti(ids);
	}
    
    public boolean deleteByWhere(Map<String, Object> parameters){
		return dao.deleteByWhere(parameters);
	}
    
    /**
     * 更新相应的状态
     * @param sessionId
     * @return
     */
    public void flash(String sessionId){
    	List<SKUser> userlist = sKUserService.selectSKList();
    	for(SKUser user:userlist){
    		String notaobao = user.getNoTaobao();
    		if(StringUtils.isBlank(notaobao)){
    			continue;
    		}
    		SKTaobao one = selectOne(notaobao);
    		if(one == null){
    			one = new SKTaobao();
    			one.setId(notaobao);
    			insert(one);
    		}
    	}
    	
    	Map<String, Object> parameters = MapUtils.genMap("flag",0);
    	List<SKTaobao> list = selectByWhere(parameters);
    	if(CollectionUtils.isNotEmpty(list)){
    		for(SKTaobao taobao:list){
    			try {
					String html = TaoBaoService.postTaobaoZhangHao(taobao.getId(), sessionId);
					JSONObject json = JSONObject.parseObject(html);
					if(StringUtils.isNotBlank(json.getString("code"))){
						taobao.setFlag(-1);
					}else{
						taobao.setSex(json.getString("sex"));
						int authed = json.getInteger("authed");
						taobao.setShiming(authed == 2 ? "1" : "0");
						taobao.setRegTime(json.getString("reg_time"));
						taobao.setActivePoint(json.getInteger("active_point"));
						taobao.setActiveLevel(json.getInteger("active_level"));
						taobao.setBuyerTotalPoint(json.getInteger("buyer_total_point"));
						taobao.setWeekAvg(json.getString("week_avg"));
						taobao.setSellerGoodRate(json.getInteger("buyer_good_rate"));
						taobao.setVip(json.getInteger("vip"));
						taobao.setFlag(1);
					}
					
				} catch (Exception e) {			
					BusinessExceptionUtil.threwException("sessionid不对.请重新获取");
				}
    			update(taobao);
    		}
    	}

	}
  

}
