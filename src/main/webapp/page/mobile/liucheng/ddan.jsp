<%@page import="com.kensure.shike.user.model.SKUser"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.baobei.model.SKBaobei" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
    SKUser user = (SKUser)request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>试用流程</title>
    <meta name="keywords" content="试呗网">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="<%=BusiConstant.context %>/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/common/css/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/Common.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>

    <script src="https://unpkg.com/qiniu-js@2.5.0/dist/qiniu.min.js"></script>


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
    
<link href="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/JPinFlow.css">

<script src="<%=BusiConstant.shikemobilepath %>/common/js/uploadimageNew.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/clipboard.min.js"></script>
<script>
    var referrer = '';     //记录上一页地址
</script>
<input type="hidden" id="dpname" value="${baobei.dpname}">
<div style="position: fixed;display: none; height: 100%;width: 100%;top: 0;left: 0; vertical-align: middle;
                                      text-align: center; background: #fff;z-index: 1011;" class="imgshade" onclick="$(&#39;.imgshade&#39;).fadeOut();">
    <p style="padding: 0.5rem;padding-top: 2rem;text-align: left;color: #ff464e;">1.在购物车找到领券宝贝。</p>
    <img src="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/quancase2.png" style="width: 100%;" alt="Alternate Text">
    <p style="padding: 0.5rem;text-align: left;color: #ff464e;">2.领券。</p>
    <img src="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/quancase1.png" style="width: 100%;" alt="Alternate Text">
    <p style="padding-top: 2rem;padding: 0.5rem;text-align: left;color: #ff464e;">注意：1、京东活动和淘宝活动领券方式一样。</p>
    <p style="padding-top: 2rem;padding: 0.5rem;text-align: left;color: #ff464e;text-indent: 3em;">2、再次点击页面，即可关闭示例。</p>

</div>
    <header class="header task-top frv" style="line-height: 2rem">
        <i class="arrows" onclick="history.back(-1)"></i>
        试用流程
    </header>
    <div style="height: 2rem"></div>
    <input id="taobaoImg" type="hidden" value="<%=user.getTaobaoImg() %>"/>
    <div class="Flow">
        <div class="Flow-hd">
            <img src="${baobei.zturl}">
            <ul>
                <li><span class="iconfont icon-tb"></span> <span>${baobei.title}</span></li>
                <li>店铺名称：<span>${baobei.dpnameS}</span></li>
                <li>价格：<span style="color: #ff464e;">${baobei.salePrice}元</span></li>
                <li>规格：<span style="color: #ff464e;" onclick="myAlert(&#39;${baobei.guige}&#39;)">${baobei.guige}</span></li>
            </ul>
        </div>
       <%-- <div style="height: 1.4rem;line-height: 1.2rem;text-align:center;background-color: #fff;">
            <i class="iconfont icon-QQ" style="display: inline; color: #00ADE1;display: inline-block;vertical-align: middle;"></i> <span style="display: inline-block; vertical-align: middle;">商家QQ：<em style="color:#999;">3302422581</em></span>
        </div>--%>
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
                        <span class="num">2</span> 登录淘宝账号
                        <em class="red"><%=user.getNoTaobao() %></em>进入购物车,找到宝贝
                </li>
                <li>
                    <span class="num">3</span>核对商品：<em class="red">请提交宝贝淘口令(非必填)</em>
                    <div>
                        ①点击一下输入框—②长按—③粘贴
                    </div>
                    <div class="textarea">
                        <textarea id="link" placeholder="点击宝贝详情页“分享按钮，选择“复制链接”，然后将商品链接粘贴到此处"></textarea>
                    </div>
                    <div class="check-url">
                        <span class="btn">
                            <i class="iconfont icon-error1"></i>
                            <em>点击核对</em>
                        </span>
                    </div>
                </li>
                    <li>
                        <span class="num">4</span>确认无误后下单付款。
                                                    <div class="warn mt3" style="margin-top: 0.5rem;">
                                <i class="iconfont icon-weitongguo"></i>注意：勿用信用卡等产生手续费的付款方式。
                            </div>
                    </li>


            </ul>


        </div>

        <div class="usera-kong"></div>
        <div class="Flow-page">
            <span>填写订单信息</span>
        </div>
        <div class="FlowCon">
            <ul>
                <li>
                    <span class="num">1</span>上传订单详情截图，如图
                    <div class="likePic">
                        <img src="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/order.png" style="max-height:10rem;">
                    </div>
                    <div class="up-img mt3">
                        上传订单截图：<img class="up-num-img" src="<%=BusiConstant.shikemobilepath %>/liucheng/ddan/up-img.png">
                    </div>
                    <div class="red">我的—我的订单—待发货的【订单列表页】并截图</div>
                </li>

                <li>
                    <span class="num">2</span>复制订单号
                    <div class="input mt3">
                        订单号：<input id="ddanhao" type="text" class="order-num">
                    </div>
                    <div class="red">点击 我的—我的订单—订单详情页—点击复制订单编号</div>
                </li>
            </ul>
        </div>
        <div class="btn" onclick="postTDay()">
            已经付款，确认提交订单号
        </div>


    </div>
