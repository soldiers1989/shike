package com.kensure.shike.constant;


/**
 * 一些路径和信息
 * @author fankd created on 2018-3-13
 * @since
 */
public class BusiConstant {
	
	public static final String context = "/shike";

	/**
	 * 商家页面资源路径
	 */
	public static final String shangjiapath = context+"/page/shangjia/ss";
	
	
	/**
	 * 应用名称
	 */
	public static final String name = "米袋网";
	
	
	
	
	
	/**
	 * 商家登录
	 */
	public static final KVBean shangjia_login = new KVBean(context+"/shangjia/login","商家登录");
	/**
	 * 商家注册
	 */
	public static final KVBean shangjia_regist = new KVBean(context+"/shangjia/regist","免费注册");

}
