package com.kensure.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kensure.frame.Const;
import co.kensure.http.RequestUtils;
import co.kensure.mem.NumberUtils;
import co.kensure.mem.QRUtils;
import co.kensure.mem.StringKSUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKBaobeiTP;
import com.kensure.shike.baobei.model.SKJindian;
import com.kensure.shike.baobei.model.SKJysj;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKBaobeiTPService;
import com.kensure.shike.baobei.service.SKJindianService;
import com.kensure.shike.baobei.service.SKJysjService;
import com.kensure.shike.baobei.service.SKSkqkService;
import com.kensure.shike.baobei.service.SKWordService;
import com.kensure.shike.dianpu.model.SKDianPu;
import com.kensure.shike.dianpu.service.SKDianPuService;
import com.kensure.shike.sys.model.SKCMS;
import com.kensure.shike.sys.service.SKCMSService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.weixin.service.WeixinOpenidService;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.model.SkUserJinbi;
import com.kensure.shike.zhang.service.SKUserYueService;
import com.kensure.shike.zhang.service.SkUserFansService;
import com.kensure.shike.zhang.service.SkUserJinbiService;

/**
 * 试客手机端页面
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "skm")
public class ShikeMobileController {

	@Resource
	private SKBaobeiService sKBaobeiService;
	@Resource
	private SKJindianService sKJindianService;
	@Resource
	private SKWordService sKWordService;
	@Resource
	private SKSkqkService sKSkqkService;
	@Resource
	private SKUserService sKUserService;
	@Resource
	private SKUserYueService skUserYueService;
	@Resource
	private SkUserJinbiService skUserJinbiService;
	@Resource
	private SkUserFansService skUserFansService;
	@Resource
	private SKDianPuService skDianPuService;
	@Resource
	private SKCMSService sKCMSService;
	@Resource
	private SKJysjService skJysjService;
	@Resource
	private SKBaobeiTPService sKBaobeiTPService;
	@Resource
	private WeixinOpenidService weixinOpenidService;

	// 首页
	@RequestMapping("index")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
		// 首页轮播
		List<SKCMS> banner = sKCMSService.selectByTypeId(6);
		req.setAttribute("banner", banner);
		return "page/mobile/index/index.jsp";
	}

	// CMS内容页面
	@RequestMapping("/cms/{id}")
	public String cms(@PathVariable String id, HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKCMS cms = sKCMSService.get(NumberUtils.parseLong(id, 0L));
		req.setAttribute("cms", cms);
		return "page/mobile/index/cms.jsp";
	}

	// 好货页面
	@RequestMapping("haohuo")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/haohuonew/haohuo.jsp";
	}

	// 详情页面
	@RequestMapping("detail")
	public String detail(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		return "page/mobile/detail/detail.jsp";
	}

	// 登陆页面
	@RequestMapping("login")
	public String login(HttpServletRequest req, HttpServletResponse rep, Model model) {
		// type=1时，代表回到页面， 否则直接后退
		String backToIndex = req.getParameter("type");
		req.setAttribute("type", backToIndex);
		// 微信认证
		String c = weixintiaozhuan(req, rep, "http://www.52shibei.com/shike/skm/login");
		if (c == null) {
			return null;
		}
		return "page/mobile/mine/login.jsp";
	}

	// 登陆页面
	@RequestMapping("login2")
	public String login2(HttpServletRequest req, HttpServletResponse rep, Model model) {
		// 微信认证
		String c = weixintiaozhuan(req, rep, "http://www.52shibei.com/shike/skm/login2");
		if (c == null) {
			return null;
		}

		return "page/mobile/mine/login2.jsp";
	}

	/**
	 * 微信跳转,必须返回，返回null，表示跳转了，返回有值，就继续
	 */
	private String weixintiaozhuan(HttpServletRequest req, HttpServletResponse rep, String rurl) {
		String c = "cc";
		String code = req.getParameter("code");
		// 微信浏览器，进行微信校验
		if (RequestUtils.isWechat(req) && StringUtils.isBlank(code)) {
			// 如果为空，进行跳转判断
			String mdtokenid = RequestUtils.getCookieByName(req, "mdtokenid");
			String mdopenid = RequestUtils.getCookieByName(req, "mdopenid");
			// 令牌和openid为空，需要跳转，进行识别
			if (StringUtils.isBlank(mdtokenid) && StringUtils.isBlank(mdopenid)) {
				String url = WeixinOpenidService.getCodeUrl(rurl);
				try {
					rep.sendRedirect(url);
					return null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (StringUtils.isNotBlank(code)) {
			String openId = weixinOpenidService.getOpenId(code);
			req.setAttribute("openId", openId);
		}
		return c;
	}

	// 注册
	@RequestMapping("regist")
	public String regist(HttpServletRequest req, HttpServletResponse rep, Model model) {
		RequestUtils.paramToAttr(req);
		return "page/mobile/mine/regist.jsp";
	}

	// 忘记密码页面
	@RequestMapping("wjpwd")
	public String wjpwd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/mine/wjpwd.jsp";
	}

	// 隐私页面
	@RequestMapping("private")
	public String privatePage(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/mine/private.jsp";
	}

	// 代言人页面
	@RequestMapping("dyren")
	public String dyren(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/mine/dyren.jsp";
	}

	// 分享二维码页面
	@RequestMapping("fenxiang")
	public String fenxiang(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		String id = user.getId() + "";
		id = StringKSUtils.autoGenericCode6(id);
		String path = "/filetemp/qr/" + id + ".png";
		QRUtils.genQR(300, 300, "http://www.52shibei.com/shike/skm/regist?refereeId=" + id, Const.ROOT_PATH + path);
		req.setAttribute("code", id);
		req.setAttribute("path", path);
		return "page/mobile/mine/fenxiang.jsp";
	}

	// 账户安全页面
	@RequestMapping("zhanghu")
	public String zhanghu(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/zhanghu.jsp";
	}

	// 修改手机号码页面
	@RequestMapping("modifyphone")
	public String modifPhone(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/modifyphone.jsp";
	}

	// 修改淘宝账号页面
	@RequestMapping("modifyalipay")
	public String modifyAlipay(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/modifyalipay.jsp";
	}

	// 修改淘宝账号页面
	@RequestMapping("modifytaobao")
	public String modifyTaobao(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/modifytaobao.jsp";
	}

	// 修改qq账号页面
	@RequestMapping("modifyqq")
	public String modifyQq(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/modifyqq.jsp";
	}

	// 修改登录密码页面
	@RequestMapping("modifyloginpwd")
	public String loginPwd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/mine/modifyloginpwd.jsp";
	}

	// 整合流程页面
	@RequestMapping("gouwuche")
	public String gouwuche(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKUser user = sKUserService.getUser();
		SKSkqk skqk = sKSkqkService.getQkByBBId(id, user.getId());
		// 试客情况
		int status = skqk.getStatus().intValue();

		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);

		// 宝贝第一个图片
		List<SKBaobeiTP> tplist = sKBaobeiTPService.getList(id);
		SKBaobeiTP firsttp = tplist.get(0);

		req.setAttribute("baobei", baobei);
		req.setAttribute("user", user);
		req.setAttribute("firsttp", firsttp);

		// 加购物车
		if (status < 18) {
			List<SKWord> words = sKWordService.getList(id);
			List<SKJindian> jindians = sKJindianService.getList(id);
			req.setAttribute("words", words);
			req.setAttribute("jindians", jindians);
			// 货比三家
			if (status < 11 && baobei.getHbsj() != null) {
				return "page/mobile/liucheng/hbsj.jsp";
			} else {
				return "page/mobile/liucheng/gouwuche.jsp";
			}
		} else if (status == 18) {
			// 收藏关注
			return "page/mobile/liucheng/scgz.jsp";
		} else if (status == 51) {
			// 确认宝贝、提交付款订单
			return "page/mobile/liucheng/ddan.jsp";
		} else if (status == 71) {
			// 反馈好评晒图
			return "page/mobile/liucheng/haop.jsp";
		}
		return null;
	}

	// 我的活动页面
	@RequestMapping("wdhd")
	public String wdhd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();

		if (user == null) {
			return "page/mobile/mine/login.jsp";
		}

		String status = req.getParameter("status");
		if (StringUtils.isEmpty(status)) {
			status = "18"; // 默认是"继续申请"页面
		}
		req.setAttribute("status", status);
		return "page/mobile/wdhd/wdhd.jsp";
	}

	// 订单页面
	@RequestMapping("haop")
	public String haop(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		// 宝贝第一个图片
		List<SKBaobeiTP> tplist = sKBaobeiTPService.getList(id);
		SKBaobeiTP firsttp = tplist.get(0);
		req.setAttribute("firsttp", firsttp);
		req.setAttribute("baobei", baobei);
		return "page/mobile/liucheng/haop.jsp";
	}

	// 余额页面
	@RequestMapping("yue")
	public String yue(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		SKUserYue yue = skUserYueService.selectOne(user.getId());

		req.setAttribute("user", user);
		req.setAttribute("yue", yue);
		return "page/mobile/mine/yue.jsp";
	}

	// 金币页面
	@RequestMapping("jinbi")
	public String jinbi(HttpServletRequest req, HttpServletResponse rep, Model model) {

		SKUser user = sKUserService.getUser();
		if (user == null) {
			return "page/mobile/mine/login.jsp";
		}

		String type = req.getParameter("type");
		if (StringUtils.isEmpty(type)) {
			type = "1";
		}

		SKUserYue yue = skUserYueService.selectOne(user.getId());

		List<SkUserJinbi> list = skUserJinbiService.getTodayQiandao();

		// 判断当天是否已经签到
		Boolean isQiaodao = false;
		if (!list.isEmpty()) {
			isQiaodao = true;
		}

		req.setAttribute("type", type);
		req.setAttribute("isQiaodao", isQiaodao); // 当天是都已经签到
		req.setAttribute("user", user);
		req.setAttribute("yue", yue);
		Integer jinbi = 0;
		if (yue != null) {
			jinbi = yue.getJinbi().intValue();
		}
		req.setAttribute("jinbi", jinbi);
		return "page/mobile/mine/jinbi.jsp";
	}

	// 金币明细页面
	@RequestMapping("jinbimx")
	public String jinbimx(HttpServletRequest req, HttpServletResponse rep, Model model) {
		String inorout = req.getParameter("inorout");

		SKUser user = sKUserService.getUser();
		SKUserYue yue = skUserYueService.selectOne(user.getId());

		req.setAttribute("inorout", inorout);
		req.setAttribute("user", user);
		req.setAttribute("yue", yue);
		Integer jinbi = 0;
		if (yue != null) {
			jinbi = yue.getJinbi().intValue();
		}
		req.setAttribute("jinbi", jinbi);
		return "page/mobile/mine/jinbimx.jsp";
	}

	// 提现页面
	@RequestMapping("tixian")
	public String tixian(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/mine/tixian.jsp";
	}

	// 明细页面
	@RequestMapping("mingxi")
	public String mingxi(HttpServletRequest req, HttpServletResponse rep, Model model) {
		String inorout = req.getParameter("inorout");

		req.setAttribute("inorout", inorout);
		return "page/mobile/mine/mingxi.jsp";
	}

	// 即将到账页面
	@RequestMapping("jjdz")
	public String jjdz(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/lc/jjdz.jsp";
	}

	// 我的
	@RequestMapping("mine")
	public String mine(HttpServletRequest req, HttpServletResponse rep, Model model) {

		SKUser user = sKUserService.getUser();

		if (user == null) {
			return "page/mobile/mine/login.jsp";
		}

		SKUserYue yue = skUserYueService.selectOne(user.getId());

		// 当前是已中奖状态的 任务数量
		long yzj = sKSkqkService.getQkByByYzj(user.getId());

		// 今日申请数量
		long todaySq = sKSkqkService.getQkByToday(user.getId());

		// 粉丝数量
		long fensiNum = sKUserService.getListByRefereeId().size();

		// 邀请奖励的金币数
		Long jinbiSum = skUserJinbiService.sumByType(3L);

		// 已到账奖金总数
		Double ydzSum = skUserFansService.sumByStatus(9L);

		// 即将到账奖金总数
		Double jjdzSum = skUserFansService.sumByStatus(1L);

		Integer jinbi = 0;
		if (yue != null) {
			jinbi = yue.getJinbi().intValue();
		}
		req.setAttribute("user", user);
		req.setAttribute("yue", yue);
		req.setAttribute("yzj", yzj);
		req.setAttribute("jinbi", jinbi);
		req.setAttribute("todaySq", todaySq);
		req.setAttribute("fensiNum", fensiNum);
		req.setAttribute("jinbiSum", jinbiSum);
		req.setAttribute("ydzSum", ydzSum);
		req.setAttribute("jjdzSum", jjdzSum);

		return "page/mobile/mine/mine.jsp";
	}

	// 我的粉丝页面
	@RequestMapping("fensi")
	public String fensi(HttpServletRequest req, HttpServletResponse rep, Model model) {
		String status = req.getParameter("status");
		req.setAttribute("status", status);
		return "page/mobile/mine/fensi.jsp";
	}

	// 帮助中心页面
	@RequestMapping("help/{id}")
	public String help(@PathVariable String id, HttpServletRequest req, HttpServletResponse rep, Model model) {
		List<SKCMS> sk = sKCMSService.selectByTypeId(2);

		if (StringUtils.isNotBlank(id) && !"0".equals(id)) {
			SKCMS obj = sKCMSService.get(NumberUtils.parseLong(id, 0L));
			req.setAttribute("obj", obj);
		}
		req.setAttribute("sk", sk);
		return "page/mobile/mine/help.jsp";
	}

	// 意见反馈页面
	@RequestMapping("yijian")
	public String yijian(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		req.setAttribute("user", user);
		return "page/mobile/mine/yijian.jsp";
	}

	// 中奖秘笈页面
	@RequestMapping("zjmj")
	public String zjmj(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/index/zjmj.jsp";
	}

	// 赚钱秘笈页面
	@RequestMapping("zqmj")
	public String zqmj(HttpServletRequest req, HttpServletResponse rep, Model model) {
		return "page/mobile/index/zqmj.jsp";
	}

	// 订单详情页面
	@RequestMapping("ddxq")
	public String ddxq(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();

		Long id = Long.valueOf(req.getParameter("id"));

		SKSkqk skSkqk = sKSkqkService.selectOne(id);
		SKBaobei skBaobei = sKBaobeiService.getSKBaobei(skSkqk.getBbid());
		SKDianPu skDianPu = skDianPuService.selectOne(skBaobei.getDpid());

		List<SKJysj> skJysjs = skJysjService.selectByBbidAndUserid(skBaobei.getId(), user.getId());

		for (SKJysj skJysj : skJysjs) {
			// 购物车（店铺名）
			if ("dpm".equals(skJysj.getBusitype()) || "tkl".equals(skJysj.getBusitype())) {
				req.setAttribute("dpm", skJysj);
			}
			// 收藏
			if ("sc".equals(skJysj.getBusitype())) {
				req.setAttribute("sc", skJysj);
			}
			// 关注
			if ("gz".equals(skJysj.getBusitype())) {
				req.setAttribute("gz", skJysj);
			}
			// 订单
			if ("dd".equals(skJysj.getBusitype())) {
				req.setAttribute("dd", skJysj);
			}
			// 订单号
			if ("ddh".equals(skJysj.getBusitype())) {
				req.setAttribute("ddh", skJysj);
			}
			// 好评
			if ("hp".equals(skJysj.getBusitype())) {
				req.setAttribute("hp", skJysj);
			}
			// 好评图
			if ("hpy".equals(skJysj.getBusitype())) {
				req.setAttribute("hpy", skJysj);
			}
		}

		req.setAttribute("skSkqk", skSkqk);
		req.setAttribute("skBaobei", skBaobei);
		req.setAttribute("skDianPu", skDianPu);
		return "page/mobile/wdhd/ddxq.jsp";
	}

	// 修改收藏关注页面
	@RequestMapping("xgscgz")
	public String xgscgz(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		Long id = Long.valueOf(req.getParameter("id"));

		SKSkqk skSkqk = sKSkqkService.selectOne(id);
		List<SKJysj> skJysjs = skJysjService.selectByBbidAndUserid(skSkqk.getBbid(), user.getId());

		for (SKJysj skJysj : skJysjs) {
			// 收藏
			if ("sc".equals(skJysj.getBusitype())) {
				req.setAttribute("sc", skJysj);
			}
			// 关注
			if ("gz".equals(skJysj.getBusitype())) {
				req.setAttribute("gz", skJysj);
			}
		}
		req.setAttribute("skSkqk", skSkqk);
		return "page/mobile/wdhd/xgscgz.jsp";
	}

	// 修改订单页面
	@RequestMapping("xgdd")
	public String xgdd(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		Long id = Long.valueOf(req.getParameter("id"));

		SKSkqk skSkqk = sKSkqkService.selectOne(id);
		List<SKJysj> skJysjs = skJysjService.selectByBbidAndUserid(skSkqk.getBbid(), user.getId());

		for (SKJysj skJysj : skJysjs) {
			// 订单图片
			if ("dd".equals(skJysj.getBusitype())) {
				req.setAttribute("dd", skJysj);
			}
			// 订单号码
			if ("ddh".equals(skJysj.getBusitype())) {
				req.setAttribute("ddh", skJysj);
			}
		}
		req.setAttribute("skSkqk", skSkqk);
		return "page/mobile/wdhd/xgdd.jsp";
	}

	// 修改好评页面
	@RequestMapping("xghp")
	public String xghp(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		Long id = Long.valueOf(req.getParameter("id"));

		SKSkqk skSkqk = sKSkqkService.selectOne(id);
		List<SKJysj> skJysjs = skJysjService.selectByBbidAndUserid(skSkqk.getBbid(), user.getId());

		for (SKJysj skJysj : skJysjs) {
			// 好评文字
			if ("hpy".equals(skJysj.getBusitype())) {
				req.setAttribute("hpy", skJysj);
			}
			// 好评图片
			if ("hp".equals(skJysj.getBusitype())) {
				String[] hptps = skJysj.getContent().split("sktag");
				req.setAttribute("hptps", hptps);
				req.setAttribute("hp", skJysj);
			}
		}
		req.setAttribute("skSkqk", skSkqk);
		return "page/mobile/wdhd/xghp.jsp";
	}

	// 金币抽奖页面
	@RequestMapping("jbcj")
	public String jbcj(HttpServletRequest req, HttpServletResponse rep, Model model) {
		SKUser user = sKUserService.getUser();
		if (user == null) {
			return "page/mobile/mine/login.jsp";
		}

		SKUserYue yue = skUserYueService.selectOne(user.getId());
		Integer jinbi = 0;
		if (yue != null) {
			jinbi = yue.getJinbi().intValue();
		}

		// 当天剩余抽奖数
		Integer todayCj = skUserJinbiService.countTodayCj();

		req.setAttribute("jinbi", jinbi);
		req.setAttribute("todayCj", todayCj);
		return "page/mobile/index/jbcj.jsp";
	}

}
