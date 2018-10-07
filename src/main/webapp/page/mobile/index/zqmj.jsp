<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.user.model.SKUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>赚钱秘籍</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://test.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script>
        var userId=0;
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
    
<link href="<%=BusiConstant.shikemobilepath %>/common/cdd/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/list.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/iconfont.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/goods.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zqmj/mytryout.css">

<style>
    body{background: #ff4f69;}
    .art img {
        animate-duration: 1s;
        -ms-animation-duration: 1s;
        -o-animation-duration: 1s;
        -webkit-animation-duration: 1s;
    }
</style>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="location.href = &#39;<%=BusiConstant.shike_index.getKey() %>&#39;"></i>
    中奖秘籍
</header>

<%--<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="history.back(-1)"></i>
   
            <div class="syyh" style="border: 1px solid #ececec">
                <div class="trial" style="background-color:#ff464e;color:white">代言人秘籍</div>
                <div class="Forthe" style="background-color:#fff;color:#333" onclick="location = &#39;/help/applyshop&#39;">
                    微客秘籍
                </div>
            </div>
</header>--%>
 <div style="height: 2rem"></div>
<div class="art">
    <img class="" data-class="animated" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj1-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj2-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj3-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj4-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj5-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj6-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj7-2.png" alt="Alternate Text">
    <img class="" data-class="animated bounceIn" src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj8-2.png" alt="Alternate Text">
    <div style="height: 2rem"></div>
</div>
<%--
<div class="art-bottom">
    <a href="http://test.com/Invitation/InvitationqrCode">
        <img src="<%=BusiConstant.shikemobilepath %>/index/zqmj/mj9.png" alt="Alternate Text">
    </a>
</div>--%>
<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/index/zqmj/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/index/zqmj/core.php" charset="utf-8" type="text/javascript"></script>

<div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/common/images/loading.gif">
    </div>
</div>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.form.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Validform_v5.3.2.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/post.loading.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layer.m.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layerdialog.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.cookie.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/browser.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/app.js"></script>


</body></html>