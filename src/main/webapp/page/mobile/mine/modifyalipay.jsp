<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>绑定支付宝账号</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/modifytaobao/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifytaobao/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifytaobao/regist.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/JPinFlow.css">
<script>
    var param = 0;
    function delTb(k) {
        $(k).parent().remove();
    }

    var returnurl = "";
    // $(function () {
    //     $("#form").Validform();
    // });
</script>
<style>
    .regist-content .renzheng{
        height: 2rem;
        display: inline-block;
        line-height: 2rem;
        margin-right: 3%;
        border: 1px solid #d4d4d4;
        margin-top: 0.2rem;
        padding: 0 0.5rem;
        background: #fff;
        box-sizing:border-box;
        color:#aaa;
    }
    .regist-content .renzheng.success{
        color:green;
        border: 1px solid green;
    }
    .regist-content .renzheng.error{
        color:red;
        border: 1px solid red;
    }
</style>

<header class="header regist-top"><i class="arrows" onclick="history.back(-1) "></i>修改支付宝号</header>

<div class="regist-content conent alipay" id="form">
    <section class="clearfix">
        <input id="noAlipay" style="width: 100%" name="sk_taobao" value="${user.noAlipay}"
               class="auto-input it lf" type="text" placeholder="请填写支付宝账号" datatype="*" maxlength="50">
        <%--<span class="Validform_checktip"></span>--%>
    </section>
   
    <section class="auto-btn" id="PayBtnSubmit">提交</section>
</div>

<div style="height:2.15rem;">
</div>
<jsp:include page="../common/footer.jsp" flush="true"/>

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

<script>
    $(function () {
        var logo = "";
        var uploading = false;

        bindUploadImage('.alipay-img', function (p) {
            $('.alipay-img').attr("src", p);
            $('.alipay-img').data("src", p);
            logo = p;
            uploading = true;
        }, false, "JpinOrderFlow");

        $("#PayBtnSubmit").click(function () {
            if ($("#noAlipay").val() == '') {
                myAlert("支付宝账号不能为空");
                return;
            }
           // var alipayImg = $('.alipay-img').data("src");
           // if (!alipayImg) {
           //    myAlert("您还没有上传修改后的支付宝截图");
           //     return false;
           // }

            updateAlipay();

            // var arrayTB = "";
            // if ($(".Validform_wrong").length < 1) {
                // $("[name='sk_taobao']").each(function () {
                //     arrayTB += "≌✿" + $(this).val();
                // });
                // if (!inputBlur()) {
                //     return;
                // }
            // }
        });
    })

    function updateAlipay(){
        var data = {noAlipay: $("#noAlipay").val(), alipayImg: $('.alipay-img').data("src"), type: 2};
        var url = "<%=BusiConstant.shike_user_update_do.getKey()%>";
        postdo(url, data, huodongsucdo,null, null);
    }

    function huodongsucdo(data) {
        if (data.type == 'success') {
            myAlert("修改成功", function () {
                //history.go(-1);
                window.location.href="<%=BusiConstant.shike_zhanghu.getKey()%>";
            });
        } else {
            myAlert(data.message);
        }
    }
</script>