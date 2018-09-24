<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String context = BusiConstant.shikemobilepath;
    SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
%>
<!DOCTYPE html>
<!-- saved from url=(0058)http://m.meilipa.com/JpinShopIssue/WriteReport?id=21353190 -->
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>试呗网</title>
    <meta name="keywords" content="试呗网">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="http://m.meilipa.com/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/base.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/Common.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    <script src="<%=BusiConstant.shikemobilepath %>/common/uploadimage.js"></script>

    <script>
        /*var userId=273226;
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
        })(document, window);*/
    </script>
    
<link href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>
    
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/index.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/mytryout.css">

<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/liucheng/haop/goods.css">

<script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/jquery.countdown.js"></script>

<style>
    .tpsc {
        min-height: 100px;
    }
</style>
<script src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/clipboard.min.js"></script>
<script type="text/javascript">

    var logo2 = "";
    var issubmit = false;
    $(function () {
        $(".countdown").countdown({ nowTime: '2018/9/21 13:49:32', tmpl: '%{d}天%{h}时%{m}分后将自动取消资格' }); //倒计时
        $(".countdown1").countdown({ nowTime: '2018/9/21 13:49:32', tmpl: '%{d}天%{h}时%{m}分后将自动返款' }); //倒计时
        $("#form").Validform();
        $("#form").form({
            beforeSubmit: function () {
                if (issubmit) {
                    return false;
                }
                issubmit = true;
                $('#sk_comment').val(encodeURI($('#comment').val()));
                return true;
            },
            success: function (data) {
                issubmit = false;
                if (!data.Result) {
                    myAlert(data.Message);
                } else {
                    if (data.Data == 1) {
                        location = '/JpinShopIssue/list?type=2';
                    } else {
                        location = '/JpinShopIssue/list?type=3';
                    }
                   
                }
            }
        });
        bindUploadImage('#uploadbtn', function (path) {
            path = "<%=BusiConstant.context %>" + path;
            var html = '<li class="tpsc"><img name="preview" src="' + path + '" class="baob" style="width:85px;height:85px"><textarea name="preview" class="wby vfff" placeholder="简单的介绍下您收到的宝贝图片"></textarea><div class="caca" onclick="$(this).parent().remove();">X</div></li>';
            $('#picList').append(html);
            $("html, body").animate({ scrollTop: $("#picList").offset().top }, 500);
        }, true, 2, true);
        bindUploadImage('#uploadbtn1', function (path) {
            path = "<%=BusiConstant.context %>" + path;
            var html = '<li class="tpsc"><img name="preview1" src="' + path + '" class="baob" style="width:85px;height:85px"><div class="caca" onclick="$(this).parent().remove();">X</div></li>';
            $('#picList1').append(html);
            $("html, body").animate({ scrollTop: $("#picList1").offset().top }, 500);
            if (logo2 == '') {
                logo2 = path;
            } else {
                logo2 = logo2 + "sktag" + path;
            }

            alert(logo2)
        }, true, 2, true);
        bindUploadImage('#uploadbtn2', function (path) {
            path = "<%=BusiConstant.context %>" + path;
            var html = '<li class="tpsc"><img name="preview2" src="' + path + '" class="baob" style="width:85px;height:85px"><textarea name="preview1" class="wby vfff" placeholder="简单的介绍下您收到的宝贝图片"></textarea><div class="caca" onclick="$(this).parent().remove();">X</div></li>';
            $('#picList2').append(html);
            $("html, body").animate({ scrollTop: $("#picList1").offset().top }, 500);
        }, true, 2, true);
        bindUploadImage('#uploadbtn3', function (path) {
            path = "<%=BusiConstant.context %>" + path;
            var html = '<li class="tpsc"><img name="preview3" src="' + path + '" class="baob" style="width:85px;height:85px"><div class="caca" onclick="$(this).parent().remove();">X</div></li>';
            $('#picList3').append(html);
            $("html, body").animate({ scrollTop: $("#picList1").offset().top }, 500);
        }, true, 2, true);

        var clipboard1 = new Clipboard('#copy-button1');
        clipboard1.on('success', function (e) { myAlert("复制成功"); });
        clipboard1.on('error', function (e) { myAlert("复制失败，请长按文字复制"); });
    });
    function checkData() {
        if ($("#picList1 li").length < 1) {
            myAlert("请上传评价截图");
            return false;
        }
        if ($("#picList2").length > 0 && $("#picList2 li").length < 1) {
            myAlert("请上传追加试用品评价");
            return false;
        }
        if ($("#picList3").length > 0 && $("#picList3 li").length < 1) {
            myAlert("请上传追评评价截图");
            return false;
        }
        return true;
    }
    function submitForm() {
        //整体展示
        var imgStr = "", descStr = "";
        var imgs = $("img[name='preview']");
        var descs = $("textarea[name='preview']");
        for (var i = 0; i < imgs.length; i++) {
            imgStr += $(imgs[i]).attr("src") + ",";
        }
        for (var j = 0; j < descs.length; j++) {
            descStr += $(descs[j]).val() + ",";
        }
        $('#imgs').val(imgStr);
        $('#descs').val(descStr);
        //评价截图
        var imgStr1 = "", descStr1 = "";
        var imgs1 = $("img[name='preview1']");
        var descs1 = $("textarea[name='preview1']");
        for (var i = 0; i < imgs1.length; i++) {
            imgStr1 += $(imgs1[i]).attr("src") + ",";
        }
        for (var j = 0; j < imgs1.length; j++) {
            descStr1 += ",";
        }
        $('#imgs1').val(imgStr1.replace(/,$/, ""));
        $('#descs1').val(descStr1);

        //追加截图
        var imgStr2 = "", descStr2 = "";
        var imgs2 = $("img[name='preview2']");
        var descs2 = $("textarea[name='preview2']");
        for (var i = 0; i < imgs2.length; i++) {
            imgStr2 += $(imgs2[i]).attr("src") + ",";
        }
        for (var j = 0; j < descs2.length; j++) {
            descStr2 += $(descs2[j]).val() + ",";
        }
        $('#imgs2').val(imgStr2.replace(/,$/, ""));
        $('#descs2').val(descStr2);
        //返款后的追评截图
        var imgStr3 = "";
        var imgs3 = $("img[name='preview3']");
        for (var i = 0; i < imgs3.length; i++) {
            imgStr3 += $(imgs3[i]).attr("src") + ",";
        }
        $('#imgs3').val(imgStr3.replace(/,$/, ""));

        var descStr3 = "";
        var descs3 = $("textarea[name='preview3']");
        for (var i = 0; i < descs3.length; i++) {
            descStr3 += $(descs3[i]).val() + ",";
        }
        $('#descs3').val(descStr3.replace(/,$/, ""));
        if (checkData()) {
           // $('#form').submit()
            add();
        }
    }

    function dictsucdo(data){
        myAlert("提交成功，等待返款", function () {
            window.location.href="<%=BusiConstant.shike_wdhd.getKey()%>?status=51";
        });
    }

    function add(){
        var ds = [{content:$("#comment").val(),busitype:"hpy",typeid:2},{content:logo2,busitype:"hp",typeid:3}];
        var data = {id:<%=baobei.getId()%>,status:81,datas:JSON.stringify(ds)};
        var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
        postdo(url, data, dictsucdo,null, null);
    }

    function openWriteOrder() {
        openDialog('#writeOrder');
        $("#formorder").Validform();
        $("#formorder").form({
            success: function (data) {
                if (!data.Result) {
                    myAlert(data.Message);
                } else {
                    location = location;
                    // layer.closeAll();
                }
            }
        });
    }
