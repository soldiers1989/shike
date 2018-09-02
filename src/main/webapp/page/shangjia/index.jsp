<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="https://www.meilipa.com/favicon.ico" type="image/x-icon">
    <title>商家管理中心 - 美丽啪</title>
    
    <meta name="keywords" content="试客网,试客平台,试宝">
    <meta name="description" content="欢迎来免费美丽啪试用网:美丽啪—是全国领先的免费试用网和试客网,深得试客信赖的免费试用中心网站,是免费试用网和试客网站的首选,美丽啪免费试用网为试客提供最优质和实用的优秀免费试用商品.">
    <link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/base.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/index.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/pagination.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/jquery.fancybox.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/credit.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/iconfont.css">

    <script charset="utf-8" src="<%=context%>/page/shangjia/shangjia/v.js"></script><script src="<%=context%>/page/shangjia/shangjia/hm.js"></script><script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/Common.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/credit.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.form.js"></script>

    
    
    <script>
        var userId = 0;
        var userOrBisId=312117;
    </script>
<link rel="stylesheet" href="<%=context%>/page/shangjia/shangjia/layer.css" id="layuicss-layer"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/base.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/pagination.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/shangjia_index.css">

<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/Common.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/credit.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.form.js"></script>



<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/iconfont(1).css">
<script src="<%=context%>/page/shangjia/shangjia/layoutbis.js"></script>
<script src="<%=context%>/page/shangjia/shangjia/jquery.SuperSlide.2.1.1.js"></script>
<script>
    var canPublish = 'False';
    var isyearVip = 'False';

    var txnum = '';
    $(function () {
        jQuery(".SuperSlide").slide({ mainCell: ".bd ul", autoPlay: true, effect: "fade", interTime: 3000, delayTime: 1000 });
    });
</script>



<div id="lingla-hd" style="background: #F2F2F2; width: 100%; height: 35px; border-bottom: 1px solid #e2e2e2;">
    <div class="header_top" style="margin-left: auto; margin-right: auto;">
            <div class="header_leftt">
                    <div class="top_pm">
                        <div class="op-menu">
                            <a href="https://www.meilipa.com/bisindex" target="_blank" class="top-nickname">xiaoluo123<i class="top-down"></i></a>
                            <div class="top-toggle" style="left: 0;">
                                <a href="https://www.meilipa.com/JPinShopIssueBis" target="_blank"><i style="background: url(/Content/images/bis_bg_head_icon2.png); width: 15px; height: 15px; margin-top: -2px;"></i>活动管理</a>
                                <a href="https://www.meilipa.com/ShopissueOfTaskBis/TaskManageList" target="_blank"><i style="background: url(/Content/images/bis_bg_head_icon3.png); width: 15px; height: 15px; margin-top: -5px;"></i>有奖竞猜</a>
                                <a style="border: none;" href="https://www.meilipa.com/commonbase/logout">
                                    <i style="background: url(//www.meilipa.com/Content/images/nav5.png); width: 15px; height: 15px; margin-top: -2px;">
                                    </i>退出
                                </a>
                            </div>
                        </div>
                    </div>
                <span class="color_fg" style="float:left;">|</span>
                <!--top_pm-->
                <div class="top_ml">
                    <dl>
                        <dd>
                            <a class="xin_po" href="https://www.meilipa.com/bisremind" target="_blank">提醒(<strong>0</strong>)</a>
                        </dd>
                    </dl>
                </div>
                <span class="color_fg" style="float: left">|</span>
                <!--top_ml-->
                <div class="top_left">
                    <a href="https://www.meilipa.com/Regist/about" target="_blank" class="on-service">在线客服</a>
                </div>
                <!--top_ml-->
                <div class="shou_btn">
                    <em>&nbsp;&nbsp;收藏</em>
                    <div class="shou_toggle"><span>Ctrl</span>或<span>Cmd+D</span>收藏本站</div>
                </div>
            </div>
        <!--header_left-->
        <div class="header_right">
            <a href="https://www.meilipa.com/" title="试客联盟官网">美丽啪首页</a><span class="color_fg">|</span>
            <a href="https://www.meilipa.com/other/appdownload" target="_blank"><i class="top-icon-ph"></i>手机客户端</a><span class="color_fg">|</span>
            <a href="https://www.meilipa.com/invitation/NewInvitation" target="_blank">分享赚钱<span style="color: #ed594f; font-weight: bold;">月入4000</span></a><span class="color_fg">|</span>
                <a href="javascript:" onclick="login()">做问卷送金币</a>
                <span class="color_fg">|</span>
            <a href="https://www.meilipa.com/help/index" target="_blank">帮助中心</a><span class="color_fg">|</span>
            <span class="wzdh">
                <a href="https://www.meilipa.com/help/index" target="_blank" class="sbdjx" id="naviatetext">网站导航</a>
                <div class="oneto" id="naviate">
                    <div class="onetoa">
                        <p class="tcbt">
                            <a href="https://jing.meilipa.com/">免费试用</a>
                        </p>
                        <p>
                            <a href="https://jing.meilipa.com/" target="_blank">试用专区</a>
                        </p>
                    </div>
                    <div class="onetoa">
                        <p class="tcbt">
                            <a href="https://www.meilipa.com/invitation/NewInvitation">站内活动</a>
                        </p>
                        <p>
                            <a href="https://www.meilipa.com/invitation/NewInvitation" target="_blank">邀请有奖</a>&nbsp;&nbsp;<a href="https://www.meilipa.com/lottery" target="_blank">金币抽奖</a>
                        </p>
                    </div>
                    <div class="onetoa">
                        <p style="padding-top: 8px;">
                            <a href="https://www.meilipa.com/help/MerchantApply" target="_blank">商家报名</a>&nbsp;&nbsp;
                            <a href="https://www.meilipa.com/Feedback" target="_blank">意见反馈</a>
                        </p>
                    </div>
                </div>
            </span>
        </div>
    </div>
