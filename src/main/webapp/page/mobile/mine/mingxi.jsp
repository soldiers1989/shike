<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;">
<head>

    <title>账户明细</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>

    <script>
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
    
    <link href="<%=BusiConstant.shikemobilepath %>/common/css/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/mingxi/index.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/mingxi/mytryout.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/mingxi/account.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.infinitescroll.js"></script>

    <script type="text/javascript">
        $(function() {
            $(".con").infinitescroll({
                itemSelector: ".billion"
            });
        });
</script>
<style>
    .bar ul li{width: 33.33%;}
    .bar.zt-menu ul li a{height: 1.85rem;}
     .sel {
        width: 2rem;
        margin: 0 auto;
         height: 0.15rem; margin-top: 1px;
    }
    .billion{background: #fff;border-bottom: 1px solid #dedede; padding: 0.1rem 0.6rem 0.5rem;}
    .billion .r{float: right;}
    .billion .l{float: left;}
    .billion .exactly{padding-top: 0.4rem;height: 1rem;line-height: 1rem;font-size: 0.6rem;}
    .billion .l.title{width:70%;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;font-weight: bold;}
</style>
<header class="header acct-top"><i class="arrows" onclick="location.href = &#39;<%=BusiConstant.shike_yue.getKey() %>&#39;"></i>账户明细</header>
<div class="bar zt-menu" style="background: #fff;">
    <ul>
        <li>
            <a style="<c:if test='${empty inorout}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_mingxi.getKey() %>">全部</a>
            <div class="<c:if test='${empty inorout }'>sel</c:if>"></div>
        </li>
        <li>
            <a style="<c:if test='${inorout == 1}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_mingxi.getKey() %>?inorout=1">收入</a>
            <div class="<c:if test='${inorout == 1 }'>sel</c:if>"></div>
        </li>
        <li>
            <a style="<c:if test='${inorout == -1}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_mingxi.getKey() %>?inorout=-1">支出</a>
            <div class="<c:if test='${inorout == -1 }'>sel</c:if>"></div>
        </li>
    </ul>
</div>
<div class="usera-kong"></div>
<div class="con" id="mingxi">

    <%--<div class="billion" onclick="location.href = &#39;/aa/aa?orderid=7768&#39;">
        <div class="sbj">
            <div class="exactly aaaa">
                <div class="z l title">金币抽奖获得0.02元现金</div>
                <div class="z r" style="color: #333333">
                    <span style="color: #000;font-weight: bold;">+0.02</span>
                </div>

            </div>
            <div class="exactly aaaa ">
                <div class="y l" style="color: #999999">2018-09-16</div>
                <div class="y r">
                    <span style="color: #10b60f">交易成功</span>
                </div>
            </div>
        </div>
    </div>--%>



   <%-- <div class="navigation">
        <a href="x/GetNextMoneyRecords?type=-1&amp;page=2"></a>
    </div>--%>

</div>
<div style="height: 2rem"></div>
        <div style="margin-bottom: 2rem;">
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


<script>

    function huodongsucdo(data){
        var rows = data.resultData.rows;
        for(var i=0;i<rows.length;i++){
            var row = rows[i];
            var color = row.status == 1 ? "#10b60f" : "#ff464e";

            var html = "<div class=\"billion\" >" +
                "        <div class=\"sbj\">\n" +
                "            <div class=\"exactly aaaa\">\n" +
                "                <div class=\"z l title\">"+ row.busitypeidStr +"</div>\n" +
                "                <div class=\"z r\" style=\"color: #333333\">\n" +
                "                    <span style=\"color: #000;font-weight: bold;\">"+ (row.yue*row.inorout) +"</span>\n" +
                "                </div>\n" +
                "\n" +
                "            </div>\n" +
                "            <div class=\"exactly aaaa \">\n" +
                "                <div class=\"y l\" style=\"color: #999999\">"+ row.createdTimeStr +"</div>\n" +
                "                <div class=\"y r\">\n" +
                "                    <span style=\"color: "+ color +"\">"+ row.statusStr +"</span>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>";
            $("#mingxi").append(html);
        }
    }
    function huodonglist(){
        var data = {inorout: "${inorout}"};
        var url = "<%=BusiConstant.shangjia_zhanglist_do.getKey()%>";
        postdo(url, data, huodongsucdo,null, null);
    }
    huodonglist();


</script>
