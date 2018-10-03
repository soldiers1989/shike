<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
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

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/index/resource/index.js"></script>
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
            <a href="#">
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
    <div class="report">
        <%--<img src="<%=BusiConstant.shikemobilepath %>/index/resource/report.png" alt="Alternate Text">--%>
        <ul style="margin-top: 0px;">
                    
        <li><em>[迷路***] </em>获得<em> 0.35元 </em>邀请粉丝下单奖</li><li><em>[1丽宁***] </em>获得<em> 0.38元 </em>邀请粉丝下单奖</li><li><em>[_王老***] </em>获得<em> 0.13元 </em>邀请粉丝下单奖</li><li><em>[Uniq***] </em>获得<em> 0.32元 </em>邀请粉丝下单奖</li><li><em>[冰激***] </em>获得<em> 1.00元 </em>邀请粉丝下单奖</li><li><em>[wang***] </em>获得<em> 0.10元 </em>邀请粉丝下单奖</li><li><em>[bobo***] </em>获得<em> 0.10元 </em>邀请粉丝下单奖</li><li><em>[??***] </em>获得<em> 0.68元 </em>邀请粉丝下单奖</li><li><em>[dlf1***] </em>获得<em> 0.14元 </em>邀请粉丝下单奖</li><li><em>[梦里***] </em>获得<em> 0.47元 </em>邀请粉丝下单奖</li><li><em>[zzzz***] </em>获得<em> 0.27元 </em>邀请粉丝下单奖</li><li><em>[对你***] </em>获得<em> 0.10元 </em>邀请粉丝下单奖</li><li><em>[流浪***] </em>获得<em> 0.40元 </em>邀请粉丝下单奖</li><li><em>[_王老***] </em>获得<em> 0.15元 </em>邀请粉丝下单奖</li><li><em>[雨晴***] </em>获得<em> 0.43元 </em>邀请粉丝下单奖</li><li><em>[ting***] </em>获得<em> 0.09元 </em>邀请粉丝下单奖</li><li><em>[woai***] </em>中了<em>  吊篮吊椅藤椅秋千鸟巢摇椅... </em></li><li><em>[岩岩***] </em>中了<em> 时尚钢托聚拢显瘦泳衣新款 </em></li><li><em>[蓝天***] </em>中了<em> 麻花宽松网红毛衣女学生 </em></li><li><em>[Bona***] </em>中了<em> 女士朋克风灯芯绒外套 </em></li><li><em>[苏晓***] </em>中了<em> 长毛水貂绒马夹显瘦 </em></li><li><em>[cctv***] </em>中了<em> 九阳电饭煲一个+窗帘样品 </em></li><li><em>[xiao***] </em>中了<em> 宽松慵懒风V领格子毛衣女 </em></li><li><em>[阿白***] </em>中了<em>  韩版复古眼镜框圆形宽边 </em></li><li><em>[王爱***] </em>中了<em> 军绿长款水貂绒大衣 </em></li><li><em>[裸奔***] </em>中了<em> 雄狮高档香水摆座 </em></li><li><em>[高瑾***] </em>中了<em>  吊篮吊椅藤椅秋千鸟巢摇椅... </em></li><li><em>[安久***] </em>中了<em> 连帽卫衣女春秋新款韩版宽松... </em></li><li><em>[吴莉***] </em>中了<em> 套装女（裤子+衬衫） </em></li><li><em>[LOVE***] </em>中了<em> 九阳电饭煲+窗帘样品 </em></li><li><em>[钱钱***] </em>中了<em> 嘻哈红帽套头红卫衣 </em></li><li><em>[喜气***] </em>中了<em> 羊毛中山装男外套 男士商务... </em></li><li><em>[wang***] </em>中了<em> 黄色加绒卫衣女长袖 </em></li><li><em>[D云兮***] </em>中了<em> 中老年长袖加厚T恤 </em></li><li><em>[天天***] </em>中了<em> 蚕丝被 1.5m*2m 3斤 </em></li><li><em>[念之***] </em>中了<em> 长毛水貂绒毛衣双层加厚宽松... </em></li><li><em>[xueq***] </em>中了<em> 韩版羽绒棉服 </em></li><li><em>[源小***] </em>中了<em> 长毛水貂绒马夹显瘦 </em></li><li><em>[传奇***] </em>中了<em> 羊毛中山装男外套 男士商务... </em></li><li><em>[没意***] </em>中了<em> 连帽卫衣女春秋新款韩版宽松... </em></li><li><em>[无敌***] </em>中了<em> 男士皮衣 </em></li><li><em>[贠菇***] </em>获得<em> 0.45元 </em>邀请粉丝下单奖</li><li><em>[小雨***] </em>获得<em> 0.59元 </em>邀请粉丝下单奖</li><li><em>[高扬***] </em>获得<em> 0.07元 </em>邀请粉丝下单奖</li><li><em>[刘圣***] </em>获得<em> 0.18元 </em>邀请粉丝下单奖</li><li><em>[_王老***] </em>获得<em> 0.07元 </em>邀请粉丝下单奖</li><li><em>[馨懿***] </em>获得<em> 0.27元 </em>邀请粉丝下单奖</li><li><em>[MME] </em>获得<em> 0.28元 </em>邀请粉丝下单奖</li><li><em>[??***] </em>获得<em> 0.78元 </em>邀请粉丝下单奖</li><li><em>[阿菲***] </em>获得<em> 0.29元 </em>邀请粉丝下单奖</li></ul>
    </div>
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

            <a class="right-title" href="<%=BusiConstant.shike_haohuo.getKey() %>?order=1">今日上新<strong id="jrsxCount" style="margin: 0 0.1rem;">29205</strong>件好货 <i class="iconfont icon-gengduo1"></i></a>
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
    <div class="usera-kong"></div>
    <div class="jp-groom-bg">
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
        <%--<div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz1.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB27P11qH3nBKNjSZFMXXaUSFXa_!!83067502.jpg">
                                    <p>简雅多色大杯无钢圈文胸一件</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥17.80</span>
                                        <span class="rt">限84份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2bRbcakzoK1RjSZFlXXai4VXa_!!3877875633-0-item_pic.jpg">
                                    <p>透气硅胶胸垫一对</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥29.00</span>
                                        <span class="rt">限39份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2saxHXNvzQeBjSZFMXXcVfFXa_!!354829425.jpg">
                                    <p>棒球服情侣卫衣韩版情侣开衫学生班服秋</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥118.00</span>
                                        <span class="rt">限7份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN0123iPNhoVsPguSAM_!!356237289.jpg">
                                    <p>品牌正品打底裤一条</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥27.00</span>
                                        <span class="rt">限27份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011ISZkUmIdqIR1HL_!!65210892.jpg">
                                    <p>sk春秋打底裤一条</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥28.00</span>
                                        <span class="rt">限27份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=1" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2OPBXeXLM8KJjSZFBXXXJHVXa_!!1595887680.jpg">
                                    <p>秋冬韩版新款网红毛衣女</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥120.00</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>--%>
        <%--<div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz2.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1nQ89XwHqK1RjSZJnXXbNLpXa_!!0-item_pic.jpg">
                                    <p>日系复古风宽松灯芯绒裤</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥89.00</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2hAhPtDCWBKNjSZFtXXaC3FXa_!!3335579532.jpg">
                                    <p>男士秋季长袖T恤</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥88.00</span>
                                        <span class="rt">限20份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2hAhPtDCWBKNjSZFtXXaC3FXa_!!3335579532.jpg">
                                    <p>男士秋季长袖T恤</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥88.00</span>
                                        <span class="rt">限20份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2aU4ApYwrBKNjSZPcXXXpapXa_!!757602351.jpg">
                                    <p>加绒冲锋衣一件</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥49.00</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1lZghmxtnkeRjSZSgXXXAuXXa_!!0-item_pic.jpg">
                                    <p>男士皮衣</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥238.00</span>
                                        <span class="rt">限6份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=2" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2OT0xxXkoBKNjSZFkXXb4tFXa_!!3879903778-0-item_pic.jpg">
                                    <p>男士长袖T恤</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥68.00</span>
                                        <span class="rt">限10份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz3.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011kcTYHHLDMYzXNv_!!664134704.jpg">
                                    <p> 棉拖鞋一双</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥9.90</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011togea4RCL4Xbhx_!!1810705949.jpg">
                                    <p> 棉拖鞋 居家鞋 一双</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥9.90</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011kcTYHPH3mOPAzU_!!664134704.jpg">
                                    <p>运动鞋 男鞋 小白鞋 板鞋 学生鞋</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥37.80</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011kcTY7ybtuB7Afz_!!664134704.jpg">
                                    <p>运动鞋 小白鞋 学生鞋 女鞋 跑步鞋</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥39.80</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2Ky6aJeuSBuNjSsziXXbq8pXa_!!4037844894.jpg">
                                    <p>一双潮袜男潮街头欧美嘻哈韩版中筒袜一双</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥10.80</span>
                                        <span class="rt">限36份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=4" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2.iMBXHrpK1RjSZTEXXcWAVXa_!!2706745878.jpg">
                                    <p>5双简约男士女士短袜</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥16.90</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz4.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN0128sYELFiUKcyxEw_!!3960797988.jpg">
                                    <p>图片中手机壳（不包括挂绳和毛球）</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥23.80</span>
                                        <span class="rt">限15份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN0128sYEEWj1N24KYD_!!3960797988.jpg">
                                    <p>华为nova2s手机壳（不带挂绳）</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥25.80</span>
                                        <span class="rt">限31份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011NtfFjWu86vVGk5_!!198831628.jpg">
                                    <p>USB摄像头 笔记本外置摄像机 </p>
                                    <div class="scale">
                                        <span class="lf t-price">¥25.00</span>
                                        <span class="rt">限16份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/5b5abf67Nc98263d9.jpg">
                                    <p>锌合金快充苹果数据线一条</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥28.00</span>
                                        <span class="rt">限50份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011eWAOwemxeY2wJK_!!4131113878.jpg">
                                    <p>手机支架粉嫩金属扣一件</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥15.00</span>
                                        <span class="rt">限18份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=7" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1Bdq4azfguuRjSspaXXaXVXXa_!!0-item_pic.jpg">
                                    <p>手机支架指环一个</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥6.80</span>
                                        <span class="rt">限18份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz5.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2CVlfrkZmBKNjSZPiXXXFNVXa_!!93173187.jpg">
                                    <p>日系字母成人毛巾 2条</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥29.80</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011Ck5C1ymDdtbkxY_!!2116650118.jpg">
                                    <p>不锈钢摇摇杯运动水杯便携健身奶昔杯</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥17.80</span>
                                        <span class="rt">限54份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/57d90f37N3815ffab.jpg">
                                    <p>一个热水袋 一条腰带</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥69.00</span>
                                        <span class="rt">限100份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN012A15E1vHMamJQ1w_!!2778208142.jpg">
                                    <p>防油贴纸5米</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥18.90</span>
                                        <span class="rt">限54份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1bBIfKpXXXXX9aXXXXXXXXXXX_!!0-item_pic.jpg">
                                    <p>多功能衣架3个</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥9.80</span>
                                        <span class="rt">限92份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=5" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011hvIzIFAxgMo3DI_!!3562404339.jpg">
                                    <p>去除脚鸡眼膏贴肉刺祛趾鸡尤液足部手部</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥45.90</span>
                                        <span class="rt">限50份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz6.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011pFdsxiLR2pr64b_!!4103005331.jpg">
                                    <p>置物架</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥30.00</span>
                                        <span class="rt">限39份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB22L2AqHwrBKNjSZPcXXXpapXa_!!1968025037-0-item_pic.jpg">
                                    <p>十字绣马到成功150*60厘米</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥55.00</span>
                                        <span class="rt">限42份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2JEpNo8DH8KJjy1zeXXXjepXa_!!1968025037.jpg">
                                    <p>钻石画流水生财130*60</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥57.00</span>
                                        <span class="rt">限42份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2RJ9Jg5AnBKNjSZFvXXaTKXXa_!!1873630522.jpg">
                                    <p>小吊灯一个</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥24.75</span>
                                        <span class="rt">限18份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2H3sBwOMnBKNjSZFCXXX0KFXa_!!3053393950.jpg">
                                    <p>桌面书架 竹</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥25.00</span>
                                        <span class="rt">限39份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=10" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011n4zRRVSsAadr81_!!1968025037.jpg">
                                    <p>钻石画马到成功</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥52.00</span>
                                        <span class="rt">限20份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz7.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2Ed28uQomBKNjSZFqXXXtqVXa_!!715907316.jpg">
                                    <p>玫红色儿童演出服舞蹈裙</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥36.00</span>
                                        <span class="rt">限17份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN0120LYluS26ZKzxzv_!!205736833.jpg">
                                    <p>婴儿童必备四季保温吸盘碗碗</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥19.00</span>
                                        <span class="rt">限45份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011VhJUp9KQW0z2sX_!!2586662684.jpg">
                                    <p>秋款0-3岁宝宝学步鞋一双</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥29.00</span>
                                        <span class="rt">限36份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2PhZozv5TBuNjSspmXXaDRVXa_!!1069622388.jpg">
                                    <p>产后收腹带</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥49.00</span>
                                        <span class="rt">限80份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN012Bc0m901OT5U2Yk_!!1661398358.jpg">
                                    <p>四双装秋冬宝宝纯棉袜</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥25.80</span>
                                        <span class="rt">限56份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=6" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/O1CN011UFXryqLjg3RGJY_!!2390952488.jpg">
                                    <p>婴儿鞋袜一双</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥16.80</span>
                                        <span class="rt">限75份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>
        <div class="clnz_box">
            <a class="clnz_img" href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                <img src="<%=BusiConstant.shikemobilepath %>/index/resource/clnz8.png" alt="">
            </a>
            <div class="jp-groom">
                <div>
                    <ul style="width:26.279333rem">
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2DQPdtpuWBuNjSspnXXX1NVXa_!!2568866821.jpg">
                                    <p>希罗气垫BB霜单只 无替换芯</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥98.00</span>
                                        <span class="rt">限20份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2YheRXFzqK1RjSZFvXXcB7VXa_!!2667728970.jpg">
                                    <p>novo16色眼影</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥16.80</span>
                                        <span class="rt">限12份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB15brupXuWBuNjSspnXXX1NVXa_!!0-item_pic.jpg">
                                    <p>希罗丝绒亚光唇釉一支</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥98.00</span>
                                        <span class="rt">限42份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB2fovKoQUmBKNjSZFOXXab2XXa_!!1998008735.jpg">
                                    <p>蘑菇头网红气垫bb霜保湿持久遮瑕学生</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥79.00</span>
                                        <span class="rt">限42份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1agkMwrArBKNjSZFLXXc_dVXa_!!0-item_pic.jpg">
                                    <p>素颜霜50g和美白面膜</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥19.99</span>
                                        <span class="rt">限52份</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                
                                <a href="http://m.meilipa.com/home/list?order=1&amp;type=8" style="color:#333;">
                                    <img src="<%=BusiConstant.shikemobilepath %>/index/resource/TB1IHYIXrvpK1RjSZPiXXbmwXXa_!!0-item_pic.jpg">
                                    <p>水光针原液玻尿酸深层保湿精华一盒</p>
                                    <div class="scale">
                                        <span class="lf t-price">¥98.00</span>
                                        <span class="rt">限30份</span>
                                    </div>
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="usera-kong"></div>--%>

    <%--<div class="jp-con" id="goods">
        <ul class="con-cat">
            <li class=""><a href="http://m.meilipa.com/home/list?order=1">最新<i class="iconfont icon-sortD"></i></a></li>
            <li class=""><a href="http://m.meilipa.com/home/list?order=2">价值<i class="iconfont icon-sortD"></i></a></li>
            <li class="act"><a href="http://m.meilipa.com/home/list?order=3">人气<i class="iconfont icon-sortD"></i></a></li>
        </ul>
        <ul id="list" class="jp-list"><li><a data-id="90441" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/3948168074/TB2GJT4qrZnBKNjSZFhXXc.oXXa_!!3948168074.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 特价家用吊篮抖音吊椅藤椅单人成人室内</p> <div class="jp-num"><span>¥299.00</span> <span>73214人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90441" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90441" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92048" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/2739068054/TB23lW8gY_0UKFjy1XaXXbKfXXa_!!2739068054.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 吊篮吊椅藤椅秋千鸟巢摇椅</p> <div class="jp-num"><span>¥377.72</span> <span>25245人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92048" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92048" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="80019" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/401176042/TB243TbtRjTBKNjSZFwXXcG4XXa_!!401176042-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 充气不倒翁玩具</p> <div class="jp-num"><span>¥26.90</span> <span>23404人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="80019" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=80019" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92027" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/856209972/TB2HdS8BuOSBuNjy0FdXXbDnVXa_!!856209972.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 时尚韩版羽绒棉服</p> <div class="jp-num"><span>¥128.00</span> <span>22955人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92027" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92027" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="79218" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/458372346/TB2z7CYDY1YBuNjSszeXXablFXa_!!458372346.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 男女宝宝裤子春秋儿童一件</p> <div class="jp-num"><span>¥59.00</span> <span>20843人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="79218" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=79218" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90376" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i4/2126271513/O1CN011N2zhUibWkIE7qK_!!2126271513.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 早秋时尚两件套</p> <div class="jp-num"><span>¥153.00</span> <span>19180人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90376" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90376" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91186" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/2878098883/TB2Yz_5rZj_B1NjSZFHXXaDWpXa_!!2878098883.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 早秋慵懒小香风甜美少女内搭针织连衣裙</p> <div class="jp-num"><span>¥118.00</span> <span>18929人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91186" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91186" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="84568" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/458372346/TB2z7CYDY1YBuNjSszeXXablFXa_!!458372346.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 男女宝宝裤子春秋儿童一件</p> <div class="jp-num"><span>¥59.00</span> <span>18836人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="84568" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=84568" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88909" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i1/2854957458/TB29bLIAiCYBuNkHFCcXXcHtVXa_!!2854957458.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 蚕丝被1.5m*2m3斤</p> <div class="jp-num"><span>¥158.00</span> <span>18170人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88909" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88909" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91370" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i4/1891858643/O1CN012DiXebgUHS5AkL5_!!1891858643.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 花架子多层室内特价省空间阳台绿萝实木</p> <div class="jp-num"><span>¥58.00</span> <span>17761人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91370" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91370" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="80365" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/https://img.alicdn.com/imgextra/i1/4013498542/TB2uJ1kd4tnkeRjSZSgXXXAuXXa_!!4013498542.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 化妆刷套装</p> <div class="jp-num"><span>¥49.00</span> <span>17074人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="80365" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=80365" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="79692" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i1/3478570853/O1CN011IAiIUsOWTzg8Mw_!!3478570853.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 风干牛肉干500克</p> <div class="jp-num"><span>¥43.80</span> <span>16988人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="79692" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=79692" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89288" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/287124456/O1CN011imtKAFwowI4pdg_!!287124456.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 新鲜上市突尼斯软籽石榴3斤</p> <div class="jp-num"><span>¥19.70</span> <span>16903人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89288" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89288" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90057" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i1/2/TB1V5M8k4tnkeRjSZSgXXXAuXXa_!!2-item_pic.png" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 喇叭袖毛衣女针织衫chic上衣</p> <div class="jp-num"><span>¥86.00</span> <span>16368人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90057" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90057" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89201" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i4/1729537783/TB2pSG5XdVIxuRjHxmxXXX2gFXa_!!1729537783.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 时尚羽绒棉服</p> <div class="jp-num"><span>¥128.00</span> <span>16084人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89201" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89201" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89616" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i3/2136221385/TB2SsT0dwaTBuNjSszfXXXgfpXa_!!2136221385.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 宽松慵懒针织开衫女</p> <div class="jp-num"><span>¥126.00</span> <span>15781人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89616" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89616" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91619" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/1048677106/TB2c3uUjz3z9KJjy0FmXXXiwXXa_!!1048677106.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 真皮小白鞋</p> <div class="jp-num"><span>¥148.00</span> <span>15451人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91619" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91619" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90313" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i2/593972756/O1CN011WEI0ezH4nmOmTo_!!593972756.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 秋季新款牛仔裤女</p> <div class="jp-num"><span>¥79.00</span> <span>15266人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90313" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90313" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90380" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i1/1727414059/TB2xmi7H7yWBuNjy0FpXXassXXa_!!1727414059.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 韩版羽绒棉服</p> <div class="jp-num"><span>¥118.00</span> <span>15226人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90380" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90380" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92695" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/3965335301/TB2R4eaG4GYBuNjy0FnXXX5lpXa_!!3965335301.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 抱枕长条枕妇睡觉神器男朋友长抱枕</p> <div class="jp-num"><span>¥29.90</span> <span>14956人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92695" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92695" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92003" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/73563463/TB2SFATbMCYW1JjSZFCXXcxLVXa_!!73563463.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 时尚羽绒棉服</p> <div class="jp-num"><span>¥128.00</span> <span>14084人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92003" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92003" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93197" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/2186384735/TB2LSN7BhWYBuNjy1zkXXXGGpXa_!!2186384735-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 时尚羽绒棉服面包服</p> <div class="jp-num"><span>¥88.00</span> <span>13840人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93197" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93197" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93213" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i3/1051919441/O1CN012Jc1iO8s0cI9gOM_!!1051919441.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 麻花宽松网红毛衣女学生</p> <div class="jp-num"><span>¥128.00</span> <span>13807人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93213" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93213" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88917" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/0/TB1KwxqwkomBKNjSZFqXXXtqVXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 垃圾袋一卷三十只</p> <div class="jp-num"><span>¥5.00</span> <span>13787人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88917" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88917" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="76761" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i3/4079551956/O1CN011QJt9dqXvPAOV77_!!4079551956.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 花梨木筷子5双</p> <div class="jp-num"><span>¥9.99</span> <span>13649人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="76761" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=76761" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91917" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i1/2188498822/O1CN012F2WY1AqDJWMX1R_!!2188498822.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 新款打底衫高领显瘦加厚毛衣女学生</p> <div class="jp-num"><span>¥79.00</span> <span>12514人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91917" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91917" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90112" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/79445886/O1CN011tLphLTpUJmfKaO_!!79445886.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 0-3岁儿童卫衣</p> <div class="jp-num"><span>¥51.00</span> <span>12296人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90112" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90112" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90037" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/2188498822/TB2Lutpl2ImBKNjSZFlXXc43FXa_!!2188498822.png" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 秋冬新款木耳边针织打底衫毛衣女短款</p> <div class="jp-num"><span>¥78.00</span> <span>12098人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90037" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90037" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90851" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i1/1595887680/TB2ffRPr7UmBKNjSZFOXXab2XXa_!!1595887680.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 秋冬新款韩版宽松粗毛线毛衣</p> <div class="jp-num"><span>¥123.00</span> <span>12058人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90851" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90851" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91241" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/2213064679/TB2_JQpaRfH8KJjy1XbXXbLdXXa_!!2213064679.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 双面呢版型貂绒大衣大码宽松</p> <div class="jp-num"><span>¥353.00</span> <span>11966人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91241" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91241" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93055" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/3930699061/TB1YpMfXXzqK1RjSZFoXXbfcXXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 越南大青芒</p> <div class="jp-num"><span>¥48.80</span> <span>11781人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93055" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93055" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89279" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/0/TB1fuMJEER1BeNjy0FmXXb0wVXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 明星同款套头毛衣</p> <div class="jp-num"><span>¥125.00</span> <span>11748人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89279" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89279" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89289" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/2213064679/TB2c5sMwSMmBKNjSZTEXXasKpXa_!!2213064679-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 军绿长款水貂绒大衣</p> <div class="jp-num"><span>¥258.00</span> <span>11088人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89289" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89289" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="72872" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i4/127258894/TB2Ac2UpIIrBKNjSZK9XXagoVXa_!!127258894.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> clio极细眼线笔一只</p> <div class="jp-num"><span>¥69.00</span> <span>11055人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="72872" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=72872" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92849" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i4/919204342/TB2uDZCDeSSBuNjy0FlXXbBpVXa_!!919204342.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 大毛领修身羽绒棉服</p> <div class="jp-num"><span>¥108.00</span> <span>10969人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92849" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92849" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89648" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i3/1661312307/O1CN011SueB3UP9GCugb3_!!1661312307.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 短靴35-39码</p> <div class="jp-num"><span>¥68.00</span> <span>10956人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89648" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89648" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91496" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i2/1079849911/TB2aoMBpEOWBKNjSZKzXXXfWFXa_!!1079849911.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 男童长裤</p> <div class="jp-num"><span>¥19.80</span> <span>10619人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91496" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91496" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90025" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/3429728785/O1CN012ElZtLvm9r013p1_!!3429728785.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 吸水浴巾</p> <div class="jp-num"><span>¥56.90</span> <span>10349人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90025" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90025" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89551" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i2/387192687/O1CN011ViggEXoPtanDkk_!!387192687.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 女童连衣裙2018新款秋季两件套</p> <div class="jp-num"><span>¥79.00</span> <span>10184人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89551" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89551" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92662" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i3/1595887680/TB2TptVjxtnkeRjSZSgXXXAuXXa_!!1595887680.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 宽松套头麻花针织衫</p> <div class="jp-num"><span>¥123.00</span> <span>10151人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92662" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92662" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91373" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/1765982230/O1CN011SLNgFb6rltFZEl_!!1765982230.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 早秋喇叭裤女显瘦九分裤</p> <div class="jp-num"><span>¥109.00</span> <span>10012人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91373" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91373" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91676" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/3256017490/TB2Op1puEOWBKNjSZKzXXXfWFXa_!!3256017490-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 套装女（裤子+衬衫）</p> <div class="jp-num"><span>¥128.00</span> <span>9953人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91676" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91676" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90259" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i1/251084929/TB2pC3Td9fD8KJjSszhXXbIJFXa_!!251084929.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 长毛水貂绒马夹显瘦</p> <div class="jp-num"><span>¥183.00</span> <span>9847人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90259" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90259" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89073" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/2080955510/TB2RtKKwOQnBKNjSZFmXXcApVXa_!!2080955510-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 高腰冬季加绒抗起球打底裤</p> <div class="jp-num"><span>¥56.00</span> <span>9808人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89073" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89073" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91957" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/1626801922/O1CN011Q4JhEhdEclWBjc_!!1626801922.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 男士毛衣一件</p> <div class="jp-num"><span>¥136.00</span> <span>9676人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91957" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91957" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88582" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/1638716936/O1CN01216jZIvFgOSRaTr_!!1638716936.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 蜻蜓单鞋</p> <div class="jp-num"><span>¥68.00</span> <span>9359人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88582" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88582" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89992" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/3429728785/O1CN012ElZtLvm9r013p1_!!3429728785.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 成人浴巾</p> <div class="jp-num"><span>¥56.90</span> <span>9346人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89992" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89992" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92768" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/3694313291/TB1K47cawHqK1RjSZFgXXa7JXXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 宝宝学步鞋男女秋冬季0-1岁防滑软底</p> <div class="jp-num"><span>¥35.90</span> <span>9286人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92768" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92768" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="68572" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/3108680944/TB2MLVhXs4IxuRkSO2gXXaynXXa_!!3108680944-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 潮男新款拼接长袖衬衫大码夜店酒吧</p> <div class="jp-num"><span>¥19.00</span> <span>9002人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="68572" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=68572" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90019" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/1088993802/O1CN011dxMIIsIrrCND6Q_!!1088993802.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 加绒加厚卫裤女</p> <div class="jp-num"><span>¥78.00</span> <span>8983人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90019" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90019" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91847" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/324448963/O1CN012G56OYGSoD2oMkQ_!!324448963.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 女士朋克风灯芯绒外套</p> <div class="jp-num"><span>¥140.00</span> <span>8745人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91847" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91847" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90665" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/2213064679/TB2qtRKXbvpK1RjSZFqXXcXUVXa_!!2213064679-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 短款貂绒外套显高西装毛绒上衣</p> <div class="jp-num"><span>¥203.00</span> <span>8646人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90665" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90665" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89946" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i3/0/TB14tgrJKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 大码飞行员褶皱夹克</p> <div class="jp-num"><span>¥98.00</span> <span>8593人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89946" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89946" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88818" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/2925044404/TB219tKw21TBuNjy0FjXXajyXXa_!!2925044404-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 1-3岁宝宝配对积木玩具</p> <div class="jp-num"><span>¥29.80</span> <span>8573人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88818" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88818" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88731" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/3519573586/TB2LUIqwyMnBKNjSZFzXXc_qVXa_!!3519573586-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 蝴蝶兰花苗盆栽带花剑花卉盆栽植物大苗</p> <div class="jp-num"><span>¥18.80</span> <span>8573人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88731" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88731" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90863" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/2969170809/TB2ea9yeZbI8KJjy1zdXXbe1VXa_!!2969170809.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 足浴桶</p> <div class="jp-num"><span>¥78.00</span> <span>8560人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90863" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90863" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="81248" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/2932460249/TB2Uec2p_qWBKNjSZFxXXcpLpXa_!!2932460249-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 秋季新款男士格子衬衫</p> <div class="jp-num"><span>¥69.00</span> <span>8329人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="81248" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=81248" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91996" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/2124152490/TB2XaINv8smBKNjSZFFXXcT9VXa_!!2124152490.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 保暖内衣</p> <div class="jp-num"><span>¥109.00</span> <span>8191人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91996" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91996" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92937" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/2261951609/TB1htbyd0LO8KJjSZPcXXaV0FXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 牛仔裤女小脚裤</p> <div class="jp-num"><span>¥69.00</span> <span>8138人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92937" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92937" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92467" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/92408026/O1CN01299xHQIKUf165jz_!!92408026.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 章丘铁锅</p> <div class="jp-num"><span>¥38.00</span> <span>8131人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92467" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92467" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89490" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/2441431787/O1CN011P4UE10NQ3mGgE8_!!2441431787.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 时尚网纱中长款半身裙秋冬季女2018</p> <div class="jp-num"><span>¥39.80</span> <span>8039人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89490" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89490" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91682" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i4/258821268/O1CN011LEmfY2U9G7E9hV_!!258821268.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 弹力修身打底裤女</p> <div class="jp-num"><span>¥118.00</span> <span>7880人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91682" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91682" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88803" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/1121890579/O1CN011G9DmLDxXkTEHRi_!!1121890579.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 书包双肩包背包女包</p> <div class="jp-num"><span>¥39.00</span> <span>7854人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88803" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88803" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89611" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i1/1803341719/TB2wMKwHL5TBuNjSspmXXaDRVXa_!!1803341719.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> ins少女心公主床边地毯水洗地垫10</p> <div class="jp-num"><span>¥76.56</span> <span>7715人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89611" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89611" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="81096" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/3955916641/TB2vykhyRyWBuNkSmFPXXXguVXa_!!3955916641.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 创意挂钩</p> <div class="jp-num"><span>¥68.00</span> <span>7610人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="81096" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=81096" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89184" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i3/2554331609/TB2sn0sfN1YBuNjy1zcXXbNcXXa_!!2554331609.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 飘窗垫80*160</p> <div class="jp-num"><span>¥60.00</span> <span>7544人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89184" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89184" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89375" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i3/482448316/O1CN012BIm8jJW43TYjkf_!!482448316.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 加绒保暖儿童背心马甲</p> <div class="jp-num"><span>¥15.90</span> <span>7491人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89375" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89375" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88910" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/4079998578/TB2jyR2sHZnBKNjSZFrXXaRLFXa_!!4079998578-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 韩版小白鞋</p> <div class="jp-num"><span>¥39.90</span> <span>7465人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88910" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88910" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91205" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/2993757017/TB2hX3esdknBKNjSZKPXXX6OFXa_!!2993757017-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 内蒙古超干牛肉干100g</p> <div class="jp-num"><span>¥69.80</span> <span>7432人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91205" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91205" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91384" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/1951409946/TB2zDorEv5TBuNjSspcXXbnGFXa_!!1951409946-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 初秋毛呢背带连衣裙女中长款</p> <div class="jp-num"><span>¥138.00</span> <span>7352人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91384" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91384" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89246" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/2925044404/TB2pZr4uHsrBKNjSZFpXXcXhFXa_!!2925044404-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 木制早教1-2-3岁益智数字火车玩具</p> <div class="jp-num"><span>¥18.90</span> <span>7220人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89246" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89246" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93445" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i2/0/TB1EkLXCY9YBuNjy0FgXXcxcXXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 宽松慵懒风V领格子毛衣女</p> <div class="jp-num"><span>¥128.00</span> <span>7121人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93445" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93445" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91230" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/1640312666/TB2SUyWqMZC2uNjSZFnXXaxZpXa_!!1640312666-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 【高品质】毛呢半身裙</p> <div class="jp-num"><span>¥89.00</span> <span>7075人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91230" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91230" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90107" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/2213064679/TB26bXsxbArBKNjSZFLXXc_dVXa_!!2213064679-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 貂绒短外套时尚多色</p> <div class="jp-num"><span>¥193.00</span> <span>7055人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90107" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90107" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88581" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i2/393594448/TB2DVw.wrZnBKNjSZFrXXaRLFXa_!!393594448.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 毛绒充电迷你防爆小暖宝</p> <div class="jp-num"><span>¥29.80</span> <span>7029人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88581" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88581" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90291" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i2/1639928105/TB2Wt3loHZnBKNjSZFrXXaRLFXa_!!1639928105.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 简约现代大尺寸床边地毯80*160</p> <div class="jp-num"><span>¥54.00</span> <span>6877人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90291" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90291" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90282" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i3/251084929/TB2.WErXxPI8KJjSspfXXcCFXXa_!!251084929.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 军绿条纹连帽貂绒大衣</p> <div class="jp-num"><span>¥253.00</span> <span>6851人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90282" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90282" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91579" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/80357036/O1CN0121qXAn4cXCLJN6I_!!80357036.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 羊毛中山装男外套男士商务休闲西装</p> <div class="jp-num"><span>¥299.00</span> <span>6752人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91579" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91579" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93216" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/1661398358/O1CN012Bc0m901OT5U2Yk_!!1661398358.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 四双装秋冬宝宝纯棉袜</p> <div class="jp-num"><span>¥25.80</span> <span>6712人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93216" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93216" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="89040" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i4/1638716936/O1CN01216jZBVlGogWesl_!!1638716936.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 弹力靴</p> <div class="jp-num"><span>¥168.00</span> <span>6699人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="89040" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=89040" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90214" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i4/0/TB1Fa0qvIIrBKNjSZK9XXagoVXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 大码加厚打底裤</p> <div class="jp-num"><span>¥55.80</span> <span>6547人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90214" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90214" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91516" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i3/4104958894/O1CN012FZV4BNmp6DOC2R_!!4104958894.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 荷叶边紧身打底针织衫</p> <div class="jp-num"><span>¥78.00</span> <span>6514人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91516" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91516" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91211" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/1640312666/TB2TyQvvBjTBKNjSZFNXXasFXXa_!!1640312666-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 【高质量】针织半身裙女秋冬</p> <div class="jp-num"><span>¥99.00</span> <span>6488人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91211" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91211" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="84738" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img11.360buyimg.com/n1/s260x260_jfs/t3265/78/288809961/178786/131bc721/57aef193Nbbf6b5cb.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-jd"></span> 荞麦枕一只装</p> <div class="jp-num"><span>¥24.90</span> <span>6488人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="84738" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=84738" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91679" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i2/2925044404/TB2gcpbmfiSBuNkSnhJXXbDcpXa_!!2925044404.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 蒙氏教具配对积木玩具</p> <div class="jp-num"><span>¥23.50</span> <span>6435人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91679" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91679" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92783" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/1075416762/TB2VWb3mWSWBuNjSsrbXXa0mVXa_!!1075416762.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 简约子母大包单肩手提女包</p> <div class="jp-num"><span>¥158.00</span> <span>6435人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92783" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92783" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92040" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i3/0/TB1yOKJXrvpK1RjSZFqXXcXUVXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 冬季加绒手套</p> <div class="jp-num"><span>¥19.81</span> <span>6389人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92040" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92040" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88939" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd4.alicdn.com/imgextra/i1/127258894/O1CN012FZV48FNaUOnBUm_!!127258894.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 谜尚全效bb霜一只</p> <div class="jp-num"><span>¥89.00</span> <span>6356人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88939" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88939" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90669" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i1/4019840782/TB2lHFYvOOYBuNjSsD4XXbSkFXa_!!4019840782.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 太阳伞防晒防紫外线</p> <div class="jp-num"><span>¥56.00</span> <span>6244人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90669" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90669" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91062" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i3/2169050275/O1CN011DtzNHTKFXKMGtO_!!2169050275.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 羊毛手套女士秋冬新款</p> <div class="jp-num"><span>¥28.50</span> <span>6204人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91062" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91062" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91841" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/3879903778/TB1Zw8ewEOWBKNjSZKzXXXfWFXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 中老年男士夹克</p> <div class="jp-num"><span>¥138.00</span> <span>6112人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91841" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91841" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91179" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i4/3203916161/TB1OYCyaAUmBKNjSZFOXXab2XXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 针织包臀裙</p> <div class="jp-num"><span>¥69.00</span> <span>6105人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91179" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91179" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="88239" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i1/2200154771/TB2GHKEqFkoBKNjSZFEXXbrEVXa_!!2200154771.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 希罗气垫一盒</p> <div class="jp-num"><span>¥98.00</span> <span>6013人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="88239" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=88239" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="67839" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i3/2058507551/TB2P._nmfImBKNjSZFlXXc43FXa_!!2058507551-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 防臭硅胶地漏芯</p> <div class="jp-num"><span>¥11.80</span> <span>5999人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="67839" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=67839" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90662" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i2/1121890579/O1CN011G9DlzhCkOqtpvN_!!1121890579.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 书包背包双肩包学生包</p> <div class="jp-num"><span>¥39.00</span> <span>5960人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90662" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90662" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="87973" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd2.alicdn.com/imgextra/i3/0/TB1xlmEvHZnBKNjSZFGXXbt3FXa_!!0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 粉底刷</p> <div class="jp-num"><span>¥19.90</span> <span>5933人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="87973" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=87973" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="90425" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img11.360buyimg.com/n1/s260x260_jfs/t19915/9/1012358895/346243/c9543e18/5b11fd96N463001cf.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-jd"></span> 5双羊毛加厚女袜</p> <div class="jp-num"><span>¥89.00</span> <span>5881人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="90425" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=90425" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="93147" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd1.alicdn.com/imgextra/i2/127258894/O1CN012FZV4EaKMR3Da2G_!!127258894.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 爱敬香水洗发水500ml</p> <div class="jp-num"><span>¥33.00</span> <span>5881人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="93147" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=93147" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="92617" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//img.alicdn.com/imgextra/i1/2390952488/TB28eS5Jk9WBuNjSspeXXaz5VXa_!!2390952488-0-item_pic.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tm"></span> 婴儿袜一双</p> <div class="jp-num"><span>¥18.50</span> <span>5867人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="92617" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=92617" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li><li><a data-id="91937" class="tod"><img src="<%=BusiConstant.shikemobilepath %>/index/resource/blank.gif" data-original="//gd3.alicdn.com/imgextra/i1/3676471793/TB2LTqgd3mTBuNjy1XbXXaMrVXa_!!3676471793.jpg" class="lazy"> <div><span class="red">首单99%中奖</span></div></a> <p><span class="iconfont icon-tb"></span> 冠军卫衣champion男女正品百搭</p> <div class="jp-num"><span>¥333.00</span> <span>5867人申请</span> <!----> <!----></div> <div class="jp-btn"><a data-id="91937" class="btn tod">免费申请</a> <!----> <a href="http://m.meilipa.com/jing/share?invitationCode=0&amp;shopid=91937" class="btn share-btn">分享赚<em style="color: rgb(255, 70, 78);">10元</em></a></div></li></ul>
    </div>--%>

    </div>

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