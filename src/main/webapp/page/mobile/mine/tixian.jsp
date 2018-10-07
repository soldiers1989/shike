<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>提现</title>
    <meta name="keywords" content="试呗网">
    <meta name="description" content="试呗网">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script>
        var userId=0;
        (function (doc, win) {
            var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function (first) {
                var clientWidth = docEl.clientWidth;
                
                if (!clientWidth) return;
          
                docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                
            };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
            recalc();
        })(document, window);
    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/tixian/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/tixian/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/tixian/mytryout.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/tixian/account.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/tixian/regist.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/tixian/goods.css">
<script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>


<script>
    var goldnum = "4150";
    
    var isVip = 'False';
    $(function () {
        if (globle.isWeixin()) {
            $(".text-info span").eq(0).css("display", "none");
        } else {
            $(".text-info span").eq(1).css("display", "none");
        }
        $("#apply-con").Validform({
            beforeSubmit: function(data) {
                if ($("#pwd").val().length < 6) {
                    myConfirm("支付密码：<input type='password' placeholder='首次输入为登录密码' style='border:1px solid #ddd; height:1.2rem;line-height:1.2rem;width:7rem;' id='input-pwd'>",function() {

                        $("#apply-con").submit();
                    });
                    $("#input-pwd").on("keyup", function() {
                        $("#pwd").val($(this).val());
                    });
                    return false;
                }
            }
        });
        $("#apply-con").form({
            success: function (data) {
                if (!data.Result) {
                    myAlert(data.Message);
                    $("#pwd").val("");
                } else {
                    //myAlert("提现成功");
                    $("#pwd").val("");
                    $("#apply-con").css("display", "none");
                    $("#applySuccess").fadeIn();
                }
            }
        });
        $(".all-btn").on("click", function() {
            $("#money").val($("#zhanghuye").html() - 0);
            $("#show2").fadeIn();
            $("#show1").fadeOut();
            var money = $("#zhanghuye").html() - 0;
            var fee = 0;

            fee = parseFloat(money * 0.05).toFixed(2);
            if (fee < 1) {
                fee = 1;
            }
            $("#feeSpan").text(fee);
            var feeGold = fee*100;
            if (feeGold >= 5000)
                feeGold = 5000;
            if (feeGold > goldnum) {
                $("#canUseGold").html(goldnum);
                $("#goldprice").html(parseFloat(goldnum / 200).toFixed(2));
            } else {
                $("#canUseGold").html(Math.round(feeGold));
                $("#goldprice").html(parseFloat(feeGold / 200).toFixed(2));
            }
            $("#draw").text((money - fee).toFixed(2));
        });

        $("#checkGold").on("click", function() {
            if (isVip!="True") {
                layer.open({
                    content: '只有VIP才能使用金币抵扣手续费哦！',
                    btn: ['成为VIP', "取消"],
                    yes: function (index) {
                        location.href = "/UserAccount/Vip";
                    },
                    no: function (index) {
                    }
                });
                return false;
            }
            if ($(this).is(":checked")) {
                $(this).val(1);
                var Allmoney=($("#draw").text()-0)+ ($("#goldprice").text()-0);
            } else {
                $(this).val(0);
                var Allmoney=($("#draw").text()-0)- ($("#goldprice").text()-0);
            }
           
            $("#draw").text(Allmoney.toFixed(2));
        });

        $("#money").bind("input propertychange", function () {
            $("#checkGold").removeAttr("checked");
            $("#checkGold").val(0);
            var val = $(this).val();
            if (! /^-?\d+\.?\d{0,2}$/.test(val)) { //判断是否是两位小数  //强制两位小数
                var s = val;
                this.value = s.substring(0, s.length - 1);
            }

            val = $(this).val() - 0;
            if (val) {
                if (val < 0) {
                    val = 0;
                    this.value = 0;
                }
                $("#show2").fadeIn();
                $("#show1").fadeOut();
                var money = val;
                var fee = 0;

                fee = parseFloat(money * 0.06).toFixed(2);
                if (fee < 1) {
                    fee = 1;
                }
                $("#feeSpan").text(fee);
                var feeGold = fee * 100;
                if (feeGold >= 5000)
                    feeGold = 5000;
                if (feeGold > goldnum) {
                    $("#canUseGold").html(goldnum);
                    $("#goldprice").html(parseFloat(goldnum / 200).toFixed(2));
                } else {
                    $("#canUseGold").html(Math.round(feeGold));
                    $("#goldprice").html(parseFloat(feeGold / 200).toFixed(2));
                }
                $("#draw").text((money - fee).toFixed(2));
            } else {
                $("#show2").fadeOut();
                $("#show1").fadeIn();
            }

        });

    });

