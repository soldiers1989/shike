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
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/base.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/home.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/index.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/iconfont.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/signup.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/pagination.css" rel="stylesheet">
    <link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/credit.css" rel="stylesheet">
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery-1.8.3.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery.pagination.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/common/js/common.js"></script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/credit.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context %>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    <script>
        var userId = 0;
    </script>
<style type="text/css">#YSF-BTN-HOLDER{position: fixed;max-width:30px;max-height:120px;right: 30px; bottom: 24px; cursor: pointer; overflow: visible; filter: alpha(opacity=100);opacity:1;z-index: 9990} #YSF-BTN-HOLDER:hover{filter: alpha(opacity=95);opacity:.95} #YSF-BTN-HOLDER img{ display: block;overflow: hidden; } #YSF-BTN-CIRCLE{display: none;position: absolute;right: -5px;top: -6px;width: auto;min-width: 12px;height: 20px;padding: 0 4px;background-color: #f00;font-size: 12px;line-height: 20px;color: #fff;text-align: center;white-space: nowrap;font-family: sans-serif;border-radius: 10px;z-index:1;} #YSF-BTN-BUBBLE{display: none;position: absolute;left: -274px;bottom:-15px;width: 278px;height: 80px;box-sizing: border-box;padding: 14px 22px;filter: alpha(opacity=100);opacity:1;background: url(https://qiyukf.com/sdk//res/img/sdk/bg_floatMsg2x.png) no-repeat;background:url(https://qiyukf.com/sdk//res/img/sdk/bg_floatMsg.png)9; background-size: 278px 80px; z-index: 1;} #YSF-BTN-HOLDER.layer-6{bottom:0;} #YSF-BTN-HOLDER.layer-1 #YSF-BTN-BUBBLE{top:0} #YSF-BTN-HOLDER.layer-6 #YSF-BTN-BUBBLE{bottom:-6px;} #YSF-BTN-BUBBLE:hover{filter: alpha(opacity=95);opacity:.95} #YSF-BTN-CONTENT{height:45px;padding: 0;white-space: normal;word-break: break-all;text-align: left;font-size: 14px;line-height: 1.6;color: #222;overflow: hidden;z-index: 0;} #YSF-BTN-ARROW{ display: none; } #YSF-BTN-CLOSE{position: absolute; width:15px; height:15px;right: 4px;top: -3px; filter: alpha(opacity=90); opacity:.9; cursor: pointer; background: url(https://qiyukf.com/sdk//res/img/sdk/btn-close.png) no-repeat;z-index: 1} #YSF-BTN-CLOSE:hover{filter: alpha(opacity=100); opacity: 1;} #YSF-PANEL-CORPINFO.ysf-chat-layeropen{ width: 511px; height: 470px; box-shadow: 0 0 20px 0 rgba(0, 0, 0, .15);} #YSF-PANEL-CORPINFO{ position: fixed; bottom: 0px; right: 20px; width: 0; height: 0; z-index: 99999; } #YSF-PANEL-INFO.ysf-chat-layeropen{ width: 311px; height: 470px; filter: alpha(opacity=100);opacity:1; box-shadow: 0 0 20px 0 rgba(0, 0, 0, .15);} #YSF-PANEL-INFO{ position: fixed; bottom: 0px; right: 20px; width: 0px; height: 0px; filter: alpha(opacity=0);opacity:0;z-index: 99999;} #YSF-PANEL-INFO .u-btn{background-color: #F96868} #YSF-CUSTOM-ENTRY{background-color: #F96868;} #YSF-CUSTOM-ENTRY-0{position: relative;width:auto;background-color: #F96868;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-1{position: relative;width:auto;background-color: #F96868;border-radius: 14px; box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-2{position: relative;width:auto;background-color: #F96868;border-radius: 0;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-3{position: relative;width:auto;background-color: #F96868;border-radius: 50%;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-4{position: relative;width:auto;background-color: #F96868;border-radius: 50%;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-5{position: relative;width:auto;background-color: #F96868;border-radius: 5px;box-shadow: 0px 6px 10px 0px rgba(0,0,0,0.25);} #YSF-CUSTOM-ENTRY-6{position: relative;width:auto;background-color: #F96868;border-radius:5px;border-bottom-left-radius: 0;border-bottom-right-radius: 0;} #YSF-CUSTOM-ENTRY-0 img{max-width: 300px;height:auto;} #YSF-CUSTOM-ENTRY-1 img{width:28px;height:auto;} #YSF-CUSTOM-ENTRY-2 img{width:58px;height:auto;} #YSF-CUSTOM-ENTRY-3 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-4 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-5 img{width:60px;height:auto;} #YSF-CUSTOM-ENTRY-6 img{width:115px;height:auto;} #YSF-IFRAME-LAYER{ border:0; outline:none; } .ysf-online-invite-wrap{z-index:10001;position:fixed;_position:absolute;top:50%;left:50%;} .ysf-online-invite{position:relative;top:-50%;left:-50%;cursor:pointer;} .ysf-online-invite img{display:block;width:250px;} .ysf-online-invite .ysf-online-invite-img{width:100%;height:100%} .ysf-online-invite .text{position:absolute;top:-11px;left:0;right:0;overflow:hidden;margin: 36px 20px 0 67px;line-height:140%;color:#526069;font-size:14px;font-family:"Microsoft YaHei","微软雅黑",tahoma,arial,simsun,"宋体";text-align:left;white-space:normal;word-wrap:break-word;} .ysf-online-invite .close{position:absolute;top:-6px;right:-6px;width:32px;height:32px;background:url(https://qiyukf.com/sdk/res/img/invite-close.png) no-repeat;cursor:pointer;} .ysf-online-invite .close.custom{top:-16px;right:-16px;}</style><script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/share.js"></script><link rel="stylesheet" href="<%=BusiConstant.shikewebepath %>/haohuo/detail/share_style0_16.css"></head>
<body>

