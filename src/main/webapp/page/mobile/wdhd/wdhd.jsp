<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html lang="zh" style="font-size: 22.125px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>我的活动</title>
    <meta name="keywords" content="<%=BusiConstant.keywords %>">
    <meta name="description" content="<%=BusiConstant.description %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="full-screen" content="yes">
    <link href="/shike/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/base.css">
    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/iconfont.css">

    <link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/style.css">

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/Common.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
    <script type="text/javascript"
            src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>

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
    
<link href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/layer.css" type="text/css" rel="styleSheet" id="layermcss"></head>
<body>

<input id="status" type="text" value="${status}">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/index.css">

<link href="<%=BusiConstant.shikemobilepath %>/wdhd/resource/list.css" rel="stylesheet">
<script src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/jquery.infinitescroll.js"></script>
<script src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/jquery.countdown.js"></script>
<script>
    $(function () {
        $(".go-mj i").on("click", function (e) {
            e.stopPropagation();
            $(".go-mj").remove();
        });
        $("#shadow").on("click", function () {
            $(".my-list .gold-list").slideUp();
            $(this).fadeOut(200);
        });

        $(".my-list .gold-info").on("click", function () {
            $(this).parents("dd").children(".gold-list").slideDown();
            $("#shadow").fadeIn(200);
        });
        $(".regain-btn").on("click", function () {
            var id = $(this).data("id");
            var skId = $(this).data("sk_id");
            $.post("/JpinShopIssue/Recover", { orderid: id }, function (re) {
                if (re.code) {
                    layer.open({
                        content: "该活动已恢复中奖资格，并移至“中奖了”，请在2小时内下单；逾期将取消资格！",
                        btn: ['立即下单', '再看看'],
                        shadeClose: false,
                        yes: function (index) {
                            location.href = "/JpinShopIssue/OrderFlow?activityId=" + skId;
                        },
                        no: function (index) {
                            location.replace("/JPinShopIssue/List?type=4");//已取消页面
                        }
                    });
                } else {
                    myAlert(re.msg, function () {
                        location.replace("/JPinShopIssue/List?type=4");//已取消页面
                    });
                }


            })
        });


        $(".time").countdown({ tmpl: '%{d}天%{h}时%{m}分后' }); //倒计时
        $(".time1").countdown({ tmpl: '%{d}天%{h}时%{m}分内' }); //倒计时
        $("span.read").on("click", function () {
            myAlert($(this).data("task"));
        });
        $("#list").infinitescroll({
            itemSelector: ".my-list"
        }, function () {
    $("span.read").off("click");
            $("#shadow").off('click');
            $(".my-list .gold-info").off('click');
            $(".time").countdown({ tmpl: '%{d}天%{h}时%{m}分后' }); //倒计时
            $(".time1").countdown({ tmpl: '%{d}天%{h}时%{m}分内' }); //倒计时
            $("span.read").on("click", function () {
                myAlert($(this).data("task"));
            });
            $("#shadow").on("click", function () {
                $(".my-list .gold-list").slideUp();
                $(this).fadeOut(200);
            });

            $(".my-list .gold-info").on("click", function () {
                $(this).parents("dd").children(".gold-list").slideDown();
                $("#shadow").fadeIn(200);
            });
        });
    });
    function GiveUpComment(id) {
        myConfirm('确认放弃追评资格？放弃后，你将不能获得追评金币奖励！', function () {
            $.post("/JpinShopIssue/GiveUpComment", { orderid: id }, function (re) {
                if (re.Result) {
                    window.location.href = '/JpinShopIssue/List?type=3';
                }
            })
        })
    }

    var flag = false;
    function regain(orderId, activityId) {
        if (flag) return;
        flag = true;
        $.post('/JpinShopIssue/Recover', { orderid: orderId }, function (data) {
            flag = false;

            if (data.code) {
                layer.open({
                    content: '该活动已恢复中奖资格，并移至“中奖了”，请在2小时内下单；逾期将取消资格！',
                    btn: ['立即下单', '再看看'],
                    shadeClose: false,
                    yes: function (index) {
                        location.href = "/JpinShopIssue/OrderFlow?activityId=" + activityId;
                        layer.close(index);
                    },
                    no: function (index) {
                        location.replace("/JPinShopIssue/List?type=5");
                        layer.close(index);
                    }
                });
            } else {
                myAlert(data.msg);
            }
        });
    }

    function GoAddRates(id) {
        window.location = "/JpinShopIssue/WriteReport?id=" + id + "&isaddrate=" + true;
    }
    window.onload = function () {
        var fontSize = "20";
        try {
            fontSize = document.documentElement.style.fontSize.splice(0, document.documentElement.style.fontSize.length - 2)
        } catch (err) {
            fontSize = "20";
        }
        if ('6' == "4") {
            document.getElementById("jd-hd-scroll").scrollLeft = parseInt(fontSize) * 15;
        }
        if ('6' == "3") {
            document.getElementById("jd-hd-scroll").scrollLeft = parseInt(fontSize) * 15;
        }
        if ('6' == "5") {
            document.getElementById("jd-hd-scroll").scrollLeft = parseInt(fontSize) * 15;
        }
    }

    function Feedback(sid) {
        // window.location.href = '/JpinShopIssue/OrderFeedback?shopissueid=' + sid;
        myAlert("维护中...")
    }

    function DeletedOrder(id) {
        myConfirm("确认是否删除?", function () {
            deleteSq(id)
        });
    }

    function deleteSq(id){
        var data = {id: id};
        var url = "<%=BusiConstant.shike_deletesq_do.getKey()%>";
        postdo(url, data, deleteSqCallBack,null, null);
    }

    function deleteSqCallBack(data) {
        if (data.type == 'success') {
            huodonglist($("#status").val() == undefined || $("#status").val() == '' ? "18" : $("#status").val());
        } else {
            myAlert(data.message);
        }
    }

    function GoldApplyByOrder(sid, oid, gold) {
       
            $.post('/JpinShopIssue/GoldApplyByOrder', { shopissueid: sid, orderid: oid }, function (data) {
                if (data.Result) {
                    myAlert('你已消费' + gold + '金币获得必中名额！若中途放弃，金币不予返还', function () {
                        window.location.href = '/JpinShopIssue/OrderFlow?activityId=' + sid;
                    });
                }
                else {
                    if (data.Message != '金币不足') {
                        
                            myAlert(data.Message);
                     
                    }
                    else {
                        layer.open({
                            content: '您的账号不足' + gold + '金币，充值后可直接兑换该商品',
                            btn: ['立即充值兑换', '残忍拒绝'],
                            shadeClose: false,
                            yes: function (index) {
                                layer.close(index);
                                window.location.href = '/UserAccount/GoldRecharge';
                            },
                            no: function (index) {
                                layer.close(index);
                            }
                        });
                    }
                }
            }, 'json');
       
    }


    function huodongsucdo(data){
        var rows = data.resultData.rows;
        $("#list").html("");

        for(var i=0;i<rows.length;i++){
            var row = rows[i];

            if (!row.baobei) {
                continue;
            }

            var btn = "";
            if(row.status>0 && row.status<21){
                btn = "        <div class=\"jp-btn clearfix\">\n" +
                    "            <a href=\"<%=BusiConstant.shike_gouwuche.getKey() %>?id="+ row.bbid +"\" class=\"\">继续申请</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"DeletedOrder("+ row.id +")\">删除</a>\n" +
                    "        </div>";
            }else if(row.status == 21){
                btn = "        <div class=\"jp-btn clearfix\">\n" +
                "           每日10点、15点、20点抽奖 <a href=\"javascript:void(1);\" class=\"black\" >等待抽奖</a>\n" +
                "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                "        </div>";
        	}else if(row.status == 51){
                btn = "        <div class=\"jp-btn clearfix\">\n" +
                    "            <a href=\"<%=BusiConstant.shike_gouwuche.getKey() %>?id="+ row.bbid +"\" class=\"\">提交订单</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                    "        </div>";
            }else if(row.status == 61){
                //
                // var time1 = row.updatedTime;
                // var time2 = Date.parse(new Date())
                // alert(parseInt(time2 - time1) / 1000 / 60 / 60);//两个时间相差的小时数

                btn = "        <div class=\"jp-btn clearfix\">\n" +
                    "           <span class=\"time\">01天20时30分后</span>将自动返还用户担保金 " +
                    "            <a href=\"javascript:void(1);\" class=\"black\">等待收货</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                    "        </div>";
            }else if(row.status == 71){
                btn = "        <div class=\"jp-btn clearfix\">\n" +
                    "            <a href=\"<%=BusiConstant.shike_haop.getKey() %>?id="+ row.bbid +"\" class=\"\">提交好评</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                    "        </div>";
            }else if(row.status == 81){
                btn = "        <div class=\"jp-btn clearfix\">\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback()\">等待返款</a>\n" +
                    "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback("+ row.bbid +")\">反馈问题</a>\n" +
                    "        </div>";
            }

            var html = "<dd class=\"my-list\">\n" +
                "        <p class=\"title\">"+row.baobei.updatedTimeStr+"</p>\n" +
                "        <a href=\"\">\n" +
                "            <img src=\""+row.baobei.zturl+"\">\n" +
                "            <div style=\"position:absolute;left:0;bottom:0;\">\n" +
                "            </div>\n" +
                "        </a>\n" +
                "        <ul class=\"item-con\">\n" +
                "            <li><span class=\"iconfont icon-tb\" style=\"margin-right:0;\"></span> "+row.baobei.title+"</li>\n" +
                "            <li>\n" +
                "                价值：<span>"+row.baobei.salePrice+"</span>\n" +
                "            </li>\n" +
                "            <li><em>下单账号："+row.noTaobao+"</em></li>\n" +
                "            <li><em>规格："+row.baobei.guige+"</em></li>\n" +
                "        </ul>\n" +
                // "        <div class=\"jp-btn clearfix\">\n" +
                // "            <a href=\"http://localhost:8081/shike/skm/gouwuche?id=701\" class=\"\">继续申请</a>\n" +
                // "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"Feedback(92821)\">反馈问题</a>\n" +
                // "            <a href=\"javascript:void(1);\" class=\"black\" onclick=\"DeletedOrder(22093979)\">删除</a>\n" +
                // "        </div>\n" +
                btn +
                "    </dd>";

            // var metname = "dothing("+row.baobei.id+","+row.status+")";
            // if(row.status<21){
            //     var btname = "继续申请";
            //     html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
            // }else if(row.status == 51){
            //     var btname = "提交订单";
            //     html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
            // }else if(row.status == 61){
            //     var btname = "等待收货";
            //     html+="<div class='aui-artificial5' >"+btname+"</div>";
            // }else if(row.status == 71){
            //     var btname = "提交好评";
            //     html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
            // } else if(row.status == 81){
            //     var btname = "等待返款";
            //     html+="<div class='aui-artificial5' >"+btname+"</div>";
            // }
            $("#list").append(html);
        }
    }

    function dothing(id,status){
        if(status == 51){
            window.location.href="<%=BusiConstant.shike_ddan.getKey()%>?id="+id;
        }else if(status == 71){
            window.location.href="<%=BusiConstant.shike_haop.getKey()%>?id="+id;
        }else if(status == 1){
            window.location.href="<%=BusiConstant.shike_gouwuche.getKey()%>?id="+id;
        }else if(status == 18){
            window.location.href="<%=BusiConstant.shike_scgz.getKey()%>?id="+id;
        }
    }

    function huodonglist(status){
        var data = {status:status};
        var url = "<%=BusiConstant.shike_wdhd_do.getKey()%>";
        postdo(url, data, huodongsucdo,null, null);
    }

    huodonglist($("#status").val() == undefined || $("#status").val() == '' ? "18" : $("#status").val());