</div>


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

    <a class="yaoqing" href="https://www.meilipa.com/invitation/NewInvitation" target="_blank">
        <i class="ic9" style="background: url(//www.meilipa.com/Content/images/cbl_yaoqing.png) no-repeat; height: 25px; margin: 5px 14px;"></i>
        <div class="xz_xg1" style="margin-top: -2px;">
            <p style="color: #fff;">分享赚钱</p>
        </div>
    </a>
    <div class="second_li secnd_li secet qq-online-parent">
        <a href="javascript:void(0)" target="_blank" class="qq-online-box">
            <span class="shend iconqq"></span>
                 <span class="qq-online-span">招商经理</span>
           
        </a>
        <div class="hint_text2 qq-online-box2" style="display: none;right: 34px;height:auto; width:256px; padding-right:6px;margin-top:-65px;    background: url(/Content/images/fix_hint.png) no-repeat right 91px;">
            <div class="qq-online-black-box">
             
                    <div class="qq-online-header">商家专属通道</div>
                    <div class="qq-online-body" style="padding-bottom:20px;">
                        <p style="line-height:66px;">

                            <span>QQ咨询：3003739359</span>
                            <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=3003739359&amp;site=qq&amp;menu=yes" style="display:inline; width:auto; height:auto;margin-left:6px;">
                                <img style="width:87px;height:29px;vertical-align:middle;" border="0" src="<%=context%>/page/shangjia/shangjia/qq-online.png" alt="点击这里给我发消息" title="点击这里给我发消息">
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
             <a href="https://www.meilipa.com/help/index" target="_blank" class="seaf">
                 <i class="ic9"></i>
             </a>
            <span class="hint_text setd" style="display: none;right: 34px;">
                <i>帮助中心</i>
            </span>
        </div>
    <div class="secnd_li seced">
        <a href="https://www.meilipa.com/bisindex" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heak" style="display: none">
            <img src="<%=context%>/page/shangjia/shangjia/wxfl_shangjia.png">
        </div>
    </div>
    <div class="secnd_li secft">
        <a href="https://www.meilipa.com/other/appdownload" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heack" style="display:none">
            <img src="<%=context%>/page/shangjia/shangjia/linla.png">
        </div>
    </div>
    <div class="second_li secnd_li secet">
        <a href="https://www.meilipa.com/Feedback" target="_blank" class="seaf">
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
<div class="shangjia_index">
    <div class="header">
        <div class="header_main">
            <div class="header_bottom">
                <a href="https://www.meilipa.com/home" target="_blank" style="float: left;">
                    <img src="<%=context%>/page/shangjia/shangjia/user_logoone.jpg" height="80" border="0" usemap="#Map">
                </a>
                <div class="float_left">
                    <a href="https://www.meilipa.com/bisindex" style="font-family: 微软雅黑; font-weight: bold;color: #ffffff">管理中心首页</a>

                </div>
            </div>
            <!--header_bottom-->
        </div>
        <!--header_main-->
    </div>
    <div id="SuperSlide" class="SuperSlide" style="display: block;width: 1190px; height: 90px; margin: 20px auto;overflow: hidden;">
        <div class="bd">
            <ul>
                    <li style="display: list-item;">
                        <a href="https://www.meilipa.com/help/MerchantApply1" onclick="clickNumber(45)" target="_blank" style="transition: transform 3s linear; transform: scaleX(1.1) scaleY(1.1);">
                            <img src="<%=context%>/page/shangjia/shangjia/c6be680a-f667-44a2-ac35-c33a0b139790" style="width: 1190px; height: 90px;">
                        </a>
                    </li>
                    <li style="display: none;">
                        <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=34" onclick="clickNumber(38)" target="_blank" style="transition: transform 3s linear; transform: scaleX(1.1) scaleY(1.1);">
                            <img src="<%=context%>/page/shangjia/shangjia/9bd36abd-d132-4940-ba09-33f44cbd1724" style="width: 1190px; height: 90px;">
                        </a>
                    </li>
                    <li style="display: none;">
                        <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=35" onclick="clickNumber(39)" target="_blank" style="transition: transform 3s linear; transform: scaleX(1.1) scaleY(1.1);">
                            <img src="<%=context%>/page/shangjia/shangjia/c7006afa-6301-4f28-9a16-00db6f2b12e9" style="width: 1190px; height: 90px;">
                        </a>
                    </li>
            </ul>
        </div>
        <a class="superprev" href="javascript:void(0)"><i></i></a>
        <a class="supernext" href="javascript:void(0)"><i></i></a>
    </div>

    <!--shangjia_top-->
    <div class="clearfix contant">
        <div class="main clearfix" style="width:1195px; margin-bottom:30px;overflow: hidden;">
            <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=2845119976&amp;site=qq&amp;menu=yes">
            </a>
            <div class="shangjia_left clearfix hdn-left" style="border-right:1px solid #e7e8eb;height:100%;padding-bottom:10000px;margin-bottom:-10000px;">
                <div style="width:100%; display:block;margin: 0 auto;">
                    <div class="left_bott">
                        <ul>

                            <!--<li class="left_titi" onclick="location.href = '/bisindex'" style="height: 30px;background: #fff; margin-left: -25px;"><strong style="display: block; color: #ff464e; line-height: 30px; border-left: 5px solid #ff464e; padding-left: 20px;">管理中心首页</strong></li>
                            -->
                            <li style="cursor: pointer; margin: 22px 0 10px 0;height: 42px;" class="left_titi">
                                <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit?type=0" target="_blank" class="invite-btn">发布活动</a>
                            </li>

                            <li id="4" class="left_titi"><strong><i class="iconfont icon-liwuhuodong"></i>活动管理<i class="iconfont icon-Toboottom il5 ft_up_down"></i></strong></li>
                            <li parentid="4"><a href="https://www.meilipa.com/JPinShopissueBis?orderType=0" id="openWindows31" target="_self">淘宝活动</a></li>
                            <li parentid="4"><a href="https://www.meilipa.com/JPinShopissueBis?orderType=1" id="openWindows32" target="_self">天猫活动</a></li>
                            <li parentid="4"><a href="https://www.meilipa.com/JPinShopissueBis?orderType=2" id="openWindows34" target="_self">京东活动</a></li>
                            <li class="line"></li>
                            <li id="6" class="left_titi"><strong><i class="iconfont icon-shouji1"></i>运营工具<i class="iconfont icon-Toboottom il5 ft_up_down"></i></strong></li>
                            <li parentid="6"><a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit?type=1" id="openWindows35" target="_self">猜你喜欢<em class="bisindex_new"></em></a></li>
                            <li parentid="6"><a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit?type=2" id="openWindows36" target="_self">手淘首页<em class="bisindex_new"></em></a></li>
                            <li class="line"></li>
                            <li id="7" class="left_titi"><strong><i class="iconfont icon-shop"></i>店铺解析<i class="iconfont icon-Toboottom il5 ft_up_down"></i></strong></li>
                            <li parentid="7">
                                <a id="openWindows71" target="_self" href="https://www.meilipa.com/bis/diagnosis">
                                    免费诊断<em class="bisindex_new"></em>
                                </a>
                            </li>
                            <li class="line"></li>
                            <li id="5" class="left_titi"><strong><i class="iconfont icon-shop"></i>直通车托管<i class="iconfont icon-Toboottom il5 ft_up_down"></i></strong></li>
                            <li parentid="5">
                                <a href="https://www.meilipa.com/help/MerchantApply1" id="openWindows50" target="_blank">
                                    托管介绍
                                    <i class="iconfont icon-hot" style="color: #ff464e;font-size: 19px;margin-left:3px;"></i>
                                </a>
                            </li>

                            <li parentid="5"><a href="https://www.meilipa.com/bis/driverIntroduction" id="openWindows51" target="_self">预约车手 <i class="iconfont icon-hot" style="color: #ff464e;font-size: 19px;margin-left:3px;"></i></a></li>
                            <li parentid="5"><a href="https://www.meilipa.com/bis/openTrusteeship" id="openWindows52" target="_self">开启托管 <i class="iconfont icon-hot" style="color: #ff464e;font-size: 19px;margin-left:3px;"></i></a></li>
                            
                      
                            
                            
                            
                            <li class="line"></li>
                            <li id="10" class="left_titi ">
                                <strong><i class="iconfont icon-zhanghuxinxi"></i>账户信息</strong>
                                <!--<img class="ft_up_down" src="/Content/images/ft_up.png" />-->
                                <i class="iconfont icon-Toleft il5 ft_up_down" style="color:rgb(102,102,102);"></i>
                            </li>
                            <li parentid="10" style="display:none;">
                                <a href="https://www.meilipa.com/Bis/BoundShopBis" id="openWindows18" target="_self">店铺管理</a>
                            </li>
                            <li parentid="10" style="display:none;">
                                <a href="javascript:" id="openWindows6" target="_self" onclick="HasTxianNum(&#39;/drawapply&#39;, &#39;/drawaccount&#39;)">提现/账户明细</a>
                            </li>
                            <li parentid="10" style="display:none;">
                                <a href="https://www.meilipa.com/drawaccount" id="openWindows7" target="_self">我的提现账号</a>
                            </li>
                            <li parentid="10" style="display:none;">
                                <a href="https://www.meilipa.com/security" id="openWindows8" target="_blank">账户安全</a>
                            </li>
                            <li parentid="10" style="display:none;">
                                <a href="https://www.meilipa.com/Bis/Recharge/" id="openWindows17" target="_self">账户充值</a>
                            </li>
                            <li class="line"></li>

                            
                            <li id="11" class="left_titi ">
                                <strong style="width: 77px;display: block;float: left;white-space: nowrap;line-height: 38px;"><i class="iconfont icon-VIP1" style="color:rgb(102,102,102);"></i>VIP通道</strong>
                                <i class="iconfont icon-Toboottom il5 ft_up_down" style="color:rgb(102,102,102);"></i>
                            </li>
                                <li parentid="11">
                                    <a href="https://www.meilipa.com/VIP/ApplyVip" id="openWindows20" target="_self">成为VIP</a>
                                </li>
                                <li parentid="11">
                                    <a href="https://www.meilipa.com/VIP/VIPDetailNew" target="_blank">了解VIP</a>
                                </li>

                        </ul>
                    </div>
                </div>
                <!--left-->
            </div>
            <div class="shangjia_right elg-width">
                
