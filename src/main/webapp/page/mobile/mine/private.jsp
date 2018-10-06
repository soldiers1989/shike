<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 30px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>隐私协议</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/css/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/css/Common.js"></script>

    <script>
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
    
<link href="<%=BusiConstant.shikemobilepath %>/mine/private/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/private/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/mine/private/list.css">

<link href="<%=BusiConstant.shikemobilepath %>/mine/private/animate.min.css" rel="stylesheet">
<style>
    .header {
        font-size: 0.6rem;
    }

    .h-contain {
        padding-top: 2rem;
    }

        .h-contain img {
            width: 100%;
        }

    .private {
        padding: 2.2rem 0.6rem 0.6rem;
        font-size: 0.5rem;
        color: #666;
        line-height: 0.9rem;
        text-align: justify;
    }

        .private p {
            font-size: 0.65rem;
            color: #333;
            font-weight: 500;
            padding: 0.5rem 0;
        }
</style>
<script>

</script>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="iconfont icon-Toright" style="color: #000;display: inline-block;float: left;margin-left: 0.4rem;position: absolute;left: 0;" onclick="history.back(-1);"></i>
    隐私协议
</header>


<div class="private">

    本应用（<%=BusiConstant.name %>）尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本应用会按照本隐私权政策的规定使用和披露您的个人信息。但本应用将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本应用不会将这些信息对外披露或向第三方提供。本应用会不时更新本隐私权政策。 您在同意本应用服务使用协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于本应用服务使用协议不可分割的一部分。
    <br>
    <p>
        1. 适用范围
    </p>
    (a) 在您注册本应用帐号时，您根据本应用要求提供的个人注册信息；
    <br>
    (b) 在您使用本应用网络服务，或访问本应用平台网页时，本应用自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；
    <br>
    (c) 本应用通过合法途径从商业伙伴处取得的用户个人数据。
    <br>
    您了解并同意，以下信息不适用本隐私权政策：
    <br>
    (a) 您在使用本应用平台提供的搜索服务时输入的关键字信息；
    <br>
    (b) 本应用收集到的您在本应用发布的有关信息数据，包括但不限于参与活动、成交信息及评价详情；
    <br>
    (c) 违反法律规定或违反本应用规则行为及本应用已对您采取的措施。
    <br>
    <p>
        2. 信息使用
    </p>
    (a)本应用不会向任何无关第三方提供、出售、出租、分享或交易您的个人信息，除非事先得到您的许可，或该第三方和本应用（含本应用关联公司）单独或共同为您提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有这些资料。
    <br>
    (b) 本应用亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播您的个人信息。任何本应用平台用户如从事上述活动，一经发现，本应用有权立即终止与该用户的服务协议。
    <br>
    (c) 为服务用户的目的，本应用可能通过使用您的个人信息，向您提供您感兴趣的信息，包括但不限于向您发出产品和服务信息，或者与本应用合作伙伴共享信息以便他们向您发送有关其产品和服务的信息（后者需要您的事先同意）。
    <br>
    <p>
        3. 信息披露
    </p>
    在如下情况下，本应用将依据您的个人意愿或法律的规定全部或部分的披露您的个人信息：
    <br>
    (a) 经您事先同意，向第三方披露；
    <br>
    (b) 为提供您所要求的产品和服务，而必须和第三方分享您的个人信息；
    <br>
    (c) 根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；
    <br>
    (d) 如您出现违反中国有关法律、法规或者本应用服务协议或相关规则的情况，需要向第三方披露；
    <br>
    (e) 如您是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；
    <br>
    (f) 在本应用平台上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的，本应用有权决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。
    <br>
    (g) 其它本应用根据法律、法规或者网站政策认为合适的披露。
    <br>
    <p>
        4. 信息存储和交换
    </p>
    本应用收集的有关您的信息和资料将保存在本应用及（或）其关联公司的服务器上，这些信息和资料可能传送至您所在国家、地区或本应用收集信息和资料所在地的境外并在境外被访问、存储和展示。
    <br>
    <p>
        5. Cookie的使用
    </p>
    (a) 在您未拒绝接受cookies的情况下，本应用会在您的计算机上设定或取用cookies ，以便您能登录或使用依赖于cookies的本应用平台服务或功能。本应用使用cookies可为您提供更加周到的个性化服务，包括推广服务。
    <br>
    (b) 您有权选择接受或拒绝接受cookies。您可以通过修改浏览器设置的方式拒绝接受cookies。但如果您选择拒绝接受cookies，则您可能无法登录或使用依赖于cookies的本应用网络服务或功能。
    <br>
    (c) 通过本应用所设cookies所取得的有关信息，将适用本政策。
    <br>
    <p>
        6. 信息安全
    </p>
    (a) 本应用帐号均有安全保护功能，请妥善保管您的用户名及密码信息。本应用将通过对用户密码进行加密等安全措施确保您的信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请您注意在信息网络上不存在“完善的安全措施”。
    <br>
    (b) 在使用本应用网络服务进行网上交易时，您不可避免的要向交易对方或潜在的交易对方披露自己的个人信息，如联络方式或者邮政地址。请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。如您发现自己的个人信息泄密，尤其是本应用用户名及密码发生泄露，请您立即联络本应用客服，以便本应用采取相应措施。
</div>
        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/mine/private/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/mine/private/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/mine/private/loading.gif">
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