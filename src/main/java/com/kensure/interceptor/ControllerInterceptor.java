package com.kensure.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import co.kensure.api.ApiDesc;
import co.kensure.api.ApiUtil;
import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.http.RequestUtils;

import com.kensure.shike.constant.BusiConstant;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.model.SKUserSession;
import com.kensure.shike.user.service.SKLoginService;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.weixin.service.WeixinOpenidService;

public class ControllerInterceptor extends HandlerInterceptorAdapter {

	@Resource
	private SKUserService sKUserService;
	
	@Resource
	private SKLoginService sKLoginService;

	private static Map<Integer,String> authmap = new HashMap<>();
	private static Map<String,String> loginmap = new HashMap<>();
	static{
		authmap.put(1, "user");
		authmap.put(2, "saler");
		authmap.put(3, "admin");
		
		loginmap.put("skm", "/skm/login");
		loginmap.put("shangjia", "/shangjia/login");
		loginmap.put("gl", "/gl/login");
	}
	
	// 请求之前
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 返回一个action
		String serverPath = request.getServletPath();
		ApiDesc api = ApiUtil.get(serverPath);
		String title = BusiConstant.name;
		
		SKUser user = null;
		if(!serverPath.endsWith(".do")){
			user = sKUserService.getUser();
			request.setAttribute("curentuser", user);
		}
		
		if (api != null) {
			//微信公众号重定向
			if("1".equals(api.getWxgzh())){
				boolean temp = weixintiaozhuan(request, response, BusiConstant.getFullUrl(serverPath));
				if(!temp){
					return temp;
				}
			}
			
			title = api.getName();
			if(user == null){
				user = sKUserService.getUser();
			}
			// 进行权限认证
			String auth = api.getAuth();
			// 有权限认证
			if (!"none".equals(auth)) {			
				//拥有权限
				boolean hasauth = true;
				if(user == null){
					hasauth = false;
				}else if(!"all".equals(auth)){
					int type = user.getType();
					String typestr = authmap.get(type);
					if(auth.indexOf(typestr) == -1){
						hasauth = false;
					}
				}	
				if(!hasauth){
					if(serverPath.endsWith(".do")){
						BusinessExceptionUtil.threwException("请登录");
					}else{
						response.sendRedirect(jiexi(serverPath));
						return false;
					}
				}	
			}
			//put的数据，进行重复性认证
			if("put".equals(api.getType())){
				if(user != null){
					long userid = user.getId();
					KeyLock.doLock(userid+"");
				}
			}			
		}
		request.setAttribute("wangzhangtitle", title);
		return true;
	}
	
	
	/**
	 * 微信跳转,必须返回，返回null，表示跳转了，返回有值，就继续
	 */
	private boolean weixintiaozhuan(HttpServletRequest req, HttpServletResponse rep, String rurl) {	
		String code = req.getParameter("code");
		// 微信浏览器，进行微信校验
		if (RequestUtils.isWechat(req) && StringUtils.isBlank(code)) {
			// 如果为空，进行跳转判断
			String mdtokenid = SKLoginService.getTokenIdByCookie(req);
			String mdopenid = SKLoginService.getOpenIdByCookie(req);
			// 令牌和openid为空，需要跳转，进行识别
			if (StringUtils.isBlank(mdtokenid) && StringUtils.isBlank(mdopenid)) {
				String url = WeixinOpenidService.getCodeUrl(rurl);
				try {
					rep.sendRedirect(url);
					return false;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		if (StringUtils.isNotBlank(code)) {
			String openId = WeixinOpenidService.getOpenId(code);
			if(StringUtils.isNotBlank(openId)){
				SKLoginService.setOpenIdByCookie(openId, rep);
				String loginout = SKLoginService.getLoginOutByCookie(req);	
				//进行登录
				System.out.println("loginout=="+loginout);
				if(!"1".equals(loginout)){
					SKUserSession session = sKLoginService.doLoginByOpenid(openId);
					req.setAttribute("curentsession", session);
				}	
			}
		}
		return true;
	}
	
	
	@Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
     
    }
 
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    	KeyLock.unlock();
    }


	
	private String jiexi(String url){
		String loginUrl = loginmap.get("skm");
		if(url.contains("/skm/")){
			
		}else if(url.contains("/shangjia/")){
			
		}else if(url.contains("/gl/")){
			
		}	
		return ApiUtil.getUrl(loginUrl);
	}

}