</script>
<header class="header acct-top"><i class="arrows" onclick="location.href = &#39;/JpinShopissue/List&#39; "></i>我的免费试用</header>
<div style="height: 2rem;"></div>
<div class="freeapp">
    <div class="printapp">
        <img class="img" src="${baobei.zturl}">
    </div>
    <div class="titleadd">
        <div class="title_oneap">
            ${baobei.title}
        </div>
            <div class="zt-btn">
                <a class="statusbtn  a-btn">待提交报告</a>
            </div>
        <div class="title_towap">
            <p>
                下单: ${baobei.salePrice}元
            </p>
            <p>
                返还: ${baobei.salePrice}元
            </p>
        </div>

    </div>
</div>

<form id="form" action="http://m.meilipa.com/JpinShopissue/WriteReportSubmit?addrate=false" method="POST">
    <div class="baog baogtitle">
        <div class="kk">
        </div>
        &nbsp;报告标题
    </div>
    <div class="text">
        <textarea class="wby" name="sk_title" datatype="*1-200">${baobei.title}  </textarea>
    <span class="Validform_checktip"></span></div>
    <div class="baog">
        <div class="kk">
        </div>
        &nbsp;试用品评价
    </div>
    <div class="text">
        <textarea class="wby wbyd" id="comment" name="sk_comment" datatype="*1-4000"></textarea>
        <input type="hidden" id="sk_comment" name="sk_comment">
    <span class="Validform_checktip"></span></div>

    <div class="baog">
        <div class="kk">
        </div>
        &nbsp;上传所拍宝贝的评价截图<span class="ddzt">
        
        
             <%-- <em style="color: red">(
                自由发挥
            )</em>--%>
        
      </span>
    </div>
    <style>
        .jpcopy .jpcopy-btn{text-align: center; display: block;margin:0.4rem auto;width: 6rem;font-size: 0.65rem;background-color: #ff464e;color: #fff;height:1.6rem;line-height:1.6rem;border-radius: 5px;}
        div.warn{ font-size: 0.55rem; color: #636363;font-size: 0.5rem;overflow:hidden;border: 1px solid #fef0f1;background-color:#fef0f1;line-height: 1.3rem;height: 1.3rem;text-align: center; margin:0 0.3rem;}

        div.warn i{ display: inline; color: #ff464e; font-size: 0.6rem; line-height: 1.3rem; margin-right: 0.3rem;}
    </style>
 
        <div class="text">
            <div class="wby wjsc">
                <div class="kwdlt" id="uploadbtn1">
                    选择文件
                </div>
            </div>
        </div>

    <ul id="picList1" class="text">
    </ul>

        <%--<div class="baog">
        <div class="kk">
        </div>
        &nbsp;上传试用品宝贝照片<span class="ddzt">（上传图片后有机会被评选为精华报告哦，每被评为一次精华报告送100金币！）</span>
    </div>
        <div class="text">
            <div class="wby wjsc">
                <div class="kwdlt" id="uploadbtn">
                    选择文件
                </div>
            </div>
        </div>--%>
    <ul id="picList" class="text" style="margin-bottom: 100px">
    </ul>

    <div class="baseaa">
        <div class="xd">

                <div class="owndd zt-red-btn" onclick="submitForm() ">
                    提交试用报告
                </div>
                <br>
                <div class="oo countdown" endtime="2018/9/29 20:39:50">08天06时49分后将自动取消资格</div>
        </div>
    </div>
    <input type="hidden" name="sk_id" value="0">
    <input type="hidden" name="sk_order_id" value="21353190">
    <input type="hidden" id="imgs" name="imgs">
    <input type="hidden" id="descs" name="descs">
    <input type="hidden" id="imgs1" name="imgs1">
    <input type="hidden" id="descs1" name="descs1">
    <input type="hidden" id="imgs2" name="imgs2">
    <input type="hidden" id="descs2" name="descs2">
    <input type="hidden" id="imgs3" name="imgs3">
    <input type="hidden" id="descs3" name="descs3">
</form>

<script type="text/html" id="writeOrder">
    <form id="formorder" action="/MyTryout/WriteOrderSubmit" method="POST">
         <div class="improve">
            订单号操作<span class="close-layer iconfont icon-error1" onclick="layer.closeAll()"></span>
        </div>
        <div class="drh">
            禁止填写虚假订单号，活动返款后禁止在淘宝退款，违者将罚没账户资金并封号
        </div>
        <input type="hidden" name="sk_id" value="21353190" />
        <div class="magr">
            <div class="drh" style="margin-top: 0px; color: #f35b51; ">
                到淘宝后台复制订单编号（如遇特殊订单号无法填写，订单号前面补充0，或删除前面内容，保留15位数字即可）
            </div>
            <input type="text" style="text-indent: 1em;"  value="221549102153835648" name="sk_tb_ordercode" class="wby wbyd ssb" datatype="order" placeholder="请填写9/10/11/13/15/16/28位数字"></input>
        </div>
        <div class="confirm-btn btn" onclick="$('#formorder').submit();">
            提交
        </div>
    </form>
</script><%--
<script type="text/html" id="message">
    为了给广大用户带来更好的试用体验，美丽啪手机端系统正在升级，暂无法提交试用报告，请在电脑或手机上登录美丽啪www.meilipa.com进行操作，预计在4月10号晚上6点完成升级，对您造成的麻烦我们深感抱歉
    <div class="own" onclick="layer.closeAll() ">
        确定
    </div>
</script>--%>
        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/jquery.form.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/Validform_v5.3.2.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/post.loading.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/layer.m.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/layerdialog.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/jquery.cookie.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/browser.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/liucheng/haop/app.js"></script>


<form action="http://m.meilipa.com/CommonBase/UploadPic?compressType=2" method="post"><input type="file" accept="image/*;" name="file" style="display:none" multiple="multiple"></form><form action="http://m.meilipa.com/CommonBase/UploadPic?compressType=2" method="post"><input type="file" accept="image/*;" name="file" style="display:none" multiple="multiple"></form><form action="http://m.meilipa.com/CommonBase/UploadPic?compressType=2" method="post"><input type="file" accept="image/*;" name="file" style="display:none" multiple="multiple"></form><form action="http://m.meilipa.com/CommonBase/UploadPic?compressType=2" method="post"><input type="file" accept="image/*;" name="file" style="display:none" multiple="multiple"></form></body></html>