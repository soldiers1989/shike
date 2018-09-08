package com.kensure.shike.constant;

/**
 * 一些路径和信息
 * 
 * @author fankd created on 2018-3-13
 * @since
 */
public class BusiConstant {

	public static final String version = "1.0";
	
	public static final String context = "/shike";

	/**
	 * 商家页面资源路径
	 */
	public static final String shangjiapath = context + "/page/shangjia/ss";
	
	
	public static final String dddd = "footer.jsp";
	/**
	 * 商家页面资源路径
	 */
	public static final String shangjiamanagerpath = context + "/page/shangjia/shangjia";

	// 应用名称
	public static final String name = "米袋网";
	// 公司名称
	public static final String gsname = "米袋网";
	// 公司邮箱
	public static final String gsmail = "fankaidid@163.com";
	// 公司qq
	public static final String gsqq = "64202412";
	// 公司支付宝
	public static final String gsalipay = "13606816944";
	// 公司银行名称
	public static final String gsyhmc = "建设银行";
	// 公司银行账户
	public static final String gsyhzh = "13606816944";
	// 公司银行账户名
	public static final String gsyhzhm = "杭州米袋科技有限公司";
	// 公司银行开户行
	public static final String gsyhkhh = "中国建设银行股份有限公司杭州秋涛支行营业部";

	public static final KVBean shangjia_login = new KVBean(context + "/shangjia/login", "商家登录");
	public static final KVBean shangjia_regist = new KVBean(context + "/shangjia/regist", "商家注册");
	public static final KVBean shangjia_index = new KVBean(context + "/shangjia/index", "商家主页");
	public static final KVBean shangjia_manageradd = new KVBean(context + "/shangjia/manageradd", "商品管理页面");
	public static final KVBean shangjia_chongzhi = new KVBean(context + "/shangjia/chongzhi", "商家充值");
	public static final KVBean shangjia_chongzhilist = new KVBean(context + "/shangjia/chongzhilist", "商家充值列表");
	public static final KVBean shangjia_dianpulist = new KVBean(context + "/shangjia/dianpulist", "商家店铺管理");
	

	public static final KVBean shangjia_regist_do = new KVBean(context + "/user/saveshangjia.do", "商家注册接口");
	public static final KVBean shangjia_checkname_do = new KVBean(context + "/user/checkname.do", "商家名称验证接口");
	public static final KVBean shangjia_checkphone_do = new KVBean(context + "/user/checkphone.do", "商家手机验证接口");
	public static final KVBean shangjia_login_do = new KVBean(context + "/user/login.do", "商家登录接口");
	public static final KVBean shangjia_chongzhi_do = new KVBean(context + "/inout/savein.do", "商家充值接口");
	public static final KVBean shangjia_chongzhilist_do = new KVBean(context + "/inout/chongzhilist.do", "商家充值列表接口");


}
