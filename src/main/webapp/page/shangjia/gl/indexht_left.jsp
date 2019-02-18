<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.sys.model.SKDict"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.sys.service.SKDictService"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>




<div class="shangjia_left clearfix hdn-left"
	style="border-right: 1px solid #e7e8eb; height: 100%; padding-bottom: 10000px; margin-bottom: -10000px;">
	<div style="width: 100%; display: block; margin: 0 auto;">
		<div class="left_bott">
			<ul>
				
				<li id="4" class="left_titi"><strong><i class="iconfont icon-liwuhuodong"></i>商家管理<i class="iconfont icon-Toboottom il5 ft_up_down"></i></strong></li>
				
				<li parentid="4"><a href="<%=BusiConstant.ht_huodonglist.getKey() %>" id="openWindows31" target="_self">活动管理</a></li>
				<li parentid="4"><a href="<%=BusiConstant.ht_sjlist.getKey() %>" id="openWindows31" target="_self">商家列表</a></li>
				<li parentid="4"><a href="<%=BusiConstant.ht_dplist.getKey() %>" id="openWindows31" target="_self">店铺列表</a></li>
				<li class="line"></li>

				<li class="left_titi "><strong><i class="iconfont icon-zhanghuxinxi"></i>试客管理</strong> <iclass="iconfont icon-Toleft il5 ft_up_down"style="color: rgb(102, 102, 102);"></i></li>
				<li parentid="4"><a href="<%=BusiConstant.ht_sklist.getKey() %>" id="openWindows31" target="_self">试客列表</a></li>
				<li parentid="4"><a href="<%=ApiUtil.getUrl("/gl/skqklist") %>" id="openWindows31" target="_self">试客试用情况</a></li>
				
				<li class="left_titi "><strong><i class="iconfont icon-zhanghuxinxi"></i>信息统计</strong> <iclass="iconfont icon-Toleft il5 ft_up_down"style="color: rgb(102, 102, 102);"></i></li>
				<li ><a href="<%=BusiConstant.ht_sklist.getKey() %>" id="openWindows31" target="_self">推荐试客统计</a></li>
				<li ><a href="<%=ApiUtil.getUrl("/gl/skqklist") %>" id="openWindows31" target="_self">推荐有效试客</a></li>

			<div id="cwdiv">
				<li class="left_titi "><strong><i class="iconfont icon-zhanghuxinxi"></i>资金管理 </strong> <i
					class="iconfont icon-Toleft il5 ft_up_down"
					style="color: rgb(102, 102, 102);"></i></li>
				<li parentid="4"><a href="<%=BusiConstant.ht_chongzhilist.getKey() %>" id="openWindows31" target="_self">充值管理</a></li>
				<li><a href="<%=BusiConstant.ht_tixianlist.getKey()%>" id="openWindows18" target="_self">提现管理</a></li>
			</div>
				<li class="left_titi "><strong><i class="iconfont icon-zhanghuxinxi"></i>消息公告</strong> <i
					class="iconfont icon-Toleft il5 ft_up_down"
					style="color: rgb(102, 102, 102);"></i></li>
				<%
				List<SKDict> cmsl = SKDictService.getListCache(4);
				for(SKDict c:cmsl){ %>
				<li><a href="<%=BusiConstant.shangjia_cms.getKey()%>?typeid=<%=c.getCode()%>"><%=c.getName()%></a></li>
				<%} %>
			</ul>
		</div>
	</div>
	<!--left-->
</div>

<script>
	var usernameddf = $.cookie("mdname");
    if("cwadmin" != usernameddf){
    	$("#cwdiv").html("");
    }
</script>
