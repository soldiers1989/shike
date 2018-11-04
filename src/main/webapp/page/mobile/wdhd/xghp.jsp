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

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/xghp/mytryout.css">

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
    
<link href="<%=BusiConstant.shikemobilepath %>/wdhd/xghp/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
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

    .storage{height:8rem;}
    .storage li{height: 8rem;overflow: hidden;float: left;width: 50%;margin: 0;text-align: center;}
    .btn{border-top: 1px solid #dedede;height:2rem;width: 100%;margin-top: 1.2rem;background-color: #ff464e;color:#fff;}
</style>
<%--<style>
    body{background-color: #fff;}
    .storage img{width: 6rem;height: 6rem;}
    .storage span {
        display: block;
        text-align: center;
        line-height: 2rem; color: #555;
    }
    .storage{height:8rem;}
    .storage li{height: 8rem;overflow: hidden;float: left;width: 50%;margin: 0;text-align: center;}
    .btn{border-top: 1px solid #dedede;height:2rem;width: 100%;margin-top: 1.2rem;background-color: #ff464e;color:#fff;}
</style>--%>

<div class="jing-num">
    <span>使用评价：</span>
    <input type="text" name="sk_tb_hp" id="sk_tb_hp" value="${hpy.content }" placeholder="请输入订单号">
</div>

<div class="jing-num">
    <span>评价截图：</span>
</div>
<div class="text">
    <div class="wby wjsc">
        <div class="kwdlt" id="uploadbtn1">
            选择文件
        </div>
    </div>
</div>
<ul id="picList1" class="text">
    <c:forEach items="${hptps}" var="item">
        <li class="tpsc">
            <img name="preview1" src="${item}" class="baob" style="width:85px;height:85px">
            <div class="caca" onclick="$(this).parent().remove();">X</div>
        </li>
    </c:forEach>
</ul>

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

        var logo2 = "";
        var issubmit = false;
        bindUploadImage('#uploadbtn1', function (path) {
            <%--path = "<%=BusiConstant.context %>" + path;--%>
            var html = '<li class="tpsc"><img name="preview1" src="' + path + '" class="baob" style="width:85px;height:85px"><div class="caca" onclick="$(this).parent().remove();">X</div></li>';
            $('#picList1').append(html);
            $("html, body").animate({ scrollTop: $("#picList1").offset().top }, 500);
            if (logo2 == '') {
                logo2 = path;
            } else {
                logo2 = logo2 + "sktag" + path;
            }
        }, true, 2, true);

        var subFlag = false
        $("div.btn").on("click", function () {
            if (!$("#sk_tb_hp").val()) {
                myAlert("请填写好评信息");
                return false;
            }
            if ($("#picList1 li").length < 1) {
                myAlert("请上传新的评价截图");
                return false;
            }

            if (subFlag) {
                return false;
            }
            subFlag = true;

            var hpImg = "";
            $('.baob').each(function(){
                hpImg += $(this).attr('src') + "sktag";
            })
            $.post("<%=BusiConstant.shike_baobei_updatehp_do.getKey() %>", { hpyId: "${hpy.id }", hpy: $("#sk_tb_hp").val(), hpId: "${hp.id }", hpImg: hpImg }, function (data) {
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


<form action="" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form><form action="http://m.meilipa.com/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form></body></html>