<jsp:include page="../common/top1.jsp" flush="true"/>
<input id="id" type="hidden" value="${id}">
<div class="yonghu_top">
    <div id="header" class="header">

        <div id="nav" class="nav" style="font-family: 微软雅黑;">
            <div class="main">

                <!--qiandaog-->
                <ul>
                    <li>
                        <a href="<%=BusiConstant.shike_web_haohuo.getKey() %>" class="jpSwip  selet" style="background-position: center -180px;">
                            试呗好货
                            <span class="ntp-hot">
                                <img src="<%=BusiConstant.shikewebepath %>/haohuo/haohuo/new.gif" class="png_bg">
                            </span>
                        </a>
                    </li>
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
    var jpSwip = 0;
    setInterval(function () {
        jpSwip++;
        jpSwip = jpSwip == 22 ? 0 : jpSwip;
        $(".jpSwip").css("background-position", "center -" + jpSwip * 45 + "px");
    }, 100);

</script>
    <script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/7a320daff2b34ec63dad348e818563e6.js"></script><div style="top: 0px; left: 0px; visibility: hidden; position: absolute; width: 1px; height: 1px;"><iframe style="height:0px; width:0px;" src="<%=BusiConstant.shikewebepath %>/haohuo/detail/delegate.html"></iframe></div><div class="layer-1" id="YSF-BTN-HOLDER" style="display: none;"><div id="YSF-CUSTOM-ENTRY-1"><img src="<%=BusiConstant.shikewebepath %>/haohuo/detail/1.png"></div><span id="YSF-BTN-CIRCLE"></span><div id="YSF-BTN-BUBBLE"><div id="YSF-BTN-CONTENT"></div><span id="YSF-BTN-ARROW"></span><span id="YSF-BTN-CLOSE"></span></div></div>
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
<%--<div class="floattips">

    <a class="yaoqing" href="https://www.test.com/invitation/NewInvitation" target="_blank">
        <i class="ic9" style="background: url(//www.test.com/Content/images/cbl_yaoqing.png) no-repeat; height: 25px; margin: 5px 14px;"></i>
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
                                <img style="width:87px;height:29px;vertical-align:middle;" border="0" src="<%=BusiConstant.shikewebepath %>/haohuo/detail/qq-online.png" alt="点击这里给我发消息" title="点击这里给我发消息">
                            </a>
                        </p>
                    </div>

                    <div class="qq-online-header">商家专属通道</div>
                    <div class="qq-online-body" style="padding-bottom:20px;">
                        <p style="line-height:66px;">

                            <span>QQ咨询：3005198763</span>
                            <a target="_blank" href="https://wpa.qq.com/msgrd?v=3&amp;uin=3005198763&amp;site=qq&amp;menu=yes" style="display:inline; width:auto; height:auto;margin-left:6px;">
                                <img style="width:87px;height:29px;vertical-align:middle;" border="0" src="<%=BusiConstant.shikewebepath %>/haohuo/detail/qq-online.png" alt="点击这里给我发消息" title="点击这里给我发消息">
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
            <a href="https://www.test.com/Regist/Jingxuan" target="_blank" class="seaf">
                <i class="ic9"></i>
            </a>
            <span class="hint_text setd" style="display: none;right: 34px;">
                <i>新手入门</i>
            </span>
        </div>
    <div class="secnd_li seced">
        <a href="https://test.com/108900.html?isgold=1" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heak" style="display: none">
            <img src="<%=BusiConstant.shikewebepath %>/haohuo/detail/wxfl_yonghu.png">
        </div>
    </div>
    <div class="secnd_li secft">
        <a href="https://www.test.com/other/appdownload" target="_blank">
            <span class="shend"></span>
        </a>
        <div class="heack" style="display:none">
            <img src="<%=BusiConstant.shikewebepath %>/haohuo/detail/linla.png">
        </div>
    </div>
    <div class="second_li secnd_li secet">
        <a href="https://www.test.com/Feedback" target="_blank" class="seaf">
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
</div>--%>

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
    

