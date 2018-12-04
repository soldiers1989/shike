<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 94.9375px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>Index</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/wdhd/xgdd/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>

<script src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimageNew.js"></script>
<style>
    body {
        background-color: #fff;
    }

    .storage img {
        width: 6rem;
        height: 6rem;
    }

    .jing-num * {
        display: inline-block;
        vertical-align: middle;
        height: 1.8rem;
        line-height: 1.8rem;
        margin-bottom: 0.5rem;
    }

    .jing-num input {
        border: 1px solid #ddd;
        text-indent: 1em;
        width: 11rem;
    }

    .jing-num span {
        width: 3.6rem;
        text-align: right;
    }

    .btn {
        border-top: 1px solid #dedede;
        height: 2rem;
        width: 100%;
        margin-top: 1.2rem;
        background-color: #ff464e;
        color: #fff;
    }

    .storage span {
        display: inline-block;
        vertical-align: top;
        width: 3.6rem;
        text-align: right;
    }

    .gray {
        background-color: #999;
    }
</style>

<div class="jing-num">
    <span>订单号：</span>
    <input type="text" name="sk_tb_ordercode" id="sk_tb_ordercode" value="${ddh.content }" placeholder="请输入订单号">
</div>
<div class="storage">
    <span>订单截图：</span>
    <img src="${dd.content }" class="up-img">
</div>


<div class="btn">
    保存
</div>

<script>
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    $(function () {
        bindUploadImage(".up-img", function (p) {
            $("img.up-img").attr("src", p);
        }, false, "JpinOrderFlow");

        bindUploadImage(".search-again-img", function (p) {
            $("img.search-again-img").attr("src", p);
        }, false, "JpinOrderFlow");

        var subFlag = false
        $("div.btn").on("click", function () {
            if (!(/^\d{9,50}$/.test($("#sk_tb_ordercode").val()))) {
                myAlert("请核对后填写正确的订单号");
                return false;
            }
            if (subFlag) {
                return false;
            }
            subFlag = true;
            $.post("<%=BusiConstant.shike_baobei_updatedd_do.getKey() %>", { ddhId: ${ddh.id }, ddh: $("#sk_tb_ordercode").val(), ddId: ${dd.id }, ddImg: $("img.up-img").attr("src") }, function (data) {
                subFlag = false;
                if (data.type == 'success') {
                    window.parent.layer.open({
                        content: "修改成功"
                        , btn: '确定'
                        , yes: function () {
                            var id = "${skSkqk.id}";
                            window.parent.location.href = "<%=BusiConstant.shike_ddxq.getKey() %>?id=" + id;
                        }
                    });

                } else {
                    window.parent.layer.open({
                        content: data.message
                        , btn: '确定'
                    });
                }
            });
        });
    });

</script>
<div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/common/images/loading.gif">
    </div>
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


<form action="" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form><form action="/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form></body></html>