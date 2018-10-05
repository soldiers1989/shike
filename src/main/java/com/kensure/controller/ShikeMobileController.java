package com.kensure.controller;

import co.kensure.http.RequestUtils;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.model.SKJindian;
import com.kensure.shike.baobei.model.SKSkqk;
import com.kensure.shike.baobei.model.SKWord;
import com.kensure.shike.baobei.service.SKBaobeiService;
import com.kensure.shike.baobei.service.SKJindianService;
import com.kensure.shike.baobei.service.SKSkqkService;
import com.kensure.shike.baobei.service.SKWordService;
import com.kensure.shike.user.model.SKUser;
import com.kensure.shike.user.service.SKUserService;
import com.kensure.shike.zhang.model.SKUserYue;
import com.kensure.shike.zhang.model.SkUserJinbi;
import com.kensure.shike.zhang.service.SKUserYueService;
import com.kensure.shike.zhang.service.SkUserJinbiService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

	// 首页
	@RequestMapping("index")
	public String index(HttpServletRequest req, HttpServletResponse rep, Model model) {
//		return "page/mobile/haohuo/haohuo.jsp";
		return "page/mobile/index/index.jsp";
	}

	// 好货页面
	@RequestMapping("haohuo")
	public String home(HttpServletRequest req, HttpServletResponse rep, Model model) {
//		return "page/mobile/haohuo/haohuo.jsp";
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
//		return "page/mobile/login/login.jsp";
		return "page/mobile/mine/login.jsp";
	}

	// 注册
	@RequestMapping("regist")
	public String regist(HttpServletRequest req, HttpServletResponse rep, Model model) {
//		return "page/mobile/login/regist.jsp";
		return "page/mobile/mine/regist.jsp";
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
//		SKUser user = sKUserService.getUser();
//		req.setAttribute("user", user);
		return "page/mobile/mine/modifyloginpwd.jsp";
	}

	// 整合流程页面
	@RequestMapping("gouwuche")
	public String gouwuche(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKUser user = sKUserService.getUser();
		SKSkqk skqk = sKSkqkService.getQkByBBId(id, user.getId());
		//试客情况
		int status = skqk.getStatus().intValue();	
		
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);
		req.setAttribute("baobei", baobei);
		req.setAttribute("user", user);
		
		//加购物车
		if(status<18){
			List<SKWord> words = sKWordService.getList(id);
			List<SKJindian> jindians = sKJindianService.getList(id);
			req.setAttribute("words", words);
			req.setAttribute("jindians", jindians);
			return "page/mobile/liucheng/gouwuche.jsp";
		}else if(status == 18){
			//收藏关注
			return "page/mobile/liucheng/scgz.jsp";
		}else if(status == 51){
			//确认宝贝、提交付款订单
			return "page/mobile/liucheng/ddan.jsp";
		}else if(status == 71){
			//反馈好评晒图
			return "page/mobile/liucheng/haop.jsp";
		}
		return null;		
	}


	// 我的活动页面
	@RequestMapping("wdhd")
	public String wdhd(HttpServletRequest req, HttpServletResponse rep, Model model) {
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
		req.setAttribute("baobei", baobei);
//		return "page/mobile/lc/haop.jsp";
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
		String type = req.getParameter("type");

		SKUser user = sKUserService.getUser();
		SKUserYue yue = skUserYueService.selectOne(user.getId());

        List<SkUserJinbi> list = skUserJinbiService.getTodayQiandao();

        Boolean isQiaodao = false;
        if (!list.isEmpty()) {
            isQiaodao = true;
        }

        req.setAttribute("type", type);
        req.setAttribute("isQiaodao", isQiaodao);  // 当天是都已经签到
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
		SKUser user = sKUserService.getUser();
		SKUserYue yue = skUserYueService.selectOne(user.getId());

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
//		return "page/mobile/lc/tixian.jsp";
		return "page/mobile/mine/tixian.jsp";
	}
	
	// 明细页面
	@RequestMapping("mingxi")
	public String mingxi(HttpServletRequest req, HttpServletResponse rep, Model model) {
//		return "page/mobile/lc/mingxi.jsp";
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

        if (user != null) {
			SKUserYue yue = skUserYueService.selectOne(user.getId());

			// 已中奖
			long yzj = sKSkqkService.getQkByByYzj(user.getId());

			// 今日申请
			long todaySq = sKSkqkService.getQkByToday(user.getId());

			req.setAttribute("yue", yue);
			req.setAttribute("yzj", yzj);
			req.setAttribute("todaySq", todaySq);
		}

		req.setAttribute("user", user);

        return "page/mobile/mine/mine.jsp";
	}
}
