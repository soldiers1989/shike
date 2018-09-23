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
	public static final String name = "试呗网";
	// 公司名称
	public static final String gsname = "广西南宁试呗网络科技有限公司";
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
	public static final String gsyhzhm = "广西南宁试呗网络科技有限公司";
	// 公司银行开户行
	public static final String gsyhkhh = "中国建设银行股份有限公司杭州秋涛支行营业部";
	public static final KVBean shangjia_about = new KVBean(context + "/shangjia/about", "关于我们");
	public static final KVBean shangjia_userdefine = new KVBean(context + "/shangjia/userdefine", "用户协议");

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
	public static final KVBean shangjia_chongzhi_do = new KVBean(context + "/inout/savein.do", "充值接口");
	public static final KVBean ht_chongzhitongguo_do = new KVBean(context + "/inout/tongguo.do", "通过充值");
	
	public static final KVBean sk_saveout_do = new KVBean(context + "/inout/saveout.do", "提现接口");
	public static final KVBean ht_tongguoout_do = new KVBean(context + "/inout/tongguoout.do", "通过充值");
	
	
	public static final KVBean shangjia_zhanglist_do = new KVBean(context + "/inout/zhanglist.do", "账号明细列表接口");
	public static final KVBean shangjia_chongzhilist_do = new KVBean(context + "/inout/chongzhilist.do", "商家充值列表接口");
	public static final KVBean shangjia_tixianlist_do = new KVBean(context + "/inout/tixianlist.do", "商家提现列表接口");
	
	public static final KVBean shangjia_dianpuadd_do = new KVBean(context + "/dianpu/add.do", "商家店铺新增");
	public static final KVBean shangjia_dianpualist_do = new KVBean(context + "/dianpu/list.do", "商家店铺列表");
	public static final KVBean shangjia_taobaoinfo_do = new KVBean(context + "/baobei/gettaobaoinfo.do", "淘宝图片");
	public static final KVBean shangjia_baobeiadd_do = new KVBean(context + "/baobei/save.do", "活动信息保存");
	public static final KVBean shangjia_baobeilist_do = new KVBean(context + "/baobei/list.do", "活动信息查询");
	public static final KVBean shangjia_payinfo_do = new KVBean(context + "/baobei/payinfo.do", "支付计算");
	public static final KVBean shangjia_pay_do = new KVBean(context + "/baobei/pay.do", "支付运作");
	public static final KVBean shike_baobeilist_do = new KVBean(context + "/baobei/sklist.do", "试客查看宝贝列表");
	public static final KVBean shike_wdhd_do = new KVBean(context + "/baobei/skwdhd.do", "试客查看我的活动列表");
	
	
	
	
	//后台服务
	public static final KVBean ht_chongzhilist = new KVBean(context + "/gl/chongzhilist", "后台充值列表");	
	public static final KVBean ht_huodonglist = new KVBean(context + "/gl/huodonglist", "后台活动列表");	
	public static final KVBean ht_sjlist = new KVBean(context + "/gl/sjlist", "商家列表");
	public static final KVBean ht_dplist = new KVBean(context + "/gl/dplist", "店铺列表");
	public static final KVBean ht_sklist = new KVBean(context + "/gl/sklist", "试客列表");
	public static final KVBean ht_tixianlist = new KVBean(context + "/gl/tixianlist", "后台活动列表");	
	

	public static final KVBean ht_baobeitongguo_do = new KVBean(context + "/baobei/tongguo.do", "宝贝通过审核");
	public static final KVBean user_getuser_do = new KVBean(context + "/user/getuser.do", "用户会话信息");
	
	
	//系统级别,获取字典
	public static final KVBean sys_dictlist_do = new KVBean(context + "/sys/dictlist.do", "获取字典");
	public static final KVBean user_sms_do = new KVBean(context + "/user/sms.do", "发送验证码");
	
	//试客路径
	public static final String shikemobilepath = context + "/page/mobile";
	
	public static final KVBean shike_detail = new KVBean(context + "/skm/detail", "宝贝详情");
	public static final KVBean shike_index = new KVBean(context + "/skm/index", "首页");
	public static final KVBean shike_haohuo = new KVBean(context + "/skm/haohuo", "好货页面");
	public static final KVBean shike_wdhd = new KVBean(context + "/skm/wdhd", "我的活动页面");
	public static final KVBean shike_mine = new KVBean(context + "/skm/mine", "我的");
	public static final KVBean shike_tixian = new KVBean(context + "/skm/tixian", "提现页面");
	public static final KVBean shike_mingxi = new KVBean(context + "/skm/mingxi", "明细页面");
	public static final KVBean shike_jjdz = new KVBean(context + "/skm/jjdz", "即将到账页面");
	
	public static final KVBean shike_login = new KVBean(context + "/skm/login", "登陆页面");
	public static final KVBean shike_regist = new KVBean(context + "/skm/regist", "注册页面");
	public static final KVBean shike_gouwuche = new KVBean(context + "/skm/gouwuche", "购物车页面");
	public static final KVBean shike_scgz = new KVBean(context + "/skm/scgz", "收藏关注页面");
	public static final KVBean shike_ddan = new KVBean(context + "/skm/ddan", "订单页面");
	public static final KVBean shike_haop = new KVBean(context + "/skm/haop", "好评页面");
	
	public static final KVBean shike_addsk_do = new KVBean(context + "/user/addsk.do", "试客注册并登陆");
	public static final KVBean shike_userlist_do = new KVBean(context + "/user/userlist.do", "用户列表");
	
	
	public static final KVBean shike_shenqing_do = new KVBean(context + "/baobei/shenqing.do", "立即申请操作");
	public static final KVBean shike_liucheng_do = new KVBean(context + "/baobei/liucheng.do", "后续流程性操作");
	public static final KVBean shike_addfile_do = new KVBean(context + "/baobei/addfile.do", "图片上传操作");
	
	

}
