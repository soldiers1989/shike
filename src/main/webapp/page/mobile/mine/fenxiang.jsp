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

    <script>
        (function (doc, win) {
            var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function (first) {
                var clientWidth = docEl.clientWidth;
                
                if (!clientWidth) return;
          
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                
            };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
            recalc();
        })(document, window);
    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/list.css">

<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/animate.min.css" rel="stylesheet">
<style>
    .header{font-size:0.6rem;}
    .question_main{padding:0.2rem 0.6rem 1rem;}
     .h2{height:2rem;}
    .question_main{margin-top:.4rem;font-size:.7rem;}
    .question_main>h2{text-indent:.5rem;font-size:0.55rem;color:#333;}
    .question_main>h2.textIndent{text-indent:1.1rem;}
    .question_main>p{font-size:0.512rem; margin:0.2rem 0;line-height:0.9rem;color:#666;}
    .question_main>p>span.red{color:#ff464e;font-weight:500;margin: 0 0.2rem;}
    .question_main>p>span.orange{color:#fc710b;font-weight:500;margin: 0 0.2rem;}
    .question_main>p>span.no-strong{font-weight:500;}
</style>
<script>

</script>
<header class="header task-top frv" style="line-height: 2rem">
<i class="iconfont icon-Toright" style="position:absolute;height:2rem;width:2rem;" onclick="history.back(-1)"></i>分享
</header>
<div style="text-align:center;"> <br><br><img src="<%=BusiConstant.context+path %>"></div>
<div style="text-align:center;font-size:20px;">专属邀请码<%=code %></div>
</body></html>