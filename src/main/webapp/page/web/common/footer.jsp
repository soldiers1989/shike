<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>

<!--merc_content-->

<div class="footer">
    <div class="footer_main">
        <div class="footer_left">
            <div class="footer_xy" style="padding-top: 58px;">
                <a href="<%=BusiConstant.shangjia_about.getKey() %>" target="_blank">联系我们</a><span>|</span>            
                <a href="<%=BusiConstant.shangjia_userdefine.getKey() %>" target="_blank">用户协议</a><span>|</span>
            </div>
            <div class="footer_fl">
                <span>Copyright © 2017 meili.com</span> 浙ICP备17042206号-1&nbsp;&nbsp;浙公网安备33010302003013号&nbsp;&nbsp;<%=BusiConstant.gsyhzhm %>
            </div>
           
        </div>
       
        <div style="float: left; margin-top: 52px;margin-left: 80px;">
            <p style="width: 100px;text-align: center">关注<%=BusiConstant.name %>公众号</p>
            <img style="width: 100px; height: 100px;" src="<%=context%>/yonghu_code.jpg">
        </div>      
    </div>
</div>
