package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.http.HttpUtils;
import co.kensure.mem.MapUtils;

import com.alibaba.fastjson.JSONObject;
import com.kensure.mycom.config.service.MyConfigService;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.WirelessShareTpwdCreateRequest;
import com.taobao.api.request.WirelessShareTpwdCreateRequest.GenPwdIsvParamDto;
import com.taobao.api.request.WirelessShareTpwdQueryRequest;
import com.taobao.api.response.WirelessShareTpwdCreateResponse;
import com.taobao.api.response.WirelessShareTpwdQueryResponse;

/**
 * 抓取淘宝的信息
 * 
 * @author fankd created on 2018-9-8
 * @since
 */
@Service
public class TaoBaoService extends JSBaseService {

	public List<String> getPicList(String url) {
		List<String> picList = new ArrayList<>();
		Document doc = fenxi(url);
		// 图片的J_UlThumb
		// 获取html标签中的内容
		Elements elements = doc.select("ul#J_UlThumb").select("li");
		for (Element ele : elements) {
			String picurl = ele.select("img").attr("src");
			if (StringUtils.isBlank(picurl)) {
				picurl = ele.select("img").attr("data-src");
			}
			String a = picurl.substring(0, picurl.lastIndexOf("."));
			String c = a.substring(0, a.lastIndexOf("."));
			String b = picurl.substring(picurl.lastIndexOf("."));
			String bigurl = c + b;
			picList.add(bigurl);
		}
		// String con = doc.select("div#description").text();

		return picList;
	}

	/**
	 * 获取宝贝详情
	 * 
	 * @param url
	 * @return
	 */
	public static String getContent(String url) {
		String html = "";		
		try {
			String id = getContentId(url);		
			if (StringUtils.isNotBlank(id)) {
				String m = "http://hws.m.taobao.com/cache/wdesc/5.0/?id=" + id;
				html = HttpUtils.getBody(m);
				html = parseBody(html);
			}
		} catch (Exception e) {
			BusinessExceptionUtil.threwException("抓取淘宝详情出错，请点击淘宝详情查看");
		}	
		return html;
	}
	
	public static String parseBody(String body){
		StringBuffer sb = new StringBuffer();
		String tag = "tfsContent : '";
		String c1 = body.substring(body.indexOf(tag) + tag.length());
		c1 = c1.substring(0, c1.indexOf("',"));
		String[] c2 = c1.split("src=\"");
		for (String c3 : c2) {
			if (c3.contains("\"")) {
				String c4 = c3.substring(0, c3.indexOf("\""));
				if (c4.indexOf("_!!") != -1) {
					sb.append(c4).append("sktag");
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 根据网页获取宝贝id
	 * 
	 * @return
	 */
	public static String getContentId(String url) {
		// 通过url截取淘宝id
		String[] canshu = url.split("[?]")[1].split("&");
		String id = null;
		for (String zhi : canshu) {
			if (zhi.startsWith("id=")) {
				id = zhi.substring(3);
				break;
			}
		}
		return id;
	}

	// 解析淘口令,获取taobao商品id
	public static String parseTKL(String TKL) {
		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", 
				MyConfigService.getMyConfig("taobao_appkey").getVal(), MyConfigService.getMyConfig("taobao_appsecret").getVal());
		WirelessShareTpwdQueryRequest req = new WirelessShareTpwdQueryRequest();
		req.setPasswordContent(TKL);
		WirelessShareTpwdQueryResponse rsp;
		String id = null;
		try {
			rsp = client.execute(req);
			JSONObject json = (JSONObject) JSONObject.parse(rsp.getBody());
			JSONObject bb = json.getJSONObject("wireless_share_tpwd_query_response");
			String url = bb.getString("url");
			id = getTKLId(url);
		} catch (ApiException e) {
			BusinessExceptionUtil.threwException("淘口令解析出错", e);
		}
		return id;
	}

	private static String getTKLId(String url) {
		if(url.indexOf("item.htm?") > 0){
			url = getContentId(url);
		}else{
			String tag = ".com/i";
			url = url.substring(url.indexOf(tag) + tag.length());
			url = url.substring(0, url.indexOf(".htm"));
		}	
		return url;
	}

	// 根据url生成淘口令
	public static String encodeTKL(String url) {
		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", 
				MyConfigService.getMyConfig("taobao_appkey").getVal(), MyConfigService.getMyConfig("taobao_appsecret").getVal());
		WirelessShareTpwdCreateRequest req = new WirelessShareTpwdCreateRequest();
		GenPwdIsvParamDto dto = new GenPwdIsvParamDto();
		dto.setUrl(url);
		req.setTpwdParam(dto);
		WirelessShareTpwdCreateResponse rsp;
		String id = null;
		try {
			rsp = client.execute(req);
			JSONObject json = (JSONObject) JSONObject.parse(rsp.getBody());
			JSONObject bb = json.getJSONObject("wireless_share_tpwd_query_response");

		} catch (ApiException e) {
			BusinessExceptionUtil.threwException("淘口令生成出错", e);
		}
		return id;
	}

	/**
	 * 抓取淘宝图片和详情链接
	 * 
	 * @param url
	 */
	public static Document fenxi(String url) {
		Document doc = null;
		try {
			// String url =
			// "https://detail.tmall.com/item.htm?id=551968898854&spm=a230r.7195193.1997079397.20.XRP1bz&abbucket=12";
			String html = HttpUtils.getBody(url);
			doc = Jsoup.parse(html);
		} catch (Exception e) {
			e.printStackTrace();
			BusinessExceptionUtil.threwException("获取信息错误");
		}
		return doc;
	}

	private static final String geturl = "https://www.taodaxiang.com/credit2/index/get";
	
	// 根据淘宝账号获取相应信息
	public static String postTaobaoZhangHao(String account,String sessionid) {
		String html = "";
		try {
			Map<String, String> params = MapUtils.genStringMap("account",account);	
			Map<String, String> headers = MapUtils.genStringMap("Cookie","PHPSESSID="+sessionid+";");	
			headers.put("Host", "taodaxiang.com");
			html = HttpUtils.postParams(geturl, params,headers);
		} catch (Exception e) {
			BusinessExceptionUtil.threwException("获取账号信息出错", e);
		}
		return html;
	}
	
	public static void main(String[] args) {
		// fenxi();
		
		String url = "fankaidilingzhi";
		String html = postTaobaoZhangHao(url,"idbpkmsegofvk01eg894emqle1");
		System.out.println(html);
	}

}
