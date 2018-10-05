<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>我的粉丝</title>
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
        var userId=349975;
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/fensi/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/fensi/regist.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/fensi/account.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/fensi/index.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/fensi/jquery.infinitescroll.js"></script>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/fensi/invitation.css">

<script type="text/javascript">
    var statusArr = [" 未下单，下单后激活", " 未下单，下单后激活", "未下单，下单后激活", "已下单，预计5天后到账", "已提交报告，预计2天后到账", "已下单，预计5天后到账", "已提交报告，预计2天后到账", "未下单，下单后激活", "", "未下单，下单后激活", "", "已到账"];
    var statusArr1 = ["gray", "gray", "gray", "", "", "", "", "gray", "", "gray", "", "", ""];
    $(function () {
        var listFlag = false;
        var $window = $(window);
        var $document = $(document);
        //下滑加载
        var mytype = globle.getUrlParam("type");
        $(".list-con .cat a").eq(mytype).addClass("act");
        var mypage = 1;
        getList(1);
        iniScroll();
        var overFlag = false;
        var count = 0;
        function getList(page, clearFlag) {
            if (listFlag) return;
            listFlag = true;
            clearFlag = clearFlag || 0;
            //$("#infscr-loading").show();
            $.ajax({
                type: 'post',
                url: '/Invitation/GetFriendsinfo?screen=0',
                data: { page: mypage, type: mytype, nick: $("#seach-key").val() },
                success: function (data) {
                    //$("#infscr-loading").hide();
                    var data2 = JSON.parse(data.Data);
                    mypage++;
                    listFlag = false;
               
                    var Data = data2.Data;
                    count += Data.length;
                    if (count >= data2.Count) {
                        overFlag = true;
                    }
                    var html = '';
                    var fourTime = new Date('2018/04/04').getTime();
                    var createTime = 0;
                    for (var i = 0; i < Data.length; i++) {
                        createTime = new Date(Data[i].sk_create_time.replace(/-/g, '/')).getTime();
                        if (createTime >= fourTime) {
                            var moneyorgold = '10元首单奖</span></p><p>';
                        } else {
                            var moneyorgold = '8元首单奖</span></p><p>';
                        }   
                        if (Data[i].isGold === 1) {
                            moneyorgold ='600金币</span></p><p>';
                        }
                        if (Data[i].status == 0)
                            Data[i].sk_status=0
                        var userName = (Data[i].sk_beinvite_user_name.length > 8 ? (Data[i].sk_beinvite_user_name.substring(0, 8) + '...') : Data[i].sk_beinvite_user_name);
                        html += '<li><img src="' + (Data[i].sk_Logo || "/Content/images/icon/1.png") + '" alt="Alternate Text" />' +
                            '<div><p><span class="title">' + userName + '</span>' +
                            '<span class="tag ' + statusArr1[Data[i].sk_status] + '">' + moneyorgold +
                            '<span class="m-time">' + (Data[i].sk_create_time || "获取时间失败") + '</span>' +
                            '<em>' + (Data[i].status ? statusArr[Data[i].sk_status] : "已失效") + '</em></p></div></li>';
                       
                    }
                    $("#list-funs").append(html);
                },
                error: function () {
                    listFlag = false;
                    $("#infscr-loading").hide();
                }
            });
        }
        function iniScroll() {
            $window.scroll(function () {
                if (overFlag) {
                    return false;
                }
                if ($document.scrollTop() + $window.height() >= $document.height()) {
                     layer.open({
                            content: '加载中'
                            , skin: 'msg'
                            , time: 2
                     });
                    getList(mypage);
                }
            });
        }
        $("#seach-btn").on("click", function () {
            // mypage = 1;
            // $("#list-funs").html("");
            // getList(mypage);
        });
    });

    
</script>
<style>
    body{background-image: none;}
</style>
<header class="header  task-top">
        <i class="iconfont icon-Toright" style="color: #000; display: inline-block; float: left; margin-left: 0.2rem;" onclick="location.href=&#39;<%=BusiConstant.shike_mine.getKey() %>&#39;;"></i>
        <span>我的粉丝<%--（1）--%></span>
    
</header>
<div style="height: 2rem;"></div>
<div id="infscr-loading" style="display: none;"><img alt="Loading..." src="<%=BusiConstant.shikemobilepath %>/mine/fensi/loading.gif"><div>玩命加载中...</div></div>
<div class="list money-info">
    <div class="list-con-bg">
        <div class="list-con">
            <div class="funsSearch">
                <input type="text" name="name" value="" id="seach-key" placeholder="请输入粉丝昵称(可以少输,不能输错)"><span id="seach-btn" class="iconfont icon-search"></span>
            </div>
            <div class="cat cat-list">
                <div class="act">
                    
                   
                    <a href="#" class="&#39;act&#39; act">全部</a>
                    
                </div>
               <div>
                   
                    <a href="#">待下单 <%--(<span style="font-family:Arial;">1</span>)--%></a>
               
                </div>
                <div>
                    <a href="#">即将到账</a>
                </div>
                <div>
                    <a href="#">已到账</a>
                </div>
                <div>
                    <a href="#">已失效</a>
                </div>
            </div>
            <ul id="list-funs">

            </ul>
        </div>
    </div>
</div>

<%--
<a href="#?invitationCode=349975" style="height: 2rem;line-height: 2rem; z-index: 100; position: fixed;display: block;bottom: 0;left: 0;width: 100%;background-color: #ff464e;color: #fff;text-align: center;">分享获得更多奖励</a>
--%>
<div style="height: 2rem;"></div>
<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/commone/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/commone/core.php" charset="utf-8"
            type="text/javascript"></script>

<div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/commone/images/loading.gif">
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

    function fensilistCallBack(data){
        var rows = data.resultData.rows;
        for(var i=0;i<rows.length;i++){
            var row = rows[i];

            var html = "<li><img src=\"<%=BusiConstant.shikemobilepath %>/mine/fensi/1.png\" alt=\"Alternate Text\">\n" +
                "                    <div><p><span class=\"title\">"+ row.name +"</span><span class=\"tag gray\">10元首单奖</span></p>\n" +
                "                        <p><span class=\"m-time\">"+ row.createdTimeStr +"</span><em> 未下单，下单后激活</em></p></div>\n" +
                "                </li>";
            $("#list-funs").append(html);
        }
    }
    function fensilist(){
        var data = {};
        var url = "<%=BusiConstant.shike_fensilist_do.getKey()%>";
        postdo(url, data, fensilistCallBack,null, null);
    }
    fensilist();


</script>