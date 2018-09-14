<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
%>

            <footer class="aui-footer aui-footer-fixed">
                <a href="<%=BusiConstant.shike_index.getKey() %>" id="index" class="aui-tabBar-item aui-tabBar-item-active">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-home"></i>
                    </span>
                    <span class="aui-tabBar-item-text">首页</span>
                </a>
                <a href="<%=BusiConstant.shike_haohuo.getKey() %>" id="haohuo" class="aui-tabBar-item">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-loan"></i>
                    </span>
                    <span class="aui-tabBar-item-text">试呗好货</span>
                </a>
                <a href="<%=BusiConstant.shike_wdhd.getKey() %>" id="wdhd" class="aui-tabBar-item ">
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-credit"></i>
                    </span>
                    <span class="aui-tabBar-item-text">我的活动</span>
                </a>
                <a href="<%=BusiConstant.shike_mine.getKey() %>" id="mine" class="aui-tabBar-item " >
                    <span class="aui-tabBar-item-icon">
                        <i class="icon icon-me"></i>
                    </span>
                    <span class="aui-tabBar-item-text">我的</span>
                </a>
            </footer>
   
<script>


function setcheckclass(){
	var pn = window.location.pathname;
	var tag = "";
	if(pn.indexOf('wdhd') != -1){
		tag = "wdhd";
		checkuser();
	}else if(pn.indexOf('index') != -1){
		tag = "index";
	}else if(pn.indexOf('haohuo') != -1){
		tag = "haohuo";	
	}else if(pn.indexOf('mine') != -1){
		tag = "mine";
		checkuser();
	}
	
	$("#"+tag).addClass("aui-tabBar-item-active");
	$("#"+tag).find("i").addClass("icon-"+tag);
	
	
}
setcheckclass();

function checkuser(){
   var mdtype = $.cookie("mdtype");
   if(!mdtype || mdtype != 1){
	   window.location.href="<%=BusiConstant.shike_login.getKey()%>";
   }
}


</script>
