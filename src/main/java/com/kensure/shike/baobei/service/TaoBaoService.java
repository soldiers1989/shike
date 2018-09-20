package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import co.kensure.exception.BusinessExceptionUtil;
import co.kensure.frame.JSBaseService;
import co.kensure.http.HttpUtils;

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
			if(StringUtils.isBlank(picurl)){
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
		// 通过url截取淘宝id
		String[] canshu =  url.split("[?]")[1].split("&");
		String id = null;
		for (String zhi : canshu) {
			if (zhi.startsWith("id=")) {
				id = zhi.substring(3);
				break;
			}
		}
		String html = "";
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotBlank(id)) {
			String m = "http://hws.m.taobao.com/cache/wdesc/5.0/?id=" + id;
			html = HttpUtils.getBody(m);

			String tag = "tfsContent : '";

			String c1 = html.substring(html.indexOf(tag) + tag.length());
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
		}
		return sb.toString();
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

	public static void main(String[] args) {
		// fenxi();
	
		String url = "https://detail.tmall.com/item.htm?id=551968898854&spm=a230r.7195193.1997079397.20.XRP1bz&abbucket=12";
		String html =	getContent("https://item.taobao.com/item.htm?id=573448516906&ns=1&abbucket=17#detail") ;
		System.out.println(html);
	}

}
