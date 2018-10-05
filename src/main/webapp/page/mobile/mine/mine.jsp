<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.user.model.SKUser" %>
<%@ page import="com.kensure.shike.zhang.model.SKUserYue" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
    SKUser user = (SKUser)request.getAttribute("user");

    /*Double yuee = 0.00;
    Double jinbi = 0.00;
    if (user != null) {
        SKUserYue yue = (SKUserYue)request.getAttribute("yue");

        if (yue != null && yue.getYue() != null) {
            yuee = yue.getYue();
        }
        if (yue != null && yue.getJinbi() != null) {
            jinbi = yue.getJinbi();
        }
    }*/
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>我的试呗</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>

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

        checkuser();

    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/common/css/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/resource/account.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/mine/resource/account.js"></script>

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimage.js"></script>

<script>
    $(function () {
        $(".go-mj").on("touchmove", function (e) {
            $(".go-mj").css({ "left": (e.originalEvent.changedTouches[0].clientX - 25 + "px"), "top": (e.originalEvent.changedTouches[0].clientY - 25 + "px") })
        });
    })
</script>
<style>
    body {
        background: #eee;
    }
</style>
<div class="selectImg">
    <h3>点击选择您的头像</h3>
    <ul>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/1.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/2.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/3.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/4.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/5.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/6.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/7.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/8.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/9.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/10.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/11.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/12.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/13.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/14.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/15.png" alt="加载失败"></li>
        <li><img src="<%=BusiConstant.shikemobilepath %>/mine/resource/16.png" alt="加载失败"></li>
    </ul>
</div>
<div class="usera-index">
    <div class="message">
        <a href="#">
            <i class="iconfont icon-xiaoxi" style="display:inline;"></i>
        </a>
    </div>
    <div class="usera-index-top">
        <img id="imgPic" src="<%=BusiConstant.shikemobilepath %>/mine/resource/shopdefaultavatar.jpg">
        <p>
            <span>${user.phone }</span>
            <%--<img style="display: inline-block;vertical-align: middle;height: 0.7rem;" src="<%=BusiConstant.shikemobilepath %>/mine/resource/vip-icon-gray.png" alt="Alternate Text">--%>
        </p>
        <%--<div class="status" onclick="location.href = &#39;/UserAccount/vip&#39;">
                &lt;%&ndash;<a href="http://.com/UserAccount/vip"><i class="iconfont icon-VIP"></i> 立即开通&gt;</a>&ndash;%&gt;
        </div>--%>
        <%--<a class="sign-in" href="#">签到</a>--%>
        <a class="sign-in" onclick="location.href = &#39;<%=BusiConstant.shike_jinbi.getKey() %>?type=1&#39;;">签到</a>
    </div>
    <div class="h23">
        <div class="usera-index-footer" onclick="location.href = &#39;<%=BusiConstant.shike_yue.getKey() %>&#39;;">
            <p>余额</p>：<p class="maney">${empty yue ? "0.00" : yue.yue }</p>
        </div>
        <div class="usera-index-footer" onclick="location.href = &#39;<%=BusiConstant.shike_jinbimx.getKey() %>&#39;;">
            <p>金币</p>：<p class="maney">${jinbi }</p>
        </div>
    </div>
</div><%--
<div class="user-report" onclick="window.location.href=&#39;/help/report&#39;">
    <i class="iconfont icon-gonggao"></i>
    <ul style="margin-top: -25.8232px;">
            
            
            
    <li>
                网站升级通知            </li><li>
                2018年中秋节假期安排通知            </li><li>
                业务更新通知            </li></ul>
    <i class="iconfont icon-Toleft"></i>
</div>--%>