<style>
    .shangjia_left {
        border: none !important;
    }
</style>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/Common.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=context%>/page/shangjia/shangjia/jquery.form.js"></script>

<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/jquery.fancybox.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/page/shangjia/shangjia/pagination.css">

<script src="<%=context%>/page/shangjia/shangjia/ZeroClipboard.js" type="text/javascript"> </script>
<script src="<%=context%>/page/shangjia/shangjia/bisindex.js"></script>
<link href="<%=context%>/page/shangjia/shangjia/layer(1).css" rel="stylesheet">
<script src="<%=context%>/page/shangjia/shangjia/layer.js"></script>
<script type="text/javascript">
    function linglake() {
        var isinvite = 'True';
        if (isinvite == 'True')
            window.open('/Other/BisInvitation');
        else {
            alert("请先绑定店铺！");
            window.open('/Bis/BoundShopBis');
        }
    }

    function saveAdcertisemenSet(id, type) {
        $.ajax({
            type: 'post',
            url: '/bis/ClearAdcertisement',
            data: { id: id, type: type },
            dataType: 'json',
            success: function (data) {
                $('.showDia').fadeOut(300);
            }
        });
    }
    function hideDialog(id) {
        if (id) {
            var Days = 1;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
            document.cookie = ("vipShowDia" + id) + "=True;expires=" + exp.toGMTString();
            $('.showDia-driver').fadeOut(300);
        }
    }

    function openDriverDetail() {
        layer.open({
            title: "已开通直通车的预约车手信息",
            type: 1,
            content: $('#driver-dialog').show(), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            //btn: ['关闭'],
            //yes: function (index, layero) {

            //    layer.close(index);
            //},
            //btn2: function (index, layero) {
            //    //按钮【按钮二】的回调

            //    //return false 开启该代码可禁止点击该按钮关闭

            //},
            //cancel: function () {
            //    //右上角关闭回调

            //    //return false 开启该代码可禁止点击该按钮关闭
            //}
        });
    }
