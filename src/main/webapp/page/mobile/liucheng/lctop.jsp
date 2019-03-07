<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKJindian"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
   	SKBaobeiTP firsttp = (SKBaobeiTP)request.getAttribute("firsttp");
%>

<div class="Flow-hd">
	<img src="<%=firsttp.getUrl()%>">

	<ul>
		<li><span class="iconfont icon-tb"></span> <span>${baobei.title}</span></li>
		<li>店铺名称：<span><%=baobei.getDpnameS()%></span></li>
		<li>价值：<span style="color: #ff464e;"><%=baobei.getRealPrice()%>元</span>&nbsp;&nbsp;&nbsp;返还：<span style="color: #ff464e;"><%=baobei.getSalePrice()%>元</span></li>
		<li>规格：<span style="color: #ff464e;"
			onclick="myAlert(&#39;<%=baobei.getGuige()%>&#39;)"><%=baobei.getGuige()%></span></li>
	</ul>
</div>


<script>
<%if(StringUtils.length(baobei.getGuige()) >= 10){%>
	setTimeout('myAlert("<%=baobei.getGuige()%>")',500);
<%}%>
</script>