<script>
    var _taobao = '';
    var _id = '108900';
    var uid = 0;
    var shopType=1;
    var men = "";
    function applyOne() {
        checkLogin(function () {
            if (_taobao == "") {
                $('#bindtaobao').show();
            } else {
                var limited = '';
                if (limited == 1) {
                    $.post("/Home/CheckSeckill",{skid:_id},function (re) {
                        if(re.Result){
                            window.location.href = '//www.test.com/JPinShopIssueUser/OrderFlow?activityId=' + _id+'&limited=';
                        }else {
                            myDialog({
                                msg: "限量秒杀份数已发完，进行普通申请？",
                                okText: "确定",
                                ok: function () {
                                    window.location.href = '//www.test.com/JPinShopIssueUser/OrderFlow?activityId=' + _id;
                                },
                                cancelText: "取消"
                            });
                        }
                    });
                }else {
                    window.location.href = '//www.test.com/JPinShopIssueUser/OrderFlow?activityId=' + _id+'&limited=';
                }
            }
        });
    }
    $(function () {

        $(".phone-btn").on("click", function (e) {
            e.stopPropagation();
            $("#phone-canvas").fadeIn();

        });
        $("body").on("click", function () {
            $("#phone-canvas").fadeOut();
        });
        if ($("#phoneUrl").val()) {//手机端有值，扫手机端
            $('#phone-canvas-con').qrcode({
                render: "canvas",
                text: $("#phoneUrl").val(),
                width: "160",               //二维码的宽度
                height: "160",              //二维码的高度
                background: "#ffffff",       //二维码的后景色
                foreground: "#000000",        //二维码的前景色
            });
        }
        if ($("#fromuserid").val()) {//登录有值，分享否则关注网站
            $('#code').qrcode({
                render: "canvas",
                text: "http://m.test.com/#/Detail?id="+_id+"&showWx=1&limited=",
                width: "160",               //二维码的宽度
                height: "160",              //二维码的高度
                background: "#ffffff",       //二维码的后景色
                foreground: "#000000",        //二维码的前景色
            });
        } else {
            $("img.lookWX").fadeIn();
            $("p.lookWX").html("扫码关注微信号");
        }

        var changeFlag = false;
        $(".get-change-btn").on("click", function () {
            if (changeFlag) {
                return false;
            }
            changeFlag = true;
            $.post("Home/Recommend", {}, function(D) {
                changeFlag = false;
                if (D.Result) {
                    if (D.Data.length == 0) {
                        myAlert("没有更多数据了");
                    } else {
                        $(".recom-con").html("");
                        var html = "";
                        for (var i = 0; i < D.Data.length; i++) {
                            var imgArr = D.Data[i].Item2.split("|");

                            html += '<li><a href="'+ D.Data[i].Item5 +'.html"><img src="'+imgArr[0]+'" alt="加载失败" /></a>';

                            html += '<p><span class="iconfont icon-'+['tb','tm','jd','tb'][D.Data[i].Item6]+'"></span> ' + D.Data[i].Item1+ '</p><div>';
                            html += '<span class="price">价值：<em style="text-decoration:line-through;">￥' + parseInt(D.Data[i].Item3).toFixed(2) + '</em></span>';
                            html += '<span class="num">' + D.Data[i].Item4+ '人已申请</span></div></li>';
                        }
                        $(".recom-con").html(html);
                    }
                } else {
                    myAlert("请求失败");
                }
            });
        });

        var swiper = {
            timmer: null
        }
        swiper.timmer = setInterval(function () {
            toswiper();
        }, 4000);
        function toswiper(num) {
            var index = $(".info .swiper span.act").index();
            if (num == index) {
                return false;
            }
            index = index == 3 ? 0 : index - 0 + 1;
            num = num == 0 ? 0 : num || index;
            $(".info .swiper span").eq(num).addClass("act").siblings().removeClass("act");
            $(".info .swiper ul li").fadeOut(618).eq(num).fadeIn(500);
        }
        $(".info .swiper span").on("click", function () {
            toswiper($(this).index());
        });
        $(".info .swiper").on("mouseenter", function () {
            clearInterval(swiper.timmer);
        }).on("mouseleave", function () {
            swiper.timmer = setInterval(function () {
                toswiper();
            }, 4000);
        });
    });
    window._bd_share_config = {
        "common": {
            "bdSnsKey": {},
            "bdText": "领免费试用，就上试呗",
            "bdDesc": "【免费试用】",
            "bdUrl": "https://test.com/108900.html",
            "bdPic": "",
            "bdMini": "2",
            "bdMiniList": ["qzone", "tsina", "weixin", "renren", "tqq", "sqq"],
            "bdStyle": "0",
            "bdSize": "16"
        },
        "share": {}
    };
    with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = '/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];

    function TipShow(message, tip, callback,callback1,callback2) {
        $('#linglamsg').remove();
        var title = "提示信息";
        var btn = "";
        if (tip==1) {
            title = "已兑完提醒";
            btn = '<a href="javascript:" class="qdingann qdingann_a" >兑换其他商品</a>' +
                '<a href="javascript:" class="qdingann qdingann_b" style="background-color:#999;">我要免费申请</a>';
        } else if (tip == 3) {
            title = "申请上限提醒";
            btn = '<a href="javascript:" class="qdingann qdingann_a" >我要免费申请</a>' +
                '<a href="javascript:" class="qdingann qdingann_b" style="background-color:#999;">成为VIP</a>';
        }
        else if (tip == 4) {
            title = "已申请过该活动";
            btn =  '<a href="javascript:" class="qdingann qdingann_a" >兑换其他活动</a>'+
                '<a href="javascript:" class="qdingann qdingann_b" >关闭</a>'
        }
        else if(tip == 5)
        {
            title = "兑换确认提醒";
            btn = '<a href="javascript:" class="qdingann qdingann_a" >我再想想</a>' +
               '<a href="javascript:" class="qdingann qdingann_b">我要兑换</a>';
        }
        else if(tip==6){
            title = "流量上限提醒";
            btn =  '<a href="javascript:" class="qdingann qdingann_a" style="margin: 20px 140px;">看看其他活动</a>'
        }
        else {
            title = "兑换上限提醒";
            btn = '<a href="javascript:" class="qdingann qdingann_a" >看看其他活动</a>' +
                '<a href="javascript:" class="qdingann qdingann_b" style="background-color:#999;">我要免费申请</a>';
        }
        var html = '<div class="tchs" id="linglamsg">' +
            '<div style="position:relative;width:100%;height:100%">' +
            '<div id="msgbox" class="lila_index" style="position:absolute;top:50%;left:50%;">' +
            '<div class="ling">' +
            '<strong>' + title + '</strong> ' +
            '<a onclick="$(\'#linglamsg\').remove()" style="cursor: pointer"><img src="//www.test.com/Content/images/xx.jpg" /></a>' +
            '</div>' +
            '<div class="ling_mian">' +
            '<div class="sy_cgt">' + message + '</div>' + btn +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>';
        $('body').append(html);
        $('#msgbox').css("margin-top", -$('#msgbox').height() / 2);
        $('#msgbox').css("margin-left", -$('#msgbox').width() / 2);
        if (tip == 1) {
            $('.qdingann_a').bind('click', function () {
                callback();
            });
            $('.qdingann_b').bind('click', function () {
                applyOne();
            });
        } else if (tip == 2) {
            $('.qdingann_a').bind('click', function () {
                window.location.href = "//test.com/";
            });
            $('.qdingann_b').bind('click', function () {
                applyOne();
            });
        }else if(tip ==4)
        {
            $('.qdingann_a').bind('click', function () {
                window.location.href = "//test.com/Home/GoldConvert";
            });
            $('.qdingann_b').bind('click', function () {
                $('#linglamsg').remove();
            });
        }else if(tip == 5){
            $('.qdingann_a').bind('click', function () {
                $('#linglamsg').remove();
            });
            $('.qdingann_b').bind('click', function () {
                callback2();
            });
        }
        else if(tip==6){
            $('.qdingann_a').bind('click', function () {
                window.location.href = "//test.com/";
            });
        }
        else {
            $('.qdingann_a').bind('click', function () {
                callback1();
            });
            $('.qdingann_b').bind('click', function () {
                callback2();
            });
        }

    }