</script>
<link href="<%=BusiConstant.shikemobilepath %>/mine/tixian/phonegap.css" rel="stylesheet" type="text/css">
<style>
    body, html {
        background: #f4f4f4;
        height: 100%;
    }

    .phone-num {
        line-height: 1.9rem;
        height: 1.9rem;
        padding: 0 0.6rem;
        background: #fff;
        margin-top: 0.4rem;
    }

    span.blank {
        color: #000;
        font-weight: bold;
        margin: 0;
    }

    .phone-num i {
        color: #00a9f1;
        font-size: 0.7rem;
        margin: 0 0.6rem 0 1rem;
    }

    .phone-num * {
        display: inline;
    }

    .phone-num .change {
        float: right;
        color: #999;
    }

    p.gray {
        padding: 0 0.6rem;
        height: 1.5rem;
        line-height: 1.5rem;
        color: #999;
    }

    .tx-con {
        background: #fff;
        padding: 0.6rem;
    }

        .tx-con h3 {
            font-size: 0.6rem;
            color: #000;
            padding-bottom: 1.1rem;
        }

        .tx-con div input {
            border: none;
            outline: none;
            padding-left: 1em;
        }

        .tx-con #num-price {
            display: flex;
            align-content: center;
            height: 0.8rem;
            line-height: 0.8rem;
        }

            .tx-con div span {
                line-height: 0.8rem;
                height: 0.8rem;
                font-size: 0.6rem;
            }

            .tx-con div input:focus {
                box-shadow: none !important;
                border: none !important;
                outline: none !important;
            }

        .tx-con p, .tx-con div#show2{
            padding-top: 0.6rem;
            border-top: 1px solid #eee;
            margin-top: 0.5rem;
            color: #999;
        }

            .tx-con p span {
                color: #5d6f97;
            }

    .text-info {
        padding: 0.6rem;
    }
        .text-info h3 *{display: inline-block;vertical-align: middle;}
         .text-info p {
            color: #999;
            margin-top: 0.5rem;
            font-size: 0.55rem;
        }

    .tx-btn {
        margin: 1.8rem auto 0;
        font-size: 0.7rem;
        height: 1.8rem;
        width: 12rem;
        display: block;
        background-color: #ff464e;
        border: none;
        color: #fff;
        line-height: 1.8rem;
        text-align: center;
        border-radius: 0.3rem;
    }

    .text-info h3 {
        font-weight: 500;
    }

    .text-info span {
        color: #999;
    }
    .text-info span a{ margin-left: 0.2rem; display: inline-block;vertical-align: middle; border-radius: 2px; background-color: #ff464e; padding: 0 0.3rem; color: #fff;height: 1rem;line-height:1rem;}


     #applySuccess {
        text-align: center;
    }
    #applySuccess > i {
        color: #11b611;
        margin: 2rem auto 0;
        font-size: 2.4rem;
    }
     #applySuccess > h3{font-weight: 500;height: 1.4rem;line-height: 1.4rem;}
        #applySuccess > p{color: #999;font-size: 0.52rem;margin-bottom: 3rem;}
    #applySuccess >a{ border-radius: 0.3rem; display: block; margin: 1rem 0.6rem;height: 2rem;line-height: 2rem;border: 1px solid #ff464e;color: #fff;background:#ff464e;font-size: 0.68rem;}
        #applySuccess > a:last-child{background: #fff;color: #ff464e;}

    .tx-con div#show2{height: auto;display: none;}
    .tx-con div#show2 div span{font-size: 0.55rem;}
    .tx-con div#show2 div *{display: inline-block;vertical-align: middle;height: 0.7rem;line-height: 0.7rem;}
    .tx-con div#show2 div{line-height: 1.5rem;}
    .tx-con div#show2 input{margin-right: 0.2rem;}
    #canUseGold {
        color: #ff8e1b;
    }
