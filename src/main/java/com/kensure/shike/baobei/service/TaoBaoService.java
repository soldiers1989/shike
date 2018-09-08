package com.kensure.shike.baobei.service;

import java.util.ArrayList;
import java.util.List;

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
			picList.add(picurl);
		}
//		String con = doc.select("div#description").text();

		return picList;
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

		String ds = "//img.alicdn.com/imgextra/i4/2189242944/TB2l4_3uEhnpuFjSZFEXXX0PFXa_!!2189242944.jpg_60x60q90.jpg";
		String a = ds.substring(0, ds.lastIndexOf("."));
		String c = a.substring(0, a.lastIndexOf("."));
		String b = ds.substring(ds.lastIndexOf("."));
		System.out.println(c);
		System.out.println(b);
	}

}
