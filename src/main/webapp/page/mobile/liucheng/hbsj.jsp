<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.user.model.SKUser"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = BusiConstant.shikemobilepath;
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
    SKUser user = (SKUser)request.getAttribute("user");
    
    List<SKWord> words = (List<SKWord>)request.getAttribute("words");
  	String wordStr = "";
  	for(SKWord skWord : words) {
		wordStr += skWord.getWord();
	}
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 31.125px;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta content="telephone=no" name="format-detection"/>

	<title>试用流程</title>
	<meta name="keywords" content="<%=BusiConstant.keywords %>">
	<meta name="description" content="<%=BusiConstant.description %>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="format-detection" content="address=no">
	<meta name="full-screen" content="yes">
	<link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/common/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/common/css/iconfont.css">

	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/style.css">

	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath%>/common/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath%>/common/js/Common.js"></script>

	<%--<link href="<%=BusiConstant.shikemobilepath%>/lc/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath%>/detail/js/jquery.min.js"></script>--%>

	<script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>

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

	<link href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/layer.css"
			type="text/css" rel="styleSheet" id="layermcss">
</head>
<body>

	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/index.css">

	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/goods.css">

	<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/mytryout.css">

<script>
    var tbao = "";
    $(function () {
        tbao=$("#tabao").val();
    })

    var haveOtherTaobao = "False";
    var id = '96251';
    var pic = '//img.alicdn.com/imgextra/i3/796056182/TB2sPMBBRyWBuNkSmFPXXXguVXa_!!796056182.jpg|//img.alicdn.com/imgextra/i1/796056182/TB1qw3feVooBKNjSZPhXXc2CXXa_!!0-item_pic.jpg|//img.alicdn.com/imgextra/i1/796056182/TB2GiRuqhGYBuNjy0FnXXX5lpXa_!!796056182.jpg|//img.alicdn.com/imgextra/i2/796056182/TB2np8dbRgXBuNjt_hNXXaEiFXa_!!796056182.jpg';
    var shopossueGold = 632;
    var referrer = '';     //记录上一页地址
</script>
	<link rel="stylesheet" type="text/css"
		href="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/JPinFlow.css">

	<script
		src="<%=BusiConstant.shikemobilepath%>/liucheng/gouwuche/clipboard.min.js"></script>
	<header class="header task-top frv" style="line-height: 2rem">
		<i class="arrows" onclick="history.back(-1)"></i> 试用流程
	</header>
	<input type="hidden" id="tabao" value="qq123456">
	<div style="height: 2rem"></div>
	<div class="Flow">
		<div class="Flow-hd">
			<img src="${baobei.zturl}">

			<ul>
				<li><span class="iconfont icon-tb"></span> <span>${baobei.title}</span></li>
				<li>店铺名称：<span>${baobei.dpnameS}</span></li>
				<li>价格：<span style="color: #ff464e;">${baobei.salePrice}元</span></li>
				<li>规格：<span style="color: #ff464e;"
					onclick="myAlert(&#39;${baobei.guige}&#39;)">${baobei.guige}</span></li>
			</ul>
		</div>
		<div class="usera-kong"></div>

		<input name="type" value="0" id="type" type="hidden">
		<div class="Flow-page">
			<span>试用流程</span>
		</div>
		 <div class="FlowCon">
        <ul>
            <li>
                <span class="num">1</span>打开
                <em class="red">手机淘宝APP</em>
            </li>
            <li>
                <span class="num">2</span>登录淘宝账号
                <em class="red"><%=user.getNoTaobao() %></em>
            </li>
                <li>
                    <span class="num">3</span>搜索关键词:<em class="red">
                        <%=wordStr %>
                    </em>，并复制同类宝贝的淘口令到下方
                    <div>
                        货比淘口令1：
                    </div>
                    <div class="textarea">
                        <textarea class="goodLink" id="tkl1" placeholder="点击手机淘宝宝贝详情页“分享”按钮，选择“复制链接”然后将商品链接粘贴到此处"></textarea>
                    </div>
                    <div>
                        货比淘口令2：
                    </div>
                    <div class="textarea">
                        <textarea class="goodLink" id="tkl2" placeholder="点击手机淘宝宝贝详情页“分享”按钮，选择“复制链接”然后将商品链接粘贴到此处"></textarea>
                    </div>
                    <div>
                        货比淘口令3：
                    </div>
                    <div class="textarea">
                        <textarea class="goodLink" id="tkl3" placeholder="点击手机淘宝宝贝详情页“分享”按钮，选择“复制链接”然后将商品链接粘贴到此处"></textarea>
                    </div>
                </li>
        </ul>
    </div>
    
		<div class="usera-kong"></div>
		<div class="btn" onclick="addgouwuche()">
        下一步
    </div>
    
		
	</div>


	<script>
    
    function dictsucdo(data){
        window.location.href="<%=BusiConstant.shike_gouwuche.getKey()%>?id=<%=baobei.getId()%>";
    }
    function addgouwuche(){
    	var tkl1 = $("#tkl1").val();
    	var tkl2 = $("#tkl2").val();
    	var tkl3 = $("#tkl3").val();
    	if(!tkl1 || !tkl2 || !tkl3){
    		myAlert("淘口令不能为空");
    		return;
    	}
		var ds = [{content:tkl1,typeid:1,busitype:"hbsj1"},{content:tkl2,typeid:1,busitype:"hbsj2"},{content:tkl3,typeid:1,busitype:"hbsj3"}];
		var data = {id:<%=baobei.getId()%>,status:11,datas:JSON.stringify(ds)};
		var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
		postdo(url, data, dictsucdo,null, null);
    }


</script>

	<div style="display: none">
		<script src="<%=BusiConstant.shikemobilepath%>/common/z_stat.php" language="JavaScript"></script>
		<script src="<%=BusiConstant.shikemobilepath%>/common/core.php" charset="utf-8" type="text/javascript"></script>
	</div>

	<div id="loading" class="loading">
		<div class="loadingContent">
			<img
				src="<%=BusiConstant.shikemobilepath%>/common/images/loading.gif">
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


</body>
</html>