</script>
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikewebepath %>/haohuo/detail/detail.css">
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery.qrcode.js"></script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/qrcode.js"></script>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/utf.js"></script>
<div class="info">
    <input type="hidden" id="sk_id" value="1">
    <div class="con">
        <div class="swiper">
                <input id="fromuserid" type="hidden" value="">


            <ul>
                                <li style="display: block;"><img id="img0" src=""></li>
                                <li style="display: none;"><img id="img1" src=""></li>
                                <li style="display: none;"><img id="img2" src=""></li>
                                <li style="display: list-item; "><img id="img3" src=""></li>
            </ul>
            <div>
                            <span class="act"></span>
                            <span class=""></span>
                            <span class=""></span>
                            <span class=""></span>
            </div>

        </div>

        <div class="ml360">
            <h4>
                <span style="font-weight:500;" class="iconfont icon-tb "></span>
                <font id="title"></font>
                                
            </h4>
            <ul class="price">
                <li>商品价值：<span id="price"></span>元</li>
                        <li>剩余份数：<b id="syNum"></b>份</li>
                            <%--<li>金币兑换：<span class="orange">1</span>金币</li>
                            <li style="margin-right:0;">兑换剩余份数：<b style="color:#ff464e;">0</b>份</li>--%>

            </ul>
            <div class="btn-bg" style="background-color: #ffcbd6">
                
                    <div id="phone-canvas" style="display: none;">
                        <span>微信扫一扫</span>
                        <%--<span class="red">注：手机端账号和pc端账号</span>
                        <span class="red">须一致(否则，重新登录)</span>--%>
                        <div id="phone-canvas-con">

                        <%--<canvas width="160" height="160"></canvas>--%>
                        </div>
                    </div>

                                        <%--<a class="btn gold-btn gray">今日已兑完</a>--%>
                                    <input type="hidden" id="phoneUrl" value="http://www.91midai.com/shike/skm/haohuo">
                                    <span class="btn phone-btn  ">手机申请</span>

                
                                <div>
                                    <i class="iconfont icon-time" style="margin-right:0; vertical-align:bottom;"></i> 下次开奖时间：明日
                                    <span>10</span>：
                                    <span>00</span>
                                </div>
                
                
            </div>
            <div class="defend">
                        今日金币份数已兑完，明日请赶早！
            </div>
            <ul class="people">
                <li>

                    <span><b id="sqNum"></b>人已申请</span>
                </li>
                <li>
                    <span><b id="yzjNum"></b>人已中奖</span>
                </li>
            </ul>
            <%--<div class="detail-defend">
                <i class="icon-defend iconfont"></i>
            </div>--%>
            <%--<div class="detail-share">
                <div class="bdsharebuttonbox bdshare-button-style0-16" data-tag="share_1" data-bd-bind="1542897652495">

                </div>
            </div>--%>
        </div>
        <div class="shop-cat">
            <div class="tc-hd">
