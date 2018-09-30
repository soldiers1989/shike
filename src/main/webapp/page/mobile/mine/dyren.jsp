<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>什么是代言人</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/dyren/list.css">

<link href="<%=BusiConstant.shikemobilepath %>/mine/dyren/animate.min.css" rel="stylesheet">
<style>
    .header{font-size:0.6rem;}
    .question_main{padding:0.2rem 0.6rem 1rem;}
     .h2{height:2rem;}
    .question_main{margin-top:.4rem;font-size:.7rem;}
    .question_main>h2{text-indent:.5rem;font-size:0.55rem;color:#333;}
    .question_main>h2.textIndent{text-indent:1.1rem;}
    .question_main>p{font-size:0.512rem; margin:0.2rem 0;line-height:0.9rem;color:#666;}
    .question_main>p>span.red{color:#ff464e;font-weight:500;margin: 0 0.2rem;}
    .question_main>p>span.orange{color:#fc710b;font-weight:500;margin: 0 0.2rem;}
    .question_main>p>span.no-strong{font-weight:500;}
</style>
<script>

</script>
<header class="header task-top frv" style="line-height: 2rem">
    
 
    <i class="iconfont icon-Toright" style="position:absolute;height:2rem;width:2rem;" onclick="history.back(-1)"></i>
    什么是代言人
       <%-- <a href="http://m.meilipa.com/Invitation/Top10" class="righthot" style="color:red;font-size:12px;">代言人排行榜</a>--%>
</header>
<div class="h2"></div>
    <main class="question_main">
        <h2>※ 什么是<%=BusiConstant.name %>代言人：</h2>
        <p>用户亲身体验并认可<%=BusiConstant.name %>的商品和服务，满足相应的条件且愿意分享给他人（粉丝），称为<%=BusiConstant.name %>代言人。代言人只负责分享，<span class="red no-strong">邀请用户</span>注册，不负责销售服务，所有的订单交易、售后服务、供应发货等服务全由<%=BusiConstant.name %>上的商家负责；</p>
        <br>
        <h2>※ 如何成为代言人：</h2>
        <p>1、成功注册成为<%=BusiConstant.name %>用户即可；</p>
        <br>
        <h2>※ 代言人如何获得奖励：</h2>
        <p>1、代言人通过“分享赚10元”、“分享赚钱-代言人”、“我的-我是代言人”分享自己的专属二维码及邀请码；</p>
        <p>2、通过社交媒体如微信、朋友圈、QQ、QQ空间、微博等推广给他人；</p>
        <p>3、引导其关注公众号并注册成为<%=BusiConstant.name %>用户；</p>
        <br>
        <h2>※ 奖励机制：</h2>
        <p>1、你的粉丝完成注册，你可获得<span class="orange">100金币</span>奖励；</p>
        <p>2、你的粉丝申请3件试用品，你可获得<span class="orange">100金币</span>奖励；</p>
        <p>3、你的粉丝完成首单，你可获得<span class="red">10元</span>奖金；</p>
        <p>4、你的粉丝完成每笔订单，你可获得订单金额<span class="red">1%</span>的奖金；</p>
        
        
        
        <br>
        <h2>※ 代言人奖励周期：</h2>
        <p>1、粉丝注册后30天内不下单，将永久解除与你的代言人关系，无法恢复</p>
        <p>2、自代言人获取粉丝开始，30天内拥有代言人资格，期间没有新增粉丝，代言人奖励资格将消失；期间新增粉丝，将重置时间，新的失效日期是最近1次新增粉丝之后的30天</p>
        <p>3、失效期间无法获得粉丝的任何奖励；失效并恢复后，失效期间的奖励不会补发；恢复资格后，之后的奖励正常发放。</p>
        <p>4、代言人奖励最长有效期为粉丝注册后的2个月内，奖金在粉丝成功获得返款后到账</p>
        <br>
        <h2>※ 代言人服务团队：</h2>
        <p>1、<%=BusiConstant.name %>代言人管家，微信号：00000000000</p>
        <p>2、代言人管家将不定时在群里进行有利于代言人进行推广吸粉的培训课程；</p>
    </main>

        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
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