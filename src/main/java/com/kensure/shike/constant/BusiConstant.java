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
	public static final KVBean shangjia_huodonglist = new KVBean(context + "/shangjia/huodonglist", "商家活动信息查询");
	public static final KVBean shangjia_payinfo = new KVBean(context + "/shangjia/payinfo", "商家支付信息");
	
	

	public static final KVBean shangjia_regist_do = new KVBean(context + "/user/saveshangjia.do", "商家注册接口");
	public static final KVBean shangjia_checkname_do = new KVBean(context + "/user/checkname.do", "商家名称验证接口");
	public static final KVBean userzhyue_do = new KVBean(context + "/user/getzhyue.do", "用户余额接口");
	public static final KVBean shangjia_checkphone_do = new KVBean(context + "/user/checkphone.do", "商家手机验证接口");
	public static final KVBean shangjia_login_do = new KVBean(context + "/user/login.do", "商家登录接口");
	public static final KVBean shangjia_chongzhi_do = new KVBean(context + "/inout/savein.do", "商家充值接口");
	public static final KVBean shangjia_chongzhilist_do = new KVBean(context + "/inout/chongzhilist.do", "商家充值列表接口");
	public static final KVBean shangjia_dianpuadd_do = new KVBean(context + "/dianpu/add.do", "商家店铺新增");
	public static final KVBean shangjia_dianpualist_do = new KVBean(context + "/dianpu/list.do", "商家店铺列表");
	public static final KVBean shangjia_taobaoinfo_do = new KVBean(context + "/baobei/gettaobaoinfo.do", "淘宝图片");
	public static final KVBean shangjia_baobeiadd_do = new KVBean(context + "/baobei/save.do", "活动信息保存");
	public static final KVBean shangjia_baobeilist_do = new KVBean(context + "/baobei/list.do", "活动信息查询");
	public static final KVBean shangjia_payinfo_do = new KVBean(context + "/baobei/payinfo.do", "支付计算");
	public static final KVBean shangjia_pay_do = new KVBean(context + "/baobei/pay.do", "支付运作");
	public static final KVBean shike_baobeilist_do = new KVBean(context + "/baobei/sklist.do", "试客查看宝贝列表");
	
	
	
	
	//后台服务
	public static final KVBean ht_chongzhilist = new KVBean(context + "/gl/chongzhilist", "后台充值列表");	
	public static final KVBean ht_huodonglist = new KVBean(context + "/gl/huodonglist", "后台活动列表");	
	public static final KVBean ht_chongzhitongguo_do = new KVBean(context + "/inout/tongguo.do", "通过充值");
	public static final KVBean ht_baobeitongguo_do = new KVBean(context + "/baobei/tongguo.do", "宝贝通过审核");
	
	//系统级别,获取字典
	public static final KVBean sys_dictlist_do = new KVBean(context + "/sys/dictlist.do", "获取字典");
	
	//试客路径
	public static final String shikemobilepath = context + "/page/mobile";

}
