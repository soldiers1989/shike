package com.kensure.controller;

import co.kensure.frame.Const;
import co.kensure.frame.ResultInfo;
import co.kensure.frame.ResultRowInfo;
import co.kensure.frame.ResultRowsInfo;
import co.kensure.http.RequestUtils;
import co.kensure.io.FileUtils;
import co.kensure.mem.DateUtils;
import co.kensure.mem.PageInfo;
import co.kensure.mem.Utils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kensure.shike.baobei.model.*;
import com.kensure.shike.baobei.query.SKBaobeiQuery;
import com.kensure.shike.baobei.query.SKBaobeiQuery1;
import com.kensure.shike.baobei.service.*;
import com.kensure.shike.constant.BusiConstant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 活动信息
 * 
 * @author fankaidi
 *
 */
@Controller
@RequestMapping(value = "baobei")
public class SKBaobeiController {

	@Resource
	private TaoBaoService taoBaoService;
	@Resource
	private SKBaobeiService sKBaobeiService;
	@Resource
	private SKSkqkService sKSkqkService;
	@Resource
	private SKBbrwService sKBbrwService;
	@Resource
	private SKChouJiangService sKChouJiangService;

	// 获取宝贝详情
	@ResponseBody
	@RequestMapping(value = "detail.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo detail(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = sKBaobeiService.getSKBaobei(id);

		return new ResultRowInfo(baobei);
	}

	
	/**
	 * 获取完整的宝贝信息
	 */
	@ResponseBody
	@RequestMapping(value = "baobeiFull.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo baoBeiFull(HttpServletRequest req, HttpServletResponse rep, Model model) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		SKBaobei baobei = this.sKBaobeiService.getBaoBeiFull(id);
		return new ResultRowInfo(baobei);
	}

	/**
	 * 根据url获取商品的详情
	 */
	@ResponseBody
	@RequestMapping(value = "gettaobaoinfo.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo getTaoBaoInfo(HttpServletRequest req, HttpServletResponse rep) {
		/**
		 * 需要传入的参数， url 淘宝链接
		 */
		JSONObject json = RequestUtils.paramToJson(req);
		String url = json.getString("url");
		List<String> list = taoBaoService.getPicList(url);
		return new ResultRowsInfo(list);
	}

	/**
	 * 保存宝贝
	 */
	@ResponseBody
	@RequestMapping(value = "save.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo save(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKBaobei obj = JSONObject.parseObject(json.toJSONString(), SKBaobei.class);

		/**
		 * `dpid` '店铺id', `title` '宝贝标题', `url` '宝贝链接', `taokl` '淘口令', `zturl`
		 * '宝贝主图链接', `sale_price` '宝贝单价', `jiangli` '宝贝奖励', `no_qq` '联系qq账号',
		 * `guige` '商品规格', `typeid` '宝贝分类id', `hdtypeid` '活动类型id', `xinyongka`
		 * TINYINT(3) NOT NULL COMMENT '允许使用信用卡 1是允许，0是不允许', `huabei` TINYINT(3)
		 * NOT NULL COMMENT '允许使用花呗 1是允许，0是不允许', `shaitu` TINYINT(3) NOT NULL
		 * COMMENT '是否需要晒图 1是需要，0是不用', `wangwang` TINYINT(3) NOT NULL COMMENT
		 * '是否需要旺旺聊天 1是需要，0是不用',
		 * 
		 * tplist 图片列表[{url:}] jdlist 进店路径[{typeid:,bili:}] wordlist
		 * 关键字[{word:,ordermethod:}] bbrwlist 宝贝任务[{bbnum:,zhuanhua:,daydes:,details（任务详情）:[{bbnum:,hour1:,hour2:,}]}]
		 * hbsj活笔三家:{tkl1:,tkl2:,tkl3}
		 */
		sKBaobeiService.saveBaoBei(obj);
		return new ResultRowInfo();
	}

	/**
	 * 活动列表
	 */
	@ResponseBody
	@RequestMapping(value = "list.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo list(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);

		SKBaobeiQuery query = JSONObject.parseObject(json.toJSONString(), SKBaobeiQuery.class);
		PageInfo page = JSONObject.parseObject(json.toJSONString(), PageInfo.class);
		List<SKBaobei> list = sKBaobeiService.getList(query, page);
		long cont = sKBaobeiService.getListCount(query, page);
		return new ResultRowsInfo(list, cont);
	}

	/**
	 * 支付信息
	 */
	@ResponseBody
	@RequestMapping(value = "payinfo.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo payinfo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKPayInfo> list = sKBaobeiService.payYingShouinfo(id).getList();
		return new ResultRowsInfo(list);
	}

	/**
	 * 支付数据入库
	 */
	@ResponseBody
	@RequestMapping(value = "pay.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo pay(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.pay(id);
		return new ResultRowInfo();
	}

