package com.kensure.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kensure.frame.ResultInfo;

import com.kensure.mycom.config.service.MyConfigService;

/**
 * 系统管理部分接口
 * 
 */
@Controller
@RequestMapping(value = "sysmanager")
public class SysManagerController {

	@Resource
	private MyConfigService myConfigService;

	

	/**
	 * 重置配置缓存
	 */
	@ResponseBody
	@RequestMapping(value = "initsysconfig.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo initsysconfig(HttpServletRequest req, HttpServletResponse rep) {
		myConfigService.initCache();
		return new ResultInfo();
	}

}
