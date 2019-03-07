<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="keywords" content="<%=BusiConstant.keywords %>">
        <meta name="description" content="<%=BusiConstant.description %>">
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
        <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">
        <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">
        <script type="text/javascript" src="<%=BusiConstant.context %>/common/base.js?ver=<%=BusiConstant.version%>"></script>
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
        <link href="<%=BusiConstant.shikemobilepath %>/common/css/layer.css" type="text/css" rel="styleSheet" id="layermcss">
    </head>

<body>
    
<link href="<%=BusiConstant.shikemobilepath %>/common/css/swiper.min.css" rel="stylesheet">
<script src="<%=BusiConstant.shikemobilepath %>/common/js/swiper.min.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.infinitescroll.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/vue.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.lazyload.js"></script>
<script>
    var order = 0;
</script>
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/haohuonew/resource/index.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuonew/resource/list.js?ver=<%=BusiConstant.version%>"></script>


<div class="jp-fixed-top" style="border-bottom: 1px solid #ddd;height: auto;">
    <div class="jp-hd">
        <a href="#">
            <i class="iconfont icon-xianshangchongzhi" style="font-size: 0.89rem;color: #a5a5a5;"></i>
        </a>
        <div>
            <input id="search-input" placeholder="搜索你喜欢的宝贝" type="text" class="search-input">
            <span class="iconfont icon-search"></span>
        </div>
         <i class="iconfont icon-sign" onclick="location.href= &#39;<%=BusiConstant.shike_jinbi.getKey() %>&#39;;"></i>
    </div>
    <div class="jp-cat-bg">
        <div class="jp-cat">
            <ul>
                <li>
                    <a data-href="" class="act">全部</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="plat" id="plat" style="background: #f5f5f5;">
        <div class="div-container" style="width: 23rem;">
            <span class="<c:if test="${empty param.hdtypeid}">act</c:if>" data-num="">全部</span>
            <span class="<c:if test="${param.hdtypeid == '1'}">act</c:if>" data-num="1">普通试用</span>
            <span class="<c:if test="${param.hdtypeid == '3'}">act</c:if>" data-num="3">高价值</span>
            <span class="<c:if test="${param.hdtypeid == '4'}">act</c:if>" data-num="4">必中任务</span>
            <span class="<c:if test="${param.hdtypeid == '6'}">act</c:if>" data-num="6">拼团</span>
            <span class="<c:if test="${param.jiangli == '1'}">act</c:if>" data-num="5">有奖任务</span>
            <span class="<c:if test="${param.hdtypeid == '7'}">act</c:if>" data-num="7">有奖拼团</span>
        </div>
    </div>
    <div class="jp-con">
        <ul class="con-cat">
            <li class="<c:if test="${empty param.order}">act</c:if>"><a data-href="0">综合</a></li>
            <li class="<c:if test="${param.order == '1'}">act</c:if>" ><a data-href="1">最新<i class="iconfont icon-sortD"></i></a></li>
            <li class="<c:if test="${param.order == '2'}">act</c:if>" ><a data-href="2">价值<i class="iconfont icon-sortD"></i></a></li>
            <li class="<c:if test="${param.order == '3'}">act</c:if>" ><a data-href="3">人气<i class="iconfont icon-sortD"></i></a></li>
            <li class="shaixuan-last"><a data-shaixuan="true">筛选<i class="iconfont icon-shaixuan"></i></a></li>
        </ul>
    </div>
</div>
<div class="jp-shaixuan-box">
    <div class="jp-shaixuan">
        
        <div class="main">
            <%--<div class="main-kuai">
                <p class="title">其他筛选</p>
                <div class="main-btn">
                         <span class="noApply">我未申请的</span>
                    <span class="isSendGold">送金币</span>
                </div>
            </div>
            <div class="main-kuai">
                <p class="title">支持支付方式</p>
                <div class="main-btn money-cat">
                    <span data-num="1">信用卡</span>
                    <span data-num="2">花呗/京东白条</span>
                    <span data-num="3">优惠券</span>
                </div>
            </div>--%>
            <div class="main-kuai">
                <p class="title">价格区间（元）</p>
                <div class="main-btn  main-shaixuan clearfix">
                    <input type="number" maxlength="7" class="shaixuan-min" placeholder="最低价">
                    <em></em>
                    <input type="number" maxlength="7" class="shaixuan-max" placeholder="最高价">
                </div>
            </div>
        </div>
        <div style="width:100%;height:3.7rem;"></div>
        <div class="foot clearfix">
            <button class="reset">重置</button>
            <button class="completed">完成</button>
        </div>
    </div>
</div>
<div id="index">
    <div style="height:5.5rem;background: #f5f5f5;"></div>
    <div class="jp-con" id="goods" style="border:none;">
        
        <div class="no-search" style="display: none;">
            <i class="iconfont icon-search"></i>
            <p>没有找到相关商品</p>
        </div>
        <ul id="list" class="jp-list">

        </ul>
    </div>
</div>


<style>
    .down-app {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1000000;
        background: rgba(0,0,0,0.7);
    }

        .down-app img {
            position: absolute;
            width: 14.5rem;
            height: 15.36rem;
            left: 0.75rem;
            top: 50%;
            margin-top: -8.68rem;
        }

        .down-app .iconfont {
            display: block;
            position: absolute;
            top: 50%;
            margin-top: 7.5rem;
            color: #fff;
            font-size: 2rem;
            margin-left: -1rem;
            left: 50%;
            z-index: 10;
        }
