<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>



<link href="<%=context%>/style.css" rel="stylesheet" type="text/css">
<script src="<%=context%>/Validform_v5.3.2.js" type="text/javascript"> </script>
<script src="<%=context%>/jquery.form.js(1)" type="text/javascript"> </script>
<script src="<%=context%>/VerCodeSend.js" type="text/javascript"> </script>
<script src="<%=context%>/sendcaptcha.js"></script>
<script language="javascript" type="text/javascript">
    $(function () {
        $("#einfo_form").Validform({
            tiptype: 3,
            datatype: {
                "must": function (gets, obj, curform, regxp) {
                    var chk = curform.find("#protocol");
                    var checked = chk.attr("checked");
                    return (checked == "checked");
                }
            }
        });
        
        
        var isSubmiting = false;
        $("#einfo_form").ajaxForm({
            beforeSubmit: function () {
                if (isSubmiting) {
                    return false;
                }
                isSubmiting = true;
                $('#submit').val('注册中...');
                return true;
            },
            success: function (data) {
            	if (data.type == "success") {
                    alert("注册成功");
                    location.href = "<%=BusiConstant.shangjia_login.getKey()%>";
                } else {
                    var src = $("#captcha_img").attr("src");
                    $("#captcha_img").attr("src", src + "?randstamp=" + new Date().getTime());
                    alert(data.message);
                    isSubmiting = false;
                    $('#submit').val('提交');
                }
            }
        });

        $(".mer_pc input").on("focus", function () {
            var id = $(this).attr("id");
            if (!id) {
                return false;
            }
            if ($("." + id).length > 0) {
                $("." + id).show();
            }
            
        }).on("blur", function () {
            var id = $(this).attr("id");
            if (!id) {
                return false;
            }
            if ($("." + id).length > 0) {
                $("." + id).hide();
            }
            
        });
    })
