package com.kensure.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kensure.shike.constant.BusiConstant;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;

import co.kensure.api.ApiDesc;
import co.kensure.api.ApiUtil;

public class ControllerInterceptor extends HandlerInterceptorAdapter {
	
	@Resource
	private SKUserService sKUserService;
	
	// 请求之前
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//返回一个action
		String serverPath =request.getServletPath();
		ApiDesc api = ApiUtil.get(serverPath);
		String title = BusiConstant.name;
		if(api != null){
			title = api.getName();	
			//进行权限认证
			 String auth = api.getAuth();
			 //有权限认证
			if(!"none".equals(auth)){
//				SKUser user = sKUserService.getUser();
//				if(user == null){
//					
//				}
			}
			
		}
		request.setAttribute("wangzhangtitle", title);	
		return true;
	}

}