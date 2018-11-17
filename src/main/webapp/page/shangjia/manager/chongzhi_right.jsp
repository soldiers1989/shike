<%@page import="co.kensure.api.ApiUtil"%>
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
        <a class="seled">账户充值</a>
        <a href="<%=BusiConstant.shangjia_chongzhilist.getKey()%>" style="margin-left:-5px;">充值记录</a>
    </div>
    <div class="recharge">
        <p class="tle">请选择充值方式</p>

        <ul class="cat">
            <li class="act">
                <i class="iconfont icon-zfb"></i> <span>支付宝充值</span> <span class="red">(免手续费)</span> <img src="<%=context%>/vipNew3.png" alt="Alternate Text">
                <i class="iconfont icon-confirm1"></i>
            </li>
                <li>
                    <i class="iconfont icon-bank"></i> <span>银行卡支付</span>
                    <i class="iconfont icon-confirm1"></i>
                </li>
        </ul>

        <div class="bd"></div>
        
        <div id="showcat1">
            <h3>官方 <span>支付宝</span> 打款充值</h3>
            <div class="recharge-num">
                进入<em style="color:#ff464e;">支付宝</em>打款至：<span class="#ff464e"><%=BusiConstant.gsname%></span> 支付宝账户号：<span class="#ff464e"><%=BusiConstant.gsalipay%></span> 
            </div>
            <p class="warn"><span class="iconfont icon-warn"></span> 
                <span><%=BusiConstant.name %>不提供刷单/刷销量/炒作信用等服务，若商家利用平台进行以上活动或在转账信息中备注以上信息，将依据《<%=BusiConstant.name %>商家处罚规则》处以立即清退及终生不予合作的处罚。</span></p>
        </div>
        
        <div id="showcat2" style="display:none;">  
            <h3>进入 <span>网银</span> 打款至</h3>
            <div class="recharge-num">
                <%=BusiConstant.gsyhmc %>账户： <span><%=BusiConstant.gsyhzh %></span>账户名： <span><%=BusiConstant.gsyhzhm %></span>开户行： <span><%=BusiConstant.gsyhkhh %></span>
            </div>
            <p class="warn">
                <span class="iconfont icon-warn"></span> 
                <span><%=BusiConstant.name %>不提供刷单/刷销量/炒作信用等服务，若商家利用平台进行以上活动或在转账信息中备注以上信息，将依据《<%=BusiConstant.name %>商家处罚规则》处以立即清退及终生不予合作的处罚。</span>
            </p>
        </div>

        <div class="recharge-form">
            <div class="text1" id="chongzhiusername"> </div>
            <div class="text2">
                <b>转账后 <span id="text2">输入交易号</span></b><input type="text" id="name" style="width:200px;" name="name" value="">
                <b>金额</b><input type="number" name="money" id="money" value=""><span>元</span>
                <span class="btn" id="confirm" onclick="chongzhitijiao()" style="cursor:pointer">确认提交</span>
            </div>
            <div id="showcard" style="padding-left: 123px; padding-top: 10px; display:none;">
                如：张三 33050161662700000598
            </div>
        </div>
        
      

        <div>
            <img class="img" id="img" src="<%=context%>/zhcz.png" alt="Alternate Text">
        </div>
        
        <div>
            公司支付宝：<img  id="img" src="<%=context%>/zfb.jpg" alt="Alternate Text">
        </div>

        <div class="red-warn">
            <span style="display: inline-block;vertical-align: middle;">
                <span id="text">支付宝自助打款审核，1-2小时内审核。若急需审核。可联系您的对接商家客服: </span>
            </span>
             <a target="_blank" style="display: inline-block;vertical-align: middle; height: 25px;" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<%=BusiConstant.gsqq %>&amp;site=qq&amp;menu=yes">
                 <img border="0" src="http://pub.idqqimg.com/qconn/wpa/button/button_11.gif" alt="点击这里给我发消息" title="点击这里给我发消息">
             </a>
        </div>

    </div>

</div>

</div>

<script>
	var chognzhiusername = "<span>您的<%=BusiConstant.name %>商家账号：</span>"+$.cookie("mdname");
   $("#chongzhiusername").html(chognzhiusername);
   function chongzhitijiao(){
	   var jiaoyihao = $("#name").val();
	   var jine = $("#money").val();
	   if(confirm('流水号：'+jiaoyihao+',金额:'+jine+',确认充值？')){
		   var data = {fangshi:1,jiaoyihao:jiaoyihao,jine:jine};
		   var url = "<%=BusiConstant.shangjia_chongzhi_do.getKey()%>";
		   postdo(url, data, sucdo,null, null);
	   }
   }
   
   function sucdo(data){
	   window.location.href="<%=ApiUtil.getUrl("/shangjia/chongzhilist")%>";
   }
   
</script>