</script>
<style>
    input:focus,select:focus{border:1px solid #ff464e ;box-shadow:0 0 5px #ff464e;outline:none;}
    .mert_main {
        height: 530px;
    } 
     .mer_pct a {
         display: inline-block;
         width: 60px;
         height: 25px;
         border: 1px solid #d2d0d0;
         background: #f7f7f7;
         text-align: center;
         line-height: 25px;
         color: #666;
         border-radius: 2px;
         font-weight: bold;
         margin-left: 6px;
         cursor: pointer;
         font-size: 12px;
     }
    .bis-icon {
    border:9px solid #f0f0f0;
        height: 181px;
        width: 942px;
        margin: 10px auto;
    }
    .online_service .img-tab{float: left;margin-left: 200px;margin-top: -180px;}
     .bis-icon li {
        float: left;
        width: 209px;
        border-left: 1px solid #dedede;
        height: 100%;
    }
    .bis-icon li:first-child{border: none;}
    .bis-icon li span { font-size: 14px;color: #333;}
    .bis-icon li span.gray{color: #9a9a9a;margin-top: 2px;display: block;line-height: 26px;}
    .bis-icon div { text-align: center; padding-top: 35px; height:87px;}
    .bis-icon div i{ line-height: 48px; margin-top: 24px; font-size: 26px; border-radius: 24px; display: inline-block;height: 48px; width: 48px; background-color: #ff464e;color: #fff;}
    .bis-icon div img{margin-top: 10px;}
     .nat_ttv{width:267px; height: 36px; padding-left: 3px; border: 1px solid #dfdfdf;text-indent: 1em;}
    .mer_pc{height:49px;}
    .mert_main{height:690px;}
    .Validform_right, .Validform_wrong{line-height: 30px !important;}
    .mer_center h1 {
        margin: 20px 0 0 20px;
        font-size: 20px;
        font-family: Microsoft YaHei;
        color: #3c3d45;
    }
    .warn{color: #999;padding-left:78px;height: 20px;display:none;}
    .mert_main{width: 1050px;height:689px;}
    .warn i{margin-right: 5px;}
    .online_service{margin-left: 530px;}
    .qu_pxc{ border: none; font-weight: 500; width: 275px;height: 46px;line-height: 46px;color: #fff; background-color: #ff464e; margin-top: 10px;}
    .bis-icon {width: 1050px;}
    .mer_center h1{font-size: 18px;font-weight: 500;color: #ff464e;padding-bottom: 50px;}
    .mer_center h1 span{color: #666;font-size: 16px;}
    .submit{background-color: #e2e2e2;color: #333;}
     .submit:hover {background-color: #DBDBDB; }
    .mer_center h1 span.toLogin {float: right;display: inline-block;margin-right: -190px;}
    .mer_center h1 span.toLogin a{color: #0289cd;}
         .nrtou div {
        background: #ff464e;
        text-align: center;
        padding: 12px 0;
    }

        .nrtou div a {
            font-size: 15px;
            border-radius: 4px;
            display: inline-block;
            height: 38px;
            width: 120px;
            background: #fff;
            color: #ff464e;
            line-height: 38px;
        }

            .nrtou div a:hover {
                background: #f6d4d4;
            }
            .fork {
    width: 12px;
    height: 12px;
    position: absolute;
    top: -4px;
    right: -4px;
    font-size: 14px;
    color: #000000;
}
 .fork:hover{color:#999;}

</style>
<div class="merc_content">
    <div class="mert_main">
        <!--mer_top-->
        <div class="mer_center" style="  top: 10px;">
            <h1>试客注册 / <span></span>
                <span class="toLogin">已有账号，
                <a href="<%=BusiConstant.shangjia_login.getKey()%>">立即登录</a>
                </span>
            </h1>
            <form action="<%=BusiConstant.shangjia_regist_do.getKey()%>" id="einfo_form" class="einfo_form" method="post">
                
                <div class="mer_pc">
                    <span class="nat_px">用户名：</span>
                    <input name="name" type="text" id="bisRegister1" value="" maxlength="15" datatype="username" ajaxurl="<%=BusiConstant.shangjia_checkname_do.getKey() %>" placeholder="请设置用户名" class="nat_ttv Validform_error" nullmsg="请填写信息！">
                <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>

                <p class="warn bisRegister1" style="display: none;">
                    <i class="iconfont icon-warn"></i>支持汉字、字母、数字、下划线组合，3-15个字符，不能为纯数字
                </p>
               
                <!--mer_pc-->

                <div class="mer_pc">
                    <span class="nat_px">登录密码：</span><input id="bisRegister2" name="password" type="password" datatype="/^\w{6,16}$/i" errormsg="请填写6到16位字符！" placeholder="请设置密码" class="nat_ttv Validform_error" nullmsg="请填写信息！">
                <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>

                <!--mer_pc-->
                <p class="warn bisRegister2" style="display: none;">
                    <i class="iconfont icon-warn"></i>密码由6-16位字母、数字和下划线组成，区分大小写
                </p>
                <!--mina_ti-->
                <div class="mer_pc">
                    <span class="nat_px">确认密码：</span><input name="repassword" id="bisRegister3" datatype="*" recheck="password" type="password" nullmsg="请再次输入密码！" placeholder="请再次输入密码" errormsg="密码不一致！" class="nat_ttv Validform_error">
                <span class="Validform_checktip Validform_wrong">请再次输入密码！</span></div>
                <p class="warn bisRegister3" style="display: none;">
                    <i class="iconfont icon-warn"></i>请再次输入密码
                </p>
                <div class="mer_pc">
                    <span class="nat_px">手机号：</span>
                    <input name="phone" type="text" id="mobile-lk" datatype="m" nullmsg="格式有误" placeholder="请输入您的手机号" class="nat_ttv Validform_error">
                    
                <span class="Validform_checktip Validform_wrong">格式有误</span></div>
                <p class="warn mobile-lk" style="display: none;">
                    <i class="iconfont icon-warn"></i>请输入11位手机号，其他用户不可见
                </p>
                <div class="mer_pc">
                    <span class="nat_px">验证码：</span>
                    <input name="qrcode" type="text" style="width:95px" datatype="num" id="bisqq" placeholder="请输入验证码" nullmsg="请输入验证码" class="nat_ttv">
                    <span id="sendbtn" style="margin: 0 0 0 0;width: 166px;" class="submit" onclick="sendSms('#sendbtn','#mobile-lk')">发送验证码</span>
                <span class="Validform_checktip"></span></div>

                

                <div class="mer_pc">
                    <span class="nat_px">QQ号：</span><input name="no_qq" type="text" placeholder="请输入您的QQ号" datatype="n4-12" nullmsg="请输入QQ！" class="nat_ttv">
                <span class="Validform_checktip"></span></div>
                      <div class="mer_pc">
                    <span class="nat_px">邀请码：</span><input name="invateCode" type="text" placeholder="请输入您的邀请码" id="" class="nat_ttv">

                </div>
              
                <div class="mer_psc">
                    <input id="protocol" type="checkbox" checked="checked" disabled="disabled" class="merchant-protocol">我已仔细阅读并同意接受
                    <a href="#" target="_blank">《用户使用协议》</a>
                </div>
                <!--mer_psc-->
                <div class="mer_pct" style="margin-top: 0;">
                    <input id="submit" type="submit" name="eReg_subimt" value="立即注册" class="qu_pxc p-red">
                </div>
                <!--mer_pc-->
                <input type="hidden" name="type" id="smstype" value="1">
            </form> 
        </div>
       
        <!--mer_center-->
    </div>
    <!--mert_main-->
</div>