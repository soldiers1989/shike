<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=BusiConstant.context %>/favicon.ico" type="image/x-icon">
    <title>试呗好货</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/base.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/home.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/index.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/iconfont.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/signup.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/pagination.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/credit.css" rel="stylesheet">
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jquery-1.8.3.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jquery.pagination.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/common/js/common.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/credit.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context %>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    <script>
        var userId = 0;
    </script>
<style type="text/css">#YSF-BTN-HOLDER{position: fixed;max-width:30px;max-height:120px;right: 30px; bottom: 24px; cursor: pointer; overflow: visible; filter: alpha(opacity=100);opacity:1;z-index: 9990} #YSF-BTN-HOLDER:hover{filter: alpha(opacity=95);opacity:.95} #YSF-BTN-HOLDER img{ display: block;overflow: hidden; } #YSF-BTN-CIRCLE{display: none;position: absolute;right: -5px;top: -6px;width: auto;min-width: 12px;height: 20px;padding: 0 4px;background-color: #f00;font-size: 12px;line-height: 20px;color: #fff;text-align: center;white-space: nowrap;font-family: sans-serif;border-radius: 10px;z-index:1;} #YSF-BTN-BUBBLE{display: none;position: absolute;left: -274px;bottom:-15px;width: 278px;height: 80px;box-sizing: border-box;padding: 14px 22px;filter: alpha(opacity=100);opacity:1;background: url(https://qiyukf.com/sdk//res/img/sdk/bg_floatMsg2x.png) no-repeat;background:url(https://qiyukf.com/sdk//res/img/sdk/bg_floatMsg.png)9; background-size: 278px 80px; z-index: 1;} #YSF-BTN-HOLDER.layer-6{bottom:0;} #YSF-BTN-HOLDER.layer-1 #YSF-BTN-BUBBLE{top:0} #YSF-BTN-HOLDER.layer-6 #YSF-BTN-BUBBLE{bottom:-6px;} #YSF-BTN-BUBBLE:hover{filter: alpha(opacity=95);opacity:.95} #YSF-BTN-CONTENT{height:45px;padding: 0;white-space: normal;word-break: break-all;text-align: left;font-size: 14px;line-height: 1.6;color: #222;overflow: hidden;z-index: 0;} #YSF-BTN-ARROW{ display: none; } #YSF-BTN-CLOSE{position: absolute; width:15px; height:15px;right: 4px;top: -3px; filter: alpha(opacity=90); opacity:.9; cursor: pointer; background: url(https://qiyukf.com/sdk//res/img/sdk/btn-close.png) no-repeat;z-index: 1} #YSF-BTN-CLOSE:hover{filter: alpha(opacity=100); opacity: 1;} #YSF-PANEL-CORPINFO.ysf-chat-layeropen{ width: 511px; height: 470px; box-shadow: 0 0 20px 0 rgba(0, 0, 0, .15);} #YSF-PANEL-CORPINFO{ position: fixed; bottom: 0px; right: 20px; width: 0; height: 0; z-index: 99999; } #YSF-PANEL-INFO.ysf-chat-layeropen{ width: 311px; height: 470px; filter: alpha(opacity=100);opacity:1; box-shadow: 0 0 20px 0 rgba(0, 0, 0, .15);} #YSF-PANEL-INFO{ position: fixed; bottom: 0px; right: 20px; width: 0px; height: 0px; filter: alpha(opacity=0);opacity:0;z-index: 99999;} #YSF-PANEL-INFO .u-btn{background-color: #F96868} #YSF-CUSTOM-ENTRY{background-color: #F96868;} #YSF-CUSTOM-ENTRY-0{position: relative;width:auto;background-color: #F96868;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-1{position: relative;width:auto;background-color: #F96868;border-radius: 14px; box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-2{position: relative;width:auto;background-color: #F96868;border-radius: 0;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-3{position: relative;width:auto;background-color: #F96868;border-radius: 50%;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-4{position: relative;width:auto;background-color: #F96868;border-radius: 50%;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-5{position: relative;width:auto;background-color: #F96868;border-radius: 5px;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-6{position: relative;width:auto;background-color: #F96868;border-radius:5px;border-bottom-left-radius: 0;border-bottom-right-radius: 0;} #YSF-CUSTOM-ENTRY-0 img{max-width: 300px;height:auto;} #YSF-CUSTOM-ENTRY-1 img{width:28px;height:auto;} #YSF-CUSTOM-ENTRY-2 img{width:58px;height:auto;} #YSF-CUSTOM-ENTRY-3 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-4 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-5 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-6 img{width:115px;height:auto;} #YSF-IFRAME-LAYER{ border:0; outline:none; } .ysf-online-invite-wrap{z-index:10001;position:fixed;_position:absolute;top:50%;left:50%;} .ysf-online-invite{position:relative;top:-50%;left:-50%;cursor:pointer;} .ysf-online-invite img{display:block;width:250px;} .ysf-online-invite .ysf-online-invite-img{width:100%;height:100%} .ysf-online-invite .text{position:absolute;top:-11px;left:0;right:0;overflow:hidden;margin: 36px 20px 0 67px;line-height:140%;color:#526069;font-size:14px;font-family:"Microsoft YaHei","微软雅黑",tahoma,arial,simsun,"宋体";text-align:left;white-space:normal;word-wrap:break-word;} .ysf-online-invite .close{position:absolute;top:-6px;right:-6px;width:32px;height:32px;background:url(https://qiyukf.com/sdk/res/img/invite-close.png) no-repeat;cursor:pointer;} .ysf-online-invite .close.custom{top:-16px;right:-16px;}</style></head>
<body>