</style>
<div class="down-app">
    <a href="https://m.meituitui.com/other/appdownload" onclick="clickNumber(62)">
        <img src="<%=BusiConstant.shikemobilepath %>/haohuonew/resource/34b78bb2-4e27-4f9d-b460-8cebf69d5a94" alt="sk_gotourl">
    </a>
        <i class="iconfont icon-error1"></i>
</div>
<script>

   
</script>
<div id="detail" class="fix-detail showHidden">
    <input type="hidden" id="baobeiId">
    <div onclick="toIndex()" class="toback to-index"><i class="iconfont icon-back1"></i></div>
    <div id="swiper2" class="swiper-container" style="position: relative;">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img id="logo_pic1" src="#"></div>
            <div class="swiper-slide"><img id="logo_pic2" src="#"></div>
            <div class="swiper-slide"><img id="logo_pic3" src="#"></div>
            <div class="swiper-slide"><img id="logo_pic4" src="#"></div>
        </div>
        <div class="swiper-pagination"></div>
        <div style="position: absolute; left: 0px; bottom: 0px; z-index: 10; display: none;"><span
                style="float: left; color: rgb(255, 255, 255); font-size: 0.6rem; height: 0.8rem; line-height: 0.8rem; padding: 0px 0.1rem; background: rgb(249, 127, 41);">送金币</span>
        </div>
    </div>
    <div class="info-hd"><p class="title"><span class="" style="margin-right: 0.1rem;"></span> <span class="name" id="activity_name"
                                                                                                     style="max-width: 14rem;"></span>
        <em id="huabei" style="display: none">花呗</em><em id="xinyongka" style="display: none">信用卡</em>
        <!----> <!----> <!----> <!----></p> <span>价值 <em id="salePrice">¥</em></span><span id="jiangli"></span> <span id="shengyu">剩余  份</span> <!----> <!----> <!----></div>
    <!----> <!---->
    <ul class="info-num">
        <li><span id="ysqnum">人 已申请</span></li>
        <li><span id="yzj">人 已中奖</span></li>
    </ul>
    <div class="usera-kong"></div>
    <div class="info-cat"><span class="act">商品详情</span> <%--<span>问题答疑</span>--%></div>
    <div class="info-list">
        <div class="act  jp-con">
            <div class="intro"></div>
            <div id="guss-like">
                <div><i class="iconfont icon-xin"></i><span>猜你喜欢</span></div>
            </div>
            <ul id="list-apply1" class="jp-list"></ul>
            <div id="get-more" class="get-more"><a href="#">加载更多</a></div>
        </div>
        <div class="jp-con">
            <ul id="list-apply" class="jp-list"></ul>
            <div class="get-more"><a href="#">加载更多</a></div>
        </div>
    </div>
    <div id="flow2" class="flow-con">
        <div class="code-con">
            <div class="dona-bottom"><h1
                    style="font-size: 0.7rem; margin: 1.3866rem 0px; text-align: center; font-weight: 600;">温馨提示</h1>
                <div class="not-area-tips"><h2 style="margin-bottom: 0.3rem; font-weight: normal;">此商品以下地区不发货：</h2>
                    <h2 style="line-height: 1.024rem;"></h2></div>
                <span class="btn confirm-btn" style="color: rgb(255, 255, 255);">确定</span></div>
        </div>
    </div>
</div>
<div class="info-foot">
    <div>
        <a href="javascript:void(0)" class="back">
            <i class="iconfont icon-fanhui to-index"></i>
            <span class="to-index">返回</span>
        </a>
    </div>
    <div class="show-flow">
        <i class="iconfont icon-sort"></i>
        <span>流程</span>
    </div>
    <a id="get-invite" class="get-invite"></a>
    <a id="applyText" onclick="shenqin()" class="get-apply"></a>
</div>

<div class="flex-bg"></div>
<div class="flow-con" id="flow">
    <div class="code-con">
        <div class="dona-bottom">
            <h3 id="detail-type">试用流程</h3>
            <div>
                <img src="<%=BusiConstant.shikemobilepath %>/haohuonew/resource/flow.png" alt="" class="dona-image">
            </div>
            <span class="btn">取消</span>
        </div>
    </div>
</div>


        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
        <%--<div class="toTop" onclick="$(&#39;body,html&#39;).animate({scrollTop:0},500);">--%>
    </div>
<div id="loading" class="loading" style="display: none;">
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

    <script type="text/javascript">
        function dictsucdo(data){
            window.location.href="<%=BusiConstant.shike_gouwuche.getKey()%>?id=" + $("#baobeiId").val();
        }
        function shenqin(){
            var data = {id: $("#baobeiId").val()};
            checkuser();
            var url = "<%=BusiConstant.shike_shenqing_do.getKey()%>";
            postdo(url, data, dictsucdo,null, null);
        }

        function checkuser(){
            var mdtype = $.cookie("mdtype");
            if(!mdtype || mdtype != 1){
                window.location.href="<%=BusiConstant.shike_login.getKey()%>";
            }
        }
    </script>

</body></html>