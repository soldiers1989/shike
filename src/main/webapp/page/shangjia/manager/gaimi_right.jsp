<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String shangjiacss = BusiConstant.shangjiacss;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=shangjiacss%>/zhanghuanquan.css">



<div class="shangjia_right elg-width">
	
	<div class="clearfix acco_center">
            <div class="modify_mian">
                
                <div class="modify_top">
                    <div class="mod_left mod_lef" id="RadioGroup1_0" onclick="checkthis(this)">
                        <label>
                            <div class="mdd_px mdd_p">
                                <strong>修改登录密码</strong><br>
                                （您在登录时的密码）
                            </div>
                            <!--mdd_px-->
                        </label>
                    </div>
                    <div class="mod_right" id="RadioGroup1_1" onclick="checkthis(this)">
                        <label>               
                            <div class="mdd_px">
                                <strong>修改支付密码</strong><br>
                                （您在提现时的密码，如果是第一次设置，请输入登录密码）
                            </div>
                            <!--mdd_px-->
                        </label>
                    </div>
                    <!--mod_right-->
                </div>
                
                <!--modify_top-->
                <div class="modify_bottom">
                    <div class="mod_tv" id="oldpwd">
                        <span class="mod_cs">输入旧密码：</span>
                        <input id="oldpassword" name="" type="password" class="nat_ttv">
                        <a href="#" target="_parent">忘记密码？</a> 
                        <span class="mod_tsc" style="display: none">密码有误，请输入正确的旧密码</span>
                    </div>
                    <!--mod_tv-->
                    <div class="mod_tv" name="paw">
                        <span class="mod_cs">设置新密码：</span><input name="" id="newpwd" type="password" class="nat_ttv">
                        <span class="mod_tsc" style="display: none">密码格式不正确</span>
                    </div>
                    <!--mod_tv-->
                    <div class="mod_tv">
                        <em>密码长度6-16位，请用数字、字母或下划线组合。</em>
                    </div>
                    <!--mod_tv-->
                    <div class="mod_tv" name="paw">
                        <span class="mod_cs">确认新密码：</span><input id="newpwd_1" name="" type="password" class="nat_ttv">
                        <span class="mod_tsc" style="display: none">两次输入的密码不一致</span>
                    </div>
                    <!--mod_tv-->
                    <div class="mer_pct">
                        <a href="#" onclick="gaimi();">提交</a>
                    </div>
                    <!--mer_pct-->
                </div>
                <!--modify_bottom-->
            </div>
            <!--modify_mian-->
        </div>                
</div>

<script>
	var chognzhiusername = "<span>您的<%=BusiConstant.name %>商家账号：</span>"+$.cookie("mdname");
   $("#chongzhiusername").html(chognzhiusername);
   function gaimi(){
	   var type = 5;
	   var d1 = $("#RadioGroup1_1");
	   if(d1.hasClass("mod_lef")){
		   type = 6;
	   }
	   var data = {type:type,oldPassword:$("#oldpassword").val(),newPassword:$("#newpwd").val()};
	   var url = "<%=BusiConstant.shike_user_update_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   
   function checkthis(chthis){
	   var d0 = $("#RadioGroup1_0");
	   var d1 = $("#RadioGroup1_1");
	   d0.removeClass("mod_lef");
	   d1.removeClass("mod_lef");
	   $("#"+chthis.id).addClass("mod_lef");
	  
   }
   
</script>