<script>


    $(function () {

        var taobaoImg = $("#taobaoImg").val();

        if (!taobaoImg) {
            myAlert("请先上传淘宝截图后，再提交订单!", function () {
                location.href = "<%=BusiConstant.shike_modifytaobao.getKey() %>"
            });
        }
    })

    var logo2 = "";

    function updateUrl(url,key){
        var key= (key || 't') +'=';  //默认是"t"
        var reg=new RegExp(key+'\\d+');  //正则：t=1472286066028
        var timestamp=+new Date();
        if(url.indexOf(key)>-1){ //有时间戳，直接更新
            return url.replace(reg,key+timestamp);
        }else{  //没有时间戳，加上时间戳
            if(url.indexOf('\?')>-1){
                var urlArr=url.split('\?');
                if(urlArr[1]){
                    return urlArr[0]+'?'+key+timestamp+'&'+urlArr[1];
                }else{
                    return urlArr[0]+'?'+key+timestamp;
                }
            }else{
                if(url.indexOf('#')>-1){
                    return url.split('#')[0]+'?'+key+timestamp+location.hash;
                }else{
                    return url+'?'+key+timestamp;
                }
            }
        }
    }

    var id='90976';
    $(function() {
        /****换一换代码****/
        setTimeout(function(){$(".change-btn").removeClass("gray");}, 30000);//换一换
        var seachcount = 1;
        var clicktime =30;
        $(".change-btn").on("click", function() {
            if ($(this).hasClass("gray")) {
                return false;
            }
            var $this = $(this);
            $.post("/JpinShopIssue/NextKeyword", { id: id,item:$("#item").val(),seachcount:seachcount }, function(data) {
                if (data.Result) {
                    clicktime = 30;
                    $this.addClass("gray");
                    var timmerKey=setInterval(function() {
                        clicktime--;
                        if (clicktime == 0) {
                            clearInterval(timmerKey);
                            $(".change-btn").removeClass("gray");
                        }
                    }, 1000);
                    $("#item").val(data.Data.nextCount);
                    $(".nextKey-item1").html(data.Data.data.Item1);
                    $(".nextKey-item2").html(data.Data.data.Item2);
                    $(".nextKey-item34").html(data.Data.data.Item3 +"-"+data.Data.data.Item4);
                    if (data.Data.shopname!="") {
                        $("#bbbt").remove();
                        $(".lh14").before('<div id="bbbt">宝贝标题：<em class="red">'+data.Data.shopname+'</em></div>');
                    }
                    seachcount++;
                } else {
                    myAlert(data.Message);
                }
            });
        });



        /****换一换结束****/
        bindUploadImage('.up-num-img', function (p) {

            $('.up-num-img').attr("src", p);
            $('.up-num-img').data("src", p);
            logo2 = p;
        },false,"JpinOrderFlow");

        bindUploadImage('.search-again-img', function (p) {
            $('.search-again-img').attr("src", p);
            $('.search-again-img').data("src", p);
        },false,"JpinOrderFlow");

        $(".check-url .btn").on("click", function() {
        	var tkl = $('#link').val();
        	checkTKL(tkl);
        });
        var clipboard1 = new Clipboard('#copy-button1');
        //myAlert("复制失败，请长按文字复制");

        clipboard1.on('success', function(e) {
            myAlert("复制成功");
        });

        clipboard1.on('error', function(e) {
            myAlert("复制失败，请长按文字复制");
        });
        $("#copy-button1").on("click", function() {

        });
    });
    
    
    //核对淘口令
    function checkTKL(tkl){
        var data = {id:<%=baobei.getId()%>,tkl:tkl};
        var url = "<%=BusiConstant.shike_tklcheck_do.getKey()%>";
        postdo(url, data, tklsuc,tklerr, null);
    }
    function tklsuc(data){
    	 $(".submit-btn").removeClass("gray");
         myAlert("验证通过");
         var  $this = $(".check-url .btn")
         $this.addClass("right").find("i").removeClass("icon-error1").addClass("icon-right");
         $this.find("em").html("验证通过"); 	
   }
   function tklerr(data){
	   myAlert("验证失败");
	   var  $this = $(".check-url .btn")
       $this.addClass("error").find("i").addClass("icon-error1").removeClass("icon-right");
       $this.find("em").html("验证失败");
   }
    
    var flag = false;
    function postTDay() {

        if (!$(".search-again-img").data("src")&&'False'=='True')
        {
            myAlert("宝贝位置截图没有上传");
            return false;
        }

        if (!(/^\d{9,50}$/.test($(".order-num").val()))) {
            myAlert("请核对后填写正确的订单号");
            return false;
        }
        if (!$(".order-num").val()) {
            myAlert("您还未填写订单号");
            return false;
        }
        if (!$(".up-num-img").data("src")) {
            myAlert("您还未上传订单截图");
            return false;
        }
        if (flag) {
            return false;
        }
        if($("#sk_evaluate_info").length > 0 && $("#sk_evaluate_info").val().length < 10 )  {
            myAlert("试用心得需要大于10个字哦！");
            return false;
        } else if($("#sk_evaluate_info").length > 0 && $("#sk_evaluate_info").val().length >= 500) {
            myAlert("试用心得需要小于500个字哦！");
            return false;
        }
        flag = true;

        add();
    }


    function dictsucdo(data){
        myAlert("提交成功，等待收货", function () {
            window.location.href="<%=BusiConstant.shike_wdhd.getKey()%>?status=51";
        });
    }
    function add(){

        var ds = [{content:$("#ddanhao").val(),busitype:"ddh",typeid:2},{content:logo2,busitype:"dd",typeid:3}];
        var data = {id:<%=baobei.getId()%>,status:61,datas:JSON.stringify(ds)};
        var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
        postdo(url, data, dictsucdo,null, null);
    }

</script>
<div style="display: none">

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


<form action="/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form><form action="/CommonBase/UploadPic?compressType=JpinOrderFlow" method="post"><input type="file" accept="image/*;" name="file" style="display:none"></form></body></html>