<%--商家类型：<i class="icon-month icon-cat6"></i>--%>
            </div>
            <p class="lookWX">扫码关注微信号</p>
            <div id="code">
                <img class="lookWX" style="" src="<%=BusiConstant.shikewebepath %>/haohuo/detail/linglaG.jpg" alt="加载失败">
            </div>

        </div>
    </div>
    <div class="flow">
        <div>
            申请流程
            <i class="iconfont icon-right"></i>
        </div>
        <ul>
            <li>
                <i class="iconfont icon-hart"></i>
                <div>
                    <b>1.申请流程</b> 选择喜爱的宝贝完成申请
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
                    <b>3.下单付款</b> 按照流程操作并提交订单号
                </div>
            </li>
            <li>
                <i class="iconfont icon-text"></i>
                <div>
                    <b>4.提交试用报告</b> 提交真实客观的试用报告
                </div>
            </li>
            <li>
                <i class="iconfont icon-monery"></i>
                <div>
                    <b>5.返还担保金</b> 报告通过后返还担保金，提现
                </div>
            </li>
        </ul>

    </div>
    <div class="info-alt mt24">
        <div class="alt-hd">
            <span>温馨提示</span>
        </div>



        <div class="alt-item mt30">
            <h4>请注意以下事项</h4>
            <ul>
                <li>请核对店铺拍下订单的单价加邮费是否是<span id="price2"></span>元</li>
                <li>禁止在旺旺上提“试呗”“免费试用”等</li>
                <li>无特殊说明，请不要使用产生手续费的付款方式</li>
                <li>不要催促商家返款</li>
            </ul>
        </div>
        <div class="alt-item mt30">
            <h4>如何提高申请通过率</h4>
            <p>申请次数越多；连续签到时间越长；多邀请好友一起参加，及时绑定微信，及时完善个人信息，开通VIP服务，满足这些条件，通过率就越高哦~ </p>
        </div>
    </div>
    <div class="detail_xingqer">
        <iframe id="frameorderlist" class="top20 parent_ifr" frameborder="0" marginheight="0" marginwidth="0" border="0" scrolling="no"
                src="<%=BusiConstant.shike_web_haohuo_detailpic.getKey() %>?id=${id}" width="100%"
                onload=" SetCwinHeight(&#39;frameorderlist&#39;); " style="height: 1020px;">
        </iframe>
    </div>
    <div class="recommend mt24">
        <h2>精选推荐<span class="get-change-btn"><i class="iconfont icon-change"></i>换一批</span></h2>
        <ul class="recom-con">
                   <%-- <li>
                        <a href="httpaa.html"><img src="" alt=""></a>
                        <p><span class="iconfont icon-tm"></span></p>
                        <div>
                            <span class="price">价值：<em style="text-decoration:line-through;">￥10</em></span>
                            <span class="num"><em>1</em>人已申请</span>
                        </div>
                    </li>--%>

        </ul>
    </div>
    <div style="clear: both;"></div>