<jsp:include page="../common/top1.jsp" flush="true"/>

<div class="yonghu_top">
    <div id="header" class="header">
        <div class="header_main" style="height: 20px">

        </div>
        <div id="nav" class="nav" style="font-family: 微软雅黑;">
            <div class="main">

                <!--qiandaog-->
                <ul>
                    <%--<li class="showtrytype"><div class="fication"><i></i>试用品分类</div></li>
                    <li><a href="http://test.com/" class="" target="_blank">首页</a></li>--%>
                    <li>
                        <a href="<%=BusiConstant.shike_web_haohuo.getKey() %>" class="jpSwip  selet" style="background-position: center -180px;">
                            试呗好货
                            <span class="ntp-hot">
                                <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/new.gif" class="png_bg">
                            </span>
                        </a>
                    </li>
                    <%--<li>
                        <a href="#m/home/" class="" target="_blank">
                            金币兑换
                        </a>
                    </li>
                    <li>
                        <a href="#m/home/" class="" target="_blank">
                            限量秒杀
                            <span class="ntp-hot" style="top:-23px;left: 44px;">
                                <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/hit.gif" class="png_bg">
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#m/home/" target="_blank" class="">
                            新人必中
                            <span class="ntp-hot" style="top:-23px;left: 44px;">
                                <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/hit.gif" class="png_bg">
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="https://test.com//" class="" target="_blank">
                            邀请有礼
                        </a>
                    </li>--%>
                </ul>
                <div class="sj_apply" style="margin-right:10px;">
                    <a href="https://test.com/help/MerchantApply4" target="_blank">商家报名</a>
                </div>
            </div>
        </div>

        <!--header_main-->
    </div>
    <!--header-->
</div>
<script>
    // var jpSwip = 0;
    // setInterval(function () {
    //     jpSwip++;
    //     jpSwip = jpSwip == 22 ? 0 : jpSwip;
    //     $(".jpSwip").css("background-position", "center -" + jpSwip * 45 + "px");
    // }, 100);

