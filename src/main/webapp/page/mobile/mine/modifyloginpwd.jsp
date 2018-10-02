<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>修改登入密码</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/modifyloginpwd/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifyloginpwd/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/modifyloginpwd/regist.css">

<script>
    $(function() {
        $("#form").Validform();
        // $("#form").form({
        //     success: function(data) {
        //         if (!data.Result) {
        //             myAlert(data.Message);
        //         } else {
        //             location.href = '/UserAccount/AccountSecurity';
        //         }
        //     }
        // });


    });

    function updatePwd() {
        var data = {oldPassword: $("#oldPassword").val(), newPassword: $("#newPassword").val(), type: 5};
        var url = "<%=BusiConstant.shike_user_update_do.getKey()%>";
        postdo(url, data, huodongsucdo,null, null);
    }

    function huodongsucdo(data) {
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
<form id="form" action="#" method="POST">
    <header class="header regist-top"><i class="arrows" onclick="history.back(-1) "></i>修改登录密码</header>
    <div class="regist-content conent">
        <section class="clearfix">
            <input id="oldPassword" name="oldPassword" class="auto-input" type="password" placeholder="请输入当前登录密码" datatype="*6-16">
        <span class="Validform_checktip"></span></section>
        <section style="margin-bottom: 14px;">
            <input id="newPassword" name="newPassword" class="auto-input" type="password" placeholder="请输入新密码" datatype="*6-16">
        <span class="Validform_checktip"></span></section>
        <section style="margin-top: 7px;">
            <input class="auto-input" type="password" placeholder="请重复新密码" datatype="*6-16" recheck="newPassword">
        <span class="Validform_checktip"></span></section>
        <section class="auto-btn" onclick="updatePwd() ">确定</section>
    </div>
</form>
        <div style="height:2.15rem;">
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