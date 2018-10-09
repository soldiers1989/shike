<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<!-- saved from url=(0045)http://m.meilipa.com/UserAccount/ModifyMobile -->
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>绑定手机号</title>
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

    <script type="text/javascript" async="" src="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/captcha.js"></script>
    <script type="text/javascript" async="" src="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/api.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>

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

<link href="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/regist.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/sendcaptcha.js"></script>

<script src="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/luosimaoApi.js"></script>

<script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
<script>
    $(function() {
        // $("#form").Validform();
        // $("#form").form({
        //     success: function(data) {
        //         if (!data.Result) {
        //             myAlert(data.Message);
        //         } else {
        //             location.href = '/';
        //         }
        //     }
        // });
        bindCaptcha("#btnCaptcha", "#mobile");
    });

    // $("#BtnSubmit").click(function () {
    function BtnSubmit() {
        if ($("#mobile").val() == '') {
            myAlert("手机号不能为空");
            return;
        }

        var reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
        var m = $("#mobile").val().trim();
        if (!reg.test(m)) {
            myAlert("手机号不正确");
            return;
        }

        if ($("#verifyCode").val() == '') {
            myAlert("验证码不能为空");
            return;
        }

        updatePhone();

        // var arrayTB = "";
        // if ($(".Validform_wrong").length < 1) {
        //     $("[name='sk_taobao']").each(function () {
        //         arrayTB += "≌✿" + $(this).val();
        //     });
        // }
    }

    function updatePhone() {
        var data = {newPhone: $("#mobile").val(), verifyCode: $("#verifyCode").val(), type: 1};
        var url = "<%=BusiConstant.shike_user_update_do.getKey()%>";
        postdo(url, data, callBack,null, null);
    }

    function callBack(data) {
        if (data.type == 'success') {
            myAlert("修改成功", function () {
                // history.go(-1);
                window.location.href="<%=BusiConstant.shike_zhanghu.getKey()%>";
            });
        } else {
            myAlert(data.message);
        }
    }
</script>
<form id="form" action="http://m.meilipa.com/UserAccount/CheckMobile" method="POST">
    <div>
        <header class="header regist-top"><i class="arrows" onclick="history.back(-1) "></i>修改手机</header>
        <div class="regist-content conent alipay">
            <%--<section class="clearfix">
                <div class="l-captcha" data-width="100%" data-callback="getCode"
                     data-site-key="2826dd503b3231e8c3117ddddda5e438" data-id="_nlnrm1xez" id="l-captcha_nlnrm1xez"
                     style="width: 100%; height: 44px;">
                    <iframe src="<%=BusiConstant.shikemobilepath %>/mine/modifyphone/widget.html" height="44"
                            width="100%" name="captcha_widget_nlnrm1xez" frameborder="0" scrolling="no"
                            id="captcha_widget_nlnrm1xez" data-id="captcha_widget_nlnrm1xez"
                            style="background: transparent;"></iframe>
                    <input type="hidden" name="luotest_response" value="" data-id="_nlnrm1xez" id="lc-captcha-response"
                           class="lc-captcha-response_nlnrm1xez"></div>
            </section>--%>
            <section class="clearfix">
                <%--<input type="hidden" value="${user.phone }" id="mobile">--%>
                <%--<span class="cellphone nw-doit">手机号：<span>${user.phone }</span></span>--%>
                <input name="mobile" id="mobile" class="auto-input it lf" style="margin-top:0;" type="number" placeholder="请填写新手机号码" datatype="m">
                <div id="btnCaptcha" class="auto-btn bl rt" style="background: #919096; margin-right: 0;">发送验证码</div>
            </section>

            <section><input id="verifyCode" name="captcha" class="auto-input" type="text" placeholder="输入您收到的验证码" datatype="*">
                <%--<span
                    class="Validform_checktip"></span>--%>
            </section>
            <section class="auto-btn" onclick="BtnSubmit()">提交</section>
        </div>
    </div>
</form>


        <div style="height:2.15rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8" type="text/javascript"></script>
   
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