<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" flush="true"/> 
<body>
<style>
    .header_top{width: 1075px;}
</style>

<jsp:include page="top1.jsp" flush="true"/> 

<jsp:include page="banner.jsp" flush="true"/> 


<link href="<%=context%>/page/shangjia/ss/style.css" rel="stylesheet" type="text/css">
<script src="<%=context%>/page/shangjia/ss/Validform_v5.3.2.js" type="text/javascript"> </script>
<script src="<%=context%>/page/shangjia/ss/jquery.form.js(1)" type="text/javascript"> </script>
<script src="<%=context%>/page/shangjia/ss/VerCodeSend.js" type="text/javascript"> </script>
<script src="<%=context%>/page/shangjia/ss/sendcaptcha.js"></script>
<script language="javascript" type="text/javascript">
    $(function () {
        bindCaptcha('#sendbtn', "#mobile-lk");
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
                if (data.Result) {
                    myAlert("注册成功",function() {
                        location.href = "/bis/bisRegist";
                    });
                } else {
                    var src = $("#captcha_img").attr("src");
                    $("#captcha_img").attr("src", src + "?randstamp=" + new Date().getTime());
                    myAlert(data.Message);
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
            <h1>商家注册 / <span>快速提升店铺流量 轻松超越同行</span>
                <span class="toLogin">已有账号，
                <a href="http://www.meib2c.com/login?type=0">立即登录</a>
                </span>
            </h1>
            <form action="http://www.meib2c.com/regist/BisRegisterSubmit" id="einfo_form" class="einfo_form" method="post">
                
                <div class="mer_pc">
                    <span class="nat_px">用户名：</span>
                    <input name="sk_name" type="text" id="bisRegister1" value="" maxlength="15" datatype="username" ajaxurl="/CommonBase/CheckUserNameExist" placeholder="请设置用户名" class="nat_ttv Validform_error" nullmsg="请填写信息！">
                <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>

                <p class="warn bisRegister1" style="display: none;">
                    <i class="iconfont icon-warn"></i>支持汉字、字母、数字、下划线组合，3-15个字符，不能为纯数字
                </p>
               
                <!--mer_pc-->

                <div class="mer_pc">
                    <span class="nat_px">登录密码：</span><input id="bisRegister2" name="sk_password" type="password" datatype="/^\w{6,16}$/i" errormsg="请填写6到16位字符！" placeholder="请设置密码" class="nat_ttv Validform_error" nullmsg="请填写信息！">
                <span class="Validform_checktip Validform_wrong">请填写信息！</span></div>

                <!--mer_pc-->
                <p class="warn bisRegister2" style="display: none;">
                    <i class="iconfont icon-warn"></i>密码由6-16位字母、数字和下划线组成，区分大小写
                </p>
                <!--mina_ti-->
                <div class="mer_pc">
                    <span class="nat_px">确认密码：</span><input name="repassword" id="bisRegister3" datatype="*" recheck="sk_password" type="password" nullmsg="请再次输入密码！" placeholder="请再次输入密码" errormsg="密码不一致！" class="nat_ttv Validform_error">
                <span class="Validform_checktip Validform_wrong">请再次输入密码！</span></div>
                <p class="warn bisRegister3" style="display: none;">
                    <i class="iconfont icon-warn"></i>请再次输入密码
                </p>
                <div class="mer_pc">
                    <span class="nat_px">手机号：</span>
                    <input name="sk_mobile" type="text" id="mobile-lk" datatype="m" nullmsg="格式有误" placeholder="请输入您的手机号" ajaxurl="/Regist/mobileCheck" class="nat_ttv Validform_error">
                    
                <span class="Validform_checktip Validform_wrong">格式有误</span></div>
                <p class="warn mobile-lk" style="display: none;">
                    <i class="iconfont icon-warn"></i>请输入11位手机号，其他用户不可见
                </p>
                <div class="mer_pc">
                    <span class="nat_px">验证码：</span>
                    <input name="code" type="text" style="width:95px" datatype="num" id="bisqq" placeholder="请输入验证码" nullmsg="请输入验证码" class="nat_ttv">
                    <span id="sendbtn" style="margin: 0 0 0 0;width: 166px;" class="submit">发送验证码</span>
                <span class="Validform_checktip"></span></div>

                

                <div class="mer_pc">
                    <span class="nat_px">QQ号：</span><input name="sk_qq" type="text" placeholder="请输入您的QQ号" datatype="n4-12" nullmsg="请输入QQ！" class="nat_ttv">
                <span class="Validform_checktip"></span></div>
                      <div class="mer_pc">
                    <span class="nat_px">邀请码：</span><input name="invateCode" type="text" placeholder="请输入您的邀请码" id="" class="nat_ttv">

                </div>
              
                <div class="mer_psc">
                    <input id="protocol" type="checkbox" checked="checked" disabled="disabled" class="merchant-protocol">我已仔细阅读并同意接受
                    <a href="http://www.meib2c.com/Regist/UserAgreement" target="_blank">《用户使用协议》</a>
                </div>
                <!--mer_psc-->
                <div class="mer_pct" style="margin-top: 0;">
                    <input id="submit" type="submit" name="eReg_subimt" value="立即注册" class="qu_pxc p-red">
                </div>
                <!--mer_pc-->
            </form> 
        </div>
        <div class="online_service">
            <img src="<%=context%>/page/shangjia/ss/zhuce_zixun.jpg">
        </div>
        <!--mer_center-->
    </div>
    <!--mert_main-->
</div>
<ul class="bis-icon">
    <li>
        <div>
            <span>合理优化店铺权重</span>
            <span class="gray">告别盲目销量</span>
            <img src="<%=context%>/page/shangjia/ss/shoplogin4.png" alt="Alternate Text">
        </div>
    </li>
    <li>
        <div>
            <span>手淘流量飙升</span>
            <span class="gray">15天流量增长300%</span>
             <img src="<%=context%>/page/shangjia/ss/shoplogin2.png" alt="Alternate Text">
        </div>
    </li>
    <li>
        <div>
            <span>海量收藏加购</span>
            <span class="gray">优化店铺权重</span>
              <img src="<%=context%>/page/shangjia/ss/shoplogin5.png" alt="Alternate Text">
        </div>
    </li>
    <li>
        <div>
            <span>精准买家标签</span>
            <span class="gray">匹配最合适的用户下单</span>
              <img src="<%=context%>/page/shangjia/ss/shoplogin3.png" alt="Alternate Text">
        </div>
    </li>
     <li>
        <div>
            <span>合理购物流程</span>
            <span class="gray">用户通过多天浏览购买</span>
            <img src="<%=context%>/page/shangjia/ss/shoplogin1.png" alt="Alternate Text">
        </div>
    </li>
</ul>
<!--merc_content-->

<!--merc_content-->
<div class="nrtou" id="abc">
    <a href="javascript:void(0)">
        <img src="<%=context%>/page/shangjia/ss/shoufw2.png" style="display:block;">
    </a><a href="javascript:" class="fork" onclick=" $(&#39;#abc&#39;).hide();">ｘ</a>
    <div>
        <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3002529035&amp;site=qq&amp;menu=yes" target="_blank">业务咨询</a>
    </div>
    <div style="padding:8px 0;"></div>
</div>

<div class="footer">
    <div class="footer_main">
        <div class="footer_left">
            <div class="footer_xy" style="padding-top: 58px;">
                <a href="http://www.meib2c.com/Regist/about" target="_blank">联系我们</a><span>|</span>
                <a href="http://www.meib2c.com/Help/AdvertisingCost" target="_blank">商务合作</a><span>|</span>
                <a href="http://www.meib2c.com/Regist/UserAgreement" target="_blank">用户协议</a><span>|</span>
                <a href="http://www.meib2c.com/help/index" target="_blank">帮助中心</a>
            </div>
            <div class="footer_fl">
                <span>Copyright © 2017 meili.com</span> 浙ICP备17042206号-1&nbsp;&nbsp;浙公网安备33010302003013号&nbsp;&nbsp;杭州美名科技有限公司
            </div>
            <div>
                <a class="f_t" rel="nofollow" title="美丽啪官网" target="_blank"></a>
                
                <a class="f_f" rel="nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.meilipa.com&amp;at=business" title="美丽啪官网" target="_blank"></a>
                <a class="f_g" rel="nofollow" href="https://v.pinpaibao.com.cn/cert/site/?site=www.meilipa.com&amp;at=business" title="美丽啪官网" target="_blank"></a>
            </div>
        </div>
        <div class="footer_right" style="float: left; margin-left: 80px;">
            <div class="footer-sp1">bussiness@meilipa.com</div>
            
        </div>
        <div style="float: left; margin-top: 52px;margin-left: 80px;">
            <p style="width: 100px;text-align: center">关注米袋网公众号</p>
            <img style="width: 100px; height: 100px;" src="<%=context%>/page/shangjia/ss/yonghu_code.jpg">
        </div>      
    </div>
</div>

    <script src="<%=context%>/page/shangjia/ss/jquery.form.js(1)" type="text/javascript"></script>
<div class="tchs" id="logindialog" style="display: none;">
    <div id="dialog_log_qiandao" class="dialog-wrapper dialog_log_qiandao" style="width: 416px;">
        <span class="red">
            登录/注册
            <a href="javascript:void(0)" title="关闭窗口" onclick="$(&#39;#logindialog&#39;).hide()">
                <span class="close"></span>
            </a>
        </span>
        <div class="diginfo" style="border: none">
            <div class="log-cont">
                <ul class="clickTitle">
                    <li onclick="tab(this,0)" class="active"><i class="icon-1"></i> 用户登录</li>
                    <li onclick="window.open(&#39;//www.meilipa.com/Regist/UserRegister&#39;)"><i class="icon-2"></i> 用户注册</li>
                </ul>
                <div class="tabcont">
                    <div class="tab">
                        <form style=" width: 288px; margin: 0 auto;" method="POST">
                            <div class="mb-20 msg-input">
                                <input type="text" id="username" placeholder="请输入邮箱/手机号/用户名" title="邮箱/手机号/用户名" onkeydown="keyLogin(event)">
                                <input type="password" class="pwd" id="password" placeholder="请输入密码" autocomplete="off" disableautocomplete="" onkeydown="keyLogin(event)">
                            </div>
                            <div class="btn">
                                <input id="submitbtn" type="button" class="btn-input" value="立即登录" title="登 录" onclick="loginSubmit(1, location.href)">
                            </div>
                            <div class="clearfix msg-tip" style="height: 52px;">
                                <div class="msg-tip-lf">
                                    <p id="error" class="err-txt" style="display:none;">请输入密码</p>
                                    <p class="tip-txt" style="margin-bottom:0;">使用其他账号登录</p>
                                </div>
                                <a class="msg-tip-rt" href="http://www.meilipa.com/Security/FindPassword?usertype=1">
                                    <p>忘记密码？</p>
                                </a>
                                <div class="jiao"></div>
                            </div>
                        </form>
                        <div class="qq-login">
                            <a href="javascript:" onclick="WxLogin()">
                                <div class="qq-icon wx-icon"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>



    <a class="totop" id="back-to-top" style="display: none">


</a><div style="display: none"><a class="totop" id="back-to-top" style="display: none">
    <script src="<%=context%>/page/shangjia/ss/z_stat.php" language="JavaScript"></script><script src="<%=context%>/page/shangjia/ss/core.php" charset="utf-8" type="text/javascript"></script></a><a href="http://www.cnzz.com/stat/website.php?web_id=1264684842" target="_blank" title="站长统计">站长统计</a>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?688dd87df7b6415752fbd3fdd58258d9";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</div></body></html>