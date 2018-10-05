<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>我的金币</title>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/regist.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.infinitescroll.js"></script>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/mytryout.css">

<style>
    .bar ul li {
        width: 33.33%;
    }

    .bar.zt-menu ul li a {
        height: 1.85rem;
    }
    .sel {
        width: 2rem;
        margin: 0 auto;
        height: 0.15rem;
        margin-top: 1px;
    }

    .billion {
        background: #fff;
        border-bottom: 1px solid #dedede;
        padding: 0.1rem 0.6rem 0.5rem;
    }

        .billion .r {
            float: right;
        }

        .billion .l {
            float: left;
        }

        .billion .exactly {
            padding-top: 0.4rem;
            height: 1rem;
            line-height: 1rem;
            font-size: 0.6rem;
        }

        .billion .l.title {
            width: 70%;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

    .gold-hd {
        height: 4.7rem;
        background: url(<%=BusiConstant.shikemobilepath %>/mine/jinbimx/gold1.png);
        background-size: 100% 100%;
    }
    .gold-cat li{float: left;width: 33.33%;text-align: center;}
    .gold-cat li img{height: 1.66rem;}
    .gold-cat {background-color: #fff;height: 3.7rem;box-sizing: border-box;padding: 0.5rem 0;}
    .gold-cat span{display: block;line-height: 0.9rem;}
    .gold-hd{ color: #fff; font-size: 0.5rem; text-align: center;box-sizing: border-box;padding: 0.5rem 0;}
    .gold-hd h2{font-size: 1.4rem;font-weight: 500;padding: 0.1rem 0;}
    .gold-hd span{display: inline-block;height: 0.8rem;line-height: 0.8rem;background: #feb800; border-radius: 0.4rem; padding:0 0.4rem;}
</style>
<script type="text/javascript">
    $(function () {
        $("#Gold").infinitescroll({
            itemSelector: ".billion"
        });
    });
</script>
<header class="header  task-top">
    <i class="iconfont icon-Toright" style="color: #000;display: inline-block;float: left;margin-left: 0.2rem;" onclick="location.href=&#39;<%=BusiConstant.shike_mine.getKey() %>&#39;"></i>
   我的金币
</header>
<div style="height: 2rem;"></div>

    <div class="gold-hd">
        金币余额
        <h2>${jinbi}</h2>
        <%--<span>您已累计获得0金币</span>--%>
    </div>
    <%--<ul class="gold-cat">
        <li onclick=" location.href = &#39;/UserAccount/mygold?type=1&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/gold2.png" alt="Alternate Text">
            <span>赚金币</span>
        </li>
        <li onclick=" location.href = &#39;/UserAccount/mygold?type=2&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/gold3.png" alt="Alternate Text">
            <span>花金币</span>
        </li>
        <li onclick=" location.href = &#39;/UserAccount/GoldRecharge&#39; ">
            <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbimx/gold4.png" alt="Alternate Text">
            <span>充金币</span>
        </li>
    </ul>--%>
    <div class="usera-kong"></div>
    <div class="bar zt-menu" style="background: #fff; padding-top: 0rem;">
        <ul>
            <li>
                <a style="<c:if test='${empty inorout}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_jinbimx.getKey() %>">全部</a>
                <div class="<c:if test='${empty inorout }'>sel</c:if>"></div>
            </li>
            <li>
                <a style="<c:if test='${inorout == 1}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_jinbimx.getKey() %>?inorout=1">收入</a>
                <div class="<c:if test='${inorout == 1}'>sel</c:if>"></div>
            </li>
            <li>
                <a style="<c:if test='${inorout == -1}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_jinbimx.getKey() %>?inorout=-1">支出</a>
                <div class="<c:if test='${inorout == -1}'>sel</c:if>"></div>
            </li>
        </ul>
    </div>
<div id="Gold" class="con">
     



    <%--<div class="navigation">
        <a href="http://aaaam/UserAccount/GetNextGoldList?page=2&amp;sceen=0&amp;type=-1"></a>
    </div>--%>
</div>


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


<script>

    function jinbimxlistCallBack(data){
        var rows = data.resultData.rows;
        for(var i=0;i<rows.length;i++){
            var row = rows[i];

            var tishi = row.remark == null || row.remark == '' ? row.typeidStr : row.remark;
            var color = row.inorout == '1' ? "#fc710b" : "#aaa";
            var inorout = row.inorout == '1' ? "+" : "-";

            var html = "<div class=\"billion\">\n" +
                "        <div class=\"sbj\">\n" +
                "            <div class=\"exactly aaaa\">\n" +
                "                <div class=\"z l title\" onclick=\"myAlert(&#39;"+ tishi +"&#39;)\">"+ tishi +"</div>\n" +
                "                <div class=\"z r\" style=\"color: #333333\">\n" +
                "                    <span style=\"color: "+ color +"; font-weight: bold; \">" +(inorout + row.jinbi)+ "</span>\n" +
                "                </div>\n" +
                "\n" +
                "            </div>\n" +
                "            <div class=\"exactly aaaa \">\n" +
                "                <div class=\"y l\" style=\"color:#999999\">"+ row.createdTimeStr +"</div>\n" +
                "                <div class=\"y r\">\n" +
                "                    <span style=\"color:#ff464e\"></span>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>";

            $("#Gold").append(html);
        }
    }
    function jinbimxlist(){
        var data = {inorout: "${inorout}"};
        var url = "<%=BusiConstant.shike_jinbilist_do.getKey()%>";
        postdo(url, data, jinbimxlistCallBack,null, null);
    }
    jinbimxlist();


</script>
