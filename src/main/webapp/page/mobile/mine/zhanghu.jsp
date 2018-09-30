<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>账户安全</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/zhanghu/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/zhanghu/regist.css">

<script>
    function modifyAlipay() {
        if ("False" == "True") {
            myAlert("<div><a href='/UserAccount/SetMobile?returnurl=http://m.meilipa.com/UserAccount/AccountSecurity' style='display: block; width: 100%; height: 100%; height: 53px; overflow: hidden; color: #fff;'>您还未绑定手机号，立即绑定</a><div>", false);
        } else {
            location.href = '/UserAccount/ModifyAlipay';
        }
    }
</script>
<header class="header regist-top"><i class="arrows" onclick="history.back(-1) "></i>账户安全</header>
<div class="content password">
    <div class="item">
        <div class="ls">
                <div class="right" onclick="location.href = &#39;/UserAccount/ModifyMobile&#39; ">
                    修改手机号<span style="color: #666">13606816944</span><i class="ar-rt"></i>
                </div>
        </div>
        <div class="ls" onclick="modifyAlipay() ">
                <div class="right">
                    修改支付宝<span style="color: #666">13606816944</span><i class="ar-rt"></i>
                </div>
        </div>
        <div class="ls" onclick="location.href = &#39;<%=BusiConstant.shike_taobao.getKey() %>&#39; ">
                <div class="right">
                    修改淘宝账号<i class="ar-rt"></i>
                </div>
        </div>
        
        <div class="ls" onclick="location.href = &#39;/UserAccount/ModifyQq&#39; ">
                <div class="right">
                    修改QQ<i class="ar-rt"></i>
                </div>
        </div>

        <div class="ls">
                <div class="right" onclick="location.href = &#39;/UserAccount/ModifyLoginPassword&#39; ">
                    修改登录密码<i class="ar-rt"></i>
                </div>
        </div>
        <div class="ls">
                <div class="right" onclick="location.href = &#39;/UserAccount/ModifyDrawApplyPassword&#39; ">
                    修改支付密码<i class="ar-rt"></i>
                </div>
        </div>
        <div class="ls">
            <div class="right border-none" onclick="location.href = &#39;/UserAccount/FindDrawApplyPassword&#39; ">
                找回支付密码<i class="ar-rt"></i>
            </div>
        </div>
    </div>
    <section class="auto-btn" onclick="myConfirm(&#39;您确定要退出吗？&#39;, function() { location.href = &#39;/CommonBase/Logout&#39;; }) ">退出登录</section>
</div>
        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
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