</script>
<a class="go-mj" href="javascript:void(0)">
    <%--<i class="iconfont icon-error1"></i>--%>
    <%--<img onclick="location.href = &#39;/Invitation&#39;;" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/share-icon.png">--%>
</a>
<header class="header task-top frv" style="line-height: 2rem">
    <i class="arrows" onclick="history.back(-1)"></i>
    我的活动
</header>
<div style="height: 1rem"></div>
<div id="jd-hd-scroll" style="overflow-x:scroll; padding-bottom:1rem;-webkit-overflow-scrolling: touch;">
    <ul class="jp-hd" style="width:25.8rem;">

        <li class="<c:if test="${status == '18'}">act</c:if>"><a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=18">继续申请</a></li>
        <li class="<c:if test="${status == '21'}">act</c:if>"><a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=21">待开奖</a></li>
        <%--<li class=""><a href="http://aa/JPinShopIssue/List?type=1">继续抽奖<span>0</span></a></li>--%>
        <li class="<c:if test="${status == '51'}">act</c:if>"><a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=51">中奖了</a></li>
        <%--<li class=""><a href="http://aa/JPinShopIssue/List?type=5">可恢复<span>0</span></a></li>--%>
        <li class="<c:if test="${status == '99'}">act</c:if>"><a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=99">已返款</a></li>
        <li class="<c:if test="${status == '-2'}">act</c:if>"><a href="<%=BusiConstant.shike_wdhd.getKey() %>?status=-2">已取消</a></li>
        <%--<li class=""><a href="http://aa/JPinShopIssue/List?type=4">已取消</a>--%>
        </li>
    </ul>
