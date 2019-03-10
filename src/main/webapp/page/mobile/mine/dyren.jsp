<%@page import="com.kensure.shike.user.model.SKUser"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
	SKUser user = (SKUser)request.getAttribute("curentuser");
%>
<!DOCTYPE html>
<html lang="zh" >

<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>代言人</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    
    <link rel="stylesheet" href="<%=BusiConstant.context%>/page/mobile/mine/dyren/css/reset.css">
	<link rel="stylesheet" href="<%=BusiConstant.context%>/page/mobile/mine/dyren/css/iconfont.css">
    <link rel="stylesheet" href="<%=BusiConstant.context%>/page/mobile/mine/dyren/css/common.css">
    <link rel="stylesheet" href="<%=BusiConstant.context%>/page/mobile/mine/dyren/css/share.css">
    
    <script src="<%=BusiConstant.context%>/page/mobile/mine/dyren/js/index.min.js"></script>
	
<style>
    body{
        background: rgba(250,82,66,1);
        box-shadow: 0px 8px 48px 60px rgba(248,61,83,0.4), 0px 15px 118px 0px rgba(253,200,52,0.44) inset;
        padding-bottom: 30px;
    }
</style>

<style type="text/css">@keyframes animate_dots{0%{opacity:1}to{opacity:0}}@-webkit-keyframes animate_dots{0%{opacity:1}to{opacity:0}}.dot0,.dot1{animation:animate_dots .9s infinite;-moz-animation:animate_dots .9s infinite;-webkit-animation:animate_dots .9s infinite;-o-animation:animate_dots .9s infinite}.dot1{animation-delay:.2s;-webkit-animation-delay:.2s}.dot2{animation:animate_dots .9s infinite;-moz-animation:animate_dots .9s infinite;-webkit-animation:animate_dots .9s infinite;-o-animation:animate_dots .9s infinite;animation-delay:.4s;-webkit-animation-delay:.4s}.dots_item{display:inline-block;margin-right:5px;width:10px;height:10px;border-radius:50%;background:#4886ff}.verify-icon{position:absolute;width:100%;margin-top:70px;text-align:center}.t-mask{width:100%;height:100%;position:fixed;_position:absolute;left:0;top:0;background:#000;opacity:.5;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=50);z-index:2000000000}</style>
</head>

<body style="font-size: 24px;">
<!--主题内容-->

<div class="conmon_header">
    <i class="iconfont icon-fanhui" onclick="window.history.go(-1)"></i>
    <h1>分享赚钱</h1>
    <button style="opacity: 0;"><a href="javascript:void(0)"></a></button>
</div>
<div class="empty"></div>
<div class="teyao_banner">
    <img src="<%=BusiConstant.context%>/page/mobile/mine/dyren/image/banner.jpg" alt="">
</div>
<div class="teyao_module no1 mod0221">
    <div class="in_box">
        <h1>邀请奖励 </h1>
        <ul>
            <li>
                <div class="img"><img src="<%=BusiConstant.context%>/page/mobile/mine/dyren/image/j1.png" alt=""></div>
                <h3>￥10元现金</h3>
                <p>粉丝完成注册下单</p>
            </li>
             &nbsp;
            <li>
                <div class="img"><img src="<%=BusiConstant.context%>/page/mobile/mine/dyren/image/j5.png" alt=""></div>
                <h3> 终身VIP服务</h3>
                <p>在试呗网平台享受终身VIP服务</p>
            </li>
        </ul>
    </div>
</div>

<!--邀请方式-->

<!--代言人规则-->
<div class="teyao_module no3 mod0221">
    <div class="in_box">
        <h1 class="title">代言人规则</h1>
        <ul class="rule_box">
            <li>
                <p><i>1</i></p>
                <p>自代言人获取粉丝开始，<span>30天内</span>拥有代言人资格，期间没有新增粉丝，代言人奖励资格将消失；期间新增粉丝，将重置时间，新的失效日期是<span>最近1次</span>新增粉丝之后的<span>30天</span>；</p>
            </li>
            <li>
                <p><i>2</i></p>
                <p><span>失效期间</span>无法获得粉丝的任何奖励；失效恢复后，失效期间的奖励不会补发；恢复资格后，之后的奖励正常发放。</p>
            </li>
        </ul>
    </div>
</div>

<!--其他规则-->
<div class="putongShare_module teyao_module mod0221">
    <div class="in_box">
        <h1 class="title">其它规则</h1>
        <ul class="rule_text">
            <li>1、奖励有效期为粉丝注册后的<span>2个月内</span>，奖金在粉丝成功获得返款后到账；</li>
            <li>2、代言人邀请粉丝成功下单才奖励<span>10元</span>现金</li>
            <li>3、粉丝注册后<span>30天内</span>不下单，将永久解除与你的代言人关系，无法恢复；</li>
            <li>4、粉丝必须为试呗网新用户，若通过反作弊系统检测出有作弊行为，将取消奖励、冻结余额并永久封号；</li>
            <li>5、你可通过微信、朋友圈等方式分享商品给粉丝领取；</li>
        </ul>
    </div>
</div>
<%if(user == null){ %>
    <a href="<%=BusiConstant.context%>/skm/regist" class="gozc">成为代言人</a>
<%}else{ %>
<a href="<%=BusiConstant.context%>/skm/fenxiang" class="gozc">专属二维码</a>
<%} %>

<!--返回顶部-->
<div class="go_top" onclick="$(&#39;body,html&#39;).animate({scrollTop: 0}, 200),$(&#39;.uc_module_body&#39;).animate({scrollTop: 0}, 200)">
    <img src="<%=BusiConstant.context%>/page/mobile/mine/dyren/image/gotop.png" alt="">
</div>
</body></html>