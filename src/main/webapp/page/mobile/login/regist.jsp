<%@page import="co.kensure.api.ApiUtil"%>
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
        <link href="<%=BusiConstant.shikemobilepath %>/login/css/style2.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/jquery.min.js"></script>     
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>
    <body>
         <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="javascript:history.go(-1);" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">用户注册</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-news"></i>
                </a>
            </header>
            <section class="aui-scrollView">
                <div class="aui-code-box">
                    <form action="">
                        <p class="aui-code-line">
                            <input type="text" class="aui-code-line-input" name="search" value="" id="phone1" autocomplete="off" placeholder="请输入手机号"/>
                        </p>
                        <p class="aui-code-line">
                            <input type="password" class="aui-code-line-input" name="search" value="" id="phone2" autocomplete="off" placeholder="请输入8-16位数字与字母组成的密码"/>
                        </p>
                        <p class="aui-code-line aui-code-line-clear">
                            <input id="code1" type="text" class="aui-code-line-input" autocomplete="off" placeholder="短信验证码"/>
                            <input id="btnSendCode1" type="button" class="aui-btn-default" value="获取验证码" onClick="sendMessage1()"/>
                        </p>
                        <p class="aui-code-line">
                            <input type="text" class="aui-code-line-input" name="search" value="" id="noQq" autocomplete="off" placeholder="请输入QQ号"/>
                        </p>
                         <p class="aui-code-line">
                            <input type="text" class="aui-code-line-input" name="search" value="" id="noAlipay" autocomplete="off" placeholder="请输入支付宝号"/>
                        </p>
                          <p class="aui-code-line">
                            <input type="text" class="aui-code-line-input" name="search" value="" id="noTaobao" autocomplete="off" placeholder="请输入淘宝号"/>
                        </p>
                
                        <div class="aui-code-btn">
						  <input type="button" onclick="regist()" value="注册">
                        </div>			  
                    </form>
                </div>
            </section>
        </section>
    </body>
</html>

<script>
function registsucdo(data){
	var usersession = data.resultData.row;
	addcookie(usersession);
	history.go(-2);
}
function regist(){	
   var data = {type:1,qrcode:$("#code1").val(),phone:$("#phone1").val(),password:$("#phone2").val(),noQq:$("#noQq").val(),noAlipay:$("#noAlipay").val(),noTaobao:$("#noTaobao").val()};
   var url = "<%=ApiUtil.getUrl("/user/addsk.do")%>";
   postdo(url, data, registsucdo,null, null);
}


var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
var count = 60;
var InterValObj1;
var curCount1;
function sendMessage1() {
    curCount1 = count;
    var phone = $.trim($('#phone1').val());
    if (!phoneReg.test(phone)) {
        alert(" 请输入有效的手机号码");
        return false;
    }
    
    $("#btnSendCode1").attr("disabled", "true");
    $("#btnSendCode1").val(+curCount1 + "秒再获取");
    sendsms();
    InterValObj1 = window.setInterval(SetRemainTime1, 1000);
}
function SetRemainTime1() {
    if (curCount1 == 0) {
        window.clearInterval(InterValObj1);
        $("#btnSendCode1").removeAttr("disabled");
        $("#btnSendCode1").val("重新发送");
    } else {
        curCount1--;
        $("#btnSendCode1").val(+curCount1 + "秒再获取");
    }
}

function sendsms(mobile) {
	   var url = "<%=BusiConstant.user_sms_do.getKey()%>";
	   var data = {type:1,mobile:$("#phone1").val()};
	   postdo(url, data, smssucdo,null, null);
}
function smssucdo(data){
	alert("发送成功");
}

</script>
