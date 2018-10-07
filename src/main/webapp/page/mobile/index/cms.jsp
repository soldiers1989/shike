<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.user.model.SKUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>${cms.title }</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
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
    
<link href="<%=BusiConstant.shikemobilepath %>/index/zjmj/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/zjmj/index.css">

<link href="<%=BusiConstant.shikemobilepath %>/index/zjmj/animate.min.css" rel="stylesheet">
<script>
    function altImg(parameters) {
        // myAlert("<img class='layerimg' src='/content/images/JPin/linglaG.jpg'/>")
    }
</script>
<style>
    .layerimg{width:10rem;}
     .lottery > img {
        width: 100%;
        height: auto;
        margin: 0 !important;
        display: block;
        padding: 0 !important;
    }
    .lottery ul li {
        padding: 0 1.3rem 0.4rem;
        height: 2.5rem;
        margin:0 !important;
    }

    .lottery ul li div{font-size: 0.55rem; font-weight: bold; display: flex; align-items: center;justify-content: space-between;}
    .lottery ul li div {padding:0.25rem 0.5rem;border: 2px solid #333333;border-radius:0.4rem;}
    .lottery ul li div span, .lottery ul li div a {
        height: 1.5rem;
        width: 3.87rem;
        background-image: url(/Content/images/help/mj4.jpg);
        background-size: 100% 100%;
        color: #333;
        line-height: 1.3rem; text-align: center;
        font-weight: bold;
        font-size: 0.65rem;
    }
    .lottery ul li div span{ background: none; }
    .lottery ul li div>em:first-child{min-width: 35%;}
    .lottery ul {
        background-image: url(/content/images/help/mj5.jpg);
        background-size: 100% auto;
    }
</style>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="location.href = &#39;<%=BusiConstant.shike_index.getKey() %>&#39;"></i>
    ${cms.title }
</header>
 <div style="height: 2rem"></div>
<div class="lottery">
    ${cms.content }
     
</div>
<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8" type="text/javascript"></script>

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