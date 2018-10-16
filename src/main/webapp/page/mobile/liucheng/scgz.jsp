<%@page import="com.kensure.shike.user.model.SKUser"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.baobei.model.SKBaobei" %>
<%@ page import="com.kensure.shike.baobei.model.SKWord" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
    SKUser user = (SKUser)request.getAttribute("user");
    
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>试用流程</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="/shike/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>


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
    
<link href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>


<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/index.css">

<link href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/scgz/JPinFlow.css">

<script src="<%=BusiConstant.shikemobilepath %>/common/js/Validform_v5.3.2.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/jquery.form.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimage.js"></script>
<script>
    var referrer = '';     //记录上一页地址
</script>

    <header class="header task-top frv" style="line-height: 2rem">
        <i class="arrows" onclick="history.back(-1)"></i>
        试用流程
    </header>
    <div style="height: 2rem"></div>
    <div class="Flow">
        <div class="Flow-hd">
            <img src="${baobei.zturl}">
            <ul>
                <li><span class="iconfont icon-tb"></span> <span>${baobei.title}</span></li>
                <li>店铺名称：<span>${baobei.dpnameS}</span></li>
                <li>价格：<span style="color: #ff464e;">${baobei.salePrice}元</span></li>
                <li>规格：<span style="color: #ff464e;" onclick="myAlert(&#39;${baobei.zturl}&#39;)">${baobei.guige}</span></li>
            </ul>
        </div>
        <div class="usera-kong"></div>
        <div class="Flow-page">
                <span>试用流程</span>
        </div>
        <div class="FlowCon">
            <ul>
                <li>
                    <span class="num">1</span> 打开
                    <em class="red">手机淘宝APP</em>
                </li>
                <li>
                    <span class="num">2</span>登录淘宝账号
                    <em class="red"><%=user.getNoTaobao() %></em>进入购物车，找到宝贝
                </li>
                <li>
                    <span class="num">3</span>在宝贝详情页底部<em class="red">点击关注/收藏 </em>按钮关注/收藏宝贝，如图：
                    <div class="storage-img mt3">
                        <img src="<%=BusiConstant.shikemobilepath %>/common/images/storageGood.png">

                    </div>
                    <div class="up-img mt3">
                        关注/收藏宝贝截图：<img class="good-img" src="<%=BusiConstant.shikemobilepath %>/common/images/up-img.png">
                    </div>
                </li>
                <li>
                    <span class="num">4</span>在宝贝详情页底部点击店铺按钮进入店铺，页面顶部店铺名旁边，<em class="red">点击关注</em>如图：
                    <div class="storage-img mt3">
                        <img src="<%=BusiConstant.shikemobilepath %>/common/images/storageShop.png">
                    </div>
                    <div class="up-img mt3">
                        关注/收藏店铺截图：<img class="shop-img" src="<%=BusiConstant.shikemobilepath %>/common/images/up-img.png">
                    </div>
                </li>


            </ul>
        </div>
        <div class="usera-kong"></div>
        <div class="btn submit-btn">
            下一步
        </div>
    </div>
