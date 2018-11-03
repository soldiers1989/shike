<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>订单详情</title>
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
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>

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
    
<link href="<%=BusiConstant.shikemobilepath %>/wdhd/ddxq/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/ddxq/index.css">

<link href="<%=BusiConstant.shikemobilepath %>/wdhd/ddxq/flow.css" rel="stylesheet">
<header class="header task-top frv" style="line-height: 2rem">
    <i class="iconfont icon-Toright" onclick="history.back(-1)"></i>
    订单详情
</header>
<div style="height: 2rem"></div>
<div class="Flow">
    <%--<p class="flow-num">订单号：251555555553976967</p>--%>
    <div class="Flow-hd">
            <img src="${skBaobei.zturl}">
        <ul>
            <li><span class="iconfont icon-tb"></span> <span> ${skBaobei.title}</span></li>
            
            <li>店铺名称：<span>${skBaobei.dpnameS}</span></li>
            
            <li class="gray">价格：${skBaobei.salePrice} 元</li>
            <li class="gray" onclick="myAlert(&#39;${skBaobei.guige}&#39;)">规格：${skBaobei.guige}</li>
        </ul>

    </div>
    <div style="height: 1.6rem; line-height: 1.4rem; text-align: center;">

        <i class="iconfont icon-QQ"
           style="display: inline; color: #00ADE1; display: inline-block; vertical-align: middle;"></i> <span
            style="display: inline-block; vertical-align: middle;">商家QQ：<em style="color:#999;">${skDianPu.qq}</em></span>
    </div>
    <div class="usera-kong"></div>
    <div class="flow-item">
        <p>加入购物车</p>
        <div>
            <i class="iconfont icon-shijian"></i><span>${dpm.createdTimeStr }</span>
            <c:if test='${empty dpm}'>
                <span class="btn gray">未完成</span>
            </c:if>
            <c:if test='${!empty dpm}'>
                <span class="btn no-event red-white">已完成</span>
            </c:if>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="flow-item">
        <p>收藏/关注宝贝和店铺</p>
        <div>
            <i class="iconfont icon-shijian"></i><span>${sc.createdTimeStr }</span>
            <c:if test='${empty sc}'>
                <span class="btn gray">未完成</span>
            </c:if>
            <c:if test='${!empty sc}'>
                <span class="btn red-white" data-link="xgscgz">查看</span>
            </c:if>
        </div>
    </div>
    <div class="usera-kong"></div>

    <div class="flow-item">
        <p>订单信息</p>
        <div>
            <i class="iconfont icon-shijian"></i><span>${dd.createdTimeStr }</span>
            <c:if test='${empty dd}'>
                <span class="btn gray">未完成</span>
            </c:if>
            <c:if test='${!empty dd}'>
                <span class="btn red-white" data-link="xgdd">查看</span>
            </c:if>
        </div>
    </div>
    <div class="usera-kong"></div>

    <div class="flow-item">
        <p>好评信息</p>
        <div>
            <i class="iconfont icon-shijian"></i><span>${hp.createdTimeStr }</span>
            <c:if test='${empty hp}'>
                <span class="btn gray">未完成</span>
            </c:if>
            <c:if test='${!empty hp}'>
                <span class="btn red-white" data-link="xghp">查看</span>
            </c:if>
        </div>
    </div>

    <div class="usera-kong"></div>
</div>

<script type="text/javascript">
    var orderid = '0';

    $(".info-cat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
    })

    $(".flow-con span.btn").on("click", function () {
        $(".flow-con").slideUp();
    });

    $(".show-flow").on("click", function () {
        $(".flow-con").fadeIn();
    })
    $(".flow-item .btn").on("click", function () {
        if ($(this).hasClass("gray")) {
            return false;
        }
        if ($(this).hasClass("no-event")) {
            return false;
        }
        var title = $(this).data("link");
        var h = 11;

        var html = "";
        if (title == "xgscgz") {
            html = '<div><iframe src="<%=BusiConstant.shike_xgscgz.getKey() %>?id=${skSkqk.id }" style="height:12rem"></iframe></div>';
        } else if (title == "xgdd") {
            html = '<div><iframe src="<%=BusiConstant.shike_xgdd.getKey() %>?id=${skSkqk.id }" style="height:12rem"></iframe></div>';
        } else if (title == "xghp") {
            html = '<div><iframe src="<%=BusiConstant.shike_xghp.getKey() %>?id=${skSkqk.id }" style="height:14rem"></iframe></div>';
        }
        //底部对话框
        <%--var html =--%>
        <%--'<div><iframe src="<%=BusiConstant.shike_xgscgz.getKey() %>?id=${skSkqk.id }" style="height:' + h + 'rem"></iframe></div>';--%>
        layer.open({
            type: 1,
            content: html,
            anim: 'up',
            style: "position:fixed; bottom:0; left:0;width:100%;box-sizing:border-box; font-family:Microsoft Yahei;padding:0.4rem;",
            shadeClose: true
        });

    })

</script>

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