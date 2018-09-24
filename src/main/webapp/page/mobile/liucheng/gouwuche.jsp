<%@page import="com.kensure.shike.baobei.model.SKJindian"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page import="com.kensure.shike.baobei.model.SKBaobei" %>
<%@ page import="com.kensure.shike.baobei.model.SKWord" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
    List<SKWord> words = (List<SKWord>)request.getAttribute("words");
    SKWord word = null;
    if(words != null){
        word = words.get(0);
    }
    List<SKJindian> jindians = (List<SKJindian>)request.getAttribute("jindians");
    SKJindian  jd = jindians.get(0);
%>
<!DOCTYPE html>
<!-- saved from url=(0075)http://m.meilipa.com/JpinShopIssue/OrderFlow?activityId=96251&freeundefined -->
<html lang="zh" style="font-size: 31.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>
    <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    
    <title>试用流程</title>
    <meta name="keywords" content="试呗,免费试用,试用网,免费试用网,试用中心,试客,试客网">
    <meta name="description" content="欢迎来免费试呗.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/jquery-1.8.3.js.下载"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/Common.js.下载"></script>

    <script>
        var userId=349975;
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
    
<link href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/goods.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/mytryout.css">

<script>
    var tbao = "";
    $(function () {
        tbao=$("#tabao").val();
    })

    var haveOtherTaobao = "False";
    var id = '96251';
    var pic = '//img.alicdn.com/imgextra/i3/796056182/TB2sPMBBRyWBuNkSmFPXXXguVXa_!!796056182.jpg|//img.alicdn.com/imgextra/i1/796056182/TB1qw3feVooBKNjSZPhXXc2CXXa_!!0-item_pic.jpg|//img.alicdn.com/imgextra/i1/796056182/TB2GiRuqhGYBuNjy0FnXXX5lpXa_!!796056182.jpg|//img.alicdn.com/imgextra/i2/796056182/TB2np8dbRgXBuNjt_hNXXaEiFXa_!!796056182.jpg';
    var shopossueGold = 632;
    var referrer = '';     //记录上一页地址
</script>
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/JPinFlow.css">

<script src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/clipboard.min.js.下载"></script>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="history.back(-1)"></i>
    试用流程
</header>
<input type="hidden" id="tabao" value="qq123456">
<input type="hidden" id="dpname" value="${baobei.dpname}">
<input type="hidden" id="taokl" value="${baobei.taokl}">
<div style="height: 2rem"></div>
<div class="Flow">
    <div class="Flow-hd">
        <%--<img src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/7da6e911-c7a6-44df-932f-984d459d9ba3">--%>
        <img src="${baobei.zturl}">

        <ul>
            <li><span class="iconfont icon-tb"></span> <span>${baobei.title}</span></li>
            <li>店铺名称：<span>${baobei.dpnameS}</span></li>
            <li>价格：<span style="color: #ff464e;">${baobei.salePrice}元</span></li>
            <li>规格：<span style="color: #ff464e;" onclick="myAlert(&#39;${baobei.guige}&#39;)">${baobei.guige}</span></li>
        </ul>
    </div>
    <div class="usera-kong"></div>

        <input name="type" value="0" id="type" type="hidden">
            <div class="Flow-page">
                <span>搜索流程</span>
            </div>
            <div class="FlowCon">
                <ul>
                    <li>
                        <span class="num">1</span><em class="title">找到宝贝</em><br>
                        打开<em class="red">手机淘宝APP</em>
                        <div class="lh14">
                            搜索商品：<em class="red nextKey-item1">${words[0].word}</em>
                            <%--<span class="change-btn">换一换</span>--%>
                        </div>
                        <div class="lh14">排序方式：<em class="red nextKey-item2">综合排序</em></div>
                        <div class="filter-img lh14">筛选方式：<img src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/filter.png"> </div>
                        <div style="line-height:1.5rem;">筛选条件：
