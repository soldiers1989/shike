<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>注册</title>
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

    <script type="text/javascript" async="" src="<%=BusiConstant.shikemobilepath %>/mine/regist/captcha.js"></script>
    <script type="text/javascript" async="" src=<%=BusiConstant.shikemobilepath %>/mine/regist/api.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>


    <script src="https://unpkg.com/qiniu-js@2.5.0/dist/qiniu.min.js"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimageNew.js?ver=<%=BusiConstant.version%>"></script>

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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/regist/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/regist/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/regist/mytryout.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/regist/account.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/JPinFlow.css">

<%--
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/regist/uploadimage.js"></script>
--%>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/regist/sendcaptcha.js"></script>

<script src="<%=BusiConstant.shikemobilepath %>/mine/regist/luosimaoApi.js"></script>
<header class="header  task-top">
    <i class="iconfont icon-Toright" style="color: #000;display: inline-block;float: left;margin-left: 0.2rem;" onclick="history.back(-1)"></i> 注册领取试用
</header>
<div style="height: 2rem;"></div>
<div class="login">
    <%--<img src="<%=BusiConstant.shikemobilepath %>/mine/regist/icon.png" alt="Alternate Text">--%>
    <div class="item">
        <input type="text" name="mobile" id="name" value="" placeholder="请输入手机号">
        <span id="namewarn" class="warn"></span>
    </div>
    <div class="item">
        <input type="text" name="password" id="password" value="" placeholder="请输入8-16位数字与字母组成的密码" style="width: 10rem">
        <span id="passwordwarn" class="warn"></span>
    </div>
    <%--<div class="item" style="padding-left:0;padding-right:0;">
        <div class="l-captcha" data-width="100%" data-callback="getCode" data-site-key="2826dd503b3231e8c3117ddddda5e438" data-id="_asmbifvc7" id="l-captcha_asmbifvc7" style="width: 100%; height: 44px;"><iframe src="<%=BusiConstant.shikemobilepath %>/mine/regist/widget.html" height="44" width="100%" name="captcha_widget_asmbifvc7" frameborder="0" scrolling="no" id="captcha_widget_asmbifvc7" data-id="captcha_widget_asmbifvc7" style="background: transparent;"></iframe><input type="hidden" name="luotest_response" value="" data-id="_asmbifvc7" id="lc-captcha-response" class="lc-captcha-response_asmbifvc7"></div>
    </div>--%>
    <div class="item">
        <input type="text" name="captcha" id="pwd" placeholder="请输入验证码">
        <span id="pwdwarn1" class="warn btn-warn">获取验证码</span>
        <span id="pwdwarn" style="display:none;" class="warn btn-warn">获取验证码</span>
    </div>
    <%--<div class="item">
            <input type="text" name="intiveCode" id="code1" placeholder="请输入邀请码，没有可不填">
    </div>--%>
    <div class="item">
        <input type="text" name="intiveCode" id="noQq" placeholder="请输入QQ号">
    </div>
    <div class="item">
        <input type="text" name="intiveCode" id="noAlipay" placeholder="请输入支付宝号">
    </div>
    <div class="item">
        <input type="text" name="intiveCode" id="noTaobao" placeholder="请输入淘宝号">
    </div>
    <div class="item">
        <input type="text" name="refereeId" id="refereeId" placeholder="请输入邀请码，没有可不填">
    </div>

    <div class="FlowCon">
        <ul>
            <li>
                <span class="num"></span>打开支付宝，请上传<em class="red">支付宝个人信息页面</em>截图，如图：
                <div class="storage-img mt3">
                    <img style="height:80px" src="<%=BusiConstant.shikemobilepath %>/common/images/alipayImg.jpg">

                </div>
                <div class="up-img mt3">
                    支付宝个人信息页面截图：<img class="alipay-img" src="<%=BusiConstant.shikemobilepath %>/common/images/up-img.png">
                </div>
            </li>
            <li>
                <span class="num"></span>打开淘宝，请上传<em class="red">淘宝个人资料页面</em>截图，如图：
                <div class="storage-img mt3">
                    <img style="height:80px" src="<%=BusiConstant.shikemobilepath %>/common/images/taobaoImg.jpg">
                </div>
                <div class="up-img mt3">
                    淘宝个人资料页面截图：<img class="taobao-img" src="<%=BusiConstant.shikemobilepath %>/common/images/up-img.png">
                </div>
            </li>

        </ul>
    </div>

    <div style="margin-top:1rem;">
        <input type="checkbox" name="name" value="" id="check" checked="checked">  我已阅读<a href="<%=BusiConstant.shike_private.getKey() %>">《隐私协议》</a>
    </div>
    <div class="btn red submit-btn">
        注册领取试用
    </div>
</div>