</script>
<style>
    .shangjia_right {
        /*background: #f4f5f9;
        padding: 0;
        width: 1040px;
            */
        width: 1043px;
        padding: 22px 0 0 0;
        position: relative;
    }
</style>




<div class="clearfix">

    <div style="width: 200px; position: absolute;top: 22px;right: 20px;">
        <h5 style="width:198px;background:#fff;color:#666;font-size:12px;line-height:12px;margin-bottom:10px;">
            <em style="color:#f25f55">&nbsp;■&nbsp;</em>
            商家专属推荐
            <!--<a href="/BisForum/PartnerProduct/" target="_blank" style="color:#999;font-size:12px;font-weight:normal;float:right;margin-right:3px;">更多></a>-->
        </h5>
        <div style="width:200px;" class="clearfix">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3002504856&amp;site=qq&amp;menu=yes" onclick="clickNumber(46)" target="_brank"><img src="<%=context%>/page/shangjia/shangjia/91584bb4-9a55-4c46-beed-69032e608538" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>
                    <a href="http://sms.chaochujue.cn//user/goRegist?orangeKey=BGV3FVA6" onclick="clickNumber(51)" target="_brank"><img src="<%=context%>/page/shangjia/shangjia/fd2f1c38-80a9-4d93-9ece-512633b69e8d" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>
                    <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" onclick="clickNumber(24)" target="_brank"><img src="<%=context%>/page/shangjia/shangjia/1e16eecd-72c0-45ef-a2cb-73f42f26d9e8" style="width:200px; height:190px; margin-bottom:10px; border:none; float:left"></a>

        </div>
    </div>

    <div style="float:left;">
        <!--dept1-->

        <div class="right_top">
            <div class="right_mian clearfix" style="width: 100%; margin:22px 0;">
                <div class="bis_bg_top_left">
                    <div class="bis_bg_user_pic">
                        <img id="imgPic" style="cursor: pointer;width: 86px;height: 86px;border-radius: 86px" src="<%=context%>/page/shangjia/shangjia/shopdefaultavatar.jpg">
                        <a href="javascript:" id="touming" title="上传头像" style="display: none;">上传头像</a>
                    </div>
                    <p class="name">xiaoluo123</p>

                </div>
                <div class="bis_bg_top_mid">
                    <p class="type">
                        会员等级：
                            普通商家
                    </p>
                    <p class="clearfix">
                            您还未成为VIP会员哦！
                    </p>

                    <a href="https://www.meilipa.com/VIP/VIPDetailNew" class="bis_bg_top_btn" style="margin-top: 12px;margin-right:24px;" target="_blank">会员功能</a>
                    <a href="https://www.meilipa.com/help/compare" class="bis_bg_top_btn" style="margin-top:12px;background:#ffe8e8;border:1px solid #ff464e;color:#ff464e;box-sizing: border-box;line-height:26px;" id="obtain_freeDraw" target="_blank">
                        试用介绍
                    </a>
                    
                </div>
                <div class="bis_bg_top_vertical_line"></div>
                <div class="bis_bg_top_mid">
                    <p>账户余额：<span style="font-weight:600;font-size:18px;line-height:28px;">0.00</span> 元</p>
                    <p>
                        担保余额：<span style="color:#999;">0.00</span> 元
                        <!--<img src="/Content/images/bis_bg_top_icon2.png" style="float: left;margin-right: 5px" />
                        <span style="float: left">担保余额：<em style="color: #24aff3;">0.00 元</em></span>-->
                    </p>
                    <div class="clearfix" style="margin-top:12px;">
                        <a class="bis_bg_top_btn" href="https://www.meilipa.com/Bis/Recharge" target="_blank">充 值</a>
                        <a class="bis_bg_top_btn2" href="https://www.meilipa.com/SellerDrawApplayHis" target="_blank">账户明细</a>
                        <i style="float: left; color: #666;line-height: 28px;">|</i>
                        <a class="bis_bg_top_btn2" href="javascript:" onclick="HasTxianNum(&#39;/drawapply&#39;, &#39;/drawaccount&#39;)">提现</a>
                    </div>
                </div>
            </div>
        </div>


        <!--dept3-->
        <div class="bis_bg_data_show">
            

            <div class="clearfix">
                
                <ul class="clearfix">
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=5" target="_blank" class="bis_bg_top_btn3">
                            待支付：<em>0</em><i></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=1" target="_blank" class="bis_bg_top_btn3" style="margin-left: -1px;width: 267px;">
                            <i style="float:left"></i>进行中：<em>0</em><i></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.meilipa.com/JPinShopissueBis?status=4" target="_blank" class="bis_bg_top_btn3" style="margin-left:-1px;width:267px;">
                            <i style="float:left"></i>已完成：<em>0</em>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!--dept2-->
        <ul class="bis_bg_btn_box clearfix">
            <li>
                <a href="https://www.meilipa.com/Bis/BoundShopBis" target="_blank"><img src="<%=context%>/page/shangjia/shangjia/bis_bg_btn_icon1.png">绑定店铺<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/CompareOrder/Index" target="_blank"><img src="<%=context%>/page/shangjia/shangjia/bis_bg_btn_icon2.png">订单比对<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" target="_blank"><img src="<%=context%>/page/shangjia/shangjia/bis_bg_btn_icon2.png">发布活动<i></i></a>
            </li>
            <li>
                <a href="https://www.meilipa.com/JPinShopissueBis/AddOrEdit" target="_blank"><img src="<%=context%>/page/shangjia/shangjia/bis_bg_btn_icon4.png">活动报名</a>
            </li>
        </ul>
        <!--dept4-->
        <div class="mc-notice clearfix">
            <div class="mc-notice-left">
                <span class="mc-notice-header">商家公告</span>
                <div class="shangjia_ggleft">
                    <ul>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/help/BusinessRules" target="_blank" title="美丽啪商家服务协议">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 美丽啪商家服务协议
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-21</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=42" target="_blank" title="商家维护通知">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 商家维护通知
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-10</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=25" target="_blank" title="解/换绑店铺规则">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 解/换绑店铺规则
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-07</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/help/userRules2" target="_blank" title="美丽啪用户处罚规则">
                                    <div style="float:left;width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 美丽啪用户处罚规则
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-07-07</em>
                                </a>

                            </li>
                    </ul>
                </div>
            </div>
            <div class="mc-notice-right">
                <span class="mc-notice-header">店铺运营技巧和分析</span>
                <div class="shangjia_ggleft">
                    <ul>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=28" target="_blank" title="淘宝100问必读">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 淘宝100问必读
                                    </div>
                                    <em style="float:right;color:#999999;">2018-05-14</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=30" target="_blank" title="店铺降权了怎么办？">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 店铺降权了怎么办？
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-05-14</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=29" target="_blank" title="如何获取手淘首页流量？">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 如何获取手淘首页流量？
                                    </div>
                                    <em style="float:right;color:#999999;">2018-03-10</em>
                                </a>

                            </li>
                            <li class="clearfix">
                                <a href="https://www.meilipa.com/AnnounceGongGao?sk_id=32" target="_blank" title="【问答】淘宝运营问答">
                                    <div style="float:left; width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
                                        <em style="color:#f25f55">▪</em> 【问答】淘宝运营问答
                                            <em class="iconfont icon-hot" style="font-size:15px;color:#ff464e;"></em>
                                    </div>
                                    <em style="float:right;color:#999999;">2018-03-10</em>
                                </a>

                            </li>
                    </ul>
                </div>
            </div>

        </div>

        <div class="right_centr" style="width:982px; padding: 10px 17px 18px 20px">
            <div class="right_centr_top clearfix ">
                <span class="tuija_sy act">人气单品 <em class="tuija_sy_line"></em></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=1&amp;px=1#trygoodstype" target="_blank">女装</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=2&amp;px=1#trygoodstype" target="_blank">男装</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=4&amp;px=1#trygoodstype" target="_blank">鞋包</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=7&amp;px=1#trygoodstype" target="_blank">电器</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=5&amp;px=1#trygoodstype" target="_blank">百货</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=10&amp;px=1#trygoodstype" target="_blank">家居</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=6&amp;px=1#trygoodstype" target="_blank">母婴</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=8&amp;px=1#trygoodstype" target="_blank">美妆</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=9&amp;px=1#trygoodstype" target="_blank">配饰</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=3&amp;px=1#trygoodstype" target="_blank">食品</a></span>
                <span class="tuija_sy"><a href="https://jing.meilipa.com/?fl=11&amp;px=1#trygoodstype" target="_blank">车品</a></span>

                
                <!--tuija_sy-->
                <div class="qbsy">
                    <a href="https://jing.meilipa.com/" target="_blank">
                        更多推荐
                        <img src="<%=context%>/page/shangjia/shangjia/sy_lsy_qb.jpg" style="margin-left: 5px;">
                    </a>
                </div>
            </div>


            <!--qbsy-->
            <div class="tre_cst">
                <div class="trd_lcq">
                    
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/78921.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/TB2wuIliBnTBKNjSZPfXXbf1XXa_!!1595887680.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/78921.html" target="_blank">貂绒毛衣女中长款</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">110.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>29304</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/71625.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/TB2kbvAy7yWBuNjy0FpXXassXXa_!!3942835591-0-item_pic.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/71625.html" target="_blank">夹克男原宿风bf宽松</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">103.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>16071</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/72589.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/TB2n9cZFHSYBuNjSspfXXcZCpXa_!!67978459.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/72589.html" target="_blank">广西百香果一件30个</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">33.80</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>15556</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79186.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/O1CN011tfz7h3IrVEhGwL_!!3711085930.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tb"></span>
                                    <a href="https://jing.meilipa.com/79186.html" target="_blank">波士顿女包枕头包2018秋季新款</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">175.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>27238</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79263.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/TB1VEiGownH8KJjSspcXXb3QFXa_!!0-item_pic.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/79263.html" target="_blank">5400mAh胖宠暖手宝 </a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">148.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>15404</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>
                            <div class="vc_xs">
                                <div class="ed_cq">
                                    <a href="https://jing.meilipa.com/79274.html" target="_blank" style="height:147px;width:100%;">
                                        <img src="<%=context%>/page/shangjia/shangjia/TB2vBFEtyMnBKNjSZFCXXX0KFXa_!!398172128.jpg">
                                    </a>
                                </div>
                                <!--ed_cq-->
                                <div class="sy_j" style="  text-align: left;">
                                    <span class="iconfont icon-tm"></span>
                                    <a href="https://jing.meilipa.com/79274.html" target="_blank">55度恒温暖暖杯 少女心爆棚 萌炸啦</a>
                                </div>
                                <!--sy_j-->
                                <div class="srr_pz">
                                    <div class="str_pq">
                                        <em>￥</em><strong style="font-weight: normal;">138.00</strong>
                                    </div>
                                    <!--str_pq-->
                                    <span>|</span>
                                    <div class="str_pev">
                                        <strong>25397</strong>人申请
                                    </div>
                                    <!--str_pev-->
                                </div>
                                <!--srr_pz-->
                            </div>

                </div>
                <!--trd_lcq-->

            </div>
            <!--tre_cst-->
            <!--qbsy-->
            <div class="tre_cst">
                <div class="trd_lcq">
                </div>
                <!--trd_lcq-->

            </div>
            <!--tre_cst-->
        </div>
    </div>
