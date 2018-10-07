<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>意见反馈</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/yijian/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/yijian/regist.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/yijian/more.css">

<script src="<%=BusiConstant.shikemobilepath %>/mine/yijian/uploadimage.js"></script>
<script>
    $(function () {

        var options ={
          beforeSubmit: function (arry) {
              return true;
          },
          success: function (data) {
              myAlert(data.Message, function () {
                  location.replace("/UserAccount");
              });
          }
        };
        $("#item_form").ajaxForm(options);
        //上传截图
        bindUploadImage('.tp_tj', function (path) {
            addDiv(path);
        }, true);//第三个参数是批量

        //点击选择出现弹框
        $(".choose").click(function () {
            $(".flex-bg").fadeIn(300);
            $("#flow").fadeIn();
            $("#flow").css("display", "block");
            $("#flow").removeClass("fadeout");
        });

        //点击阴影
        $(".code-con").click(function () {
            $("#flow").addClass("fadeout");
            $(".flex-bg").fadeOut(300);
            $("#flow").fadeOut();
        });
        //点击选择
        $(".flow-type").click(function (e) {
            console.log(e.target)
            var dom = $(e.target);
            console.log(dom.data("value"));
            console.log(dom.html());
            $("#sk_type").val(dom.data("value"));
            $("#questionType").html(dom.html())
            //e.stopPropagation();


            //$(".code-con").click();
        });
    });

    var i = 0;
    function addDiv(path) {
        path = "<%=BusiConstant.context %>" + path;
        if (i < 3) {
            i += 1;
            var inpHidden = "<input class='images' type='hidden' value='" + path + "' />";
            var html = "<a href='javascript:void(0)' class='tp_tj_a'>" + inpHidden + "<img id='imgpic" + i + "' src='" + path + "' /><div  onclick='del(this)' class='tp_tj_a_tx iconfont icon-error-c'></div></a>";
            $(".tp_tj").before(html);
            if (i >= 3) {
                $(".tp_tj").hide();
            }

        } else {
            myAlert("最多只能添加3张图片!");
        }
    }

    //删除图片
    function del(obj) {
        i -= 1;
        $(obj).parent().remove();
        $(".tp_tj").show();
    }



    function onClickSubmit() {
        if (!$("#sk_type").val()) {
            myAlert("请选择您要反馈的问题类型！");
            return;
        }
        if (!$("#sk_mobile").val()) {
            myAlert("请填写您的手机号码！");
            return;
        }
        if (!/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test($("#sk_mobile").val())) {
            myAlert("您的手机号码格式不正确！");
            return;
        }
        if (!$("#content").val()) {
            myAlert("请输入您的建议！");
            return;
        }
        if ($("#content").val().length > 500) {
            myAlert("您的建议不能大于500字");
            return;
        }

        var arr = [];
        var images = $(".images");
        var i = 0, length = images.length;
        for (i; i < length; i++) {
            arr.push(images[i].value);
        }
        if (arr.length >= 0) {
            $("#sk_images").val(arr.join("|"));
        } else {
            $("#sk_images").val("");
        }
        // $('#item_form').submit();

        yjfk();
    }

    function yjfkCallBack(data){
        if (data.type == 'success') {
            myAlert("提交成功", function () {
                window.location.href="<%=BusiConstant.shike_mine.getKey()%>";
            });
        } else {
            myAlert(data.message)
        }
    }
    function yjfk(){
        var pictureUrl = $("#imgpic1").attr("src") + ";" + $("#imgpic2").attr("src") + ";" + $("#imgpic3").attr("src");

        var data = {typeId: $("#sk_type").val(), phone: $("#sk_mobile").val(), content: $("#content").val(), pictureUrl: pictureUrl};
        var url = "<%=BusiConstant.shike_yijian_do.getKey()%>";
        postdo(url, data, yjfkCallBack,null, null);
    }
</script>
<header class="header task_top"><i class="arrows iconfont icon-Toright" onclick="history.back(-1) "></i>意见反馈</header>
<form id="item_form" action="/FeedbackSubmit" method="POST">
    <div class="content feedback lyt">
        <div class="feedback-ct">
            <div class="feedback-type choose">
                <span class="feedback-title" id="questionType">您要反馈的问题类型</span>
                <span class="feedback-choose">
                    
                    <em class="iconfont icon-Toboottom"></em>
                </span>
                <input type="hidden" name="sk_type" id="sk_type">
            </div>


            
        </div>
        <div class="feedback-ct">
            <span class="feedback-title">联系方式</span>
            <input type="number" class="feedback-input" name="sk_mobile" value="${user.phone}" id="sk_mobile" placeholder="请输入手机号码">
        </div>

        <div class="feedback-ct">
            <span class="feedback-title">您的建议</span>
            <textarea id="content" placeholder="500字以内" name="content"></textarea>
        </div>

        <div class="feedback-ct">
            <span class="feedback-title">上传照片</span>
        </div>
        <input type="hidden" id="sk_images" name="sk_upload_pic" value=" ">

        <div class="feedback-ct last clearfix">
            <a href="javascript:void(0);" class="tp_tj"></a>
        </div>

        <section class="auto-btn" onclick="onClickSubmit()">提交</section>
    </div>
</form>



<div class="flex-bg" style="display: none;"></div>
<div class="flow-con fadeout" id="flow" style="display: none;">
    <div class="code-con">
        <div class="flow-type">
            <a href="javascript:void(0);" data-value="1">新功能建议</a>
            <a href="javascript:void(0);" data-value="2">功能异常</a>
            <a href="javascript:void(0);" data-value="3">体验问题</a>
            <a href="javascript:void(0);" data-value="4">服务投诉</a>
            <a href="javascript:void(0);" data-value="5">活动问题</a>
            <a href="javascript:void(0);" data-value="6">其他</a>
        </div>
    </div>
</div>
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


<form action="http://m.meilipa.com/CommonBase/UploadPic" method="post"><input type="file" accept="image/*;" name="file"
                                                                              style="display:none" multiple="multiple">
</form>
</body>
</html>