</script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/7a320daff2b34ec63dad348e818563e6.js"></script><div style="top: 0px; left: 0px; visibility: hidden; position: absolute; width: 1px; height: 1px;"><iframe style="height:0px; width:0px;" src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/delegate.html"></iframe></div><div class="layer-1" id="YSF-BTN-HOLDER" style="display: none;"><div id="YSF-CUSTOM-ENTRY-1"><img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/1.png"></div><span id="YSF-BTN-CIRCLE"></span><div id="YSF-BTN-BUBBLE"><div id="YSF-BTN-CONTENT"></div><span id="YSF-BTN-ARROW"></span><span id="YSF-BTN-CLOSE"></span></div></div>
<style>
    #YSF-BTN-HOLDER {
        display: none;
    }
</style>
<script>
    $(function () {
        $('#kefu').mouseover(function () {
            $('#qykf').show();
            $('#ptkf').hide();
        });
        $('#kefu').mouseout(function () {
            $('#qykf').hide();
            $('#ptkf').show();
        });
        $('.yaoqing').mouseover(function () {
            $('.yaoqing').css({ 'background-color': '#f13439' });
        });
        $('.yaoqing').mouseout(function () {
            $('.yaoqing').css({ 'background-color': '#ff464e' });
        });
    })
</script>
<div class="floattips">

    <a class="yaoqing" href="https://test.com/invitation/NewInvitation" target="_blank">
        <i class="ic9" style="background: url(//test.com/Content/images/cbl_yaoqing.png) no-repeat; height: 25px; margin: 5px 14px;"></i>
        <div class="xz_xg1" style="margin-top: -2px;">
            <p style="color: #fff;">分享赚钱</p>
        </div>
    </a>
    <div class="second_li secnd_li secet qq-online-parent">
        <a href="javascript:void(0)" target="_blank" class="qq-online-box">
            <span class="shend iconqq"></span>
                <span class="qq-online-span">在线客服</span>
        </a>
        <div class="hint_text2 qq-online-box2" style="display: none;right: 34px;height:auto; width:256px; padding-right:6px;margin-top:-65px;    background: url(/Content/images/fix_hint.png) no-repeat right 91px;">
            <div class="qq-online-black-box">
                    <div class="qq-online-header">用户咨询</div>
                    <div class="qq-online-body">
                        <p style="line-height:66px;">

                            <a onclick="$(&quot;#YSF-BTN-HOLDER&quot;).trigger(&quot;click&quot;);" style="display:inline; width:auto; height:auto;margin-left:10px;">
                                <img style="width:87px;height:29px;vertical-align:middle;" border="0" src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/qq-online.png" alt="点击这里给我发消息" title="点击这里给我发消息">
                            </a>
                        </p>
                    </div>

                    <div class="qq-online-header">商家专属通道</div>
                    <div class="qq-online-body" style="padding-bottom:20px;">
                        <p style="line-height:66px;">

                            <span>QQ咨询：3003730015</span>
                            <a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=3003730015&amp;site=qq&amp;menu=yes" style="display:inline; width:auto; height:auto;margin-left:6px;">
                                <img style="width:87px;height:29px;vertical-align:middle;" border="0" src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/qq-online.png" alt="点击这里给我发消息" title="点击这里给我发消息">
                            </a>
                        </p>
                        <p style="line-height:20px;">咨询热线：13208049855</p>
                    </div>

                <div class="qq-online-footer">
                    <div class="qq-online-dashed">
                        <p>工作时间：周一至周五，9:00-21:00</p>
                        <p style="text-align:center;">（节假日除外）</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="second_li secnd_li secet">
            <a href="https://test.com/Regist/Jingxuan" target="_blank" class="seaf">
                <i class="ic9"></i>
            </a>
            <span class="hint_text setd" style="display: none;right: 34px;">
                <i>新手入门</i>
            </span>
        </div>
    <div class="secnd_li seced">
        <a href="#/" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heak" style="display: none">
            <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/wxfl_yonghu.png">
        </div>
    </div>
    <div class="secnd_li secft">
        <a href="https://test.com/other/appdownload" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heack" style="display:none">
            <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/linla.png">
        </div>
    </div>
    <div class="second_li secnd_li secet">
        <a href="https://test.com/Feedback" target="_blank" class="seaf">
            <span class="shend"></span>
        </a>
        <span class="hint_text setd" style="display: none;right: 34px;">
            <i>意见反馈</i>
        </span>
    </div>
    <div class="footef"></div>
    <div class="second_li secnd_li secent">
        <a href="javascript:" onclick="$(&#39;body, html&#39;).animate({ scrollTop: 0 }, 200);" class="sheed">
            <span class="shend"></span>
        </a>
        <span class="hint_text seed" style="display: none;right: 34px;">
            <i>返回顶部</i>
        </span>
    </div>
