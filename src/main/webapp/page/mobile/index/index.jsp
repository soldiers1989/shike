<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;">

<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <title>试呗网</title>
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
    <script type="text/javascript" src="<%=BusiConstant.context %>/jqtable/jquery.min.js"></script>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/index/resource/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    

<link href="<%=BusiConstant.shikemobilepath %>/common/css/swiper.min.css" rel="stylesheet">
<script src="<%=BusiConstant.shikemobilepath %>/common/js/swiper.min.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.lazyload.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.infinitescroll.js"></script>
<style>
    html .jp-groom>div ul li span.t-price{
        background:none;
        text-decoration:line-through;
    }
    .new-alert{position:fixed;z-index:10000;height:100%;width:100%;background:rgba(0,0,0,0.5);display:none;}
    .new-alert div.new-con{width:12.52rem;height:15.06rem;background:url(/Content/images/JPin/new-alert.png);position:absolute;top:50%;left:50%;margin-top:-7.53rem;margin-left:-6.26rem;
     background-size:100% auto;background-repeat:no-repeat;background-position:center center;}
    .new-alert .icon-error1{display:block;position:absolute;top:50%;left:50%;margin-top:8.4rem;color:#fff;width:2rem;text-align:center;margin-left:-1rem;font-size:1.5rem;}
    .new-alert em {color:#ef883c;}
 
    .new-alert div.new-con a{display:block;width:6.2rem;height:1.6rem;margin:12.5rem auto 0;}
</style>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/index.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/index.js?var=<%=BusiConstant.version %>"></script>


    <style>
        .new-alert2{
            position: fixed;
            z-index: 10000;
            height: 100%;
            width: 100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            display:none;
            flex-direction:column;
        }
        .new-alert2>img{
            max-width: 100%;
            max-height: 100%;
        }
        .new-alert2 .iconBox{
            width: 100%;
            height: 2rem;
            margin-top:1rem;
            vertical-align: middle;
        }
        .new-alert2 .icon-error1{
            display: block;
            color: #fff;
            width: 2rem;
            text-align: center;
            font-size: 1.5rem;
            width: 100%;
        }
    </style>


<div class="jp-fixed-top">
    <div class="jp-hd">
        <a href="#">
            <i class="iconfont icon-xianshangchongzhi" style="font-size: 0.89rem;color: #a5a5a5;"></i>
        </a>
        <div>
            <input placeholder="搜索你喜欢的宝贝" type="text" class="search-input">
            <span class="iconfont icon-search"></span>
        </div>
        <i class="iconfont icon-sign" onclick="location.href= &#39;<%=BusiConstant.shike_jinbi.getKey() %>&#39;;"></i>
    </div>
    <div class="jp-cat-bg">
        <div class="jp-cat">
            <ul>
                <li>
                    <a href="<%=BusiConstant.shike_haohuo.getKey() %>" class="act">全部</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div id="index">
    <div style="height: 3.5rem;"></div>
    <div id="swiper" class="swiper-container swiper-container-horizontal">
        <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 300ms;">
            <c:forEach items="${banner}" var="item">
                <div class="swiper-slide swiper-slide-next" style="width: 354px;">
                    <a href="<%=BusiConstant.shike_cms_page.getKey() %>${item.id}" onclick="updateAdvClick(59)"><img src="${item.url }"></a>
                </div>
            </c:forEach>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span></div>
    </div>
    <ul class="jp-icon">
        <li>
            <a href="<%=BusiConstant.shike_haohuo.getKey() %>?hdtypeid=4">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon1.png">
                <span>必中任务</span>
            </a>
        </li>
        <li>
            <a href="<%=BusiConstant.shike_zjmj.getKey() %>">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon7.png">
                <span>中奖秘籍</span>
            </a>
        </li>
        <%--<li>
            <a href="<%=BusiConstant.shike_zqmj.getKey() %>">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon9.png">
                <span>赚钱秘籍</span>
            </a>
        </li>--%>
        <li>
            <a href="<%=BusiConstant.shike_haohuo.getKey() %>?hdtypeid=3">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon13.png">
                <span>高价值</span>
            </a>
        </li>
         <li>
            <a href="<%=BusiConstant.shike_help_page.getKey() %>/0">
                <%--<img class="zuan" src="<%=BusiConstant.shikemobilepath %>/index/resource/zuan10.png" alt="Alternate Text">--%>
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon4.png">
                <span>新手教程</span>
            </a>
        </li>
        <li>
            <a href="<%=BusiConstant.shike_haohuo.getKey() %>?jiangli=1">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon12.png">
                <span>有奖任务</span>
            </a>
        </li>
    </ul>
    <%--<div class="report">
        &lt;%&ndash;<img src="<%=BusiConstant.shikemobilepath %>/index/resource/report.png" alt="Alternate Text">&ndash;%&gt;
            <ul style="margin-top: 0px;">
                <li><em>[aa***] </em>获得<em> 0.35元 </em>邀请粉丝下单奖</li>
            </ul>
    </div>--%>
    <div class="usera-kong"></div>

    <style>
        .jp-groom-bg-shangxin {
            background: url("<%=BusiConstant.shikemobilepath %>/common/images/lijishangxin.png") left top no-repeat #fff;
            background-size: 100%;
            height: 8.895rem;
            padding:0 0.68rem;
        }
        .shangxin-title-box{    
            padding: 0.68rem 0 0.23rem 0;
        }
        .shangxin-title-box .shangxin-title{
            font-size: 0.85rem;
            color: #fff;
            font-weight: bold;
        }
        .shangxin-title-box .right-title{
            float:right;
            line-height: 1.2rem;
            color:#fff;
        }
         .shangxin-title-box .right-title i{
             display: inline-block;
             vertical-align: middle;
             margin-left:0.1rem;
             margin-top: -0.05rem;
         }
         .shangxin-goods-box{
             padding-top: 0.368rem;
             overflow:hidden;
             height:5.705rem;
             width:100%;
             box-shadow: 1px 7px 15px -9px #888888;
             background:#fff;
         }
         .shangxin-goods-box>div{
            height: 8rem;
            overflow-x: scroll;
            -webkit-overflow-scrolling: touch;
         }
         .shangxin-goods-box>div ul{
             height:5.61rem;
             padding-left:0.368rem;
         }
         .shangxin-goods-box > div li {
            float: left;
            /*height:5.61rem;*/
            height: 5.337rem;
            width: 3.2rem;
            margin-right: 0.368rem;
            
         }        
         .shangxin-goods-box>div li:last-child{
             margin-right:0;
         }
         .shangxin-goods-box>div li img{
             width:3.2rem;
             height:3.2rem;
             display:block;
         }
         .shangxin-goods-box>div li a{
             display:block;
             text-align:center;
         }
         .shangxin-goods-box>div li .t-price {
            font-size: 0.55rem;
            display: inline-block;
            margin: 0.2rem auto 0.1rem;
            color: #ff464e;
            background: url(<%=BusiConstant.shikemobilepath %>/common/images/dian-red.jpg) repeat-x;
            background-position: center center;
         }
         .shangxin-goods-box>div li .t-btn {
            border-radius: 0.2rem;
            color: #ff464e;
            height: 1rem;
            font-size: 0.55rem;
            line-height: 1rem;
            margin: 0 0.3rem;
            display: block;
            border: 1px solid #ff464e;
         }
    </style>
    <div class="jp-groom-bg jp-groom-bg-shangxin">
        <div class="shangxin-title-box clearfix">
            <span class="shangxin-title">今日上新</span>

            <a class="right-title" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1">今日上新<strong id="jrsxCount" style="margin: 0 0.1rem;">0</strong>件好货 <i class="iconfont icon-gengduo1"></i></a>
        </div>
        <div class="shangxin-goods-box">
            <div>
                <ul id="jinrilist" style="width:99%">

                </ul>
            </div>

        </div>
    </div>
 
      
    <div class="usera-kong"></div>

    <div class="jp-con" id="goods">
        <ul class="con-cat">
            <li class="act"><a href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1">最新<i class="iconfont icon-sortD"></i></a></li>
            <li class=""><a href="<%=BusiConstant.shike_haohuo.getKey() %>?order=2">价值<i class="iconfont icon-sortD"></i></a></li>
            <li class=""><a href="<%=BusiConstant.shike_haohuo.getKey() %>?order=3">人气<i class="iconfont icon-sortD"></i></a></li>
        </ul>


        <ul id="list" class="jp-list">

        </ul>
    </div>

    </div>

        <jsp:include page="../common/footer.jsp" flush="true"/>
      
    </div>

    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/common/images/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/post.loading.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layer.m.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layerdialog.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.cookie.js"></script>

</body></html>