</div>



<style>
    #driver-dialog {
        display: none;
        width: 340px;
    }

    .driever-dialog-children {
        padding: 10px 40px;
    }

    #driver-dialog p {
        padding: 5px 0;
    }
</style>
<div id="driver-dialog">
    <div class="driever-dialog-children">
        <div class="label-box" id="label-box"><p>-(周undefined)</p></div>
    </div>
    <div class="layui-layer-btn">
        <span style="margin-right: 50px;line-height:30px;color:#ff464e;">如需修改请联系你的直通车专员</span>
        <a class="layui-layer-btn0">关闭</a>
    </div>
</div>
<script>
    var nameStr = "".split(",");
    var dateStr = "".split(",");

    var html = "";

    if (nameStr[0] != "系统推荐车手") {
        for (var i = 0; i < nameStr.length; i++) {
            html += "<p>" + nameStr[i] + "-" + dateStr[i] + "(周" + ["日", "一", "二", "三", "四", "五", "六"][new Date(dateStr[i]).getDay()] + ")</p>"
        }
    } else {
        html += "<p>你选择了：系统推荐车手</p>";
        html += "<p>&nbsp;</p>";
        html += "<p>设置的类目： " + dateStr[0] + "</p>";
    }
    document.getElementById("label-box").innerHTML = html;

