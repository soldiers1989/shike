package com.kensure.shike.weixin.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import co.kensure.frame.JSBaseService;
import co.kensure.http.HttpUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.mycom.config.service.MyConfigService;
import com.kensure.shike.weixin.dao.WeixinOpenidDao;
import com.kensure.shike.weixin.model.WeixinOpenid;


/**
 * 微信openid关联表服务实现类
 * @author fankd created on 2019-2-20
 * @since 
 */
@Service
public class WeixinOpenidService extends JSBaseService{
	
	@Resource
	private WeixinOpenidDao dao;
    
    
    public WeixinOpenid selectOne(String id){
    	return dao.selectOne(id);
    }
	
	public List<WeixinOpenid> selectByIds(Collection<String> ids){
		return dao.selectByIds(ids);
	}
	
	public List<WeixinOpenid> selectAll(){
		return dao.selectAll();
	}
	
	public List<WeixinOpenid> selectByWhere(Map<String, Object> parameters){
		return dao.selectByWhere(parameters);
	}
	
	
	public long selectCount(){
		return dao.selectCount();
	}
	
	public long selectCountByWhere(Map<String, Object> parameters){
		return dao.selectCountByWhere(parameters);
	}
	
	
	public boolean insert(WeixinOpenid obj){
		super.beforeInsert(obj);
		return dao.insert(obj);
	}
	
	public boolean insertInBatch(List<WeixinOpenid> objs){
		return dao.insertInBatch(objs);
	}
	
	
	public boolean update(WeixinOpenid obj){
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
    
    public static String getCodeUrl(){
    	String weixin_appid = MyConfigService.getMyConfig("weixin_appid").getVal();
    	String  codeUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+weixin_appid+"&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
    	return codeUrl;
    }
    
    
    /**
     * 根据code获取openid
     * @param code
     * @return
     */
    private String getOpenId(String code){
    	String weixin_appid = MyConfigService.getMyConfig("weixin_appid").getVal();
    	String weixin_appsecret = MyConfigService.getMyConfig("weixin_appsecret").getVal();
    	String url = "https://api.weixin.qq.com/sns/access_token?appid=" + weixin_appid + "&secret=" + weixin_appsecret + "&code=" + code + "&grant_type=authorization_code";
    	String content = HttpUtils.getBody(url);
    	JSONObject weixin = JSONObject.parseObject(content, JSONObject.class);
    	String openid = weixin.getString("openid");
    	return openid;
    }
    
    /**
     * 根据code获取WeixinOpenid
     * @param code
     * @return
     */
    public WeixinOpenid getOpenByCode(String code){
    	String openid = getOpenId(code);
    	WeixinOpenid open = selectOne(openid);
    	return open;
    }
    
    /**
     * 根据code获取WeixinOpenid
     * @param code
     * @return
     */
    public void saveOpen(String openid,String sessionid){
    	WeixinOpenid open = selectOne(openid);
    	if(open == null){
    		open = new WeixinOpenid();
    		open.setId(openid);
    		open.setSessionid(sessionid);
    		insert(open);
    	}else{
    		open.setSessionid(sessionid);
    		update(open);
    	}
    }
    
}
