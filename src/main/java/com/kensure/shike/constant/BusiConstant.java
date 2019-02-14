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
	public static final String shangjiacss = context + "/page/shangjia/css";
	/**
	 * 商家页面资源路径
	 */
	public static final String shangjiamanagerpath = context + "/page/shangjia/shangjia";

	// 应用名称
	public static final String name = "试呗网";
	// 公司名称
	public static final String gsname = "广西南宁试呗网络科技有限公司";
	// 公司qq
	public static final String gsqq = "64202412";
	// 公司支付宝
	public static final String gsalipay = "www.52shibei.com";
	// 公司银行名称
	public static final String gsyhmc = "建设银行";
	// 公司银行账户
	public static final String gsyhzh = "13606816944";
	// 公司银行账户名
	public static final String gsyhzhm = "广西南宁试呗网络科技有限公司";
	// 公司银行开户行
	public static final String gsyhkhh = "中国建设银行股份有限公司杭州秋涛支行营业部";

	// 网页上的keywords
	public static final String keywords = "试呗网";
	// 网页上的description
	public static final String description = "试呗网";

	// 七牛云外链默认域名
	public static final String qiniu_context = "http://img.91midai.com/";

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
	
	public static final KVBean shangjia_shikelist = new KVBean(context + "/shangjia/shikelist", "试用情况");
	public static final KVBean shangjia_activity_edit = new KVBean(context + "/shangjia/actedit", "活动编辑");
	public static final KVBean shangjia_zhanglist = new KVBean(context + "/shangjia/zhanglist", "商家账户明细");
	public static final KVBean shangjia_tixian = new KVBean(context + "/shangjia/tixian", "商家账户提现");
	public static final KVBean shangjia_gaimi = new KVBean(context + "/shangjia/gaimi", "改密功能");
	
	public static final KVBean shangjia_cms = new KVBean(context + "/gl/cms", "消息中心");
	public static final KVBean shangjia_cmsedit = new KVBean(context + "/gl/cmsedit", "编辑消息");
	
	
	
	public static final KVBean sys_getcms_do = new KVBean(context + "/sys/getcms.do", "消息内容");
	public static final KVBean sys_cmslist_do = new KVBean(context + "/sys/cmslist.do", "消息列表");

	public static final KVBean shangjia_regist_do = new KVBean(context + "/user/saveshangjia.do", "商家注册接口");
	public static final KVBean shangjia_checkname_do = new KVBean(context + "/user/checkname.do", "商家名称验证接口");
	public static final KVBean userzhyue_do = new KVBean(context + "/user/getzhyue.do", "用户余额接口");
	public static final KVBean shangjia_checkphone_do = new KVBean(context + "/user/checkphone.do", "商家手机验证接口");
	public static final KVBean shangjia_login_do = new KVBean(context + "/user/login.do", "商家登录接口");
	public static final KVBean shangjia_chongzhi_do = new KVBean(context + "/inout/savein.do", "充值接口");
	public static final KVBean ht_chongzhitongguo_do = new KVBean(context + "/inout/tongguo.do", "通过充值");
	
	public static final KVBean sk_saveout_do = new KVBean(context + "/inout/saveout.do", "提现接口");
	public static final KVBean sk_saveoutser_do = new KVBean(context + "/inout/saveoutser.do", "提现接口,需要支付密码");
	
	public static final KVBean ht_tongguoout_do = new KVBean(context + "/inout/tongguoout.do", "通过充值");
	

	public static final KVBean shangjia_zhanglist_do = new KVBean(context + "/inout/zhanglist.do", "账号明细列表接口");
	public static final KVBean shangjia_chongzhilist_do = new KVBean(context + "/inout/chongzhilist.do", "商家充值列表接口");
	public static final KVBean shangjia_tixianlist_do = new KVBean(context + "/inout/tixianlist.do", "商家提现列表接口");
	
	public static final KVBean shangjia_dianpuadd_do = new KVBean(context + "/dianpu/add.do", "商家店铺新增");
	public static final KVBean shangjia_dianpualist_do = new KVBean(context + "/dianpu/list.do", "商家店铺列表");
	public static final KVBean shangjia_taobaoinfo_do = new KVBean(context + "/baobei/gettaobaoinfo.do", "淘宝图片");
	public static final KVBean shangjia_baobeiadd_do = new KVBean(context + "/baobei/save.do", "活动信息保存");
	public static final KVBean shangjia_baobei_detail_do = new KVBean(context + "/baobei/detail.do", "活动信息详情");
	public static final KVBean shangjia_baobei_full_do = new KVBean(context + "/baobei/baobeiFull.do", "活动信息完整详情");
	public static final KVBean shangjia_baobeilist_do = new KVBean(context + "/baobei/list.do", "活动信息查询");
	public static final KVBean shangjia_payinfo_do = new KVBean(context + "/baobei/payinfo.do", "支付计算");
	public static final KVBean shangjia_pay_do = new KVBean(context + "/baobei/pay.do", "支付运作");
	public static final KVBean shike_baobeilist_do = new KVBean(context + "/baobei/sklist.do", "试客查看宝贝列表");
	public static final KVBean shike_wdhd_do = new KVBean(context + "/baobei/skwdhd.do", "试客查看我的活动列表");
	public static final KVBean shike_skqklist_do = new KVBean(context + "/baobei/skqklist.do", "商家查看宝贝下的活动列表");
	public static final KVBean shike_tklcheck_do = new KVBean(context + "/baobei/tklcheck.do", "淘口令校验");
	public static final KVBean shike_dpnamecheck_do = new KVBean(context + "/baobei/dpnamecheck.do", "店铺名称校验");
	public static final KVBean shike_fankuan_do = new KVBean(context + "/baobei/fankuan.do", "返款接口");	
	public static final KVBean shike_statustj_do = new KVBean(context + "/baobei/statustj.do", "统计状态");


	public static final KVBean shike_deletesq_do = new KVBean(context + "/baobei/deletesq.do", "删除申请");


	public static final KVBean shike_qiaodao_do = new KVBean(context + "/jinbi/qiandao.do", "试客签到接口");
	public static final KVBean shike_jinbilist_do = new KVBean(context + "/jinbi/jinbilist.do", "金币列表明细");


	//后台服务
	public static final KVBean ht_chongzhilist = new KVBean(context + "/gl/chongzhilist", "后台充值列表");	
	public static final KVBean ht_huodonglist = new KVBean(context + "/gl/huodonglist", "后台活动列表");	
	public static final KVBean ht_sjlist = new KVBean(context + "/gl/sjlist", "商家列表");
	public static final KVBean ht_dplist = new KVBean(context + "/gl/dplist", "店铺列表");
	public static final KVBean ht_sklist = new KVBean(context + "/gl/sklist", "试客列表");
	public static final KVBean ht_tixianlist = new KVBean(context + "/gl/tixianlist", "后台活动列表");	
	

	public static final KVBean ht_baobeitongguo_do = new KVBean(context + "/baobei/tongguo.do", "宝贝通过审核");
	public static final KVBean ht_baobeiuntongguo_do = new KVBean(context + "/baobei/untongguo.do", "宝贝通过审核");
	
	public static final KVBean ht_baobeixiaxiando = new KVBean(context + "/baobei/xiaxian.do", "宝贝下线");
	public static final KVBean user_getuser_do = new KVBean(context + "/user/getuser.do", "用户会话信息");
	
	
	//系统级别,获取字典
	public static final KVBean sys_dictlist_do = new KVBean(context + "/sys/dictlist.do", "获取字典");
	public static final KVBean sys_savecms_do = new KVBean(context + "/sys/savecms.do", "保存消息");
	public static final KVBean user_sms_do = new KVBean(context + "/user/sms.do", "发送验证码");
	
	//试客路径
	public static final String shikemobilepath = context + "/page/mobile";
	public static final String shikewebepath = context + "/page/web";

	public static final KVBean shike_index = new KVBean(context + "/skm/index", "首页");
	public static final KVBean shike_zjmj = new KVBean(context + "/skm/zjmj", "中奖秘笈页面");
	public static final KVBean shike_zqmj = new KVBean(context + "/skm/zqmj", "赚钱秘笈页面");
	public static final KVBean shike_cms_page = new KVBean(context + "/skm/cms/", "CMS内容页面");
	public static final KVBean shike_jbcj = new KVBean(context + "/skm/jbcj/", "金币抽奖页面");

	public static final KVBean shike_detail = new KVBean(context + "/skm/detail", "宝贝详情");
	public static final KVBean shike_haohuo = new KVBean(context + "/skm/haohuo", "好货页面");
	public static final KVBean shike_wdhd = new KVBean(context + "/skm/wdhd", "我的活动页面");
	public static final KVBean shike_ddxq = new KVBean(context + "/skm/ddxq", "订单详情页面");

	public static final KVBean shike_mine = new KVBean(context + "/skm/mine", "我的");
	public static final KVBean shike_yue = new KVBean(context + "/skm/yue", "余额页面");
	public static final KVBean shike_tixian = new KVBean(context + "/skm/tixian", "提现页面");
	public static final KVBean shike_mingxi = new KVBean(context + "/skm/mingxi", "明细页面");
	public static final KVBean shike_jjdz = new KVBean(context + "/skm/jjdz", "即将到账页面");

	public static final KVBean shike_login = new KVBean(context + "/skm/login", "登陆页面");
	public static final KVBean shike_regist = new KVBean(context + "/skm/regist", "注册页面");
	public static final KVBean shike_wjpwd = new KVBean(context + "/skm/wjpwd", "忘记密码页面");
	public static final KVBean shike_private = new KVBean(context + "/skm/private", "隐私页面");
	public static final KVBean shike_dyren = new KVBean(context + "/skm/dyren", "代言人页面");
	public static final KVBean shike_help_page = new KVBean(context + "/skm/help", "帮助中心页面");
	public static final KVBean shike_yijian = new KVBean(context + "/skm/yijian", "意见反馈页面");

	public static final KVBean shike_fensi = new KVBean(context + "/skm/fensi", "我的粉丝页面");

	public static final KVBean shike_jinbi = new KVBean(context + "/skm/jinbi", "金币页面");
	public static final KVBean shike_jinbimx = new KVBean(context + "/skm/jinbimx", "金币明细页面");
	public static final KVBean shike_xgscgz = new KVBean(context + "/skm/xgscgz", "修改收藏关注页面");
	public static final KVBean shike_xgdd = new KVBean(context + "/skm/xgdd", "修改订单页面");
	public static final KVBean shike_xghp = new KVBean(context + "/skm/xghp", "修改好评页面");

    public static final KVBean shike_zhanghu = new KVBean(context + "/skm/zhanghu", "账户安全页面");
    public static final KVBean shike_modifyphone = new KVBean(context + "/skm/modifyphone", "修改手机号码页面");
    public static final KVBean shike_modifyalipay = new KVBean(context + "/skm/modifyalipay", "修改支付宝账户页面");
    public static final KVBean shike_modifytaobao = new KVBean(context + "/skm/modifytaobao", "修改淘宝账号页面");
    public static final KVBean shike_modifyqq = new KVBean(context + "/skm/modifyqq", "修改qq账号页面");
    public static final KVBean shike_modifyloginpwd = new KVBean(context + "/skm/modifyloginpwd", "修改登录密码页面");

    public static final KVBean shike_gouwuche = new KVBean(context + "/skm/gouwuche", "购物车页面");
    public static final KVBean shike_scgz = new KVBean(context + "/skm/gouwuche", "收藏关注页面");
    public static final KVBean shike_ddan = new KVBean(context + "/skm/gouwuche", "订单页面");
    public static final KVBean shike_haop = new KVBean(context + "/skm/haop", "好评页面");

    public static final KVBean shike_addsk_do = new KVBean(context + "/user/addsk.do", "试客注册并登陆");
    public static final KVBean shike_userlist_do = new KVBean(context + "/user/userlist.do", "用户列表");

    public static final KVBean shike_fensilist_do = new KVBean(context + "/user/fensilist.do", "我的粉丝列表");
    public static final KVBean shike_fanslslist_do = new KVBean(context + "/fans/fanslslist.do", "我的粉丝流水列表");

    public static final KVBean shike_yijian_do = new KVBean(context + "/yijian/add.do", "添加意见反馈");

    public static final KVBean shike_shenqing_do = new KVBean(context + "/baobei/shenqing.do", "立即申请操作");
    public static final KVBean shike_liucheng_do = new KVBean(context + "/baobei/liucheng.do", "后续流程性操作");
    public static final KVBean shike_addfile_do = new KVBean(context + "/baobei/addfile.do", "图片上传操作");

    public static final KVBean shike_user_update_do = new KVBean(context + "/user/update.do", "用户安全管理更新操作");

    public static final KVBean shike_help = new KVBean(context + "/help", "帮助中心");
    public static final KVBean shike_cms = new KVBean(context + "/help/cms", "内容页面");
    
    public static final KVBean shike_baobei_sqs_do = new KVBean(context + "/baobei/sqs.do", "增加申请数");

    public static final KVBean shike_baobei_updatescgz_do = new KVBean(context + "/jysj/updatescgz.do", "更新修改关注信息");
    public static final KVBean shike_baobei_updatedd_do = new KVBean(context + "/jysj/updatedd.do", "更新订单信息");
    public static final KVBean shike_baobei_updatehp_do = new KVBean(context + "/jysj/updatehp.do", "更新好评信息");


    public static final KVBean shike_user_audit_do = new KVBean(context + "/user/audit.do", "用户账号审核");
    public static final KVBean shike_update_source_do = new KVBean(context + "/user/updateSource.do", "修改商家来源");
    public static final KVBean shike_update_taoqizhi_do = new KVBean(context + "/user/updateTaoqizhi.do", "修改试客淘宝淘气值");


	public static final KVBean shike_web_haohuo = new KVBean(context + "/skw/haohuo", "好货列表页面");
	public static final KVBean shike_web_haohuo_detail = new KVBean(context + "/skw/detail", "好货详情页面");
	public static final KVBean shike_web_haohuo_detailpic = new KVBean(context + "/skw/detailpic", "好货详情图页面");
}