<script>
    function updateUrl(url, key) {
        var key = (key || 't') + '=';  //默认是"t"
        var reg = new RegExp(key + '\\d+');  //正则：t=1472286066028
        var timestamp = +new Date();
        if (url.indexOf(key) > -1) { //有时间戳，直接更新
            return url.replace(reg, key + timestamp);
        } else {  //没有时间戳，加上时间戳
            if (url.indexOf('\?') > -1) {
                var urlArr = url.split('\?');
                if (urlArr[1]) {
                    return urlArr[0] + '?' + key + timestamp + '&' + urlArr[1];
                } else {
                    return urlArr[0] + '?' + key + timestamp;
                }
            } else {
                if (url.indexOf('#') > -1) {
                    return url.split('#')[0] + '?' + key + timestamp + location.hash;
                } else {
                    return url + '?' + key + timestamp;
                }
            }
        }
    }

    var id = '21353190';
    var askType = 'False';
    $(function () {

        var logo1 = "";
        var logo2 = "";
        var uploading1 = false;
        var uploading2 = false;

        bindUploadImage('.good-img', function (p) {
            $('.good-img').attr("src", "<%=BusiConstant.context %>" + p);
            $('.good-img').data("src", "<%=BusiConstant.context %>" + p);
            logo1 = "<%=BusiConstant.context %>" + p;
            uploading1 = true;
        }, false, "JpinOrderFlow");
        bindUploadImage('.shop-img', function (p) {
            $('.shop-img').attr("src", "<%=BusiConstant.context %>" + p);
            $('.shop-img').data("src", "<%=BusiConstant.context %>" + p);
            logo2 = "<%=BusiConstant.context %>" + p;
            uploading2 = true;
        }, false, "JpinOrderFlow");
        bindUploadImage('.up-ask-img', function (p) {
            $('.up-ask-img').attr("src", p);
            $('.up-ask-img').data("src", p);
        }, false, "JpinOrderFlow");


        function dictsucdo(data){
            if ("${baobei.hdtypeid}" == 4) {
                myAlert("提交成功，可以中奖活动页直接提交订单", function () {
                    window.location.href="<%=BusiConstant.shike_wdhd.getKey()%>?status=51";
                });
            } else {
                myAlert("提交成功，等待抽奖", function () {
                    window.location.href="<%=BusiConstant.shike_wdhd.getKey()%>?status=21";
                });
            }
        }
        function add(){
            var ds = [{content:logo1,busitype:"sc"},{content:logo2,busitype:"gz"}];
            var data = {id:<%=baobei.getId()%>,status: 21,datas:JSON.stringify(ds)};
            var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
            postdo(url, data, dictsucdo,null, null);
        }


        var flag = false;
        $(".submit-btn").on("click", function () {
            var shop_img = $('.shop-img').data("src");
            var good_img = $('.good-img').data("src");
            if (!good_img) {
                myAlert("您还没有上传收藏宝贝截图");
                return false;
            }
            if (!shop_img) {
                myAlert("您还没有上传收藏店铺截图");
                return false;
            }
            if (!$("img.up-ask-img").data("src") && askType == "True") {
                myAlert("您还未上传手淘问大家截图");
                return false;
            }

            add();

            // if (flag) {
            //     return false;
            // }
            // flag = true;
            // $.post("/JPinShopIssue/OrderFlow2Submit", { sk_id: id, sk_product_pic: good_img, sk_store_pic: shop_img, sk_ask_pic: $("img.up-ask-img").data("src"), limited: '' }, function (D) {
            //     flag = false;
            //     if (D.Result) {
            //         if (D.Data != null && D.Data.sk_is_limited) {
            //             myAlert("中奖！请在" + D.Data.time + "内完成下单，逾期将取消中奖资格！", function () {
            //                 location.href = "/jing/SecKill";
            //             });
            //         }
            //         else {
            //             //window.location.replace(window.location.href + "&v=" + Math.random() * 100 + "&referrer=" + document.referrer);
            //             var activityId = globle.getUrlParam("activityId");
            //             var applyType = globle.getUrlParam("applyType");
            //             var limited = globle.getUrlParam("limited");
            //             var urlParams = "?activityId=" + activityId;
            //             if (applyType) {  //金币兑换
            //                 urlParams += "&applyType=" + applyType;
            //             }
            //             if (limited) {   //limited 为1 的时候   是限量秒杀
            //                 urlParams += "&limited=" + limited;
            //             }
            //             urlParams += "&v=" + Math.random() * 100;
            //             if (referrer == "") {
            //                 urlParams += "&referrer=" + document.referrer;
            //                 //window.location.replace(window.location.href + "&v=" + Math.random() * 100);
            //                 window.location.replace(window.location.href.split("?")[0] + urlParams);
            //             } else {
            //                 urlParams += "&referrer=" + referrer;
            //                 window.location.replace(window.location.href.split("?")[0] + urlParams);
            //             }
            //         }
            //     } else {
            //         myAlert(D.Message);
            //     }
            // });
        });

    })


</script>
<div style="display: none">
    <script src="<%=BusiConstant.shikemobilepath %>/common/z_stat.php" language="JavaScript"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/common/core.php" charset="utf-8" type="text/javascript"></script>

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


<form action="<%=BusiConstant.context %>/baobei/addfile.do" method="post"><input type="file"
                                                                                                         accept="image/*;"
                                                                                                         name="file"
                                                                                                         style="display:none">
</form>
<form action="http://test.com/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file"
                                                                                                         accept="image/*;"
                                                                                                         name="file"
                                                                                                         style="display:none">
</form>
<form action="http://test.com/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file"
                                                                                                         accept="image/*;"
                                                                                                         name="file"
                                                                                                         style="display:none">
</form>
</body>
</html>