</div>

<script>
    $(".shead").mouseover(function () {
        $(".sited").css("display", "block");
    });
    $(".shead").mouseout(function () {
        $(".sited").css("display", "none");
    });
    $(".shed").mouseover(function () {
        $(".sted").css("display", "block");
    });
    $(".shed").mouseout(function () {
        $(".sted").css("display", "none");
    });
    $(".seced").mouseover(function () {
        $(".heak").show();
    });
    $(".seced").mouseout(function () {
        $(".heak").hide();
    });
    $(".seaf").mouseover(function () {
        $(this).parent().find(".setd").css("display", "block");
    }).mouseout(function () {
        $(this).parent().find(".setd").css("display", "none");
    });
    $(".qq-online-parent").mouseover(function () {
        $(this).parent().find(".qq-online-box2").css("display", "block");
        //$(this).parent().find(".qq-online-box2").css("background", "green");
    }).mouseout(function () {
        $(this).parent().find(".qq-online-box2").css("display", "none");
        //$(this).parent().find(".qq-online-box2").css("background", "red");
    });
    $(".sheed").mouseover(function () {
        $(this).find(".seed").css("display", "block");
    }).mouseout(function () {
        $(this).find(".seed").css("display", "none");
    });
    $(".secft").mouseover(function () {
        $(".heack").show();
    });
    $(".secft").mouseout(function () {
        $(".heack").hide();
    });
</script>

<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jquery.lazyload.js"></script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jquery.SuperSlide.2.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jpIndex.css">
<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/JPinIndex.js"></script>
<script>
    var fl = '';
    var px = '4';
    var index = '1';
    var count = '633';
    var size = '100';
    var price1 = 0 || '';
    var price2 = 0 || '';
    var ck = '';
    var st = '1';
    var hg = "";
    var sort = "1";
    var shopcat = '0';
    var noApply = '0';
    var wq = '';
    $(function () {
        $(".xgguod .pitem").on("mouseenter", function () {
            $(this).find(".apply-btn").addClass("apply-btn-hover");
        }).on("mouseleave", function () {
            $(this).find(".apply-btn").removeClass("apply-btn-hover");
        });
        initSuperSlide();
        function initSuperSlide() {
            jQuery(".picScroll-left").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, scroll: 6, vis: 6, interTime: 4000 });
        }
    });
</script>
<div class="jp-hd">
    <div class="w1195">
        <div class="flow-f">
            <div>
                试呗好货<br> 新手流程
            </div>
        </div>
        <ul>
            <li>
                <i class="iconfont icon-hart"></i>
                <div>
                    <b>1.免费申请</b>
                    选择喜爱的宝贝完成申请
                </div>
            </li>
            <li>
                <i class="iconfont icon-time"></i>
                <div>
                    <b>2.等待开奖</b>
                    每天10,15,20点三场开奖
                </div>
            </li>
            <li>
                <i class="iconfont icon-recharge"></i>
                <div>
                    <b>3.下单付款</b>
                    按照流程操作并提交订单号
                </div>
            </li>
            <li>
                <i class="iconfont icon-text"></i>
                <div>
                    <b>4.提交试用报告</b>
                    提交真实客观的试用报告
                </div>
            </li>
            <li>
                <i class="iconfont icon-monery"></i>
                <div>
                    <b>5.返还担保金</b>
                    报告通过后返还担保金，提现
                </div>
            </li>
        </ul>
    </div>
</div>