<em style="display: inline-block;width: 10rem;vertical-align: top;text-align: justify;letter-spacing: 0.03rem;line-height: 0.9rem;padding-top: 0.3rem;">
折扣与服务（<%=jd.getZkfw()==null?"无":jd.getZkfw() %>）</em>
                            
                        </div>
                        <div class="lh14">价格区间：<em class="red nextKey-item34">-</em></div>
                    </li>
                    <li>
                        <span class="num">2</span><em class="title">核对宝贝</em>
                        <div style="color: #aaa">以下两种方式二选一</div>
                        <div class="flow-cat">
                            <span class="">验证淘口令</span>
                            <span class="act">验证店铺</span>
                        </div>
                        <dl class="validate-list">
                            <dd class="">
                                <div>
                                    ①点击一下输入框—②长按—③粘贴
                                </div>
                                <div class="textarea">
                                    <textarea class="link" placeholder="点击手机淘宝宝贝详情页“分享”按钮，选择“复制链接”然后将商品链接粘贴到此处"></textarea>
                                </div>
                                <div class="check-url">
                                    <span class="btn">
                                        <i class="iconfont icon-error1"></i>
                                        <em>点击核对</em>
                                    </span>
                                </div>
                            </dd>
                            <dd class="act">
                                <div>
                                    请进入商品详情页，浏览商品详情<em class="red">不少于3分钟</em>，复制并核对目标宝贝<em class="red">店铺名称</em>。
                                </div>
                                <div class="check-title">核对店铺名：<input type="text" name="name" class="link" placeholder="请输入店铺名称验证宝贝"></div>
                                <div class="storage-img mt3 jp-sl">
                                    <em class="red">示例：</em><img src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/dp1.png">
                                </div>
                                <div class="check-url check-title">
                                    <span class="btn">
                                        <i class="iconfont icon-error1"></i>
                                        <em>点击核对</em>
                                    </span>
                                </div>
                            </dd>
                        </dl>
                        
                    </li>
                    <li>
                        <span class="num">3</span>
                        <em class="title">加入购物车</em><br>
                        找到宝贝后<em class="red">必须加购物车</em>，被通过后从购物车里找到宝贝下单。
                        (申请成功后就没有搜索流程了哦！找不到的话会导致无法下单哟!)
                    </li>
                </ul>
            </div>
        <div class="usera-kong"></div>
            <div class="btn gray submit-btn" onclick="apply(0);">
                加入购物车后，确定申请
            </div>
        <input id="ApplyType" hidden="hidden" value="0">


    <input type="hidden" value="0" id="item">
    <script type="text/html" id="selectTaobao">
    <div class="improve">
        选择下单的淘宝/京东账号 <span class="close-layer iconfont icon-error1" onclick="layer.closeAll()"></span>
    </div>
    <select id="seltaobao" class="taobaoselect">
                <option>qq123456</option>
    </select>
    <div class="yqintshi">*必须用选择的淘宝/京东账号下单否则将不返款并冻结账户</div>
    <div class="confirm-btn btn" onclick="taobaosuccess($('#seltaobao').val(), $('#txtremark').val());">
        提交
    </div>
</script>
    <script type="text/html" id="applySuccess">
    <div class="improve flh">
        试用申请已提交，商家审核中
    </div>
    <div class="bfen wmen">
        商品在审核通过后
    </div>
    <div class="wmen ">
        我们将通过APP推送通知您哦
    </div>
    <div class="own" onclick="layer.closeAll() ">
        确定
    </div>
</script>
      <script type="text/html" id="bindtaobao">
      <div class="improve">
      <span class="close-layer" style="font-size: 0.55rem;color: #aaa;top:-1.2rem;" onclick="taobaosuccess('')">跳过</span> 
      </div>
      <div class="bind-tao" style="margin-top:1.2rem;">
          <span>请输入淘宝/京东号：</span> <input type="text" id="Tbao" />
      </div>
      <div class="xd qxjy">
            <div class="confirm-btn btn" onclick="taobaoSubmit($('#Tbao').val().trim())">
                绑定
            </div>
       </div>
    </script>
</div>



