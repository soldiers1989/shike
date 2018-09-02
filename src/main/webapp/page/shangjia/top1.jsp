<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>



<div id="lingla-hd" style="background: #F2F2F2; width: 100%; height: 35px; border-bottom: 1px solid #e2e2e2;">
    <div class="header_top" style="margin-left: auto; margin-right: auto;">
            <div class="header_leftt">
                <div class="top_mb">
                    <a href="<%=BusiConstant.shangjia_login.getKey() %>" style="color:#888">商家登录</a>
                    <span class="color_fg">|</span>
                    <a href="<%=BusiConstant.shangjia_login.getKey() %>" style="color: #ff464e;">免费注册</a>
                </div>
                <div class="top_left">
                    <a href="/shangjia/about" target="_blank" class="on-service">在线客服</a>
                </div>
                <div class="shou_btn">
                    <em>&nbsp;&nbsp;收藏</em>
                    <div class="shou_toggle"><span>Ctrl</span>或<span>Cmd+D</span>收藏本站</div>
                </div>
            </div>
        <div class="header_right">
            <a href="http://www.meib2c.com/" title="<%=name %>首页"><%=name %>首页</a><span class="color_fg">|</span>
            <a href="http://www.meib2c.com/other/appdownload" target="_blank"><i class="top-icon-ph"></i>微信公众号</a><span class="color_fg">|</span>
            <a href="http://www.meib2c.com/invitation/NewInvitation" target="_blank">分享赚钱<span style="color: #ed594f; font-weight: bold;">月入4000</span></a><span class="color_fg">|</span>
        
            <a href="http://www.meib2c.com/help/index" target="_blank">帮助中心</a><span class="color_fg">|</span>
            <span class="wzdh">
                <a href="http://www.meib2c.com/help/index" target="_blank" class="sbdjx" id="naviatetext">网站导航</a>
                <div class="oneto" id="naviate">
                    <div class="onetoa">
                        <p class="tcbt">
                            <a href="http://jing.meilipa.com/">免费试用</a>
                        </p>
                        <p>
                            <a href="http://jing.meilipa.com/" target="_blank">试用专区</a>
                        </p>
                    </div>
                    <div class="onetoa">
                        <p class="tcbt">
                            <a href="http://www.meib2c.com/invitation/NewInvitation">站内活动</a>
                        </p>
                        <p>
                            <a href="http://www.meib2c.com/invitation/NewInvitation" target="_blank">邀请有奖</a>&nbsp;&nbsp;<a href="http://www.meib2c.com/lottery" target="_blank">金币抽奖</a>
                        </p>
                    </div>
                    <div class="onetoa">
                        <p style="padding-top: 8px;">
                            <a href="http://www.meib2c.com/help/MerchantApply" target="_blank">商家报名</a>&nbsp;&nbsp;
                            <a href="http://www.meib2c.com/Feedback" target="_blank">意见反馈</a>
                        </p>
                    </div>
                </div>
            </span>
        </div>
    </div>
</div>

