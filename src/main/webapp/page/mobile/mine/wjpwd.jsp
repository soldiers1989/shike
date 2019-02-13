<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>忘记密码</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" async="" src="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/captcha.js"></script>
    <script type="text/javascript" async="" src="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/api.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/mytryout.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/account.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimage.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/sendcaptcha.js"></script>

<script src="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/luosimaoApi.js"></script>
<header class="header  task-top" style="box-shadow: none;">
   <div class="righthot thot">
        <a class="icon-userCenter" href="/shike/skm/login">
            <i class="iconfont icon-error3" style="color:#333;"></i>
        </a>
    </div>
</header>
<div style="height: 2rem;"></div>
<div class="login">
    <img src="<%=BusiConstant.shikemobilepath %>/common/images/icon.png" alt="Alternate Text">
    <div class="item">
        <input type="text" name="mobile" id="name" value="" placeholder="请输入手机号">
        <span id="namewarn" class="warn"></span>
    </div>
    <%--<div class="item" style="padding-left:0;padding-right:0;">
        <div class="l-captcha" data-width="100%" data-callback="getCode" data-site-key="2826dd503b3231e8c3117ddddda5e438" data-id="_g0sw4wx5x" id="l-captcha_g0sw4wx5x" style="width: 100%; height: 44px;"><iframe src="<%=BusiConstant.shikemobilepath %>/mine/wjpwd/widget.html" height="44" width="100%" name="captcha_widget_g0sw4wx5x" frameborder="0" scrolling="no" id="captcha_widget_g0sw4wx5x" data-id="captcha_widget_g0sw4wx5x" style="background: transparent;"></iframe><input type="hidden" name="luotest_response" value="" data-id="_g0sw4wx5x" id="lc-captcha-response" class="lc-captcha-response_g0sw4wx5x"></div>
    </div>--%>
    <div class="item">
        <input type="text" name="captcha" id="code1" placeholder="请输入验证码">
        <span id="pwdwarn" class="warn btn-warn">获取验证码</span>
    </div>
    <div class="item">
        <input type="password" name="intiveCode" id="pwd" placeholder="请输入6-16位密码">
    </div>
    <div class="btn red submit-btn">
       提交
    </div>
</div>

<script>
    $(function () {
        bindCaptcha("#pwdwarn", "#name");
        $(".submit-btn").on("click", function () {
            if ($("#pwd").val().length <= 0 || $("#name").val().length <= 0) {
                myAlert("手机号或者验证码未填写");
                return false;
            }
            var name = $("#name").val();
            var pwd = $("#pwd").val();
            var code = $("#code1").val();
            if (/^[\w\W]{6,16}$/.test(pwd) && code) {
                updatePwd();
            } else {
                myAlert("密码格式有误，或者验证码未填写")
            }
        });


        function updatePwd() {
            var data = {phone: $("#name").val(), type: 1, verifyCode: $("#code1").val(), newPassword: $("#pwd").val()};
            var url = "<%=ApiUtil.getUrl("/user/wjpwd.do")%>";;
            postdo(url, data, callBack,null, null);
        }

        function callBack(data) {
            if (data.type == 'success') {
                myAlert("修改成功", function () {
                    window.location.href="<%=BusiConstant.shike_login.getKey()%>?type=1";
                });
            } else {
                myAlert(data.message);
            }
        }
    });
</script>
    <div style="height:2.15rem;">
    </div>
    <jsp:include page="../common/footer.jsp" flush="true"/>
    <div style="display: none">
        <script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script>
        <script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8"
                type="text/javascript"></script>

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