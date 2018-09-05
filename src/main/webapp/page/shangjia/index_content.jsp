<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>

<div class="contant" style="padding-top: 0;padding-bottom: 0">
    <div class="clearfix stja_mian">
        <div class="stv_mca">
            <div style="float: left; margin-bottom: 84px; margin-right: -1px; margin-top: 47px;">
                <a>
                    <img src="<%=context %>/001.png">
                </a>
            </div>
          
            <div class="clearfix sdt_right">
                <div class="alswitch">
                    <a  class="">&nbsp;</a>
                    <a  class="noborito">商家登录</a>
                </div>
                <div class="sdt_bvx">
                    <strong>登录名：</strong>
                </div>
                <!--sdt_bvx-->
                <div class="stg_lb">
                    <input type="text" id="username" altercss="gray" class="sj_yxb" placeholder="手机号">
                </div>
                <!--stg_lb-->
                <div class="sdt_bvx">
                    <strong>登录密码：</strong>
                    <a href="/Security/FindPassword?usertype=0" tabindex="60" target="_blank">忘记密码？</a>
                </div>
                <!--sdt_bvx-->
                <div class="stg_lb">
                    <input type="password" id="password" class="sj_yxb" placeholder="请输入密码">
                </div>
                <div id="error" class="err-tips">请输入登录名</div>
                <!--stg_lb-->
                <div class="stv_pxx">
                    <input id="submitbtn" type="button" class="btn-input" onclick="loginSubmit(2,'')" value="登录">
                </div>
                <!--stv_pxx-->
                <div class="zc_pqe">
                    没有账号？<a href="<%=BusiConstant.shangjia_regist.getKey()%>" target="_self">[免费注册]</a>
                </div>
                <!--zc_pqe-->
            </div>
            <!--sdt_right-->
        </div>
        <!--stv_mca-->
    </div>
    <!--stja_mian-->
</div>