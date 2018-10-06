<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">



<div class="shangjia_right elg-width">
                

<div class="shangjia_right clearfix fabushiyong">
    <div class="account" style="width:100%;">
        <a class="seled">账户提现</a>
        <a href="<%=BusiConstant.shangjia_zhanglist.getKey()%>" style="margin-left:-5px;">账户明细</a>
    </div>
    <div class="recharge">
        <p class="tle">请选择提现方式</p>

        <ul class="cat">
            <li class="act">
                <i class="iconfont icon-zfb"></i> <span>支付宝提现</span> <span class="red">(1%手续费)</span> <img src="<%=context%>/vipNew3.png" alt="Alternate Text">
                <i class="iconfont icon-confirm1"></i>
            </li>
        </ul>

        <div class="bd"></div>
        
        <div id="showcat1">
            <h3>1、官方 <span>支付宝</span> 打款提现,我们将现金打入您提供的支付宝账号，为了安全，会进行实名认证，请提供准确的实名信息</h3>
            <h3>2、手续费少于一元按一元收</h3>

        <div class="recharge-form">
            <div class="text2" id="chongzhiusername"> </div>
            <div class="text2">
                <b>支付宝号</b><input type="text" id="name" style="width:200px;" name="name" value="">
                <b>提现金额</b><input type="number" name="money" id="money" value=""><span>元</span>
                <b>真实姓名</b><input type="text" name="realname" id="realname" value="">
            </div>
             <div class="text2">
                <b><%=BusiConstant.name %>支付密码</b><input type="password" id="password" style="width:200px;" name="password" value="">           
                <span class="btn" id="confirm" onclick="tixiantijiao()" style="cursor:pointer">确认提交</span>
            </div>
        </div>
  

        <div class="red-warn">
            <span style="display: inline-block;vertical-align: middle;">
                <span id="text">支付宝自助打款审核，24小时内审核。若急需审核。可联系您的对接商家客服: </span>
            </span>
             <a target="_blank" style="display: inline-block;vertical-align: middle; height: 25px;" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<%=BusiConstant.gsqq %>&amp;site=qq&amp;menu=yes">
                 <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_11.gif" alt="点击这里给我发消息" title="点击这里给我发消息">
             </a>
        </div>

    </div>

</div>

</div>

<script>
	var chognzhiusername = "<span>您的<%=BusiConstant.name %>商家账号：</span>"+$.cookie("mdname")+"余额：<span id='yue'>0</span>元"
	+"<span class='btn' id='quanbu' onclick='quanbutixian()' style='scursor:pointer'>全部提现</span>";
   $("#chongzhiusername").html(chognzhiusername);
   function tixiantijiao(){
	   var money = parseInt($("#money").val());
	   var shouxufei = (money/100).toFixed(2);
	   if(shouxufei<1){
		   shouxufei = 1;
	   }
	   var daozhang = money-shouxufei;
	   var msg = "系统将收你1%的转账手续费，"+money+"元中,转账手续费"+shouxufei+",实际到账金额"+daozhang;
	   if(confirm(msg)){
		   var data = {zhanghao:$("#name").val(),jine:$("#money").val(),realname:$("#realname").val(),paypassword:$("#password").val()};
		   var url = "<%=BusiConstant.sk_saveoutser_do.getKey()%>";
		   postdo(url, data, null,null, null);
	   } 
   }
   
   function sucdo(data){
		var row = data.resultData.row;
		if(row && row.yue){
			$("#yue").html(row.yue);
		}	
	}
	function zhanghuye(){
	   var data = {};
	   var url = "<%=BusiConstant.userzhyue_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
	}
	zhanghuye();
	
	function quanbutixian(){
		var m = $("#yue").html();
		$("#money").val(m);
	}
</script>