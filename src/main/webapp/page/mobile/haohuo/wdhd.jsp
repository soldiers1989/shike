<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=BusiConstant.name %></title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/haohuo/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/slider.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>
    <body>
        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                    <span class="aui-text-bot">扫一扫</span>
                </a>
                <div class="aui-center" style="margin-left:18%; width:100%">
                    <div class="aui-edition-box">
                        <div class="aui-edition-box-bg">
                            <i class="icon icon-search"></i>
                            <input type="text" placeholder="搜索您需要找的宝贝">  
                        </div>
                    </div>
                </div>
                <a href="javascript:;" class="aui-navBar-item" style="min-width: 15%; flex: 0 0 15%;">
                    <i class="icon icon-news"></i>
                    <span class="aui-text-bot">消息</span>
                </a>
            </header>
            <section class="aui-scrollView">
             
                <div class="n-tabs">
                    <ul class="n-tabContainer" id="auto-id-1509603311057">
                    </ul>
                </div>
                <div class="aui-list-product-box" id="huoping">
                     <div class="aui-flex aui-flex-lag">
	                    <div class="aui-aircraft-img">
	                        <img src="/shike/filetemp/20180912/9365d59f8ea64169a86fbb420f71aa63.jpg" alt="">
	                    </div>
	                    <div class="aui-flex-box">
	                   	 	<h2>
	                            <em>dfdafdf</em>
	                        </h2>
	                        <h2>价值：<em>fffadf</em></h2>
	                    	<h2>规格：<em>1111</em></h2>
	                    </div>
                	 </div>
                	 
                	  <div class="aui-flex aui-flex-lag">
	                    <div class="aui-aircraft-img">
	                        <img src="/shike/filetemp/20180912/9365d59f8ea64169a86fbb420f71aa63.jpg" alt="">
	                    </div>
	                    <div class="aui-flex-box">
	                   	 	<h2>
	                            <em>dfdafdf</em>
	                        </h2>
	                        <h2>价值：<em>fffadf</em></h2>
	                        <h2>下单账号：<em>2222</em></h2>
	                    	<h2>规格：<em>1111</em></h2>
	                    </div>
                	 </div>
                
                </div>
            </section>
            <footer class="aui-footer aui-footer-fixed">
                <a href="javascript:;" class="aui-tabBar-item aui-tabBar-item-active">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-home"></i>
                    </span>
                    <span class="aui-tabBar-item-text">首页</span>
                </a>
                <a href="javascript:;" class="aui-tabBar-item">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-loan"></i>
                    </span>
                    <span class="aui-tabBar-item-text">试呗好货</span>
                </a>
                <a href="javascript:;" class="aui-tabBar-item">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-time"></i>
                    </span>
                    <span class="aui-tabBar-item-text">分享赚钱</span>
                </a>
                <a href="javascript:;" class="aui-tabBar-item ">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-credit"></i>
                    </span>
                    <span class="aui-tabBar-item-text">我的活动</span>
                </a>
                <a href="javascript:;" class="aui-tabBar-item ">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-me"></i>
                    </span>
                    <span class="aui-tabBar-item-text">我的</span>
                </a>
            </footer>
        </section>
    </body>
</html>

<script>
function dictsucdo(data){
	var rows = data.resultData.rows;
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		var html = " <li class=\"n-tabItem\" data-id=\"type"+row.code+"\">"
        +"<a href=\"#\" id=\"type"+row.code+"\" class=\"current\" >"+row.name+"</a>"
        +"</li>";
		$("#auto-id-1509603311057").append(html);
	}	
}
function dictlist(){
   var data = {typeid:2};
   var url = "<%=BusiConstant.sys_dictlist_do.getKey()%>";
   postdo(url, data, dictsucdo,null, null);
}
dictlist();


function huodongsucdo(data){
	var rows = data.resultData.rows;
	$("#huoping").html("");
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		var html = "<div class=\"aui-flex aui-flex-lag\">"
        +"<div class=\"aui-aircraft-img\">"
        +"    <img src=\""+row.baobei.zturl+"\" >"
        +"</div>"
        +"<div class=\"aui-flex-box\">"
        +" 	<h2><em>"+row.baobei.title+"</em></h2>"
        +"    <h2>价值：<em>"+row.baobei.salePrice+"</em></h2>"
        +"	<h2>规格：<em>"+row.baobei.guige+"</em></h2>"
        +"</div>"
        +" </div>"
		$("#huoping").append(html);
	}	
}
function huodonglist(){
   var data = {status:21};
   var url = "<%=BusiConstant.shike_wdhd_do.getKey()%>";
   postdo(url, data, huodongsucdo,null, null);
}
huodonglist();



</script>
