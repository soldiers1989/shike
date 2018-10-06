<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 29px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>赚金币</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://localhost/favicon.ico" rel="shortcut icon" type="image/x-icon">
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
    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/jinbi/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbi/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbi/regist.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.infinitescroll.js"></script>

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbi/mytryout.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/jinbi/mygold.css">

<script>
    function  showCode(parameters) {
        myAlert("<img class='layerimg' src='/content/images/JPin/linglaG.jpg'/>");
    }
    function signin() {
        if (${isQiaodao}) {
            return;
        }

        qiandao();
    }

    function qiandao() {
        var data = {jinbi: 10};
        var url = "<%=BusiConstant.shike_qiaodao_do.getKey()%>";
        postdo(url, data, signinCallBack,null, null);
    }

    function signinCallBack(data) {
        if (data.type == "success") {
            $(".sign").addClass("gray");
            layer.open({
                content: '签到成功！'
                , btn: '我知道了'
            });
            $("#myJinbi").html(parseInt($("#myJinbi").html()) + 10)
        } else {
            myAlert(data.message);
        }
    }
</script>
<header class="header  task-top">
    <i class="iconfont icon-Toright" style="color: #000;display: inline-block;float: left;margin-left: 0.2rem;" onclick="history.back(-1)"></i>
   赚金币
</header>
<div style="height: 2rem;"></div>
<div class="gold-hd">
    <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold13.png" alt="Alternate Text">
    <div>
        我的金币：<em id="myJinbi">${jinbi}</em>
        <p>签到送10金币</p>
        <%--<p>连续签到送5/10/15/20(封顶)</p>--%>
    </div>
        <%--<span class="sign <c:if test='${isQiaodao}'>gray</c:if>" onclick="signin();"> 今日签到+10</span>--%>
        <c:if test='${isQiaodao}'><span class="sign gray" onclick="signin();"> 今日已签到</span></c:if>
        <c:if test='${!isQiaodao}'><span class="sign " onclick="signin();"> 今日签到+10</span></c:if>
</div>
<div class="bar zt-menu" style="background: #fff;padding-top: 0rem;">
    <ul>
        <li>
         
            <a style="<c:if test='${type == 1}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_jinbi.getKey() %>?type=1">赚金币 </a>
            <c:if test='${type == 1}'><div class="sel"></div></c:if>
        </li>
        <li>
            <a style="<c:if test='${type == 2}'>color: #ff464e</c:if>" href="<%=BusiConstant.shike_jinbi.getKey() %>?type=2">花金币 </a>
            <c:if test='${type == 2}'><div class="sel"></div></c:if>
        </li>
    </ul>
</div>
<div class="usera-kong"></div>
    <c:if test="${type == '1'}">
        <ul class="gold-list">
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold18.png" alt="Alternate Text">
                <div>
                    <span>敬请期待...</span>
                </div>
                <p><i></i><span> </span></p>
            </li>
            <%--<li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold20.png" alt="Alternate Text">
                <div>
                    <span>邀请商家</span>
                    <p>邀请商家成功发布活动</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span> +40200</span></p>
                <a href="http://test.com/Invitation/BisInvitation" class="btn">领金币</a>
            </li>

            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold14.png" alt="Alternate Text">
                <div>
                    <span>邀请粉丝</span>
                    <p>粉丝注册申请</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span> +200</span></p>
                <a href="http://test.com/Invitation" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold18.png" alt="Alternate Text">
                <div>
                    <span>金币充值</span>
                    <p>1元=200金币</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+2000起</span></p>
                <a href="http://test.com/UserAccount/GoldRecharge" class="btn">充金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold19.png" alt="Alternate Text">
                <div>
                    <span>赏金任务</span>
                    <p>送200-1600金币</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+200起</span></p>
                <a href="http://test.com/home/list?orderType=4" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold16.png" alt="Alternate Text">
                <div>
                    <span>申请试用</span>
                    <p>单日申请10次试用</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+200</span></p>
                <a href="http://test.com/home/list" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold18.png" alt="Alternate Text">
                <div>
                    <span>完成活动</span>
                    <p>周一到周日完成10个活动</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+500</span></p>
                <a href="http://test.com/home/list" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold5.png" alt="Alternate Text">
                <div>
                    <span>开通会员</span>
                    <p>会员期间每月送</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+368</span></p>
                <a href="http://test.com/UserAccount/vip" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold5.png" alt="Alternate Text">
                <div>
                    <span>90%中奖率</span>
                    <p>送100金币起</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+100起</span></p>
                <a href="http://test.com/home/list?orderType=5" class="btn">领金币</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold17.png" alt="Alternate Text">
                <div>
                    <span>精华试用报告</span>
                    <p>被评为精华试用报告</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+100</span></p>
                <a class="btn gray op0"></a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold6.png" alt="Alternate Text">
                <div>
                    <span>关注微信公众号</span>
                    <p>首次关注并绑定账号</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+100</span>
                </p>
                <a onclick="showCode();" class="btn gray">已完成</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold7.png" alt="Alternate Text">
                <div>
                    <span>做问卷（PC端）</span>
                    <p>一次性赠送</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+50</span>
                </p>
                <a class="btn gray op0"></a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold8.png" alt="Alternate Text">
                <div>
                    <span>注册账号</span>
                    <p>一次性赠送</p>
                </div>
                <p><i class="iconfont icon-jinbi2"></i><span>+100</span></p>
                <a href="http://test.com/UserAccount/MyGold?type=1#" class="btn gray">已完成</a>
            </li>--%>
        </ul>
    </c:if>

    <c:if test="${type == '2'}">
        <ul class="gold-list type-list">
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold18.png" alt="Alternate Text">
                <div>
                    <span>敬请期待...</span>
                </div>
                <p><i></i><span> </span></p>
            </li>
            <%--<li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold9.png" alt="Alternate Text">
                <div>
                    <span>金币必中</span>
                </div>
                <p></p>
                <a href="http://test.com/jing/goldHit" class="btn">去兑换</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold10.png" alt="Alternate Text">
                <div>
                    <span>兑换会员</span>
                </div>
                <p></p>
                <a href="http://test.com/UserAccount/vip" class="btn">去兑换</a>
            </li>
            <li>
                <img src="<%=BusiConstant.shikemobilepath %>/mine/jinbi/gold11.png" alt="Alternate Text">
                <div>
                    <span>金币抽奖</span>
                </div>
                <p></p>
                <a href="http://test.com/Lottery" class="btn">去抽奖</a>
            </li>--%>
        </ul>
    </c:if>



<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8"
            type="text/javascript"></script>

<div id="loading" class="loading" style="display: none;">
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