</script>


            </div>
        </div>
    </div>
    
<div class="footer">
    <div class="footer_main">
        <div class="footer_left">
            <div class="footer_xy" style="padding-top: 58px;">
                <a href="https://www.meilipa.com/Regist/about" target="_blank">联系我们</a><span>|</span>
                <a href="https://www.meilipa.com/Help/AdvertisingCost" target="_blank">商务合作</a><span>|</span>
                <a href="https://www.meilipa.com/Regist/UserAgreement" target="_blank">用户协议</a><span>|</span>
                <a href="https://www.meilipa.com/help/index" target="_blank">帮助中心</a>
            </div>
            <div class="footer_fl">
                <span>Copyright © 2017 meili.com</span> 浙ICP备17042206号-1&nbsp;&nbsp;浙公网安备33010302003013号&nbsp;&nbsp;杭州美名科技有限公司
            </div>
            <div>
                <a class="f_t" rel="nofollow" title="美丽啪官网" target="_blank"></a>
                
                <a class="f_f" rel="nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.meilipa.com&amp;at=business" title="美丽啪官网" target="_blank"></a>
                <a class="f_g" rel="nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.meilipa.com&amp;at=business" title="美丽啪官网" target="_blank"></a>
            </div>
        </div>
        <div class="footer_right" style="float: left; margin-left: 80px;">
            <div class="footer-sp1">bussiness@meilipa.com</div>
            
        </div>
        <div style="float: left; margin-top: 52px;margin-left: 80px;">
            <p style="width: 100px;text-align: center">关注美丽啪公众号</p>
            <img style="width: 100px; height: 100px;" src="<%=context%>/page/shangjia/shangjia/shangjia_code.jpg">
        </div>      
    </div>
