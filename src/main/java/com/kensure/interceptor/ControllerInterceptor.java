package com.kensure.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import co.kensure.api.ApiDesc;
import co.kensure.api.ApiUtil;
import co.kensure.exception.BusinessExceptionUtil;

import com.kensure.shike.constant.BusiConstant;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

public class ControllerInterceptor extends HandlerInterceptorAdapter {

	@Resource
	private SKUserService sKUserService;

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
		if (api != null) {
			title = api.getName();
			// 进行权限认证
			String auth = api.getAuth();
			// 有权限认证
			if (!"none".equals(auth)) {
				SKUser user = sKUserService.getUser();
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
		}
		request.setAttribute("wangzhangtitle", title);
		return true;
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