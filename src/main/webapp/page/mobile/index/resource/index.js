var scrolH = 0;
var current_id = 1;
$(function () {

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

    function dictsucdo(data){
        var rows = data.resultData.rows;
        for(var i=0;i<rows.length;i++){
            var row = rows[i];
            // var html = " <li class=\"n-tabItem\" data-id=\"type"+row.code+"\">"
            //     +"<a href=\"#\" id=\"type"+row.code+"\" >"+row.simpleName+"</a>"
            //     +"</li>";
            var html = "<li><a href=\"/shike/skm/haohuo?typeid="+ row.code +"\" class=\"\">"+ row.simpleName +"</a></li>";
            $(".jp-cat ul").append(html);
        }
        initCatBinding();
    }
    function dictlist(){
        var data = {typeid:1};
        var url = "/shike/sys/dictlist.do";
        postdo(url, data, dictsucdo,null, null);
    }
    dictlist();

    /**
     * 今日上新列表
     */
    function jinrilist() {
        // var data = {order:1, bigStartTime: new Date().toLocaleDateString()};
        var data = {order:1, sort: 1};
        var url = "/shike/baobei/sklist.do";
        postdo(url, data, jinrilistCallback,null, null);
    }

    function jinrilistCallback(data) {
        $("#jrsxCount").html(data.resultData.total);

        var rows = data.resultData.rows.length > 10 ? 10 : data.resultData.rows.length;

        for (var i = 0; i < rows; i++) {
            var row = data.resultData.rows[i];
            var html = "<li>\n" +
                "                            \n" +
                "                            <a href=\"/shike/skm/haohuo?order=1\">" +
                "                                <img src=\""+ row.zturl +"\">\n" +
                "                                <span class=\"t-price\">¥"+ row.salePrice +"</span>\n" +
                "                                <span class=\"t-btn\">免费申请</span>\n" +
                "                            </a>\n" +
                "                        </li>";

            $("#jinrilist").append(html);
        }
    }
    
    jinrilist();



    /**
     * 展示列表
     */
    function zhanshilist() {
        // var data = {order:1, typeid: 1};
        var data = {order:1};
        var url = "/shike/baobei/sklist.do";
        postdo(url, data, zhanshilistCallback,null, null);
    }

    function zhanshilistCallback(data) {

        for (var i = 0; i < data.resultData.rows.length; i++) {
            var row = data.resultData.rows[i];

            var html = "<li>\n" +
                "                                \n" +
                "                                <a href=\"/shike/skm/haohuo?typeid="+ row.typeid +"\" style=\"color:#333;\">\n" +
                "                                    <img src=\""+ row.zturl +"\">\n" +
                "                                    <p>"+ row.title +"</p>\n" +
                "                                    <div class=\"scale\">\n" +
                "                                        <span class=\"lf t-price\">¥"+ row.salePrice +"</span>\n" +
                "                                        <span class=\"rt\">限"+ row.bbnum +"份</span>\n" +
                "                                    </div>\n" +
                "                                </a>\n" +
                "                            </li>";

            // 女装
            if (row.typeid == '1') {
                $("#nvzhuanglist").append(html);
            }
            // 男装
            else if (row.typeid == '2') {
                $("#nanzhuanglist").append(html);
            }
            // 鞋子箱包
            else if (row.typeid == '4') {
                $("#xiangbaolist").append(html);
            }
            // 日用百货
            else if (row.typeid == '5') {
                $("#baihuolist").append(html);
            }
            // 数码家电
            else if (row.typeid == '7') {
                $("#dianqilist").append(html);
            }
            // 家居建材
            else if (row.typeid == '10') {
                $("#jiajulist").append(html);
            }
            // 母婴用品
            else if (row.typeid == '6') {
                $("#muyinglist").append(html);
            }
            // 美妆用品
            else if (row.typeid == '8') {
                $("#meizhuanglist").append(html);
            }
        }
    }

    // 展示列表
    zhanshilist();


    //主页swiper
    var mySwiper = new Swiper('#swiper', {
        autoplay: 5000,
        pagination: '.swiper-pagination',
    });
   
    //全局swiper  用于判断是否进入了商品详情页
    var indexSW = 0;

    //金币兑换按钮
    function GoldAplly(id) {
        $.ajax({
            type: 'post',
            url: '/jing/CheckGoldQualification',
            data: { shopissueId: id },
            dataType: 'json',
            success: function (data) {
                if (data.Result) {
                    location.href = '/JpinShopIssue/OrderFlow?applyType=1&activityId=' + id;
                } else {
                    if (data.Message == "请先登陆！") {
                        location.href = '/UserAccount/Login';
                        return;
                    }
                    if (data.Data == 1) {
                        myConfirmDefinedText(data.Message, "兑换其他商品", "我要免费申请", function () {
                            location.href = "/jing/goldHit";
                        }, function () {
                            location.href = "/JpinShopIssue/OrderFlow?activityId=" + id;
                        });
                    }
                    if (data.Data == 2) {
                        myConfirmDefinedText(data.Message, "去看看其他活动", "我要免费申请", function () {
                            location.href = "/jing/goldHit";
                        }, function () {
                            location.href = "/JpinShopIssue/OrderFlow?activityId=" + id;
                        });
                    }
                    if (data.Data == 3) {
                        myConfirmDefinedText(data.Message, "我要免费申请", "成为VIP", function () {
                            location.href = "/JpinShopIssue/OrderFlow?activityId=' + id";
                        }, function () {
                            location.href = "/UserAccount/Vip";
                        });
                    }
                    if (data.Data == 6 && data.Message == '金币不足！') {
                        myConfirmDefinedText("您的账号不足" + goodPrice + "金币，充值后可直接兑换该商品！", "立即充值兑换", "残忍拒绝", function () {
                            //location.href = "/JpinShopIssue/OrderFlow?activityId=' + id";
                            location.href = "/UserAccount/GoldRecharge";
                        }, function () {
                          
                        });
                        document.getElementsByClassName("layui-m-layercont")[0].style.textAlign = "left";
                        //myAlert(data.Message, function () {
                        //    location.href = "/UserAccount/GoldRecharge";
                        //});
                        return;
                    }
                    if (data.Data == 6 || data.Data == 4) {
                        myAlert(data.Message, function () {
                            location.href = "/jing/goldHit";
                        });
                    }

                }

            }
        });
    }
    
    //播报
    setInterval('autoScroll();', 3000);
    

    $(".info-cat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
    });

    //$(".flow-con span.btn").on("click", function () {
    //    $(".flow-con").slideUp();
    //});

    //$(".show-flow").on("click", function () {
    //    $(".flow-con").fadeIn();
    //});

    //签到
    //$(".jp-hd>span").on("click", function () {

    //});
    //初始化数据
    var lingaSort = {};
    lingaSort.page = getQueryString("page") || 1;
    lingaSort.order = getQueryString("order") || sortY || 0;
    lingaSort.key = getQueryString("key") || "";
    lingaSort.type = getQueryString("type") || -1;
    // getList(lingaSort.page, lingaSort.order, lingaSort.key, lingaSort.type);

    //搜索词
    $(".jp-hd .icon-search").on("click", function () {
        var val = $(".jp-hd input").val();
        $(".search-input").blur();
        location.href = "/shike/skm/haohuo?title=" + val;
    });
    $(".search-input").on("keyup", function (e) {
        e = e || window.event;
        var code = e.charCode || e.keyCode;
        if (code == 13) {
            $(".jp-hd .icon-search").click();
        }
    });
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
        // if (indexSW == 1) {
        //     return false;
        // }
        // if ($document.scrollTop() + $window.height() >= $document.height()) {
        //     getList(lingaSort.page, lingaSort.order, lingaSort.key, lingaSort.type);
        // }
    });
    function getList(page, order, key, type, sort, clearFlag) {
        if (listFlag) {
            return false;
        }

        if (clearFlag) {
            window.scrollTo(0, 0);
            lingaSort.page = 1;
            vm.$data.list = [];
            pageFlag = false;
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

        lingaSort.page = page || 1;
        lingaSort.order = order || 0;
        lingaSort.key = key || "";
        lingaSort.type = type || -1;
        clearFlag = clearFlag || 0;

    }

    getList2(1)


    // 好货列表
    function getList2(clearFlag) {
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

                    var html = "<li><a data-id=\"" + row.id + "\" class=\"tod\"><img\n" +
                        "                    src=\"" + row.zturl + "\"\n" +
                        "                    data-original=\"" + row.zturl + "\"\n" +
                        "                    class=\"lazy\" style=\"display: inline;\">\n" +
                        highPrice +
                        "            </a>\n" +
                        "                <p><span class=\"iconfont icon-tb\"></span> " + row.title + "</p>\n" +
                        "                <div class=\"jp-num\"><span>¥" + row.salePrice + "</span> <span>" + row.ysqnum + "人申请</span></div>\n" +
                        "                <div class=\"jp-btn\"><a data-id=\"" + row.id + "\" class=\"btn tod\">免费申请</a></div>\n" +
                        "            </li>";

                    $("#list").append(html);
                }

                vm.$nextTick(function () {
                    $("img.lazy").lazyload({effect: "fadeIn"});
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

        // $.ajax({
        //     type: 'post',
        //     url: '/aa/aa',
        //     data: { page: lingaSort.page, order: lingaSort.order, key: lingaSort.key, type: lingaSort.type, sort: sort,isHomePage:1},
        //     dataType: 'json',
        //     success: function (data) {
        //         //$("#loading").hide()
        //         listFlag = false;
        //         if (data.PageIndex == Math.ceil(data.Count / data.PageSize)) {
        //             pageFlag = true;
        //         }
        //         //if (data.Data.length == 0) {
        //         //    layer.open({
        //         //        content: '没有更多商品了'
        //         //          , skin: 'msg'
        //         //          , time: 2
        //         //    });
        //         //    return false;
        //         //}
        //         for (var i = 0; i < data.Data.length; i++) {
        //             data.Data[i].id = data.Data[i].sk_id;
        //             data.Data[i].sk_activity_name =data.Data[i].sk_activity_name
        //             data.Data[i].sk_id = "/jing/Detail?id=" + data.Data[i].sk_id;
        //             data.Data[i].showG = parseInt(data.Data[i].sk_clinch_price) >= 100 ? true : false;
        //             data.Data[i].sk_back_price = data.Data[i].sk_back_price - data.Data[i].sk_clinch_price > 0 ? true : false;
        //             data.Data[i].sk_clinch_price = "¥" + (data.Data[i].sk_clinch_price - 0).toFixed(2);
        //             data.Data[i].share_id = "/jing/share?invitationCode=" + userid + "&shopid=" + data.Data[i].id;
        //             data.Data[i].sk_shop_type = ["iconfont icon-tb", "iconfont icon-tm", "iconfont icon-jd", "iconfont icon-tb"][data.Data[i].sk_shop_type];
        //             if (data.Data[i].sk_is_original) {
        //                 var index = 0;
        //                 if (data.Data[i].sk_img_index == 0) {
        //                     index = 1;
        //                 } else {
        //                     index = 0;
        //                 }
        //                 data.Data[i].sk_logo_pic = data.Data[i].sk_logo_pic.split("|")[index];
        //             }
        //             else {
        //                 data.Data[i].sk_logo_pic = data.Data[i].sk_logo_pic.split("|")[0];
        //             }
        //             data.Data[i].sk_apply_count = data.Data[i].sk_apply_count;
        //             data.Data[i].sk_activity_name = data.Data[i].sk_activity_name.replaceAll(" ", "");
        //             data.Data[i].isNewUser = true;
        //             vm.$data.list.push(data.Data[i]);
        //         }
        //         lingaSort.page++;
        //         vm.$nextTick(function () {
        //             $("img.lazy").lazyload({ effect: "fadeIn" });
        //             $(".tod").on("click", function () {
        //                 indexSW = 1;
        //                 scrolH = $document.scrollTop();
        //                 $(".jp-fixed-top,footer").fadeOut();
        //                 $(".go-mj").data("href", "/jing/share?invitationCode=" + userid + "&shopid=" + $(this).data("id"));
        //                 $(".go-mj").show().find("img").attr("src", "/Content/images/icon/share-icon.png");
        //                 $(".info-foot").fadeIn();
        //
        //                 $("#detail .get-more").data("id", $(this).data("id"));
        //                 getDetail($(this).data("id"));
        //             });
        //         });
        //
        //     },
        //     error: function () {
        //         listFlag = false;
        //     }
        // });
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
    var vmDetail = new Vue({
        // 选项
        el: '#detail',
        data: {
            activity_name: "",
            clinch_price: "",
            return_moeny: "",
            remaining_copies: "",
            apply_count: "",
            Cart: "",
            Collects: "",
            Prize: "",
            showZt:window.showZt,
            apply_sendgold: "",
            logo_pic1: "",
            logo_pic2: "",
            logo_pic3: "",
            logo_pic4: "",
            sk_shop_type:"",
            share_id: '',
            sk_is_BlockLottery: false, //是否参团
            sk_group_passcount: 0,
            sk_group_SendCount: 0,
            hour: 0,

            sk_commodity_source: false,
            sk_is_useTokio: false,
            sk_is_useCreditCard: false,
            sk_isvoucher: false,
            sk_nondelivery_area: '',
            send_gold:''

        }
    });
    var mySwiper1 = "";
    var goodPrice = 0;
    //获取详情
    function getDetail(id) {
        current_id = id;
        $("#detail .get-more").data("id", id);
        $("#detail .get-more span").html("加载更多");
        $(".info-cat span").removeClass("act").eq(0).addClass("act");
        $(".info-list>div").removeClass("act").eq(0).addClass("act");
        getMoreFlag = true;

        $.post("/shike/baobei/detail.do", { id: id }, function (data) {
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
            var goldText = "";
            var goldBtn = "";

            $("#get-invite").attr("class", "get-apply gray ");
            $("#get-invite").html("暂不支持金币兑换");

            if (row.bbnum == row.zjnum) {
                $("#applyText").html("已兑完");
                $("#applyText").attr("class", "get-invite ");
            } else {
                $("#applyText").html("立即申请");
                $("#applyText").attr("class", "get-apply");
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
        });




        // $.post("/Jing/JinpDetail", { id: id }, function (data) {
        //     goodPrice = (data.Data && data.Data.sk_replace_price) ? data.Data.sk_replace_price : 0;   //给金币不足弹框使用
        //     $("#index").addClass("showHidden");                 //隐藏列表，高度清空
        //     $("#detail").removeClass("showHidden");             //显示商品详情
        //     vmDetail.$data.activity_name = data.Data.activity_name;
        //     vmDetail.$data.clinch_price = (data.Data.clinch_price - 0).toFixed(2);
        //     vmDetail.$data.remaining_copies = data.Data.remaining_copies;
        //     vmDetail.$data.apply_count = data.Data.apply_count;
        //     vmDetail.$data.Cart = data.Data.Cart;
        //     vmDetail.$data.apply_sendgold = data.Data.apply_sendgold;
        //     vmDetail.$data.Collects = data.Data.Collects;
        //     vmDetail.$data.Prize = data.Data.Prize;
        //     vmDetail.$data.hour = data.Data.hour;
        //     vmDetail.$data.sk_is_BlockLottery = data.Data.sk_is_BlockLottery;  //是否参团
        //     vmDetail.$data.sk_group_passcount = data.Data.sk_group_passcount;
        //     vmDetail.$data.sk_group_SendCount = data.Data.sk_group_SendCount;  //需组团人数
        //     vmDetail.$data.restzt = data.Data.sk_group_passcount ? data.Data.sk_group_passcount.split('/')[0] : '0';  //组团剩余份数
        //     vmDetail.$data.sk_is_useCreditCard = data.Data.sk_is_useCreditCard;         //信用卡
        //     var str = data.Data.sk_nondelivery_area || '';
        //     if (str) {
        //         vmDetail.$data.sk_nondelivery_area = str.substring(0., str.length - 1).replaceAll(',', '，') + '。';         //偏远地区
        //     }
        //     vmDetail.$data.sk_is_useTokio = data.Data.sk_is_useTokio;                   //花呗  白条
        //     vmDetail.$data.sk_isvoucher = data.Data.sk_isvoucher;                       //优惠券
        //     vmDetail.$data.sk_commodity_source = data.Data.sk_commodity_source;         //2表示京东
        //     vmDetail.$data.send_gold = data.Data.send_gold;  //送多少金币
        //
        //
        //     var shoptype = data.Data.sk_commodity_source;
        //     vmDetail.$data.sk_shop_type = ["iconfont icon-tb", "iconfont icon-tm", "iconfont icon-jd", "iconfont icon-tb"][shoptype];
        //     if (data.Data.is_original) {
        //         var index = 0;
        //         if (data.Data.img_index == 0) {
        //             index = 1;
        //         } else {
        //             index = 0;
        //         }
        //         vmDetail.$data.logo_pic1 = data.Data.logo_pic.split("|")[index];
        //         vmDetail.$data.logo_pic2 = vmDetail.$data.logo_pic1;
        //         vmDetail.$data.logo_pic3 = vmDetail.$data.logo_pic1;
        //         vmDetail.$data.logo_pic4 = vmDetail.$data.logo_pic1;
        //     } else {
        //         vmDetail.$data.logo_pic1 = data.Data.logo_pic.split("|")[0];
        //         vmDetail.$data.logo_pic2 = data.Data.logo_pic.split("|")[1];
        //         vmDetail.$data.logo_pic3 = data.Data.logo_pic.split("|")[2];
        //         vmDetail.$data.logo_pic4 = data.Data.logo_pic.split("|")[3];
        //     }
        //     var goldText = "";
        //     var goldBtn = "";
        //
        //     if (!mySwiper1) {
        //         mySwiper1 = new Swiper('#swiper2', {
        //             autoplay: 5000,
        //             pagination: '.swiper-pagination',
        //         });
        //     } else {
        //         mySwiper1.slideTo(0, 0, false);
        //     }
        //
        //     if (data.Data.sk_is_BlockLottery) {   //参团
        //         var pinkBtn = "get-apply pink",
        //             pinkText = (data.Data.applyText == "继续参团" ? "继续参团" : "立即参团") + "<br><span style='font-size:0.512rem;'>距开奖仅差" + (parseInt(data.Data.sk_group_SendCount) - parseInt(data.Data.sk_group_applycount)) + "人</span>";
        //
        //
        //         goldText = "暂无金币份额";
        //         goldBtn = "get-invite gray";
        //         $(".get-invite").attr("class", goldBtn);
        //         $(".get-invite").html(goldText);
        //
        //         $(".dona-image").attr("src", "/Content/images/JPin/flow2.png");
        //         $("#detail-type").html("组团流程");
        //
        //         if (data.Data.hour >= 21 || vmDetail.$data.restzt == '0') {
        //             $("#applyText").attr("class", "get-apply gray");
        //             $("#applyText").attr("href", 'javascript:void(0)');
        //             $("#applyText").html("今日份额已满");
        //         }
        //         else if (data.Data.applyText == "明日继续申请") {
        //             $("#applyText").attr("class", "get-apply gray");
        //             $("#applyText").html("明日继续申请");
        //             $("#applyText").attr("href", 'javascript:void(0)');
        //         }
        //         else if (data.Data.applyText == "已申请") {
        //             $("#applyText").attr("class", "get-apply");
        //             $("#applyText").html("已申请");
        //             $("#applyText").attr("href", 'javascript:void(0)');
        //         } else {
        //             $("#applyText").attr("href", '/JpinShopIssue/OrderFlow?activityId=' + id + "&free=" + data.Data.free);
        //             $("#applyText").attr("class", pinkBtn);
        //             $("#applyText").html(pinkText);
        //         }
        //         if (!data.Data.isSubmit) {
        //             pinkBtn = "get-apply gray";
        //             $("#applyText").attr("href", 'javascript:void(0)');
        //             $("#applyText").attr("class", pinkBtn);
        //         }
        //     } else {
        //         $(".dona-image").attr("src", "/Content/images/JPin/flow.png");
        //         $("#detail-type").html("试用流程");
        //         if (data.Data.sk_replace_count == 0 || data.Data.sk_gold_applyCount == data.Data.sk_replace_count) {
        //             goldText = "已兑完";
        //             goldBtn = "get-invite gray";
        //         } else {
        //             if (data.Data.sk_lottery_mode == 0 && (data.Data.sk_activity_type == 2 && compareTime(addDate(data.Data.sk_begindate, 2), getNowFormatDate()) || data.Data.sk_activity_type == 3 && compareTime(addDate(data.Data.sk_begindate, 3), getNowFormatDate()))) {
        //                 if (data.Data.sk_activity_type == 2) {
        //                     goldText = DateMinus(getNowFormatDate(), addDate(data.Data.sk_begindate, 2)) + "小时后可以兑换" + data.Data.sk_begindate;
        //                     goldBtn = "get-invite gray";
        //                 } else {
        //                     goldText = DateMinus(getNowFormatDate(), addDate(data.Data.sk_begindate, 3)) + "小时后可以兑换2";
        //                     goldBtn = "get-invite gray";
        //                 }
        //             } else {
        //                 if (data.Data.sk_replace_price > myGold) {
        //                     //goldText = "金币不足";
        //                     //goldBtn = "get-invite gray";
        //                     goldText = "金币不足<br><span style='font-size:0.512rem;'>" + data.Data.sk_replace_price + "金币</span>";
        //                     goldBtn = "get-invite gold double-line";
        //                     $(".get-invite").off("click");
        //                     $(".get-invite").on("click", function () {
        //                         GoldAplly(id);
        //                     });
        //                 } else {
        //                     goldText = "金币兑换" + "<br /><span style='font-size:0.512rem;'>" + data.Data.sk_replace_price + "金币</span>";
        //                     goldBtn = "get-invite gold";
        //                     $(".get-invite").off("click");
        //                     $(".get-invite").on("click", function () {
        //                         GoldAplly(id);
        //                     });
        //                 }
        //             }
        //         }
        //         $(".get-invite").attr("class", goldBtn);
        //         $(".get-invite").html(goldText);
        //         //var dataHref = '/JpinShopIssue/OrderFlow?activityId=' + id + "&free=" + data.Data.free + "&applyType=1";
        //         //$(".get-invite").attr("data-href", dataHref);
        //         //vmDetail.$data.logo_pic4 = data.Data.logo_pic.split("|")[3];
        //         console.log(data.Data.isSubmit)
        //         if (data.Data.isSubmit) {
        //
        //             $("#applyText").attr("href", '/JpinShopIssue/OrderFlow?activityId=' + id + "&free" + data.Data.free);
        //         } else {
        //             //$("#applyText").attr("class", "gray");
        //             $("#applyText").attr("href", 'javascript:void(0)');
        //         }
        //         if (data.Data.applyText == "还有机会") {
        //             $("#applyText").attr("class", "gray");
        //         }
        //         //if (!data.Data.isSubmit) {
        //
        //         //}
        //         if (data.Data.applyText == "已申请") {
        //             $("#applyText").html(data.Data.applyText);
        //             $("#applyText").attr("class", "get-apply gray");
        //         } else {
        //             $("#applyText").html(data.Data.applyText);
        //             $("#applyText").attr("class", "get-apply");
        //         }
        //     }
        //     vmDetail.$nextTick(function () {
        //         $(".not-area").off("click");
        //         $(".not-area").on("click", function () {
        //             $(".flex-bg").fadeIn(300);
        //             $("#flow2").css("display", "block");
        //             $("#flow2").removeClass("fadeout");
        //         });
        //     });
        //     $("#applyText").removeClass("w12");
        //     if (!data.Data.isSubmit) {
        //         goldText = "已申请";
        //         goldBtn = "get-invite white";
        //         $(".get-invite").attr("class", goldBtn);
        //         $(".get-invite").html(goldText);
        //         $(".get-invite").off("click");
        //         $("#applyText").addClass("w12");
        //     } else if (!data.Data.isGoldSubmit) {
        //         goldText = "今日已兑完";
        //         goldBtn = "get-invite gray";
        //         $(".get-invite").attr("class", goldBtn);
        //         $(".get-invite").html(goldText);
        //         $(".get-invite").off("click");
        //     }
        //
        //
        //     if (data.Data.is_original) {
        //         var money = data.Data.clinch_price;
        //         var reMoney = data.Data.return_moeny;
        //         $("#detail #guss-like").show();
        //         $("#detail .intro").html(getPaiB(money, reMoney));
        //         $("#get-more").show()
        //         getMoreDetail();
        //         window.scrollTo(0, 0);
        //         return false;
        //     }
        //     $.post("/Jing/GetShopDetail", { id: id, url: data.Data.shopissueUrl }, function (data) {
        //         data.Data.tbhtml = data.Data.tbhtml.replaceAll("模板保护代码", "");
        //         data.Data.tbhtml = data.Data.tbhtml.replaceAll('<p>&nbsp;</p>', '');
        //         data.Data.tbhtml = data.Data.tbhtml.replaceAll('<p style="text-align: center;">&nbsp;</p>', '');
        //         /*
        //         * 正则替换空图片
        //         * */
        //         data.Data.tbhtml = data.Data.tbhtml.replace(/<img[^>]+data-original=[\'\"]([^"]+)[\'\"][^>]*>/gi, function (match, capture) {
        //             if (emptyImg.indexOf(capture) != -1) {
        //                 return '';
        //             }
        //             return match;
        //         });
        //         $("#detail .intro").html(data.Data.tbhtml);
        //         $("#detail .intro img").lazyload({ effect: "fadeIn" });
        //     });
        //     window.scrollTo(0, 0);
        // });
        // //空图片黑名单
        // var emptyImg = [
        //           'https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif',
        //           'https://img.alicdn.com/imgextra/i2/51762646/TB22ZiEdgMPMeJjy1XdXXasrXXa_!!51762646.jpg_468x468q90s150.jpg_q90.jpg_468x468q90s150.jpg',
        //           'https://img.alicdn.com/imgextra/i2/51762646/TB2rytqXaagSKJjy0FbXXa.mVXa_!!51762646.jpg_468x468q90s150.jpg_q90.jpg_468x468q90s150.jpg',
        //           'https://img.alicdn.com/imgextra/i2/51762646/TB2BWhpXjuhSKJjSspmXXcQDpXa_!!51762646.jpg_468x468q90s150.jpg_q90.jpg_468x468q90s150.jpg',
        //           'https://img.alicdn.com/imgextra/i3/51762646/TB2b0iGdlUSMeJjSszeXXcKgpXa_!!51762646.jpg_468x468q90s150.jpg_q90.jpg_468x468q90s150.jpg',
        //           'https://img.alicdn.com/imgextra/i1/692125945/TB2Xk8lbFXXXXXeXpXXXXXXXXXX-692125945.gif'
        // ];
        $("#detail #list-apply1").html("");
        $("#detail #guss-like").hide();
        $("#get-more").hide()
    }

    var getMoreFlag = true;
    var getMoreid = 0;
    //点击获取猜你喜欢
    $(".info-cat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
        $(".info-list>div").eq($(this).index()).addClass("act").siblings().removeClass("act");
        if ($(this).index() == 1 && getMoreFlag) {
            if (getMoreid == $("#detail .get-more").data("id")) {
                return false;
            }
            getMoreDetail();
        }
    });
    //猜你喜欢
    function getMoreDetail() {
        getMoreid = $("#detail .get-more").data("id");
        $.post("/Jing/GetNextPage", function (data) {
            if ($("#detail #list-apply").is(":hidden")) {
                getMoreid = 0;
                $("#detail #list-apply1").html(data);
            } else {
                $("#detail #list-apply").html(data);
            }

            $("#detail  .tod").on("click", function () {
                getDetail($(this).data("id"));
                $(".go-mj").attr("href", "/jing/share?invitationCode=" + userid + "&shopid=" + $(this).data("id"));
            });
        });
    }
    //点击弹出流程
    $(".show-flow").on("click", function () {
        $(".flex-bg").fadeIn(300);
        $("#flow").fadeIn();
        $("#flow").css("display", "block");
        $("#flow").removeClass("fadeout");
    });

    //点击遮罩隐藏
    $(".flow-con .code-con").on("click", function () {
        $("#flow").addClass("fadeout");
        $("#flow2").addClass("fadeout");
        $(".flex-bg").fadeOut(300);
        $("#flow").fadeOut();
    });
    //$(".dona-bottom").on("click", function () {
    //    return false;
    //})
    //点击隐藏流程框
    //$(".flow-con span.btn").on("click", function () {
    //    $("#flow").addClass("fadeout");
    //    $("#flow2").addClass("fadeout");
    //    $(".flex-bg").fadeOut(300);
    //    $("#flow").fadeOut();
    //});

    //点击弹出不发货
    $(".not-area").on("click", function () {
        $(".flex-bg").fadeIn(300);
        $("#flow2").css("display", "block");
        $("#flow2").removeClass("fadeout");
    });
    window.toIndex = function toIndex() {
        $("#detail .intro").html("");
        $("#detail").addClass("showHidden");
        $("#index").removeClass("showHidden");
        $(".jp-fixed-top,footer").fadeIn();
        $(".info-foot").fadeOut();
        if (showAlert=="True") {
            $(".go-mj").data("href", "").hide();
            $(".go-mj img").attr("src", "/Content/images/JPin/new-people.png");
        } else {
            $(".go-mj").hide();
        }
        vmDetail.$data.sk_nondelivery_area = '';
        window.scrollTo(0, scrolH);
        indexSW = 0;
    }
});

//如果是拍A发B把商品详情的html改变
function getPaiB(money, reMoney) {
    var html = '<div class="tryout"><h3 class="meili-color">试用流程：</h3><p>1、申请试用，获得试用资格。<br />' +
        '2、申请通过后，按照搜索流程提示，以 <em><icon class="meili-color">' + money + '</icon> 元去指定平台下单。<br />' +
        '3、下单完成后，回试呗网填写购买付款的订单号。<br />' +
        ' 4、等待收货 → 确认收货 → 给予宝贝评价，并填写试用报告。<br />' +
        '5、报告通过 → 返还 <em><icon class="meili-color">' + reMoney + '</icon></em>' +
        ' 元到您的试呗网账户中 → 试用完成。</p></div><div class="tryout"><h3 class="meili-color">注意事项</h3><p>' +
        '1、禁止私自使用信用卡、花呗、淘金币、优惠券、红包、天猫积分等下单(试呗网指定可使用除外)。<br />' +
        '2、禁止通过淘宝客、返利网、一淘等返现返利网链接下单。<br />' +
        '以上由于买家违规下单所产生的费用，由买家承担。试呗网有权冻结其帐号，限制提现操作，IP列入黑名单。</p></div>' +
        '<div class="tryout"><h3 class="meili-color">温馨提示：</h3><p>' +
        '1、用户获得试用资格后，请根据时间提示按时提交订单号和试用报告。<br />' +
        '2、若因未按时提交以上信息而被系统取消试用资格，用户可在“可恢复”中选择恢复资格。<br/> ' +
        '3、若活动已无剩余资格，将无法恢复资格，由此造成的损失需由买家承担。'
    '</p></div>';
    return html;
}


String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}



//播报
function autoScroll() {
    var h = $('.report').find("ul li:first").height();
    h = "-" + h + "px";
    $('.report').find("ul:first").animate({
        marginTop: h
    }, 500, function () {
        $(this).css({ marginTop: "0" }).find("li:first").appendTo(this);
    });
}