<script>
    $(function () {
        var logo1 = "";
        var logo2 = "";
        var uploading1 = false;
        var uploading2 = false;

        bindUploadImage('.alipay-img', function (p) {
            $('.alipay-img').attr("src", p);
            $('.alipay-img').data("src", p);
            logo1 = p;
            uploading1 = true;
        }, false, "JpinOrderFlow");
        bindUploadImage('.taobao-img', function (p) {
            $('.taobao-img').attr("src", p);
            $('.taobao-img').data("src", p);
            logo2 = p;
            uploading2 = true;
        }, false, "JpinOrderFlow");

        $("#pwdwarn1").on("click", function () {
            var mobile = $("#name").val();
            if (/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(mobile)) {
                checkMobile(mobile);
            } else {
                layer.open({
                    content: '手机号输入有误'
                   , skin: 'msg'
                   , time: 2 //2秒后自动关闭
                });
            }
        })

        function checkMobile(m) {
            //$.post("/UserAccount/RegistValidate", { mobile: m }, function (data) {
            //    if (data.Result) {
                    $("#pwdwarn").trigger("click");
            //    } else {
            //        myAlert(data.Message);
            //    }
            //})
        }

        bindCaptcha("#pwdwarn", "#name","#pwdwarn1");

        $(".submit-btn").on("click", function () {
            var flagCheck = $("#check").is(":checked");
            if (!flagCheck) {
                myAlert("请勾选隐私协议");
                return false;
            }
            if ($("#name").val().length <= 0) {
                myAlert("手机号未填写");
                return false;
            }
            if ($("#password").val().length <= 0) {
                myAlert("密码未填写");
                return false;
            }
            if ($("#pwd").val().length <= 0) {
                myAlert("验证码未填写");
                return false;
            }

            var alipayImg = $('.alipay-img').data("src");
            var taobaoImg = $('.taobao-img').data("src");
            if (!alipayImg) {
                myAlert("您还没有上传支付宝截图");
                return false;
            }
            if (!taobaoImg) {
                myAlert("您还没有上传淘宝截图");
                return false;
            }
            var name = $("#name").val();
            var qrcode = $("#pwd").val();
            var code = $("#code1").val();
            if (name && pwd) {
                var data = {
                    type: 1,
                    qrcode: qrcode,
                    phone: name,
                    password: $("#password").val(),
                    noQq: $("#noQq").val(),
                    noAlipay: $("#noAlipay").val(),
                    noTaobao: $("#noTaobao").val(),
                    alipayImg: alipayImg,
                    taobaoImg: taobaoImg,
                    refereeId: $("#refereeId").val()
                };
                var url = "<%=BusiConstant.shike_addsk_do.getKey()%>";
                postdo(url, data, registsucdo,null, null);
            }
        });

        function registsucdo(data){
            var usersession = data.resultData.row;
            addcookie(usersession);
            // history.go(-2);
            window.location.href="<%=BusiConstant.shike_mine.getKey() %>";
        }
        <%--function regist(){--%>
            <%--var data = {type:1,qrcode:$("#code1").val(),phone:$("#phone1").val(),password:$("#phone2").val(),noQq:$("#noQq").val(),noAlipay:$("#noAlipay").val(),noTaobao:$("#noTaobao").val()};--%>
            <%--var url = "<%=BusiConstant.shike_addsk_do.getKey()%>";--%>
            <%--postdo(url, data, registsucdo,null, null);--%>
        <%--}--%>

        var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
        var count = 60;
        var InterValObj1;
        var curCount1;
        function sendMessage1() {
            curCount1 = count;
            var phone = $.trim($('#phone1').val());
            if (!phoneReg.test(phone)) {
                alert(" 请输入有效的手机号码");
                return false;
            }

            $("#btnSendCode1").attr("disabled", "true");
            $("#btnSendCode1").val(+curCount1 + "秒再获取");
            sendsms();
            InterValObj1 = window.setInterval(SetRemainTime1, 1000);
        }
        function SetRemainTime1() {
            if (curCount1 == 0) {
                window.clearInterval(InterValObj1);
                $("#btnSendCode1").removeAttr("disabled");
                $("#btnSendCode1").val("重新发送");
            } else {
                curCount1--;
                $("#btnSendCode1").val(+curCount1 + "秒再获取");
            }
        }

        function sendsms(mobile) {
            var url = "<%=BusiConstant.user_sms_do.getKey()%>";
            var data = {type:1,mobile:$("#phone1").val()};
            postdo(url, data, smssucdo,null, null);
        }
        function smssucdo(data){
            alert("发送成功");
        }
    });
</script>
        <div style="height:2.15rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
<%--<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/mine/regist/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/mine/regist/core.php" charset="utf-8"
            type="text/javascript"></script>--%>

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


<div id="l-captcha-float_asmbifvc7"
     style="display: none; border: 1px solid rgb(204, 204, 204); border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 3px; position: absolute; z-index: 2000000000; visibility: visible; left: 89px; top: 157.9px;">
    <div id="l-captcha-overlay_asmbifvc7"
         style="width: 100%; height: 100%; position: fixed; top: 0px; left: 0px; z-index: 2000000000; background-color: rgb(255, 255, 255); opacity: 0;"></div>
    <div id="l-captcha-image_asmbifvc7"
         style="z-index: 2000000001; position: relative; width: 300px; height: 190px; background: rgb(255, 255, 255);">
        <iframe src="<%=BusiConstant.shikemobilepath %>/mine/regist/frame.html" height="100%" width="100%"
                name="captcha_frame_asmbifvc7" frameborder="0" scrolling="no" id="captcha_frame_asmbifvc7"
                data-id="captcha_frame_asmbifvc7" style="background: transparent;"></iframe>
    </div>
</div>
</body>
</html>