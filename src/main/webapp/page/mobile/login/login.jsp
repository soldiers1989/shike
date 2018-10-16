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
                    <span class="aui-center-title">用户登录</span>
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
                
                        <div class="aui-code-btn">
						  <input type="button" onclick="login()" value="登陆">
                        </div>
						<div class="aui-code-btn">
						  <input type="button" onclick="zhuce()" value="新用户注册">
                        </div>
						  
                    </form>
                </div>
            </section>
        </section>
    </body>
</html>

<script>
function loginsucdo(data){
	var usersession = data.resultData.row;
	addcookie(usersession);
	history.go(-1);
}
function login(){	
   var data = {type:1,mobile:$("#phone1").val(),password:$("#phone2").val()};
   var url = "<%=BusiConstant.shangjia_login_do.getKey()%>";
   postdo(url, data, loginsucdo,null, null);
}

function zhuce(){	
	window.location.href="<%=BusiConstant.shike_regist.getKey()%>";
}



</script>
