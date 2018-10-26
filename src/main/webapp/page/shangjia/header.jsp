<%@page import="co.kensure.api.ApiDesc"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String path = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String title = (String)request.getAttribute("wangzhangtitle");
%>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=BusiConstant.context%>/favicon.ico" type="image/x-icon">
    <title><%=title %> – <%=name%></title>
    <meta name="keywords" content="试客网,试客联盟,试客之家,试客联盟网,试客联盟中心,免费试用,试用网,免费试用网,免费试用平台,<%=name%>">
    <meta name="description" content="欢迎来免费试用网:<%=name%>.">
    <link rel="stylesheet" type="text/css" href="<%=path%>/base.css?ver=<%=BusiConstant.version%>">
<link rel="stylesheet" type="text/css" href="<%=path%>/index.css?ver=<%=BusiConstant.version%>">
<link rel="stylesheet" type="text/css" href="<%=path%>/pagination.css?ver=<%=BusiConstant.version%>">
<link rel="stylesheet" type="text/css" href="<%=path%>/jquery.fancybox.css?ver=<%=BusiConstant.version%>">
<link rel="stylesheet" type="text/css" href="<%=path%>/credit.css?ver=<%=BusiConstant.version%>">
<link rel="stylesheet" type="text/css" href="<%=path%>/iconfont.css?ver=<%=BusiConstant.version%>">

<script type="text/javascript" src="<%=path%>/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>

<script charset="utf-8" src="<%=path%>/v.js"></script>
<script src="<%=path%>/hm.js"></script>

<script type="text/javascript" src="<%=path%>/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=path%>/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=path%>/Common.js"></script>
<script type="text/javascript" src="<%=path%>/credit.js"></script>
<script type="text/javascript" src="<%=path%>/jquery.form.js"></script>

<script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
<script type="text/javascript" src="<%=BusiConstant.context%>/common/fanye.js?ver=<%=BusiConstant.version%>"></script>
<script type="text/javascript" src="<%=BusiConstant.context%>/common/table.js?ver=<%=BusiConstant.version%>"></script>
</head>