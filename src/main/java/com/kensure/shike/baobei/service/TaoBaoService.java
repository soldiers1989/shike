package com.kensure.shike.baobei.service;

import com.kensure.shike.baobei.dao.SKBaobeiDao;
import com.kensure.shike.baobei.model.SKBaobei;
import com.kensure.shike.baobei.service.TaoBaoService;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
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

	public static void fenxi() {
		try {
			String url = "https://detail.tmall.com/item.htm?id=551968898854&spm=a230r.7195193.1997079397.20.XRP1bz&abbucket=12";
			HttpResponse response = HttpUtils.get(url);
			// 获取响应状态码
			int StatusCode = response.getStatusLine().getStatusCode();
			// 如果状态响应码为200，则获取html实体内容或者json文件
			if (StatusCode == 200) {
				String html = EntityUtils.toString(response.getEntity(), "utf-8");
				Document doc = Jsoup.parse(html);

				// 图片的J_UlThumb
				// 获取html标签中的内容
				Elements elements = doc.select("ul#J_UlThumb").select("li");
				for (Element ele : elements) {
					// String bookID = ele.attr("data-sku");
					String bookPrice = ele.select("img").attr("src");
					System.out.println(bookPrice);
					// String bookName =
					// ele.select("div[class=p-name]").select("em").text();
					// 创建一个对象，这里可以看出，使用Model的优势，直接进行封装
				}
				String con = doc.select("div#description").text();
				
			} else {
				BusinessExceptionUtil.threwException("获取信息错误");
			}
			EntityUtils.consume(response.getEntity());
		} catch (Exception e) {
			e.printStackTrace();
			BusinessExceptionUtil.threwException("获取信息错误");
		}
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