<div class="usera-center  jp" style="overflow:hidden;">
    <h3>
        我的活动
        <span style="color:#999;margin-left:0.2rem;">（今日申请数：${todaySq}）</span>
        <a style="float: right;color: #999;font-size: 0.55rem;display: inline;position: initial; padding: 0;width: auto;" href="<%=BusiConstant.shike_wdhd.getKey() %>">查看更多状态<i class="iconfont icon-Toleft" style="font-size: 0.6rem;color: #999;vertical-align: middle;display: inline;"></i></a>
    </h3>
    <div style="width:100%;">
        <a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=18">
            <i class="iconfont icon-exam"></i>
            <span style="color:#666;">继续申请</span>
        </a>
        <a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=21">
            <i class="iconfont icon-xinrendalibao"></i>
            <span style="color:#666;">待开奖</span>
        </a>
        <a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=51">
            <i class="iconfont icon-gift"></i>
            <span style="color:#666;">中奖了</span>
            <span class="num" style="left:1.7rem; right:auto;width:auto;min-width:0.7rem;padding:0 0.1rem;">${yzj}</span>
        </a>
        <a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=99">
            <i class="iconfont icon-wancheng"></i>
            <span style="color:#666;">已返款</span>
        </a>
        
    </div>
</div>
<%--<div class="usera-kong"></div>
<div class="my-invite">
    <h3 style="border:none;" onclick="location.href = &#39;/UserAccount/UserRank&#39;">
        我的中奖率
        <a href="http://.com/UserAccount/UserRank"><i class="iconfont icon-Toleft"></i></a>
    </h3>
</div>--%>
<div class="usera-kong"></div>
<div class="my-invite">
    <h3>
        我是代言人
        <span class="iconfont icon-wenhao" onclick="location.href = &#39;<%=BusiConstant.shike_dyren.getKey() %>&#39;"></span>
        
        <a id="shareQrcode" href="#">分享赚10元<i class="iconfont icon-Toleft"></i></a>
    </h3>
    <ul>
        <li onclick="location.href = #">
            <p>
                <i class="iconfont icon-jinbi1"></i><span>奖金</span>
            </p>
            <span>0</span>
            <div></div>
        </li>
        <li onclick="location.href = #">
            <p>
                <i class="iconfont icon-money1"></i><span>即将到账</span>
            </p>
            <span>0.00</span>
            <div></div>
        </li>
        <li onclick="location.href=#">
            <p><i class="iconfont icon-people1"></i><span>粉丝</span></p>
            <span>0</span>
            <div></div>
        </li>
        <li onclick="location.href = #">
            <p><i class="iconfont icon-jinbi"></i><span>金币</span></p>
            <span>0</span>
        </li>
    </ul>
</div><%--
<div class="usera-kong"></div>
    <div class="my-invite">
        <h3>
            我是微客
            <span class="iconfont icon-wenhao" onclick="location.href = &#39;/Help/Question?type=2&#39;"></span>
            <a id="shareQrcode" href="http://.com/invitation/BisInvaiteShare?invitationCode=0">推广二维码<i class="iconfont icon-Toleft"></i></a>
        </h3>
        <ul>
            <li onclick="location.href = &#39;/Invitation/BisMoneyInfo&#39;">
                <p>
                    <i class="iconfont icon-jinbi1"></i><span>奖金</span>
                </p>
                <span>0</span>
                <div></div>
            </li>
            <li onclick="location.href = &#39;/Invitation/BisList?sceen=1&#39;">
                <p>
                    <i class="iconfont icon-money1"></i><span>即将到账</span>
                </p>
                <span>0</span>
                <div></div>
            </li>
            <li onclick="location.href = &#39;/Invitation/BisList&#39;">
                <p><i class="iconfont icon-shangjia"></i><span>商家</span></p>
                <span>0</span>
                <div></div>
            </li>
            <li onclick="location.href = &#39;/UserAccount/GoldList?sceen=2&#39;">
                <p><i class="iconfont icon-jinbi"></i><span>金币</span></p>
                <span>0</span>
            </li>
        </ul>
    </div>--%>
    <div class="usera-kong"></div>
<ul class="help-item">
    <%--<li onclick="location.href = &#39;/a/aaa&#39; ">--%>
    <li onclick="location.href = &#39;<%=BusiConstant.shike_zhanghu.getKey() %>&#39;">
        <i class="iconfont icon-zhanghuanquan"></i>
        <p>账户安全</p>
    </li>
    <li onclick="lxjk()">
        <i class="iconfont icon-lianxikefu"></i>
        <p>联系客服</p>
    </li>
    <li onclick="yjfk()">
        <i class="iconfont icon-yijianfankui"></i>
        <p>意见反馈</p>
    </li>
    <li onclick="bzzx()">
        <i class="iconfont icon-wenhao"></i>
        
        <p>帮助中心</p>
    </li>
