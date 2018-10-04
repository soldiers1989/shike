<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="co.kensure.mem.DateUtils" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
    String day1 = DateUtils.format(new Date(),DateUtils.DAY_FORMAT);
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>试呗网</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/Common.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript"
            src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>

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
    

<link href="<%=BusiConstant.shikemobilepath %>/index/resource/swiper.min.css" rel="stylesheet">
<script src="<%=BusiConstant.shikemobilepath %>/index/resource/swiper.min.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/index/resource/jquery.lazyload.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/index/resource/vue.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/index/resource/jquery.infinitescroll.js"></script>
<style>
    /*html .shangxin-goods-box>div li .t-btn, html .report, html .jp-con, html .jp-con .jp-list li div.jp-btn a, html .info-num, html .fix-detail .info-num li, html .info-foot div:first-child{
        border-width:2px;
    }
    html .indexCat .indexCat1, html .indexCat .indexCat2, html .indexCat .indexCat3, html .indexCat .indexCat4{
        border-width:4px;
    }*/

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
<script>
    var userid = 0;
    var myGold = "0";
    var SecKillTime=Math.floor('0'/1000);
    var sortY='3';
    var showZt = 'False';
    var showAlert='True';
    $(function() {
        //if (globle.isWeixin()) {
        //    $(".go-mj").fadeIn();
        //}
        if (SecKillTime > 0) {
            var downTime = setInterval(function() {
                $(".down-time span").eq(0).text("0"+Math.floor(SecKillTime / 3600));
                var minit = Math.floor(SecKillTime / 60) % 60;
                $(".down-time span").eq(1).text((minit>=10?"":"0")+minit);
                var sec = SecKillTime % 60;
                $(".down-time span").eq(2).text((sec>=10?"":"0")+sec);
                SecKillTime--;
                if (SecKillTime == 0) {
                    $(".down-time").html('<p style="font-size: 0.5rem;margin-top:-0.2rem;">14-21点开抢</p>');
                    clearInterval(downTime);
                }
            }, 1000);
        } else {
            $(".down-time").html('<p style="font-size: 0.5rem;margin-top:-0.2rem;">14-21点开抢</p>');
        }
        $(".go-mj").on("click",function(){
            if($(this).data("href")){
                location.href=$(this).data("href");
            }else{
                $(".new-alert").show();
            }
        });
       
        var alertCookie=getCookie("alert");
        var alertData=new Date();

        var alertStr=alertData.getFullYear()+"/"+(alertData.getMonth()+1)+"/"+alertData.getDate();

        var alertCookie2=getCookie("alert2");
        var alertData=new Date();
        if(alertCookie!=alertStr&&userid<=0){
            setCookie("alert",alertStr);
            $(".new-alert").css("display","block");
        }
        if(userid > 0 & alertCookie2 != alertStr) {
            if($(".new-alert2").length > 0) {
                setCookie("alert2",alertStr);
                $(".new-alert2").css("display","flex");
            }
        }
    });

    function setCookie(c_name,value,expiredays)
    {
        //expiredays = expiredays ? expiredays : 30;   
        var exdate=new Date()
        exdate.setDate(exdate.getDate()+expiredays)
        document.cookie=c_name+ "=" +escape(value)+
        ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
    }
    function getCookie(name2){
        var cookie = {};
        var all = document.cookie;
        if( all == "" ){
            return {};
        }
        var list = all.split(";");
        for( var i = 0; i < list.length; i++ ){
            var cok = list[i];
            var p = cok.indexOf("=");
            var name = cok.substring( 0,p ).trim();
            var value = cok.substring(p+1);
            value = decodeURIComponent( value );
            cookie[ name ] = value;
        }
        return cookie[name2];
    }
</script>
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/index/resource/index.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/index.js?var=<%=BusiConstant.version %>"></script>
<%--
<a class="go-mj" data-href="" style="display:block;">
    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/new-people.png">
</a>--%>
<%--
<div class="new-alert" style="display: block;">
    <div class="new-con">
      
        <a href="http://m.meilipa.com/home/list"></a>
    </div>
    <i class="iconfont icon-error1" onclick="$(&#39;.new-alert&#39;).hide();"></i>