<script>
    //var copyCon1 = '';
    $(function() {

        var clipboard = new Clipboard('#copy-button');
        //myAlert("复制失败，请长按文字复制");

        clipboard.on('success', function(e) {
            myAlert("复制成功");
        });

        clipboard.on('error', function(e) {
            myAlert("复制失败，请长按文字复制");
        });
        $("#copy-button").on("click", function() {

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
    })
</script>

<script>
    var platform = '0';
    var id='96251';
    var type= $("#type").val();
    var LeaveMessage;
    var answer="";
    var checkFalg = false;
    var depthFlag='True'=="True"?true:false;
    var checkTimes = 0;
    var shopType=0;
    function apply(applyType) {
        if (!checkFalg) {
            myAlert("您还没有核对宝贝信息");
            return false;
        }
        if (!depthFlag) {
            myAlert("您还没有找到问题答案");
            return false;
        }
        ApplyType = applyType;

        addgouwuche();///shike/page/mobile/lc/images/dp1.png
        // checkLogin(function () {
        //     if (haveOtherTaobao == "True") {
        //         openDialog('#selectTaobao');
        //     } else if (tbao == "") {
        //         openDialog("#bindtaobao");
        //     } else {
        //         taobaosuccess(tbao);
        //     }
        // });
    }
    //留下信息
    function leaveMessageCallBack(msg) {
        $('#leaveMessage').hide();
        LeaveMessage = msg;
        postApply();
    }
    //提交成功
    function taobaosuccess(taobao, message) {
        tbao = taobao;
        layer.closeAll();
        LeaveMessage = message;
        postApply();
    }

    var postFlag = false;
    function postApply() {
        if (postFlag) {
            return false;
        }
        postFlag = true;
        $.post('/JpinShopIssue/Apply', { id:id, message: LeaveMessage, taobao: tbao, orderType:shopType,type: type,limited:'' ,applyType:$("#ApplyType").val()}, function (d) {
            postFlag = false;
            if (d.Result) {
                if(d.Data.sk_is_limited)
                {
                    myAlert("中奖！请在"+ d.Data.time +"内完成下单，逾期将取消中奖资格！", function () {
                        location.href = "/jing/SecKill";
                    });
                }else
                {
                    //window.location.replace(window.location.href + "&v=" + Math.random() * 100 + "&referrer=" + document.referrer);
                    var activityId = globle.getUrlParam("activityId");
                    var applyType = globle.getUrlParam("applyType");
                    var limited = globle.getUrlParam("limited");
                    var urlParams = "?activityId=" + activityId;
                    if(applyType){  //金币兑换
                        urlParams += "&applyType=" + applyType;
                    }
                    if(limited) {   //limited 为1 的时候   是限量秒杀
                        urlParams += "&limited=" + limited;
                    }
                    urlParams += "&v=" + Math.random() * 100;
                    if(referrer == "") {
                        urlParams += "&referrer=" + document.referrer;
                        //window.location.replace(window.location.href + "&v=" + Math.random() * 100);
                        window.location.replace(window.location.href.split("?")[0] + urlParams);
                    } else {
                        urlParams += "&referrer=" + referrer;
                        window.location.replace(window.location.href.split("?")[0] + urlParams);
                    }
                }


            } else {
                if (d.Data == 401) {
                    myConfirmDefinedText(d.Message, "我知道了", "我要参团", function () {
                        layer.closeAll();
                    }, function () {
                        location.href = "/JpinShopIssue/OrderFlow?activityId=" + id;
                    });
                    return false;
                }
                if (d.Data == 402) {
                    myAlert(d.Message,function () {
                        location.href = "/home/List";
                    });
                    return false;
                }
                if(d.Data == 201) {
                    layer.open({
                        content: d.Message
                        , btn: '去认证',
                        yes: function (index) {
                            layer.close(index);
                            location.href = "/UserAccount/ModifyTaobao?shoptype=0";
                        }
                    });

                    return;
                }

                myAlert(d.Message, false, function () {});
            }
        });
        layer.closeAll();
    }
    //淘宝提交
    function taobaoSubmit(taobao) {
        if (taobao != "") {
            $.post('/CommonBase/AddTaobaoSubmit', { taobao: taobao,shopType:shopType }, function (data) {
                if (data.Result == true) {
                    taobaosuccess(taobao);
                } else {
                    myAlert(data.Message);
                }
            });
        } else {
            myAlert("账号不能为空");
        }
    }

    $(function() {
        setTimeout(function(){$(".change-btn").removeClass("gray");}, 30000);
        $(".flow-cat span").on("click", function() {//验证方式切换
            $(this).addClass("act").siblings().removeClass("act");
            $(".validate-list dd").removeClass("act").eq($(this).index()).addClass("act");
        });
        $(".question-btn").on("click",function (){
            var val=$(".answer").val();
            if(val==answer){
                depthFlag=true;
                layer.open({
                    content: '恭喜您，答案正确'
                   ,skin: 'msg'
                   ,time: 2 //2秒后自动关闭
                });
                if(checkFalg){
                    $(".submit-btn").removeClass("gray");
                }
                $(this).addClass("green").text("验证通过");
            }else{
                layer.open({
                    content: '答案错误，请重试'
                   ,skin: 'msg'
                   ,time: 2 //2秒后自动关闭
                });
                depthFlag=false;
            }
        });
        //核对淘口令和核对标题
        $(".check-url .btn").on("click", function() {
            var key_word = "";
            if ($(".validate-list").length > 0) {
                var key_word = $(this).parents("dd").find(".link").val();
            }
            if (!key_word) {
                layer.open({
                    content: '验证值为空，请重新填写'
                    ,btn: '关闭'
                });
                return false;
            }
            var $this = $(this);

            var flag = $(this).parent().hasClass("check-title") ? 'CheckTitle' : 'CheckLink';

            // 按标题Check
            if (flag == 'CheckTitle') {
                if (key_word == $("#dpname").val()) {
                    checkFalg = true;
                } else {
                    checkFalg = false;
                }
            }
            // 按口令Check
            else {
                if (key_word == $("#taokl").val()) {
                    checkFalg = true;
                } else {
                    checkFalg = false;
                }
            }

            if (checkFalg) {
                myAlert("恭喜您找到正确的宝贝了");
                $this.addClass("right").removeClass("error").find("i").removeClass("icon-error1").addClass("icon-wancheng");
                if(depthFlag){
                    $(".submit-btn").removeClass("gray");
                }
                $this.find("em").html("验证通过");
            } else {
                myAlert("错误，请重新输入");
                $this.addClass("error").removeClass("right").find("i").addClass("icon-error1").removeClass("icon-wancheng");
                $this.find("em").html("重新验证");
            }


            // var url = $(this).parent().hasClass("check-title") ? '/JpinShopissue/CheckTabaoTitle' : '/JpinShopissue/CheckLink';
            // $.post(url, { aid: 96251 , key:key_word.replace(/《/g, "￥").replace(/€/g, "￥") }, function (d) {
            //     if (d.Code) {
            //         myAlert("系统繁忙，请使用店铺验证");
            //         $(".flow-cat span:last-child").trigger("click");
            //         return false;
            //     }
            //     if (d.Result) {
            //         //   $("#copy-con1").val(copyCon1);
            //         $this.parents("dd").find(".submit-btn").removeClass("gray");
            //         myAlert("恭喜您找到正确的宝贝了");
            //         checkFalg = true;
            //         $this.addClass("right").removeClass("error").find("i").removeClass("icon-error1").addClass("icon-wancheng");
            //         if(depthFlag){
            //             $(".submit-btn").removeClass("gray");
            //         }
            //         $this.find("em").html("验证通过");
            //     } else {
            //         myAlert(d.Message);
            //         checkFalg = false;
            //         $this.addClass("error").removeClass("right").find("i").addClass("icon-error1").removeClass("icon-wancheng");
            //         $this.find("em").html("重新验证");
            //     }
            // });
        });


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
                        $(".lh14:first").before('<div id="bbbt">宝贝标题：<em class="red">'+data.Data.shopname+'</em></div>');
                    }
                    seachcount++;
                } else {
                    myAlert(data.Message);
                }
            });
        });
    });

    function dictsucdo(data){
        window.location.href="<%=BusiConstant.shike_scgz.getKey()%>?id=<%=baobei.getId()%>";
    }
    function addgouwuche(){
        var dpmc = $("#dpname").val();
        var ds = [{content:dpmc}];
        var data = {id:<%=baobei.getId()%>,status:18,datas:JSON.stringify(ds)};
        var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
        postdo(url, data, dictsucdo,null, null);
    }

</script>

        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/jquery.form.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/Validform_v5.3.2.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/post.loading.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/layer.m.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/layerdialog.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/jquery.cookie.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/browser.js.下载"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/gouwuche/app.js.下载"></script>


</body></html>