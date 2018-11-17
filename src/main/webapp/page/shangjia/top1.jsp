<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>



<div id="lingla-hd" style="background: #F2F2F2; width: 100%; height: 35px; border-bottom: 1px solid #e2e2e2;">
    <div class="header_top" style="margin-left: auto; margin-right: auto;">
            <div class="header_leftt">
                <div class="top_mb" id="logindiv">
                    <a href="<%=BusiConstant.shangjia_login.getKey() %>" style="color:#888">商家登录</a>
                    <span class="color_fg">|</span>
                    <a href="<%=BusiConstant.shangjia_regist.getKey() %>" style="color: #ff464e;">免费注册</a>
                </div>
                <div class="top_left">
	                <a target="_blank" class="on-service"  href="http://wpa.qq.com/msgrd?v=3&amp;uin=<%=BusiConstant.gsqq %>&amp;site=qq&amp;menu=yes">
	                 <img border="0" style="padding-top:8px" src="http://pub.idqqimg.com/qconn/wpa/button/button_11.gif" alt="点击这里给我发消息" title="点击这里给我发消息">
	                </a>
                   
                </div>
                <div class="shou_btn">
                    <em>&nbsp;&nbsp;收藏</em>
                    <div class="shou_toggle"><span>Ctrl</span>或<span>Cmd+D</span>收藏本站</div>
                </div>
            </div>
        <div class="header_right">
            <a href="<%=BusiConstant.shangjia_login.getKey() %>" title="<%=name %>首页"><%=name %>首页</a>
           <a href="<%=BusiConstant.shike_help.getKey() %>/1" title="帮助中心">帮助中心</a>
        </div>
    </div>
</div>

<script>
	var mdname = $.cookie("mdname");
	if(mdname){
		 var html ="<a href='#' style='color:#888'>"+mdname+"</a>"
         +"<span class='color_fg'>|</span>"
         +" <a href='#' style='color: #ff464e;' onclick='zhuxiao()'>用户注销</a>";
		$("#logindiv").html(html);
	}
	function zhuxiao(){
		removecookie();
		window.location.href="<%=BusiConstant.shangjia_login.getKey()%>";
	}
</script>