</div>
</div>
<div id="loading" style="position:fixed;top:50%;left:50%;margin-left:-16px;margin-top:-16px;display:none;">
    <img src="<%=context%>/page/shangjia/shangjia/loading.gif" style="width:32px;height:32px;">
</div>

<a href="javascript:void(0)">
    </a><div class="nrtou" id="abc" style="display: none;"><a href="javascript:void(0)">
        <img src="<%=context%>/page/shangjia/shangjia/shoufw2.png" style="display:block;">
        </a><a href="javascript:" class="fork" onclick=" $(&#39;#abc&#39;).hide();">ｘ</a>
        <div>
            <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3003739359&amp;site=qq&amp;menu=yes" target="_blank">业务咨询</a>
        </div>
        <div style="padding:8px 0;"></div>
    </div>


<style>
    .nrtou div {
        background: #ff464e;
        text-align: center;
        padding: 12px 0;
    }

        .nrtou div a {
            font-size: 15px;
            border-radius: 4px;
            display: inline-block;
            height: 38px;
            width: 120px;
            background: #fff;
            color: #ff464e;
            line-height: 38px;
        }

            .nrtou div a:hover {
                background: #f6d4d4;
            }
</style>
    <script src="<%=context%>/page/shangjia/shangjia/jquery.form.js(1)" type="text/javascript"></script>