</style>

<header class="header acct-top"><i class="arrows" onclick="location.href = &#39;<%=BusiConstant.shike_yue.getKey() %>&#39;"></i>提现</header>
<div style="height: 2rem;"></div>
<form id="apply-con" action="#" method="POST">
     <input name="password" style="text-indent: 1em;" id="pwd" type="hidden" class="moneya">
    <div class="phone-num">
        <span class="blank">提现到</span> <i class="iconfont icon-recharge"></i> <em id="zhifubao"></em> <%--<span class="change" onclick="location.href=&#39;/aa/a&#39;">修改</span>--%>
    </div>
    <p class="gray">手续费：提现手续费率6%，每笔手续费最低1元。</p>
    <div class="tx-con">
        <h3>提现金额</h3>
        <div id="num-price">
            <span class="blank">¥</span>
            <input type="number" id="money" placeholder="输入金额" name="money" step="0.01" datatype="/^\+?(?:20000(?:\.0?0)?|1[0-9]{4}|[1-9]\d{0,3})(?:\.\d?\d)?$/" errormsg="请填写20000以内金额">
        <span class="Validform_checktip"></span></div>
        <p id="show1">可用余额¥<em id="zhanghuye"></em>，<span class="all-btn">全部提现</span></p>
        <div id="show2">
            扣除¥<em id="feeSpan">0</em>手续费
            
            实际到账 ¥<em id="draw">0</em>
        </div>

    </div>

    <div class="text-info">
        <h3><em>温馨提示：</em>
            <span>申请提现后1-3个工作日到账(节假日顺延)</span>
            <%--<span style="display: none;"><em>APP提现1个工作日快速到账</em><a class="btn" href="#">打开APP</a></span>--%>
        </h3>
        
    </div>
    <a style="color: #3B8DE4; float: right; margin-right: 0.6rem;" href="#"><%--忘记密码?--%></a>
    <input type="button" onclick="tixian()" class="tx-btn" value="申请提现">
</form>


<div id="applySuccess" style="display: none;">
    <i class="iconfont icon-righ3"></i>
    <h3>提现申请成功</h3>
    <p>1-3个工作日到账（节假日顺延）</p>
    
    <a href="<%=BusiConstant.shike_haohuo.getKey() %>">领取更多免费试用</a>
    <a href="<%=BusiConstant.shike_mine.getKey() %>">我的试呗</a>
</div>
        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8" type="text/javascript"></script>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/common/images/loading.gif">
    </div>
</div>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.form.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Validform_v5.3.2.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/post.loading.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layer.m.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/layerdialog.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.cookie.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/browser.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/app.js"></script>


</body></html>

<script>


    function addsucdo(data){
        // alert("提交成功，1-3个工作日之后会到账");
        //myAlert("提现成功");
        $("#pwd").val("");
        $("#apply-con").css("display", "none");
        $("#applySuccess").fadeIn();
    }
    function tixian() {
        var money = parseFloat($("#money").val())
        var zhanghuye = parseFloat($("#zhanghuye").html())
        if (money < 10) {
            myAlert("最低提现10元");
            return;
        }
        if (zhanghuye < money) {
            myAlert("提现金额不能超过可用余额");
            return;
        }
        add();
    }
    function add(){
        var url = "<%=BusiConstant.sk_saveout_do.getKey()%>";
        postdo(url, {jine:$("#money").val()},addsucdo,null, null);
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
            $("#zhanghuye").html(row.yue);
        }
    }
    function zhanghuye(){
        var data = {};
        var url = "<%=BusiConstant.userzhyue_do.getKey()%>";
        postdo(url, data, sucdo,null, null);
    }
    zhanghuye();


</script>