</div>
<div class="report" style="margin-top:-1rem;position:relative;z-index:1;">
    <img src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/flow3.png" alt="Alternate Text">
</div>
<div id="shadow" style="position: fixed;top: 0;left: 0;display: none; background-color: rgba(0,0,0,0.3);z-index: 1100;height: 100%;width: 100%;">

</div>
<dl class="list" id="list">

    <%--<dd class="my-list">
        <p class="title">2018-09-16 20:05:27</p>
        <a href="http://aa/JpinShopIssue/OrderDetail?orderid=22093979">
            <img src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/TB1kY32KpXXXXbsXFXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg">
            <div style="position:absolute;left:0;bottom:0;">
            </div>
        </a>
        <ul class="item-con">
            <li><span class="iconfont icon-tb" style="margin-right:0;"></span> 一色玩具粘土太空泥</li>
            <li>
                价值：<span>¥5.30</span>
            </li>
            <li><em>下单账号：</em></li>
            <li><em>规格：拍5.3的颜色随机</em></li>
        </ul>
        <div class="jp-btn clearfix">
            <a href="http://aa/JpinShopIssue/OrderFlow?activityId=92821" class="">继续申请</a>
            <a href="javascript:void(1);" class="black" onclick="Feedback(92821)">反馈问题</a>
            <a href="javascript:void(1);" class="black" onclick="DeletedOrder(22093979)">删除</a>
        </div>
    </dd>--%>


    <div class="navigation">
        <a href="http://aa/JPinShopIssue/GetNextOrders?page=2&amp;type=6"></a>
    </div>
</dl>

        <div style="margin-bottom: 2rem;">
        </div>
        <jsp:include page="../common/footer.jsp" flush="true"/>

        <div style="display: none"><script src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/z_stat.php" language="JavaScript"></script><script src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/core.php" charset="utf-8" type="text/javascript"></script><a href="http://www.cnzz.com/stat/website.php?web_id=1264685315" target="_blank" title="站长统计">站长统计</a></div>
   
    <div id="loading" class="loading">
    <div class="loadingContent">
        <img src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/loading.gif">
    </div>
</div>
    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/jquery.form.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/Validform_v5.3.2.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/post.loading.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/layer.m.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/layerdialog.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/jquery.cookie.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/browser.js"></script>

    <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/wdhd/resource/app.js"></script>


</body></html>