package com.kensure.controller;

import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import com.qiniu.util.Auth;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 七牛云
 * 
 * @author li.kai
 *
 */
@Controller
@RequestMapping(value = "qiniu")
public class SkQiniuController {

	private String accessKey = "19aQdu9aO5mtERdtAo4kQyUsYB6KOPVdE8ukMaBh";
	private String secretKey = "NM0gE2uPl0syJnJ7-JPuSVyXryq03YNY_ujvHQd4";
	private String bucket = "shike2";


	/**
	 * 获取上传使用的token
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "token.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo smsuser(HttpServletRequest req, HttpServletResponse rep) {

		Long start = System.currentTimeMillis();
		Auth auth = Auth.create(accessKey, secretKey);
		String uploadToken = auth.uploadToken(bucket, null);

		System.out.println(System.currentTimeMillis() - start);
		return new ResultRowInfo(uploadToken);
	}
	

}
