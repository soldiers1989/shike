<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
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
        <title><%=BusiConstant.name %> 提现</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/lxs_index.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/lxsHeadFoot.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/order_new.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>

    <body>

        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed b-line">
                <a href="javascript:history.go(-1);" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">提现</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    
                </a>
            </header>
            <section class="aui-scrollView">
               
               <div class="j_main m-main">
						<div class="txt">
							<dl>
								<dt>提现到支付宝账号:</dt>
								<dd class="line30" id="zhifubao"></dd>
							</dl>
							<dl>
								<dt>提现金额</dt>
								<dd class="box-flex-1 price pd0" id="adult_price_span">
								<span>￥ <input type="num" id="jine" value="0"></span>
								</dd>	
							</dl>
						</div>
						<div class="tit">
							<i></i>可用余额<span id="zhanghuye">￥0.00</span>
						</div>
						<!-- <div class="txt">
							<dl>
								<dt class="w100">密码：</dt>
								<dd><input type="password" class="m_input"  placeholder="请输入密码" value=""></dd>
							</dl>
						</div> -->
						<div class="booking_notes">
				
							<p>
								温馨提示：申请提现后1-3个工作日到账（节假日顺延）。
							</p>
						</div>
				</div>
                
            </section>
            <footer class="aui-footer aui-footer-fixed">
                <div class="aui-artificial" onclick="add()" >
                  		提交申请
                </div>
            </footer>
        </section>
       
       
    </body>
</html>
 
<script>


function addsucdo(data){
	alert("提交成功，1-3个工作日之后会到账");
}
function add(){
   var url = "<%=BusiConstant.sk_saveout_do.getKey()%>";
   postdo(url, {jine:$("#jine").val()},addsucdo,null, null);
}

function usersucdo(data){
	var row = data.resultData.row;
	$("#zhifubao").html(row.noAlipay);	
}
function getzhifubao(){
   var url = "<%=BusiConstant.user_getuser_do.getKey()%>";
   postdo(url, {}, usersucdo,null, null);
}
getzhifubao();

function sucdo(data){
	var row = data.resultData.row;
	if(row && row.yue){
		$("#zhanghuye").html("￥"+row.yue);
	}	
}
function zhanghuye(){
   var data = {};
   var url = "<%=BusiConstant.userzhyue_do.getKey()%>";
   postdo(url, data, sucdo,null, null);
}
zhanghuye();


</script>