<div class="tchs" id="logindialog" style="display: none;">
    <div id="dialog_log_qiandao" class="dialog-wrapper dialog_log_qiandao" style="width: 416px;">
        <span class="red">
            登录/注册
            <a href="javascript:void(0)" title="关闭窗口" onclick="$(&#39;#logindialog&#39;).hide()">
                <span class="close"></span>
            </a>
        </span>
        <div class="diginfo" style="border: none">
            <div class="log-cont">
                <ul class="clickTitle">
                    <li onclick="tab(this,0)" class="active"><i class="icon-1"></i> 用户登录</li>
                    <li onclick="window.open(&#39;//www.meilipa.com/Regist/UserRegister&#39;)"><i class="icon-2"></i> 用户注册</li>
                </ul>
                <div class="tabcont">
                    <div class="tab">
                        <form style=" width: 288px; margin: 0 auto;" method="POST">
                            <div class="mb-20 msg-input">
                                <input type="text" id="username" placeholder="请输入邮箱/手机号/用户名" title="邮箱/手机号/用户名" onkeydown="keyLogin(event)">
                                <input type="password" class="pwd" id="password" placeholder="请输入密码" autocomplete="off" disableautocomplete="" onkeydown="keyLogin(event)">
                            </div>
                            <div class="btn">
                                <input id="submitbtn" type="button" class="btn-input" value="立即登录" title="登 录" onclick="loginSubmit(1, location.href)">
                            </div>
                            <div class="clearfix msg-tip" style="height: 52px;">
                                <div class="msg-tip-lf">
                                    <p id="error" class="err-txt" style="display:none;">请输入密码</p>
                                    <p class="tip-txt" style="margin-bottom:0;">使用其他账号登录</p>
                                </div>
                                <a class="msg-tip-rt" href="https://www.meilipa.com/Security/FindPassword?usertype=1">
                                    <p>忘记密码？</p>
                                </a>
                                <div class="jiao"></div>
                            </div>
                        </form>
                        <div class="qq-login">
                            <a href="javascript:" onclick="WxLogin()">
                                <div class="qq-icon wx-icon"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>



    <a class="totop" id="back-to-top" style="display: none">


</a><div style="display: none"><a class="totop" id="back-to-top" style="display: none">
    <script src="<%=context%>/page/shangjia/shangjia/z_stat.php" language="JavaScript"></script><script src="<%=context%>/page/shangjia/shangjia/core.php" charset="utf-8" type="text/javascript"></script></a><a href="http://www.cnzz.com/stat/website.php?web_id=1264684842" target="_blank" title="站长统计">站长统计</a>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?688dd87df7b6415752fbd3fdd58258d9";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</div><div class="selectIMG" style="display: none;"><h3>点击图片选择头像 <i class="iconfont icon-close1"></i></h3><li><img src="<%=context%>/page/shangjia/shangjia/1.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/2.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/3.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/4.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/5.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/6.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/7.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/8.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/9.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/10.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/11.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/12.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/13.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/14.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/15.png" alt="加载失败"></li><li><img src="<%=context%>/page/shangjia/shangjia/16.png" alt="加载失败"></li><ul></ul></div></body></html>