</div>
<jsp:include page="../common/footer.jsp" flush="true"/>

<link href="<%=BusiConstant.shikewebepath %>/haohuo/detail/style.css" rel="stylesheet"><%--
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/Validform_v5.3.2.js"></script>--%>
<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/jquery.form.js"></script>
<style>
    .msg-tip-lf .tip-txt {
        margin-bottom: 0;
    }
    .Validform_right,.Validform_wrong {
        line-height: 20px;
    }
</style>
<%--<div class="tchs" id="logindialog" style="display: none;">
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
                    <li onclick="window.open(&#39;//www.test.com/Regist/UserRegister&#39;)"><i class="icon-2"></i> 用户注册</li>
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
                                    <p class="tip-txt">使用其他账号登录</p>
                                </div>
                                <a class="msg-tip-rt" href="https://www.test.com/Security/FindPassword?usertype=1">
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
</div>--%>
<script>
    function tab(Nav, Num) {
        if (Nav.className == "active") return;//为了提高效率
        $(Nav).addClass('active').siblings().removeClass();
        $(Nav).parent().next().find(".tab").eq(Num).show().siblings().hide();
    }
</script>



    <a class="totop" id="back-to-top" style="display: none">



</a>

<script src="<%=BusiConstant.shikewebepath %>/haohuo/detail/detail.js"></script>
</body></html>