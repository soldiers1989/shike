<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" flush="true"/> 
<body>

<jsp:include page="top1.jsp" flush="true"/> 

<jsp:include page="banner0.jsp" flush="true"/> 
<style>
.sj_yxb1{width:226px;height:30px;line-height:30px;border:1px solid #dbdbdb;color:#999999;font-size:12px;padding-left:4px;}
.item2{width:400px;height:40px;text-align:left;}
</style>

<div  style="text-align:center;margin:0 auto;">
<div style="width:500px;margin:0 auto;">
	<div class="sdt_bvx">
        <strong>修改密码：</strong>
    </div>
    <div class="item2">
        <input type="text" name="mobile" class="sj_yxb1" id="name" value="" placeholder="请输入手机号">
        <span id="namewarn" class="warn"></span>
    </div>
    <div class="item2">
        <input type="text" name="captcha" class="sj_yxb1" id="code1" placeholder="请输入验证码">
        <span id="pwdwarn" class="warn btn-warn" onclick="sendGetPwdSms()">发送验证码</span>
    </div>
    <div class="item2">
        <input type="password" name="intiveCode" class="sj_yxb1" id="pwd" placeholder="请输入6-16位密码">
    </div>
    <div class="stv_pxx">
        <input id="submitbtn" type="button" class="btn-input" onclick="updatePwd()" value="确认修改">
    </div>
</div>
</div>


<jsp:include page="footer.jsp" flush="true"/> 

</body>
</html>

<script>
function updatePwd() {
    var data = {phone: $("#name").val(), type: 2, verifyCode: $("#code1").val(), newPassword: $("#pwd").val()};
    var url = "<%=ApiUtil.getUrl("/user/wjpwd.do")%>";
    postdo(url, data, callBack,null, null);
}

function callBack(data) {
    if (data.type == 'success') {
    	alert("修改成功");
		window.location.href="<%=ApiUtil.getUrl("/shangjia/login")%>";
    } else {
    	alert(data.message);
    }
}


//通用发送验证码方法
function sendGetPwdSms() {
	var m = $("#name").val().trim();
    if(checkMobile(m)){
    	sendSMSdo(m);
    } 
}

function checkMobile(mobile) {
	var reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
    if (reg.test(mobile)) {
    	return true;
    } else {
    	alert("手机号不正确");
        return false;
    }
}

function sendSMSdo(mobile) {
	if($("#pwdwarn").text().indexOf("发送")!=-1){
		$("#pwdwarn").text("执行中..");
	    $.post("/shike/user/sms.do", { mobile: mobile, type: 4 }, function (data) {
	        if (data.type != "success") {
	            alert(data.message);
	        } else {
	            var i = 120;
	            var timer = setInterval(function () {
	                i--;
	                if (i == 0) {
	                    $("#pwdwarn").text("重新发送");
	                    $("#pwdwarn").bind("click", function () { _send(); });
	                    clearInterval(timer);
	                } else {
	                    $("#pwdwarn").text(i + "秒后重新获取验证码");
	                }
	            }, 1000);
	        }
	    });
	}
}
</script>