	/**
	 * 通过
	 */
	@ResponseBody
	@RequestMapping(value = "tongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.tongguo(id);
		return new ResultRowInfo();
	}

	/**
	 * 不通过
	 */
	@ResponseBody
	@RequestMapping(value = "untongguo.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo untongguo(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.untongguo(id);
		return new ResultRowInfo();
	}

	/**
	 * 试客查看的活动列表
	 */
	@ResponseBody
	@RequestMapping(value = "sklist.do", method = { RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public ResultInfo sklist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		SKBaobeiQuery1 query = JSONObject.parseObject(json.toJSONString(), SKBaobeiQuery1.class);

		// 升序/降序
		if ("1".equals(query.getSort())) {
			query.setSort("desc");
		} else {
			query.setSort("asc");
		}
		// 排序字段
		if ("1".equals(query.getOrder())) { // 最新
			query.setOrder("disorder,created_time");
			query.setSort("desc");
		} else if ("2".equals(query.getOrder())) { // 价值
			query.setOrder("sale_price");
		} else if ("3".equals(query.getOrder())) { // 人气
			query.setOrder("sqnum");
		} else {
			query.setOrder("disorder,created_time");
			query.setSort("desc");
		}

		List<SKBaobei> list = sKBaobeiService.getSKList(query);
		return new ResultRowsInfo(list);
	}

	/**
	 * 立即申请
	 */
	@ResponseBody
	@RequestMapping(value = "shenqing.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo shenqing(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.shenqing(id);
		return new ResultRowInfo();
	}

	/**
	 * 流程
	 */
	@ResponseBody
	@RequestMapping(value = "liucheng.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo liucheng(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Long status = json.getLong("status");
		String datas = json.getString("datas");
		//淘宝账号
		String notaobao = json.getString("notaobao");
		List<SKJysj> jysjList = JSONObject.parseArray(datas, SKJysj.class);
		sKBaobeiService.liucheng(id, status,notaobao, jysjList);
		return new ResultRowInfo();
	}

	/**
	 * 上传图片
	 */
	@ResponseBody
	@RequestMapping(value = "addfile.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo addfile(MultipartFile file, HttpServletRequest req) {
		String path = "/filetemp/" + DateUtils.format(new Date(), DateUtils.DAY_FORMAT1);
		String name = Utils.getUUID() + ".jpg";
		FileUtils.fileToIo(file, Const.ROOT_PATH + path, name);
		String url = path + "/" + name;
		return new ResultRowInfo(url);
	}

	/**
	 * 上传图片,给富文本框,返回结果不一样
	 */
	@ResponseBody
	@RequestMapping(value = "addfiles.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public JSONObject addfiles(MultipartHttpServletRequest request) {
		Collection<List<MultipartFile>> multipartFiles = request.getMultiFileMap().values();
		String path = "/filetemp/" + DateUtils.format(new Date(), DateUtils.DAY_FORMAT1);
		JSONObject map = new JSONObject();
		map.put("errno", 0);
		JSONArray data = new JSONArray();
		map.put("data", data);
		for (List<MultipartFile> filelist : multipartFiles) {
			for (MultipartFile file : filelist) {
				String name = Utils.getUUID() + ".jpg";
				FileUtils.fileToIo(file, Const.ROOT_PATH + path, name);
				String url = BusiConstant.context + path + "/" + name;
				data.add(url);
			}
		}
		return map;
	}

	/**
	 * 淘口令校验宝贝id
	 */
	@ResponseBody
	@RequestMapping(value = "tklcheck.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo tklcheck(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String tkl = json.getString("tkl");
		sKBaobeiService.checkTKL(id, tkl);
		return new ResultRowInfo();
	}

	/**
	 * 宝贝店铺名称校验
	 */
	@ResponseBody
	@RequestMapping(value = "dpnamecheck.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo dpnamecheck(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String dpname = json.getString("dpname");
		sKBaobeiService.checkDPName(id, dpname);
		return new ResultRowInfo();
	}

	/**
	 * 我的活动列表
	 */
	@ResponseBody
	@RequestMapping(value = "skwdhd.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo skwdhd(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long status = json.getLong("status");
		List<SKSkqk> list = sKSkqkService.getSkQKList(status);
		return new ResultRowsInfo(list);
	}

	/**
	 * 删除申请
	 */
	@ResponseBody
	@RequestMapping(value = "deletesq.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo deleteSq(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKSkqkService.delete(id);
		return new ResultInfo();
	}

	/**
	 * 抽奖ces
	 */
	@ResponseBody
	@RequestMapping(value = "cjtest.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo cjtest(HttpServletRequest req, HttpServletResponse rep) {
		sKChouJiangService.doChouJiang(true);
		return new ResultRowInfo();
	}

	/**
	 * 好评测试
	 */
	@ResponseBody
	@RequestMapping(value = "hptest.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo hptest(HttpServletRequest req, HttpServletResponse rep) {
		sKSkqkService.kaiQiHaoPin();
		return new ResultRowInfo();
	}

	/**
	 * 返款测试
	 */
	@ResponseBody
	@RequestMapping(value = "fktest.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo fktest(HttpServletRequest req, HttpServletResponse rep) {
		sKSkqkService.toReturnMoney();
		return new ResultRowInfo();
	}

	/**
	 * 结束宝贝
	 */
	@ResponseBody
	@RequestMapping(value = "endbaobei.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo endbaobei(HttpServletRequest req, HttpServletResponse rep) {
		sKBaobeiService.endBaobei();
		return new ResultRowInfo();
	}

	/**
	 * 宝贝下线
	 */
	@ResponseBody
	@RequestMapping(value = "xiaxian.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo xiaxian(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.xiaxian(id);
		return new ResultRowInfo();
	}

	/**
	 * 虚拟商品
	 */
	@ResponseBody
	@RequestMapping(value = "xuni.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo xuni(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.xuni(id);
		return new ResultRowInfo();
	}

	/**
	 * 初始化应收
	 */
	@ResponseBody
	@RequestMapping(value = "yingshou.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo yingshou(HttpServletRequest req, HttpServletResponse rep) {
		sKBaobeiService.setYingShouinfo();
		return new ResultRowInfo();
	}

	/**
	 * 商家确认返款
	 */
	@ResponseBody
	@RequestMapping(value = "fankuan.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo fankuan(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKSkqkService.userMoney(id);
		return new ResultRowInfo();
	}
	
	/**
	 * 商家确认返款
	 */
	@ResponseBody
	@RequestMapping(value = "jiesuan.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo jieSuanBaobei(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.jieSuanBaobei(id);
		return new ResultRowInfo();
	}
	
	

	/**
	 * 我的活动列表
	 */
	@ResponseBody
	@RequestMapping(value = "skqklist.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo skqklist(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		List<SKSkqk> list = sKSkqkService.getSkqkList(id);
		return new ResultRowsInfo(list);
	}

	/**
	 * 状态
	 */
	@ResponseBody
	@RequestMapping(value = "statustj.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo statustj(HttpServletRequest req, HttpServletResponse rep) {
		List<SKGroupStatus> list = sKBaobeiService.groubByStatus();
		if (list == null) {
			list = new ArrayList<SKGroupStatus>();
		}
		return new ResultRowsInfo(list);
	}

	/**
	 * 状态
	 */
	@ResponseBody
	@RequestMapping(value = "quxiao.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo quxiao(HttpServletRequest req, HttpServletResponse rep) {
		sKSkqkService.quXiaoZhongJiang();
		return new ResultRowInfo();
	}

	/**
	 * 增加申请数量
	 */
	@ResponseBody
	@RequestMapping(value = "sqs.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo addsqs(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Long sqs = json.getLong("sqs");
		sKBaobeiService.addsqs(id, sqs);
		return new ResultRowInfo(id);
	}

	/**
	 * 排序
	 */
	@ResponseBody
	@RequestMapping(value = "paixu.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo paixu(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Long disorder = json.getLong("disorder");
		sKBaobeiService.addpaixu(id, disorder);
		return new ResultRowInfo(id);
	}

	/**
	 * 增加中奖数量
	 */
	@ResponseBody
	@RequestMapping(value = "zjs.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo addzjs(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		Integer zjs = json.getInteger("zjs");
		sKBaobeiService.addzjs(id, zjs);
		return new ResultRowInfo(id);
	}

	/**
	 * 不限制用户的商品
	 */
	@ResponseBody
	@RequestMapping(value = "cancellimit.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo cancellimit(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		sKBaobeiService.cancelLimit(id);
		return new ResultRowInfo(id);
	}

	/**
	 * 增加详情
	 */
	@ResponseBody
	@RequestMapping(value = "savebody.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public ResultInfo savebody(HttpServletRequest req, HttpServletResponse rep) {
		JSONObject json = RequestUtils.paramToJson(req);
		Long id = json.getLong("id");
		String body = json.getString("body");
		sKBaobeiService.saveBody(id, body);
		return new ResultRowInfo(id);
	}

    /**
     * 指定中奖
     */
    @ResponseBody
    @RequestMapping(value = "zhiding.do", method = { RequestMethod.POST, RequestMethod.GET }, produces = "application/json;charset=UTF-8")
    public ResultInfo zhiding(HttpServletRequest req, HttpServletResponse rep) {
        JSONObject json = RequestUtils.paramToJson(req);
        Long id = json.getLong("id");
        sKChouJiangService.zhiding(id);
        return new ResultRowInfo();
    }
    
}
