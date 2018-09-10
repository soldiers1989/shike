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
                    <a  class=""></a>
                    <a  class="noborito">后台登录</a>
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
           
                </div>
                <!--sdt_bvx-->
                <div class="stg_lb">
                    <input type="password" id="password" class="sj_yxb" placeholder="请输入密码">
                </div>
                <div id="error" class="err-tips">请输入登录名</div>
                <!--stg_lb-->
                <div class="stv_pxx">
                    <input id="submitbtn" type="button" class="btn-input" onclick="loginSubmit(3,'')" value="登录">
                </div>
                <!--stv_pxx-->
             
                <!--zc_pqe-->
            </div>
            <!--sdt_right-->
        </div>
        <!--stv_mca-->
    </div>
    <!--stja_mian-->
</div>