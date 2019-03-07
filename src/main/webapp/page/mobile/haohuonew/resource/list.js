﻿var scrolH = 0;
var current_id = 1;
$(function () {
    //主页swiper
    var mySwiper = new Swiper('#swiper', {
        autoplay: 5000,
        pagination: '.swiper-pagination',
    });


    //全局swiper  用于判断是否进入了商品详情页
    var indexSW = 0;

    
    $(".info-cat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
    });

   

    function dictsucdo(data){
        var rows = data.resultData.rows;
        for(var i=0;i<rows.length;i++){
            var row = rows[i];
            // var html = " <li class=\"n-tabItem\" data-id=\"type"+row.code+"\">"
            //     +"<a href=\"#\" id=\"type"+row.code+"\" >"+row.simpleName+"</a>"
            //     +"</li>";
            var html = "<li><a id='type"+ row.code +"' data-href=\""+ row.code +"\" class=\"\">"+ row.simpleName +"</a></li>";
            $(".jp-cat ul").append(html);
        }
        initCatBinding();

        huishiType();
    }
    function dictlist(){
        var data = {typeid:1};
        var url = "/shike/sys/dictlist.do";
        postdo(url, data, dictsucdo,null, null);
    }
    dictlist();

    //初始化数据
    var lingaSort = {};
    lingaSort.page = globle.getUrlParam("page") || 1;
    lingaSort.order = globle.getUrlParam("order")|| order || 0;
    lingaSort.title = globle.getUrlParam("title") || "";
    lingaSort.typeid = globle.getUrlParam("typeid") || "";
    lingaSort.shopcat = globle.getUrlParam("shopcat") || -1;
    lingaSort.sort = globle.getUrlParam("sort") || 1;
    lingaSort.orderType = globle.getUrlParam("orderType") || 0;
    lingaSort.hdtypeid  = globle.getUrlParam("hdtypeid") || "";
    lingaSort.bigStartTime = globle.getUrlParam("bigStartTime") || "";
    lingaSort.minprice = globle.getUrlParam("minprice") || "";
    lingaSort.maxprice = globle.getUrlParam("maxprice") || "";
    lingaSort.jiangli = globle.getUrlParam("jiangli") || "";
    lingaSort.paytype = "";
    lingaSort.noApply = 0;
    lingaSort.isSendGold = 0;

    if (lingaSort.order == '1') {
        // $(".jp-con .con-cat li").removeClass("act");
        // $("#order" + lingaSort.order).addClass("act");
        // // $(that).parent().addClass("act");



        $(".jp-con .con-cat").click();
        // document.getElementById("order").click();
    }

    getList();

    // 搜索关键词回显
    if (lingaSort.title) {
        $("#search-input").val(lingaSort.title);
    }

    // 回显typeid
    function huishiType() {
        if(lingaSort.typeid != '') {
            $(".jp-cat li a").removeClass("act");
            $("#type" + lingaSort.typeid).addClass("act");
            lingaSort.sort = 1;
        }
    }

    //搜索词搜索
    $(".jp-hd .icon-search").on("click", function () {
        var title = $(".jp-hd input").val();
        lingaSort.title = title;
        lingaSort.sort = 1;
        $(".search-input").blur();
        getList(1);
    });
    $(".search-input").on("keyup", function (e) {
        e = e || window.event;
        var code = e.charCode || e.keyCode;
        if (code == 13) {
            $(".jp-hd .icon-search").click();
        }
    });
    //平台类型
    $(".plat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
        var numtype = $(this).data("num");
        if(numtype == 5){
        	lingaSort.jiangli  = 1;
        }else{
        	lingaSort.hdtypeid  = $(this).data("num");
        	lingaSort.jiangli = 0;
        }       
        lingaSort.sort = 1;
        getList(1);
    });


    //筛选start
    $(".jp-shaixuan-box").on("click", function () {
        $(".jp-shaixuan-box").hide();
;    });
    $(".jp-shaixuan").on("click", function (e) {
        e.stopPropagation();
    });
    $(".main-btn span").on("click", function () {
        $(this).toggleClass("act");
    });
    //筛选重置
    $(".jp-shaixuan-box .reset").on("click", function (e) {
        $(".main-btn span").removeClass("act");
        $(".shaixuan-min").val("");
        $(".shaixuan-max").val("");
        //然后带上参数获取列表数据;
        lingaSort.minprice = "";   //这个是假的
        lingaSort.maxprice = "";   //这个是假的
        lingaSort.paytype = ""; //这个是假的
        lingaSort.noApply ="";
        lingaSort.isSendGold ="";
        if (lingaSort.minprice || lingaSort.maxprice || lingaSort.paytype) {
            $(".jp-con .con-cat li.shaixuan-last").addClass("act");
        } else {
            $(".jp-con .con-cat li.shaixuan-last").removeClass("act");
        }
        getList(1);


        $(".jp-shaixuan-box").hide();
        e.stopPropagation();
    });
    //筛选完成
    $(".jp-shaixuan-box .completed").on("click", function (e) {
        
        var min = parseInt($(".shaixuan-min").val());   //这个是假的
        var max = parseInt($(".shaixuan-max").val());   //这个是假的
        if (min < 0 || max < 0) {
            myAlert("筛选值不能小于0");
            return false;
        }
        if (min && max && (min >= max)) {
            myAlert("筛选最小值不能大于等于筛选最大值", function () {
                
            });
            e.stopPropagation();
            return;
        }

        lingaSort.minprice = !!min ? min : '';
        lingaSort.maxprice = !!max ? max : '';

        var actArr = $(".money-cat span.act"),
            length = actArr.length,
            i = 0;
        lingaSort.paytype = ""; //这个是假的
        for (i; i < length; i++) {
            (function (i) {
                lingaSort.paytype += $(actArr[i]).data("num") + ",";
            })(i)
        }
        if (lingaSort.paytype.length > 0) {
            lingaSort.paytype = lingaSort.paytype.substring(0, lingaSort.paytype.length - 1)
        }

        if ($(".noApply").hasClass("act")) {
            lingaSort.noApply = 1;
        } else {
            lingaSort.noApply = "";
        }

        if ($(".isSendGold").hasClass("act")) {
            lingaSort.isSendGold = 1;
        } else {
            lingaSort.isSendGold = "";
        }

        if (lingaSort.minprice || lingaSort.maxprice || lingaSort.paytype || lingaSort.isSendGold || lingaSort.noApply) {
            console.log(lingaSort.minprice);
            console.log(lingaSort.maxprice);
            console.log(lingaSort.paytype);
            console.log(lingaSort.isSendGold);
            console.log(lingaSort.noApply);
            $(".jp-con .con-cat li.shaixuan-last").addClass("act");
        } else {
            $(".jp-con .con-cat li.shaixuan-last").removeClass("act");
        }

        getList(1);


        $(".jp-shaixuan-box").hide();
        e.stopPropagation();
    });
    //筛选end

    //order搜索
    $(".jp-con .con-cat").on("click", orderSeach);
    function orderSeach(e) {
        var dom = null;
        if (e.target.tagName.toUpperCase() == 'A') {
            dom = e.target;
        } else if (e.target.parentNode.tagName.toUpperCase() == 'A') {
            dom = e.target.parentNode;
        } else if (e.target.children[0].tagName.toUpperCase() == 'A') {
            dom = e.target.children[0];
        } else {
            return;
        }
        if (dom.getAttribute("data-shaixuan")) {
            $(".jp-shaixuan-box").show();
        } else {
            var that = ".jp-con .con-cat " + dom.tagName + "[data-href='" + dom.getAttribute("data-href") + "']";
            lingaSort.sort = 1;

            //去掉箭头 start
            var iconSort = $(".icon-sortA");
            var i = 0, length = iconSort.length;
            for (i; i < length; i++) {
                var value = iconSort[i];
                if ($(that).children()[0] == value) {
                    continue;
                } else {
                    $(iconSort).removeClass("icon-sortA").addClass("icon-sortD");
                }
            }
            //去掉箭头 end
            if ($(that).parent().hasClass("act") && $(that).find("i").hasClass("icon-sortD")) {
                $(that).find("i").addClass("icon-sortA").removeClass("icon-sortD");
                lingaSort.sort = 0;
            } else {
                if ($(that).parent().hasClass("act") && $(that).html() == '综合') {  //如果是act状态的且是综合的 不让点
                    return;
                }
                $(that).find("i").addClass("icon-sortD").removeClass("icon-sortA");
            }
            $(".jp-con .con-cat li:not(.shaixuan-last)").removeClass("act");
            $(that).parent().addClass("act");
            lingaSort.order = $(that).data("href");
            getList(1);
        }
    }
    //type搜索
    function initCatBinding() {
        $(".jp-cat li a").on("click", function () {
            $(".jp-cat li a").removeClass("act");
            $(this).addClass("act");
            lingaSort.typeid = $(this).data("href");
            lingaSort.sort = 1;
            getList(1);
        });
    }
    var vm = new Vue({
        // 选项
        el: '#list',
        data: {
            showZt: window.showZt,
            list: []
        }
    });

    var listFlag = false;
    var pageFlag = false;
    var $window = $(window);
    var $document = $(document);
    //下滑加载
    $window.scroll(function () {
        if (indexSW == 1) {
            return false;
        }
        if ($document.scrollTop() + $window.height() >= $document.height()) {
          
            //getList();
        }
    });

    // 好货列表
    function getList(clearFlag) {
        // if (listFlag) {
        //     return false;
        // }
      
        if (clearFlag) {
            window.scrollTo(0, 0);
            lingaSort.page = 1;
            // vm.$data.list = [];
            pageFlag = false;
            $("#list").html("")
        }
        if (pageFlag) {
            layer.open({
                content: '没有更多商品了'
                    , skin: 'msg'
                    , time: 2
            });
            return false;
        }

        listFlag = true;
        if (lingaSort.page <= 1) {
            //$("#loading").show()
        } else {
            layer.open({
                content: '加载中'
                 , skin: 'msg'
                 , time: 2
            });
        }

        $.ajax({
            type: 'post',
            url: '/shike/baobei/sklist.do',
            data: lingaSort,
            dataType: 'json',
            success: function (data) {
                if (data.type != 'success') {
                    $(".no-search").show()
                }
                $("#loading").hide()

                // 数据为空
                if (data.resultData.rows.length == 0) {
                    $(".no-search").show()
                } else {
                    $(".no-search").hide()
                }

                for (var i = 0; i < data.resultData.rows.length; i++) {
                    var row = data.resultData.rows[i];
                    // 高价值
                    var highPrice = "";
                    if (row.hdtypeid == 3) {
                        highPrice = "<div><span class=\"red\">高价值</span></div>"
                    }
                    var detailurl = getbaseurl('/skm/detail?id='+row.id);

                    var html = "<li><a href='"+detailurl+"' class=\"tod\"><img\n" +
                        "                    src=\""+ row.zturl +"!200\"\n" +
                        "                    data-original=\""+ row.zturl +"!200\"\n" +
                        "                    class=\"lazy\" style=\"display: inline;\">\n" +
                        highPrice +
                        "            </a>\n" +
                        "                <p><span class=\"iconfont icon-tb\"></span> "+ row.title +"</p>\n" +
                        "                <div class=\"jp-num\"><span>¥"+ row.salePrice +"</span> ";
                    if(row.jiangli > 0){
                    	html+="（奖¥"+row.jiangli+"元）";
                    }
                    html += "<span>"+ row.ysqnum +"人申请</span></div>\n" +
                        "                <div class=\"jp-btn\"><a href='"+detailurl+"' class=\"btn tod\">免费申请</a></div>\n" +
                        "            </li>";

                    $("#list").append(html);
                }


                
                vm.$nextTick(function () {
                    $("img.lazy").lazyload({ effect: "fadeIn" });
                    $(".tod").off("click");
                    $(".tod").on("click", function () {
                        indexSW = 1;
                        scrolH = $document.scrollTop();
                        $(".jp-fixed-top,footer").fadeOut();
                        $(".info-foot").fadeIn();

                        $(".go-mj").show();
                        $(".go-mj").attr("href", "/jing/share?invitationCode=" + userid + "&shopid=" + $(this).data("id"));
                        $("#detail .get-more").data("id", $(this).data("id"));
                        getDetail($(this).data("id"));
                        $(".jp-con .con-cat").off("click");
                    });

                });

            },
            error: function () {
                listFlag = false;
            }
        });
    }

    //回退按钮
    $(".to-index").on("click", function () {
        toIndex();
    });
    $("img.lazy").lazyload({ effect: "fadeIn" });
    

    
    $(".app-share-img .icon-Toright").on("click", function () {
        $(".app-share-img").fadeOut(200);
    });
    $(".app-share-img .icon-share").on("click", function () {
        var url = $(".app-share-img img").attr("src");
        app.share1(url);
    });
    function addDate(date, days) {
        if (days == undefined || days == '') {
            days = 1;
        }
        var date = new Date(date);
        date.setDate(date.getDate() + days);
        var month = date.getMonth() + 1;
        var day = date.getDate();
        return date.getFullYear() + '-' + getFormatDate(month) + '-' + getFormatDate(day) + " " + date.getHours() + ":" + date.getMinutes()
            + ":" + date.getSeconds();
    }

    // 日期月份/天的显示，如果是1位数，则在前面加上'0'
    function getFormatDate(arg) {
        if (arg == undefined || arg == '') {
            return '';
        }

        var re = arg + '';
        if (re.length < 2) {
            re = '0' + re;
        }

        return re;
    }

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate + " " + date.getHours() + ":" + date.getMinutes()
            + ":" + date.getSeconds();
        return currentdate;
    }

    function DateMinus(sDate, eDate) {
        var sdate = new Date(sDate.replace(/-/g, "/"));
        var now = new Date(eDate.replace(/-/g, "/"));
        var days = now.getTime() - sdate.getTime();
        var day = Math.ceil(days / (1000 * 60 * 60));
        return day;
    }
    function compareTime(startTime, endTime) {
        var thisResult = (Date.parse(endTime) - Date.parse(startTime)) / 3600 / 1000;
        if (thisResult < 0) {
            return true;
        } else if (thisResult > 0) {
            return false;
        } else if (thisResult == 0) {
            return true;
        } else {
            return false;
        }
    }
    
    var mySwiper1 = "";
    var goodPrice = 0;
    

    function huodongDetailCallBack(data){

        // goodPrice = (data.Data && data.Data.sk_replace_price) ? data.Data.sk_replace_price : 0;   //给金币不足弹框使用
        $("#index").addClass("showHidden");                 //隐藏列表，高度清空
        $("#detail").removeClass("showHidden");             //显示商品详情

        var row = data.resultData.row;
        $("#baobeiId").val(row.id);

        // vmDetail.$data.activity_name = data.dpname;
        $("#activity_name").html(row.title); // 商品名称
        $("#shengyu").html("剩余 "+(row.bbnum - row.zjnum)+"/"+row.bbnum+" 份"); // 剩余
        $("#ysqnum").html(row.ysqnum + "人 已申请"); // 已经申请数量
        $("#yzj").html(row.zjnum + "人 已中奖"); // 已经中奖人数
        $("#salePrice").html("¥" + row.salePrice); // 宝贝单价
        if(row.jiangli > 0){
        	$("#jiangli").html("¥" + row.jiangli+"元"); // 奖励
        }   
        $("#logo_pic1").attr("src", "#"); // 图1
        $("#logo_pic2").attr("src", "#"); // 图2
        $("#logo_pic3").attr("src", "#"); // 图3
        $("#logo_pic4").attr("src", "#"); // 图4

        $("#logo_pic1").attr("src", row.tplist[0].url); // 图1
        $("#logo_pic2").attr("src", row.tplist[1].url); // 图2
        $("#logo_pic3").attr("src", row.tplist[2].url); // 图3
        $("#logo_pic4").attr("src", row.tplist[3].url); // 图4

        if (row.huabei == '1') {
            $("#huabei").css("display", "block");
        } else {
            $("#huabei").css("display", "none");
        }
        if (row.xinyongka == '1') {
            $("#xinyongka").css("display", "block");
        } else {
            $("#xinyongka").css("display", "none");
        }


        if (!mySwiper1) {
            mySwiper1 = new Swiper('#swiper2', {
                autoplay: 5000,
                pagination: '.swiper-pagination',
            });
        } else {
            mySwiper1.slideTo(0, 0, false);
        }
    

        vmDetail.$nextTick(function () {
            $(".not-area").off("click");
            //点击弹出不发货
            $(".not-area").on("click", function () {
                $(".flex-bg").fadeIn(300);
                $("#flow2").css("display", "block");
                $("#flow2").removeClass("fadeout");
            });
        });
        $("#applyText").removeClass("w12");

        // $("#detail .intro").html(data.xiangqing.content.split("sktag")[0]);
        $("#detail .intro img").lazyload({ effect: "fadeIn" });

        if(row.xiangqing) {
            var rows = row.xiangqing.content.split("sktag");
            for (var i = 0; i < rows.length; i++) {
                var img = "<img src=\"" + rows[i] + "\">";
                $("#detail .intro").append(img)
            }
        }
        $("#detail .intro img").lazyload({ effect: "fadeIn" });



        window.scrollTo(0, 0);

        $("#loading").fadeOut();
    }

});

String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}