</ul>

<div style="height: 2rem"></div>
<div id="authentication" class="layermbox layermbox1 layermshow" style="display: none">
    <div class="laymshade">
        <div class="popup_rz">
            <div class="popup_rz_a">
                <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/thenti.jpg">
            </div>
            <div class="popup_rz_b">
                <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/wxshe.png">
                <span>申请无需审核</span>
            </div>
            <div class="popup_rz_b">
                <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/wxshe.png">
                <span>12小时快速返款</span>
            </div>
            <div class="popup_rz_b">
                <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/wxshe.png">
                <span>提现24小时到账</span>
            </div>

            <div class="mfei_rz-a">
                <a href="javascript:" onclick="$(&#39;#authentication&#39;).hide()">下次再说</a>
            </div>
            <a href="javascript:" class="gbinn" onclick="$(&#39;#authentication&#39;).hide();">
                <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/xxgban.png">
            </a>
        </div>
    </div>
</div><%--
<a class="go-mj" href="http://.com/help/invitearts">
    <img src="<%=BusiConstant.shikemobilepath %>/mine/resource/mj-icon.png">
</a>
--%>

<style>
    .down-app {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1000000;
        background: rgba(0,0,0,0.7);
    }

        .down-app img {
            position: absolute;
            width: 14.5rem;
            height: 15.36rem;
            left: 0.75rem;
            top: 50%;
            margin-top: -8.68rem;
        }

        .down-app .iconfont {
            display: block;
            position: absolute;
            top: 50%;
            margin-top: 7.5rem;
            color: #fff;
            font-size: 2rem;
            margin-left: -1rem;
            left: 50%;
            z-index: 10;
        }
</style>
<div class="down-app">
    <%--<a href="http://.com/UserAccount" onclick="clickNumber(0)">
        <img src="http://.com/UserAccount" alt="sk_gotourl">
    </a>--%>
        <i class="iconfont icon-error1"></i>
</div>
<script>

    $(function () {


    });
</script>


<script>
    $(function () {
        $("#btn-now").click(function () {
            layer.open({
                content: '选择支付方式',
                btn: ['金币支付', "余额支付"],
                skin: 'footer',
                yes: function (index) {
                    payCat(2);
                },
                no: function (index) {
                    payCat(1);
                }
            });
        });

        function payCat(type) {
            var cat = 1
            password = "";
            myConfirm("支付密码：<input type='password' placeholder='首次输入为登录密码' style='border:1px solid #ddd; height:1.2rem;line-height:1.2rem;width:7rem;' id='input-pwd'>", function () {
                if (password.length < 6) {
                    myAlert("密码必须大于6位");
                    return false;
                }
                submitPost(password, type, cat);
            });
            $("#input-pwd").on("keyup", function () {
                password = $("#input-pwd").val();
            });
        }

        function submitPost(pwd, type, cat) {
            $.post("/UserAccount/VipSubmit", { password: pwd, type: type, cat: cat }, function (data) {
                if (data.Result) {
                    myAlert("续费VIP成功", function () {
                        location.replace('/UserAccount?v=' + Math.random());
                    });
                } else {
                    if (data.Data) {
                        myConfirm("支付密码不正确，是否前往修改密码", function () {
                            location.href = "/UserAccount/FindDrawApplyPassword";
                        });
                    } else {
                        myAlert(data.Message);
                    }
                }
            })
        }
    });
    
    function lxjk() {
        myAlert("客户微信:000000000000000000")
    }



    function yjfk() {
        myAlert("维护中...")
    }



    function bzzx() {
        myAlert("维护中...")
    }

    function qidao() {
        myAlert("维护中...")
    }


</script>
        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>
        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/mine/resource/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/mine/resource/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
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