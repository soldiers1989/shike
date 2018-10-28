<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>帮助中心</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/help/layer.css" type="text/css" rel="styleSheet" id="layermcss"><link href="<%=BusiConstant.shikemobilepath %>/mine/help/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/help/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/help/list.css">

<link href="<%=BusiConstant.shikemobilepath %>/mine/help/swiper.min.css" rel="stylesheet">
<link href="<%=BusiConstant.shikemobilepath %>/mine/help/animate.min.css" rel="stylesheet">
<link href="<%=BusiConstant.shikemobilepath %>/mine/help/layer(1).css" rel="stylesheet">
<%--<script src="<%=BusiConstant.shikemobilepath %>/mine/help/layer.m.js"></script>--%>
<script src="<%=BusiConstant.shikemobilepath %>/mine/help/swiper.jquery.min.js"></script>
<style>
    .header {z-index: 1000000;}
    .ques-list {
        border-bottom: 1px solid #efefef;
    }

    #list-con > div.act1 {
        height: auto;
    }

    .swiper-container img {
        width:80%;
        display: block; margin: 0 auto;
        height: auto;
    }

    #list-con > div {
        height: 0;
        overflow: hidden;
    }
</style>
<script>
    $(function () {
        $(".ques-list li").on("click", function () {
            // $($(this).data("id")).siblings("div").removeClass("act1");
            // $($(this).data("id")).toggleClass("act1");
            // if ($($(this).data("id")).hasClass("act1")) {
            //     layer.open({
            //         content: '左右滑动查看完整流程', skin: 'msg'
            //    , time: 2 //2秒后自动关闭
            //     });
            // }
        });
        var mySwiper1 = new Swiper('#swiper1', {
            pagination: '.swiper-pagination',
        })
        var mySwiper2 = new Swiper('#swiper2', {
            pagination: '.swiper-pagination',
        })
        var mySwiper3 = new Swiper('#swiper3', {
            pagination: '.swiper-pagination',
        })
        var mySwiper4 = new Swiper('#swiper4', {
            pagination: '.swiper-pagination',
        })
    });
</script>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="history.back(-1)"></i>
    帮助中心
</header>
<div style="height: 2rem"></div>
<div id="list-con">

    <c:forEach items="${sk}" var="item">
         <ul class="ques-list">
        <li data-id="#con${item.id}" onclick="location.href=&#39;<%=BusiConstant.shike_help_page.getKey() %>/${item.id}&#39;;"><i class="iconfont icon-share1"></i>${item.title } <i class="iconfont icon-Toleft"></i></li>
        </ul>
        <div id="con1" class="<c:if test='${obj.id == item.id}'>act1</c:if>">
                ${obj.content}
        </div>
    </c:forEach>
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