</div>--%>

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
        <i class="iconfont icon-sign" onclick="location.href=#"></i>
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
                <div class="swiper-slide swiper-slide-active" style="width: 354px;">
                    <a href="#" onclick="updateAdvClick(43)"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/2a5740e8-b8fc-4061-8253-33febbb34ed4"></a>
                </div>
                <div class="swiper-slide swiper-slide-next" style="width: 354px;">
                    <a href="#" onclick="updateAdvClick(59)"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/1a0d3ec3-549c-437a-a0af-baa6c9bf23e1"></a>
                </div>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span class="swiper-pagination-bullet"></span></div>
    </div>
    <ul class="jp-icon">
        <li>
            <a href="#">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon1.png">
                <span>新人必中</span>
            </a>
        </li>
        <li>
            <a href="#">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon2.png">
                <span>VIP</span>
            </a>
        </li>
        <li>
                <a href="#">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon3.png">
                <span>领998元</span>
            </a>
            
        </li>
        <li>
            <a href="#">
                <img class="zuan" src="<%=BusiConstant.shikemobilepath %>/index/resource/zuan10.png" alt="Alternate Text">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon4.png">
                <span>分享赚钱</span>
            </a>
        </li>
        <li>
            <a href="<%=BusiConstant.shike_haohuo.getKey() %>?minprice=100">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon13.png">
                <span>高价值</span>
            </a>
        </li>
        <%--<li>
            
                <a href="http://m.meilipa.com/home/list?orderType=3">
                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon11.png">
                    <span>京东试用</span>
                </a>
            
            
        </li>
        <li>
            <a href="http://m.meilipa.com/help/lottery">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon7.png">
                <span>中奖秘籍</span>
            </a>
        </li>
        <li>
                 <a href="http://m.meilipa.com/help/applyshop">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon8.png">
                <span>月入过万</span>
            </a>
           
        </li>
        <li>
            <a href="http://m.meilipa.com/help/InviteArts">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon9.png">
                <span>赚钱秘籍</span>
            </a>
        </li>
        <li>
            <a href="http://m.meilipa.com/Lottery">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/icon12.png">
                <span>金币抽奖</span>
            </a>
        </li>--%>
    </ul>
    <%--<div class="report">
        &lt;%&ndash;<img src="<%=BusiConstant.shikemobilepath %>/index/resource/report.png" alt="Alternate Text">&ndash;%&gt;
            <ul style="margin-top: 0px;">

                <li><em>[aa***] </em>获得<em> 0.35元 </em>邀请粉丝下单奖</li>
                <li><em>[bbb***] </em>获得<em> 0.38元 </em>邀请粉丝下单奖</li>
                <li><em>[cc***] </em>获得<em> 0.13元 </em>邀请粉丝下单奖</li>
                <li><em>[dd***] </em>获得<em> 0.32元 </em>邀请粉丝下单奖</li>
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
            background: url(/content/images/jpin/dian-red.jpg) repeat-x;
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

            <a class="right-title" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&bigStartTime=<%=day1 %>">今日上新<strong id="jrsxCount" style="margin: 0 0.1rem;">29205</strong>件好货 <i class="iconfont icon-gengduo1"></i></a>
        </div>
        <div class="shangxin-goods-box">
            <div>
                <ul id="jinrilist" style="width:32.112rem">

                </ul>
            </div>

        </div>
    </div>
    <%--<div class="usera-kong"></div>
    <div class="indexCat">
        <a class="indexCat1" href="http://m.meilipa.com/jing/SecKill">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/indexCat5.png" alt="Alternate Text">

            <div class="down-time"><p style="font-size: 0.5rem;margin-top:-0.2rem;">14-21点开抢</p></div>
        </a>

        <a href="http://m.meilipa.com/home/list?orderType=5" class="indexCat2">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/indexCat2.png" alt="Alternate Text">
        </a>
        <a class="indexCat3" href="http://m.meilipa.com/jing/goldHit">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/indexCat3.png" alt="Alternate Text">
        </a>
        <div style="clear: both;"></div>
    </div>
    <div class="usera-kong"></div>--%>
    <%--<div class="jp-groom-bg">
        <div class="groom-title">
            推荐好货
        </div>
        <div class="jp-groom">
            <div>
                <ul style="width:33.03rem;">
                        <li>
                            <a data-id="90441" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2GJT4qrZnBKNjSZFhXXc.oXXa_!!3948168074.jpg">
                                <span class="t-price">¥299.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="92048" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB23lW8gY_0UKFjy1XaXXbKfXXa_!!2739068054.jpg">
                                <span class="t-price">¥377.72</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="84568" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2z7CYDY1YBuNjSszeXXablFXa_!!458372346.jpg">
                                <span class="t-price">¥59.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="80365" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2uJ1kd4tnkeRjSZSgXXXAuXXa_!!4013498542.jpg">
                                <span class="t-price">¥49.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="91186" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2Yz_5rZj_B1NjSZFHXXaDWpXa_!!2878098883.jpg">
                                <span class="t-price">¥118.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="89288" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011imtKAFwowI4pdg_!!287124456.jpg">
                                <span class="t-price">¥19.70</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="91619" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2c3uUjz3z9KJjy0FmXXXiwXXa_!!1048677106.jpg">
                                <span class="t-price">¥148.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="91370" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN012DiXebgUHS5AkL5_!!1891858643.jpg">
                                <span class="t-price">¥58.00</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                        <li>
                            <a data-id="92695" class="tod">
                                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2R4eaG4GYBuNjy0FnXXX5lpXa_!!3965335301.jpg">
                                <span class="t-price">¥29.90</span>
                                <span class="t-btn">免费申请</span>
                            </a>
                        </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>--%>

    <style>
        .clnz_box{
            padding:0.469333rem 0 0 0.469333rem;
            background:#fff;
        }
        .clnz_img{
            height:4.48rem;
            display:block;
            padding-bottom:0.64rem;
            padding-right:0.469333rem;
        }
        .clnz_img>img{
            width:100%;
            height:100%;
        }
        .clnz_box .jp-groom{
            height:5.9rem;
        }
        .clnz_box .jp-groom>div{
            padding-left:0;
        }
        .clnz_box .jp-groom>div>ul{
            display:block;
            height:5.548rem;
            padding-right:0rem;
        }
        .clnz_box .jp-groom>div>ul>li{
            margin-right:0.554rem;
            float:left;
            height:100%;
        }
        .clnz_box .jp-groom>div>ul>li:last-child{
            margin-right:0;
        }
        .clnz_box .jp-groom>div>ul a{
            width: 3.84rem;
            display:block;
            height:100%;
            position:relative;
        }
        .clnz_box .jp-groom>div>ul p{
             overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;

            -webkit-margin-before: 0em;
            -webkit-margin-after: 0em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;

            text-align: left;
            transform: scale(0.8);
            margin-left: -0.5rem;
            width: 125%;
            line-height:1rem;
        }
        .clnz_box .jp-groom>div>ul img{
            width:3.84rem;
            height:3.84rem;
            display:block;
        }
        .clnz_box .jp-groom>div>ul .scale>span{
            line-height:1;
            font-size: 0.512rem;
            vertical-align:middle;
            margin:0;
        }
        .clnz_box .jp-groom>div>ul .t-price{
        }
         .clnz_box .jp-groom>div>ul .rt{
             color:#999;
        }
        .scale {
            transform-origin: left;
            padding-top:0.2rem;
            position:absolute;
            transform:scale(0.8);
            width:125%;
        }
    </style>
        <div class="clnz_box">
            <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=1" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz1.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <%-- 女装 --%>
                    <ul id="nvzhuanglist" style="width:26.279333rem">

                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=2" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz2.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <%-- 男装 --%>
                    <ul id="nanzhuanglist" style="width:26.279333rem">

                    </ul>
                </div>
            </div>
        </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=4" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz3.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 鞋子箱包 --%>
                <ul id="xiangbaolist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=5" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz5.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 日用百货 --%>
                <ul id="baihuolist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=7" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz4.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 数码家电 --%>
                <ul id="dianqilist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=10" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz6.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 家居建材 --%>
                <ul id="jiajulist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=6" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz7.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 母婴用品 --%>
                <ul id="muyinglist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>
    <div class="clnz_box">
        <a class="clnz_img" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1&amp;typeid=8" style="color:#333;">
            <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz8.png" alt="">
        </a>
        <div class="jp-groom">
            <div>
                <%-- 美妆用品 --%>
                <ul id="meizhuanglist" style="width:26.279333rem">

                </ul>
            </div>
        </div>
    </div>
    <div class="usera-kong"></div>

    </div>
