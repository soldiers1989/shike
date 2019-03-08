<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
	SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <title>商品详情</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/style.css">
    <script type="text/javascript" src="<%=BusiConstant.context %>/common/base.js?ver=<%=BusiConstant.version%>"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>
	<link href="<%=BusiConstant.shikemobilepath %>/index/resource/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/index.css">
	<link href="<%=BusiConstant.shikemobilepath %>/common/css/swiper.min.css" rel="stylesheet">
	<script src="<%=BusiConstant.shikemobilepath %>/common/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layer.m.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layerdialog.js"></script>
    <body>
    
    
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
           </p> <span>价值 <em id="realPrice" style="text-decoration:none">¥</em></span> <span>返还 <em id="salePrice" style="text-decoration:none">¥</em></span> <span id="jiangli"></span> <span id="shengyu">剩余  份</span></div>
  
        <ul class="info-num">
            <li><span id="ysqnum">人 已申请</span></li>
            <li><span id="yzj">人 已中奖</span></li>
        </ul>
        <div class="usera-kong"></div>
        <div class="info-cat"><span class="act">商品详情</span> </div>
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
    <div class="info-foot" style="display:block">
        <div>
            <a href="javascript:toIndex()" class="back">
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
    
	</body>
  
  
</html>
 <script type="text/javascript" src="<%=BusiConstant.context %>/page/mobile/detail/js/detail.js?ver=<%=BusiConstant.version%>"></script>
<script>
getDetail(<%=baobei.getId()%>);

function shenqin(){
    var data = {id: $("#baobeiId").val()};
    checkuser();
    var url = "<%=BusiConstant.shike_shenqing_do.getKey()%>";
    postdo(url, data, dictsucdo,null, null);
}
function dictsucdo(data){
    window.location.href="<%=BusiConstant.shike_gouwuche.getKey()%>?id=" + $("#baobeiId").val();
}

function checkuser(){
    var mdtype = $.cookie("mdtype");
    if(!mdtype || mdtype != 1){
        window.location.href="<%=BusiConstant.shike_login.getKey()%>";
    }
}
</script>
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