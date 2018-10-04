/*
 * 文件名称: SKUserInoutServiceImpl.java
 * 版权信息: Copyright 2001-2017 hangzhou jingshu technology Co., LTD. All right reserved.
 * ----------------------------------------------------------------------------------------------
 * 修改历史:
 * ----------------------------------------------------------------------------------------------
 * 修改原因: 新增
 * 修改人员: fankd
 * 修改日期: 2018-9-8
 * 修改内容: 
 */
package com.kensure.shike.chongzhi.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.exception.ParamUtils;
import co.kensure.frame.JSBaseService;
import co.kensure.mem.MapUtils;

import com.kensure.basekey.BaseKeyService;
import com.kensure.shike.chongzhi.dao.SKUserInoutDao;
import com.kensure.shike.chongzhi.model.SKUserInout;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserZhang;
import com.kensure.shike.zhang.service.SKUserZhangService;


/**
 * 用余额充值和提现记录服务实现类
 * @author fankd created on 2018-9-8
 * @since 
 */
@Service
public class SKUserInoutService extends JSBaseService{
	
	@Resource
	private SKUserInoutDao dao;
    
	@Resource
	private SKUserService sKUserService;
	
	@Resource
	private BaseKeyService baseKeyService;
	
	@Resource
	private SKUserZhangService sKUserZhangService;
	
    
    public SKUserInout selectOne(Long id){
    	return dao.selectOne(id);
    }
	
	public List<SKUserInout> selectByIds(Collection<Long> ids){
		return dao.selectByIds(ids);
	}
	
	public List<SKUserInout> selectAll(){
		return dao.selectAll();
	}
	
	public List<SKUserInout> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(SKUserInout obj){
		super.beforeInsert(obj);
		obj.setId(baseKeyService.getKey("sk_user_inout"));
		obj.setStatus(1L);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<SKUserInout> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(SKUserInout obj){
		return dao.update(obj);
	}
    
    public boolean updateByMap(Map<String, Object> params){
		return dao.updateByMap(params);
	}
    
    
	public boolean delete(Long id){
		return dao.delete(id);
	}	
	
    public boolean deleteMulti(Collection<Long> ids){
		return dao.deleteMulti(ids);
	}
    
    public boolean deleteByWhere(Map<String, Object> parameters){
		return dao.deleteByWhere(parameters);
	}
    
    /**
     * 根据用户获取充值记录
     * @return
     */
    public List<SKUserInout> getInoutList(int typeid){
    	SKUser skuser = sKUserService.getUser();
    	SKUserService.checkUser(skuser);
    	Map<String, Object> parameters = MapUtils.genMap("userid",skuser.getId(),"typeid",typeid,"orderby","created_time desc");
    	if(skuser.getType() == 3){
    		parameters.remove("userid");
    	}
    	List<SKUserInout> list = selectByWhere(parameters);
    	return list;
    }
    
    /**
	 * 商家充值保存
	 */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public boolean saveIn(SKUserInout obj){
    	SKUser skuser = sKUserService.getUser();
    	SKUserService.checkUser(skuser);
    	obj.setUserid(skuser.getId());
    	obj.setTypeid(1L);
    	
    	//进行校验
    	ParamUtils.isErrorThrewException(obj.getJine()>=100,"金额必须大于等于100");
    	if(obj.getFangshi() == 1L){
    		//支付宝 充值
    		ParamUtils.isBlankThrewException(obj.getJiaoyihao(),"交易号不能为空"); 		
    	}else if(obj.getFangshi() == 2L){
    		//银行卡 充值
    		ParamUtils.isBlankThrewException(obj.getJiaoyihao(),"打款方账户名不能为空"); 	
    	}else{
    		BusinessExceptionUtil.threwException("参数错误");
    	}
    	insert(obj);
		return true;
	}
    
    /**
   	 * 用户或者商家进行余额提现
   	 */
       @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
       public boolean saveOut(SKUserInout obj){
       	SKUser skuser = sKUserService.getUser();
       	SKUserService.checkUser(skuser);
       	obj.setUserid(skuser.getId());
       	obj.setTypeid(2L);
       	obj.setJiaoyihao(skuser.getNoAlipay());
       	obj.setFangshi(1L);
       	
       	//进行校验
       	ParamUtils.isErrorThrewException(obj.getJine()>=10,"金额必须大于等于10");
    	ParamUtils.isBlankThrewException(obj.getJiaoyihao(),"支付宝不能为空");
       	insert(obj);
      //增加流水
    	SKUserZhang zhang = new SKUserZhang();
    	zhang.setUserid(obj.getUserid());
    	zhang.setBusiid(obj.getId());
    	zhang.setBusitypeid(2L);
    	zhang.setYue(obj.getJine());
    	sKUserZhangService.add(zhang);  
   		return true;
   	}
    
      /**
   	 * 后台通过提现
   	 */
       @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
       public boolean tongguoOut(Long id){
       	SKUser skuser = sKUserService.getUser();
       	SKUserService.checkUserAdmin(skuser);
       	
       	SKUserInout obj = selectOne(id);
       	if(obj.getStatus() != 1){
       		BusinessExceptionUtil.threwException("重复提交");
       	}
       	obj.setStatus(9L);
       	update(obj);
       	sKUserZhangService.commit(obj.getUserid(), 2L, obj.getId());
       	return true;
   	}
    
    
    /**
	 * 后台通过充值，增加余额
	 */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public boolean tongguo(Long id){
    	SKUser skuser = sKUserService.getUser();
    	SKUserService.checkUserAdmin(skuser);
    	
    	SKUserInout obj = selectOne(id);
    	if(obj.getStatus() != 1){
    		BusinessExceptionUtil.threwException("重复提交");
    	}
    	
    	obj.setStatus(9L);
    	update(obj);
    	//增加流水
    	SKUserZhang zhang = new SKUserZhang();
    	zhang.setUserid(obj.getUserid());
    	zhang.setBusiid(id);
    	zhang.setBusitypeid(1L);
    	zhang.setYue(obj.getJine());
    	sKUserZhangService.add(zhang);  
    	return true;
	}

}