<%--
<div id="detail" class="fix-detail showHidden"><div onclick="toIndex()" class="toback to-index"><i class="iconfont icon-back1"></i></div> <div id="swiper2" class="swiper-container"><div class="swiper-wrapper"><div class="swiper-slide"><img src="http://m.meilipa.com/"></div> <div class="swiper-slide"><img src="http://m.meilipa.com/"></div> <div class="swiper-slide"><img src="http://m.meilipa.com/"></div> <div class="swiper-slide"><img src="http://m.meilipa.com/"></div></div> <div class="swiper-pagination"></div> <div style="position: absolute; left: 0px; bottom: 0px; z-index: 10; display: none;"><span style="float: left; color: rgb(255, 255, 255); font-size: 0.6rem; height: 0.8rem; line-height: 0.8rem; padding: 0px 0.1rem; background: rgb(249, 127, 41);">送金币</span></div></div> <div class="info-hd"><p class="title"><span class="" style="margin-right: 0.1rem;"></span> <span class="name" style="max-width: 14rem;"></span> <!----> <!----> <!----> <!----></p> <span>价值 <em>¥</em></span> <span>剩余  份</span> <!----> <!----> <!----></div> <!----> <!----> <ul class="info-num"><li><span>人 已申请</span></li> <li><span>人 已中奖</span></li></ul> <div class="usera-kong"></div> <div class="info-cat"><span class="act">商品详情</span> <span>猜你喜欢</span></div> <div class="info-list  jp-con"><div class="act"><div class="intro"></div> <div id="guss-like"><div><i class="iconfont icon-xin"></i><span>猜你喜欢</span></div></div> <ul id="list-apply1" class="jp-list"></ul> <div id="get-more" class="get-more"><a href="http://m.meilipa.com/home/list?orderType=5">加载更多</a></div></div> <div class="jp-con"><ul id="list-apply" class="jp-list"></ul> <div class="get-more"><a href="http://m.meilipa.com/home/list?orderType=5">加载更多</a></div></div></div> <div id="flow2" class="flow-con"><div class="code-con"><div class="dona-bottom"><h1 style="font-size: 0.7rem; margin: 1.3866rem 0px; text-align: center; font-weight: 600;">温馨提示</h1> <div class="not-area-tips"><h2 style="margin-bottom: 0.3rem; font-weight: normal;">此商品以下地区不发货：</h2> <h2 style="line-height: 1.024rem;"></h2></div> <span class="btn confirm-btn" style="color: rgb(255, 255, 255);">确定</span></div></div></div></div>
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
        <a class="get-invite"></a>
        <a id="applyText" class="get-apply"></a>
    </div>
    
    <div class="flex-bg"></div>
    <div class="flow-con" id="flow">
        <div class="code-con">
            <div class="dona-bottom">
                <h3 id="detail-type">试用流程</h3>
                <div>
                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/flow.png" alt="" class="dona-image">
                </div>
                <span class="btn">取消</span>
            </div>
        </div>
    </div>--%>


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
    <a href="http://m.meilipa.com/" onclick="clickNumber(0)">
        <img src="http://m.meilipa.com/" alt="sk_gotourl">
    </a>
        <i class="iconfont icon-error1"></i>
</div>
<script>

    $(function () {


    });
</script>
        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
       <%-- <div class="toTop" onclick="$(&#39;body,html&#39;).animate({scrollTop:0},500);">--%>
    </div>

    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/index/resource/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/jquery.form.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/Validform_v5.3.2.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/post.loading.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/layer.m.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/layerdialog.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/jquery.cookie.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/browser.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/app.js"></script>


</body></html>