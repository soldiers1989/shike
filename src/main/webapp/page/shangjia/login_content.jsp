<%@page import="co.kensure.api.ApiUtil"%>
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
                    <a  class="" id="loginshike1" onclick="check(1)">试客登录</a>
                    <a  class="noborito" id="loginshike2" onclick="check(2)">商家登录</a>
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
                    <a href="<%=ApiUtil.getUrl("/shangjia/wjpwd")%>" tabindex="60" target="_blank">忘记密码？</a>
                </div>
                <!--sdt_bvx-->
                <div class="stg_lb">
                    <input type="password" id="password" class="sj_yxb" placeholder="请输入密码">
                </div>
                <div id="error" class="err-tips">请输入登录名</div>
                <!--stg_lb-->
                <div class="stv_pxx">
                    <input id="submitbtn" type="button" class="btn-input" onclick="login()" value="登录">
                </div>
                <!--stv_pxx-->
                <div class="zc_pqe">
                    没有账号？<a href="<%=BusiConstant.shangjia_regist.getKey()%>" target="_self">[免费注册]</a>
                </div>
                <!--zc_pqe-->
            </div>
            
            <!--sdt_right-->
        </div>
        <div style="float:right">
			<a id="launchBtn" class="btnText onlineBtnText btn" target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<%=BusiConstant.gsqq %>&amp;site=qq&amp;menu=yes"><img src="<%=BusiConstant.context%>/page/img/qq.png"></a>	
		</div>
        <!--stv_mca-->
    </div>
    <!--stja_mian-->
</div>


<script>
var lgtype=2;
function login(){
	dologin()
}

function dologin() {
    var submitbtn = $("#submitbtn");
    var username = $("#username");
    var password = $("#password");   
    submitbtn.val('登录中...');
    submitbtn.attr("disabled", "disabled");
    var data = { mobile: username.val(), password: password.val(), type: lgtype};
    var url = "<%=BusiConstant.shangjia_login_do.getKey()%>";
    postdo(url, data, loginsucdo,null, logincompdo);
}


function loginsucdo(data){
	var usersession = data.resultData.row;
	addcookie(usersession);
	window.location.href="<%=BusiConstant.shangjia_index.getKey()%>";
}

function logincompdo(data){
	var submitbtn = $("#submitbtn");
	submitbtn.removeAttr('disabled');
    submitbtn.val('登录');
}

function check(type){
	lgtype = type;
	$("#loginshike1").removeClass("noborito");
	$("#loginshike2").removeClass("noborito");
	$("#loginshike"+type).addClass("noborito");
	
}
</script>