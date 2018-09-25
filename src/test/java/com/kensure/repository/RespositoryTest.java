package com.kensure.repository;


import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkTpwdCreateRequest;
import com.taobao.api.request.TimeGetRequest;
import com.taobao.api.request.WirelessShareTpwdQueryRequest;
import com.taobao.api.response.TbkTpwdCreateResponse;
import com.taobao.api.response.TimeGetResponse;
import com.taobao.api.response.WirelessShareTpwdQueryResponse;


public class RespositoryTest {

	private final static String appkey = "23615464";
	private final static String appsecret = "d36f4fd1644696927465a60322f367bc";
	
//	private final static String appkey = "25089024";
//	private final static String appsecret = "d6afb55bc7487926a2b64ff55918cab7";
	@Test
	public void test() {
		String url = "https://a.m.taobao.com/i562678558396.htm?price=21-36&sourceType=item&sourceType=item&suid=3a8355c5-8f70-43e1-9b83-5700b8520bab&ut_sk=1.Wlsrw16G1gkDANL%2Fd2YObLF2_21646297_1537788301806.Copy.1&un=814e41faeefcc0722040bd82ddc2e1ea&share_crt_v=1&sp_tk=77+lODMyYWI0QmVvOHnvv6U=&spm=a211b4.23615464&visa=13a09278fde22a2e&disablePopup=true&disableSJ=1";
		String tag = ".com/i";
		url = url.substring(url.indexOf(tag)+tag.length());
		url = url.substring(0, url.indexOf(".htm"));
		System.out.println(url);
	}

	
	@Test
	public void test1() {
//		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", appkey, appsecret);
//		WirelessShareTpwdQueryRequest req = new WirelessShareTpwdQueryRequest();
//		req.setPasswordContent("【车载香水汽车出风口香薰膏空调车内用品创意香气持久淡香装饰摆件】http://m.tb.cn/h.3TDe5SM?sm=c099b7 点击链接，再选择浏览器咑閞；或復·制这段描述￥832ab4Beo8y￥后到[表情]淘♂寳♀[表情]");
//		WirelessShareTpwdQueryResponse rsp;
//		try {
//			rsp = client.execute(req);
//			
//			JSONObject json = (JSONObject)JSONObject.parse(rsp.getBody());
//			JSONObject bb = json.getJSONObject("wireless_share_tpwd_query_response");
//			String native_url = bb.getString("native_url");
//			String url = bb.getString("url");
//			System.out.println("native_url="+native_url);
//			System.out.println("url="+url);
//		} catch (ApiException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
	}

	

}
