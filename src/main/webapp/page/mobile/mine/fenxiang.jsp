<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
	String path = (String)request.getAttribute("path");
	String code = (String)request.getAttribute("code");
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>分享赚10元</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/list.css">

<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/animate.min.css" rel="stylesheet">
<style>
    .header{font-size:0.6rem;}
</style>
<script>

</script>
<div>
<header class="header task-top frv" style="line-height: 2rem">
<i class="iconfont icon-Toright" style="position:absolute;height:2rem;width:2rem;" onclick="history.back(-1)"></i>分享
</header>
</div>
<div style="text-align:center;margin-top:60px;">
	<div style="margin-left:calc(50% - 150px);width:300px;height:533px;background:#000 url(<%=BusiConstant.context%>/page/mobile/mine/dyren/image/erweimabj.jpg) no-repeat">
		<img style="margin-left:145px;margin-top:375px;" src="<%=BusiConstant.context+path %>">
	</div>
</div>
<div style="text-align:center;font-size:20px;">专属邀请码<%=code %></div>
</body></html>