<div class="jp-groom">
    <div class="titler mginbot dixbju" id="divtodayshop">
        <em class="abczuo" style="font-size: 20px">1F</em>
        <em class="cbazuo">每日上新</em>
        <em class="jxi jxionngt" style="left: 137px">&nbsp;&nbsp;&nbsp;每天有惊喜！</em>
    </div>
    <div class="picScroll-left">
       <%-- <div class="hd">
            <ul><li class="on">1</li><li class="">2</li></ul>
        </div>--%>
        <div class="titler_one bd">
            <div class="tempWrap" style="overflow:hidden; position:relative; width:1195px">
                <ul id="jinrilist" style="width: 2388px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">

                </ul>
            </div>
        </div>
    </div>
</div>

<div class="header_mf jpIndex">
    <div class="prdct_left" id="trygoodstype">
        <div class="prd_cz" style="width: 1195px;">
            <div class="zq_sxu">
                <div class="list-hd">
                    <div class="hd-title">
                        <i class="iconfont icon-time3"></i>
                        <span>好货精选</span>
                        <em>
                            每天<span>10：00</span>,<span>15：00</span>,<span>20：00</span>三场开奖
                        </em>
                    </div>
                    <%--<div class="lh38">
                            <p>
                                将于明天<span>1</span><span>0</span>:<span>0</span><span>0</span>
                                进行下次开奖
                            </p>
                    </div>--%>
                </div>
                <!--ptd_szw-->
                <div class="clear-both">
                </div>
                <div class="jp-position">
                    <em>当前位置：</em><a href="https://test.com/">首页</a> &gt;
                    <a href="#">好货专区</a>
                    <div>
                        <input type="text" id="ck" placeholder="宝贝名称关键词">
                        <i onclick="search();" class="iconfont icon-search"></i>
                    </div>

                </div>
                <!--zq_sxt-->
                <div style="height:124px;">
                    <div id="slide-cat">
                        <div class="goods-selector" style="clear: both">
                            <%--<div class="plat">
                                <span>活动类型：</span>
                                <span class="shopcat red" data-num="">全部</span>
                                <span class="shopcat "  data-num="1">普通试用</span>
                                <span class="shopcat "  data-num="3">高价值</span>
                                <span class="shopcat "  data-num="4">必中任务</span>
                                <span class="shopcat " data-num="5">有奖任务</span>
                            </div>--%>
                            <div class="all-goods-kinds">
                                <ul>
                                    <li style="width:auto;min-width:0;margin-right:10px;">
                                        <span>活动类型：</span>
                                    </li>
                                    <li>
                                        <div class="jp-plat-con">

                                            <a href="javascript:void(0);" gid="" class="act">
                                                <span id="shopcat_0">全部</span>
                                            </a>
                                            <a href="javascript:void(0);" style="margin-left: 20px" gid="1" class="">
                                                <span id="shopcat_1">普通试用</span>
                                            </a>
                                            <a href="javascript:void(0);" style="margin-left: 20px" gid="3" class="">
                                                <span id="shopcat_3">高价值</span>
                                            </a>
                                            <a href="javascript:void(0);" style="margin-left: 20px" gid="4" class="">
                                                <span id="shopcat_4">必中任务</span>
                                            </a>
                                            <a href="javascript:void(0);" style="margin-left: 20px" gid="5" class="">
                                                <span id="shopcat_5">有奖任务</span>
                                            </a>

                                        </div>

                                    </li>
                                </ul>
                            </div>
                            <div class="all-goods-kinds">
                                <ul>
                                    <li style="width:auto;min-width:0;margin-right:10px;">
                                        <span>商品类目：</span>
                                    </li>
                                    <li>
                                        <div class="jp-sort-con" id="dictlist">

                                            <a href="javascript:void(0);" gid="" class="act">
                                                <span id="seleted_0">全部</span>
                                            </a>

                                        </div>

                                    </li>
                                </ul>
                            </div>
                            <div class="all-goods-select">
                                <ul>
                                    <li style="width:auto;min-width:0;">
                                        <span>商品排序：</span>
                                    </li>
                                    <li>
                                        <a href="javascript:" onclick="PXsearch('0')" gid="3" target="_parent" class="jiazhi act">
                                            <span id="seleted_00" class="sorrowsel1">综合</span>
                                        </a>

                                    </li>
                                    <li>
                                        <a href="javascript:" onclick="PXsearch('1')" gid="1" target="_parent" class="jiazhi ">
                                            <span id="seleted_01" class="sorrow">最新</span>
                                        </a>

                                    </li>
                                    <li>
                                        <a href="javascript:" onclick="PXsearch('2')" gid="2" target="_parent" class="jiazhi ">
                                            <span id="seleted_02" class="sorrow">价值</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:" onclick="PXsearch('3')" gid="4" target="_parent" class="jiazhi">
                                            <span id="seleted_03" class="sorrow">人气</span>
                                        </a>
                                    </li>
                                    <li class="jp-search" style="width: 670px !important;">
                                        <div class="jp-price">
                                            价值筛选
                                            <span>¥</span>
                                            <input type="number" class="price1">
                                            -<span>¥</span>
                                            <input type="number" class="price2">
                                            <a class="price-btn">确定</a>
                                        </div>

                                        <%--<div class="simple-change-page">


                                                <span class="iconfont icon-toLeft"></span>
                                            <span>&nbsp;<span style="color: rgb(231, 76, 60);">1</span>/<span>7</span></span>
                                                <a href="https://aa.com/?hg=&amp;wq=&amp;fl=&amp;ck=&amp;px=4&amp;pg=2&amp;sort=1&amp;price1=&amp;price2=&amp;shopcat=-1&amp;shopActType=0&amp;noApply=0#trygoodstype">
                                                    <span class="iconfont icon-toRight"></span>
                                                </a>
                                        </div>--%>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--zq_sxu-->
        </div>
    </div>
    <div class="xgguod">
        <ul id="list">


        </ul>
    </div>
   <%-- <div class="pagination" style="margin: -15px 3px -30px 3px;"><a class="current prev">&lt;</a><a
            class="current">1</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=2#trygoodstype">2</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=3#trygoodstype">3</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=4#trygoodstype">4</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=5#trygoodstype">5</a><a>...</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=7#trygoodstype">7</a><a
            href="#m/?wq=&amp;sort=1&amp;fl=&amp;ck=&amp;px=4&amp;noApply=0&amp;price1=&amp;price2=&amp;shopActType=0&amp;pg=2#trygoodstype"
            class="next">&gt;</a><span id="clickme"
                                       style="   width: 74px;height: 70px;  position: relative;  margin: 0 6px 0 0;"><img
            src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/dwyjx.png"
            style=" position: absolute;  left: 0;top: 6px;  cursor: pointer;"></span><span
            class="pagination_font_color">&nbsp;&nbsp;跳至&nbsp;<input
            style="width: 35px;height: 35px; text-align: center; color: #333;border:1px solid #d9d9d9;" type="text"
            value="1" id="pageIdex">&nbsp;页&nbsp;&nbsp;<a id="turnTo" href="javascript:"
                                                          style="width:55px;height:35px;background:#fff;border:1px solid #d9d9d9;color:#333;"
                                                          class="next">确定</a></span></div>
--%>
    <div style="clear: both;height: 0px;"></div>

</div>

<jsp:include page="../common/footer.jsp" flush="true"/>

    <link href="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/style.css" rel="stylesheet">
<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/Validform_v5.3.2.js"></script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/jquery.form.js"></script>
<style>
    .msg-tip-lf .tip-txt {
        margin-bottom: 0;
    }
    .Validform_right,.Validform_wrong {
        line-height: 20px;
    }
</style>
<script>
    function tab(Nav, Num) {
        if (Nav.className == "active") return;//为了提高效率
        $(Nav).addClass('active').siblings().removeClass();
        $(Nav).parent().next().find(".tab").eq(Num).show().siblings().hide();
    }
</script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/list.js"></script>


    <a class="totop" id="back-to-top" style="display: none">
</a>
</body></html>