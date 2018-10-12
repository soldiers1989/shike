//活动类型设置
function baobeitype(bbtype){
	 var skType = 0;
    //初始化类型
    $(".jp-watch dt").removeClass("act");
    $(".jp-watch").find("dt[data-type=" + bbtype + "]").addClass("act");
    $(".jp-watch dd").removeClass("act").eq($(".jp-watch dt.act").index()).addClass("act");
    if ($(".jp-watch dt.act").index() == "2") {
        $(".kt").fadeIn();
    } else {
        $(".kt").fadeOut();
    }
}


var adviceAllNum = 0;
//上传图片

var linkImgFlag = false;//图片
$(function () {
 
    addValueIcon();//设置评价关键词
    bindWordIcon();//添加关键词初始化
    

    priini();//增值费价格
    //初始化需要份数
   
    iniAllNum();//初始化总份数
    var type = getUrlParam("type");
    if (type == "1") {
            selectMenu('#openWindows35');
        } else if (type == "2") {
            selectMenu('#openWindows36');
        } else {
    }
    if ($("#sk_is_search_again").is(":checked")) {
        $("#add-con-search-again").slideDown();
    } else {
        $("#add-con-search-again").slideUp();
    }
    if ($("#sk_ishave_question").is(":checked")) {
        $("#add-con-shopissue-question").slideDown();
    } else {
        $("#add-con-shopissue-question").slideUp();
       
    }
   
   
    advise(true);//初始化建议份数
    var JPinNumArr = false;
    if (!JPinNumArr) {
        if ($("#begindate").val() == $("#enddate").val()) {
            var date2 = new Date($("#begindate").val());
            date2.setDate(date2.getDate() + 6);
            var time2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
            $("#enddate").val(time2);
        }
    }
    
    if($("#sk_no_contact_chat").is(":checked")) {
            $("#sk_is_chat").attr("disabled", "disabled").removeAttr("checked");
    }

    //上传活动主图
    bindUploadImage(".bbzt", function (p) {
        $(".bbzt").attr("src", p);
        var picStr = $("#sk_bis_upload_pic").val();
        if (picStr.length != 0) {
            var list = picStr.split('|');
            $("#sk_bis_upload_pic").val(p + "|" + list[1]);
        } else {
            $("#sk_bis_upload_pic").val(p + "|");
        }
    }, false, "ShopIsuse");
    //上传礼品图片
    bindUploadImage(".lptp", function (p) {
        $(".lptp").attr("src", p);
        var picStr = $("#sk_bis_upload_pic").val();
        if (picStr.length != 0) {
            var list = picStr.split('|');
            $("#sk_bis_upload_pic").val(list[0] + "|" + p);
        } else {
            $("#sk_bis_upload_pic").val("|" + p);
        }
    }, false, "ShopIsuse");



    //评价
    $("#sk_addkw_count").on("change", function () {
        if (($(this).val() - 0) > 0) {
            $(this).siblings(".add-value").fadeIn();
        } else {
            $(this).siblings(".add-value").fadeOut();
        }
    });
    //晒图
    $("#sk_keywords_count").on("change", function () {
        if (($(this).val() - 0) > 0) {
            $(this).siblings(".add-value").fadeIn();
        } else {
            $(this).siblings(".add-value").fadeOut();
        }
    });

  
    //修改平台类型，京东淘宝，
    $("input[name='ptlei']").on("change", function () {
        if ($(this).val() == 1) {
            $(".jp-watch dt").eq(0).html('快速提升销评/排名<i class="iconfont icon-gou"></i>');
            $(".jp-watch dt").eq(1).hide();
            $(".jp-watch dt").eq(3).hide();
            $(".jp-watch dt").eq(4).hide();
            $(".jp-watch").addClass("jd").find("dt").eq(0).click();
            $("#ptText1").html('<span>*</span>京东价：');
            $("#ptText2").text('京东搜索展示价');
            $("#ptText3").text('咚咚聊天：');
            $("#ptText6").text('咚咚聊天');
            $("#ptText5").hide();
            $("#ptText4").fadeOut();
            $(".ptText7").text('宝贝链接');
            
            $(".ptText11").text("白条");
            $("#ptText8").hide();
            $("#ptText9").hide();
            $("#jp-con").hide()
            $(".ptText10").text("1、咚咚聊天，2、指定评价，3、晒图评价，4、追评评价+晒图，5、多天追评；");
            var html = ' <option value="">请选择</option>'
            var sortArr = ["综合排序", "新品优先", "评论数从高到低", "销量", "价格从高到低", "价格从低到高"];
            for (var i = 0; i < sortArr.length; i++) {
                html += ' <option value="' + sortArr[i] + '">' + sortArr[i] + '</option>'
            }
            $('select[name="app_sort_claim"]').html(html);
            $(".jd-hide").hide()
            $("#zhekou").hide()
        } else {
            $(".jp-watch").removeClass("jd")
            $(".jp-watch dt").eq(0).html('爆款打造/维护<i class="iconfont icon-gou"></i>');
            $(".jp-watch dt").eq(1).show();
            $(".jp-watch dt").eq(3).show();
            $(".jp-watch dt").eq(4).show();
            $("#jp-con").show()
            $("#ptText1").html('<span>*</span>一口价：');
            $("#ptText2").text('淘宝搜索展示价 ');
            $("#ptText3").text('旺旺聊天：');
            $("#ptText6").text('旺旺聊天：');
            $("#ptText4").fadeOut();
            $("#ptText5").show();
            $(".ptText7").html("淘口令");
            $(".ptText11").text("白条");
            $("#ptText8").show();
            $("#ptText9").show();
            $(".jd-hide").show()
            $(".ptText10").text("1、手淘问大家，2、旺旺聊天，3、指定评价，4、晒图评价，5、追评评价+晒图，6、多天追评；");
            $("#zhekou").show()
            var html = ' <option value="">请选择</option>';
            var sortArr = ["综合", "销量", "人气", "信用", "价格"];
            for (var i = 0; i < sortArr.length; i++) {
                html += ' <option value="' + sortArr[i] + '">' + sortArr[i] + '</option>';
            }
            $('select[name="app_sort_claim"]').html(html);
        }
        $.post('/JPinShopissueBis/GetShopByType', { shopType: $(this).val() }, function (data) {
            var html = '<option value="">请选择</option>';
            for (var i = 0; i < data.Data.length; i++) {
                html += '<option value="' + data.Data[i].sk_shop_name + '">' + data.Data[i].sk_shop_name + '</option>';
            }
            $("#sk_shop_name").html(html);
            if (data.Data.length <= 0) {
                myAlert("没有绑定店铺，立即绑定", function() {
                    window.open('/Bis/BoundShopBis');
                });
            }
        });
    });

    

    
    
    //提交验证
    $(".submit").on("click", function (e) { //点击按钮的时候提交
        if ($("#img-con img").eq(0).attr("src").indexOf("images/supertry/no_pic.jpg")>=0) {
            myAlert("您还没有获取宝贝信息，请在设置目标推广宝贝信息，点击获取宝贝详情");
            return false;
        }
        e.stopPropagation();
        e.preventDefault();
        if ($(this).hasClass("gray")) {
            return false;
        }
        $("#form").submit();
    });

   
 
    //类型切换
    $(".jp-watch dt").on("click", function () {
        $("#sk_type").val($(this).attr("data-type"));
        if ($(this).attr("data-type") == 4) {
            $("#GroupPrize").css("display", "block");
            if (sk_act_priority==1) {
                $("#sk_zutuan0").attr("checked", "true");
            }
            else if (sk_act_priority == 2) {
                $("#sk_zutuan1").attr("checked", "true");
            } else {
                $("#sk_zutuan0").attr("checked", "true");
            }
        } else {
            $("#GroupPrize").css("display", "none");
            $("#sk_zutuan0").removeAttr("checked");
            $("#sk_zutuan1").removeAttr("checked");
        }
        if ($(this).index() == "2") {
            $(".kt").fadeIn();
        } else {
            $(".kt").fadeOut();
        }
        $(this).addClass("act").siblings().removeClass("act");
        $(".jp-watch dd").removeClass("act").eq(parseInt($(this).index())).addClass("act");
        
        if (($("#sk_clinch_price").val() - 0) > 0) {
            $("#sk_clinch_price").trigger("change");
            timeChange();
        }
        

    });
    

    

    //
//    if (GetQueryString("id") || GetQueryString("fromid")) {
//        if (linkImgFlag) {
//            return false;
//        }
//        linkImgFlag = true;
//        $('#qrcodeTable').qrcode({
//            render: "canvas",
//            text: $("#sk-link").val(), 
//            width: "160",               //二维码的宽度
//            height: "160",              //二维码的高度
//            background: "#ffffff",       //二维码的后景色
//            foreground: "#000000",        //二维码的前景色
//        });
//    }

    //提示语
    $(".alt2").on("click", function () {
        layer.tips($(this).data("text"), ".alt2", {
            tips: [3, '#78BA32'],
            time: 7000
        });
    });
    //提示语
    $(".alt1").on("click", function () {
        layer.tips($(this).data("text"), ".alt1", {
            tips: [3, '#78BA32'],
            time: 7000
        });
    });

    //追加晒图
    $("#sk_is_addappraise").on("click", function () {
        if ($(this).is(":checked")) {
            $("#add-con").slideDown();
        } else {
            $("#add-con").slideUp();
        }
    });
    //追加晒图
    $("#sk_is_search_again").on("click", function () {
        if ($(this).is(":checked")) {
            $("#add-con-search-again").slideDown();
        } else {
            $("#add-con-search-again").slideUp();
        }
    });
    //是否设置用户搜索问题
    $("#sk_ishave_question").on("click", function () {
        if ($(this).is(":checked")) {
            $("#add-con-shopissue-question").slideDown();
        } else {
            $("#add-con-shopissue-question").slideUp();
            $("#add-con-shopissue-question input").val("");
        }
    });
    ////追评关键词
    //$("#sk_keywords_count,#sk_rated_addkw_count").on("keyup", function () {
    //    if (($(this).val() - 0) > 0) {
    //        $(this).siblings(".add-value").fadeIn();
    //    } else {
    //        $(this).siblings(".add-value").fadeOut();
    //    }
    //});
    
    //券类型切换
    $('input[name="sk_VoucHer_Type"]').change(function () {
        if ($(this).val() == "1") {
            $("#quanUrl").hide();
        } else {
            $("#quanUrl").show();
        }
    });

    

    
    ////评价关键词出现
    $("#sk_is_rated").on("change", function () {
        var falg = $(this).is(':checked');
        if (falg) {
            $(".add-value").fadeIn(600);
        } else {
            $(".add-value").fadeOut(600);
        }
    });

    //淘气值
    $(".people-tq").on("click", function () {

        if ($(".people-tq:checked").length > 2) {
            myAlert("淘气值最多选择两个");
            return false;
        }
    });
    

    //职业
    $(".zt-job").on("click", function () {
        var jobnum = $(".zt-job:checked").length;
        if (jobnum > 3) {
            myAlert("最多只能勾选3个职业");
            return false;
        }
    });

    //无需晒图
    $("#sk_no_appraise_chart").on("click", function () {
        if ($(this).is(":checked")) {
            $("#sk_print_count").attr("readonly", "readonly");
        } else {
            $("#sk_print_count").removeAttr("readonly");
        }
    });
    //无需旺旺聊天
    $("#sk_no_contact_chat").on("click", function () {
        if ($(this).is(":checked")) {
            $("#sk_is_chat").attr("disabled", "disabled").removeAttr("checked");
        } else {
            $("#sk_is_chat").removeAttr("disabled");
        }
    });

   
    
    $("input[name='sk_iscontest']").on("click", function (e) {
        e.stopPropagation();
        if ($(this).is(":checked")) {
            $("input[name='sk_iscontest']").val("True");
        } else {
            $("input[name='sk_iscontest']").val("False");
        }
    });

    $("#sk_is_search_again").on("change", function () {
        if (!$(this).is(":checked")) {
            $("#sk_search_again_count").val("")
        }
    });
    

    $(".fold .f-title").on("click", function () {
        $(this).parent().toggleClass("act");
    });

    //返回上一屏
    $(".twopage-btn").on("click", function () {
        $(".onepage").show();
        $(".twopage").hide();
    });
    //收起打开
    $(".slide-btn,.onepage-btn").on("click", function () {
        var falgBtn = $(this).hasClass("onepage-btn");//判断是下一步的按钮

        if (falgBtn) {
            var flag = checkForm($(".onepage"), false);
        } else {
            var flag = checkForm($(this).parent(), true);
        }

        

        if (falgBtn && flag) {//下一步按钮并验证成功显示下一页
            $(".onepage").hide();
            $(".twopage").show();
        } 
    })

    $(".open-slide").on("click", function () {
        $(this).parents(".slide-item").removeClass("slide-hide");
    })

   

    //价格改变

    $("input[name='sk_lottery_mode']").on("change", function () {
        timeChange();
    });
    $("input[name='sk_clinch_price']").on("change", function () {
        var price = $(this).val() - 0;
        if (100 <= price) {
            $(".sevice-price").html(0);
            if ($(".jp-watch dt.act").index() != 2) {
                $("#sk_lottery_mode-con").fadeIn();//开奖方式
            }
        } else {
            $("#sk_lottery_mode-con").fadeOut();;//开奖方式
            var arr = $(".sevice-price");
            for (var i = 0; i < arr.length; i++) {
                arr.eq(i).html(arr.eq(i).data("num"));
            }
        }
        if ($(".jp-watch dt.act").index() == 2) {
            $("#sk_lottery_mode-con").fadeOut();//开奖方式
        }
        var quanPrice = $("#sk_voucher_price").val() - 0;
        $("#AllPrice").text(price + quanPrice);

        if (300 <= price) {
            $(".sevice-ask").html(0);
        } else {
            $(".sevice-ask").html(2);
        }
        advise();
    });

    //托管
    $("#tuoguan").on("click", function () {
        if ($(this).is(":checked")) {
            $("#app-key .mb10 input").attr("disabled", "disabled").removeAttr("datatype");
            $("#app-key .mb10 select").attr("disabled", "disabled").removeAttr("datatype");
            $("#tgInfo").html("美丽啪将推送符合您宝贝的精准关键词！");
        } else {
            $("#tgInfo").html("美丽啪精准关键词托管可以让您的排名提升更显著哦！");
            $("#app-key .mb10 input").removeAttr("disabled").attr("datatype", "*");;
            $("#app-key .mb10 select").removeAttr("disabled").attr("datatype", "*");;
        }
    });

    $("#sk_isvoucher").on("click", function () {

        if ($(this).is(":checked")) {
            $("#quanInfo").fadeIn();
        } else {
            $("#quanInfo").fadeOut();
        }
    });

    $("#sk_voucher_price").on("blur", function () {
        var price = $("input[name='sk_clinch_price']").val() - 0;
        var quanPrice = $(this).val() - 0;
        $("#AllPrice").text(price + quanPrice);
    });


   
    //主图位置
    $("#img-con  img").on("click", function () {
        if ($(this).hasClass("act")) {
            return false;
        }
        $(this).addClass("act").siblings().removeClass("act");
        var arrPic = "";
        arrPic = $(this).attr("src") + "|";
        for (var i = 0; i < 4; i++) {
            if (!$("#img-con img").eq(i).hasClass("act")) {
                arrPic += $("#img-con img").eq(i).attr("src") + (i == 3 ? "" : "|");
            }
        }
        $("#sk_logo_pic").val(arrPic);
    });
    function bindWordIcon() {//
        $(".key-word-icon").off("click");
        $(".key-word-icon").on("click", function () {
            var flag = $(this).hasClass("icon-remove");
            if (flag) {
                $(this).parents(".item-con").remove();
            } else {
                
                var html = $(this).parents(".item-con").html();
                html = html.replace("icon-add", "icon-remove");
                html = '<div class="item-con add-key mb10">' + html + '</div>';
                $("#key-list").append(html);
                var index = $("#key-list").find("input.w150") - 2;
                $("#key-list").find("input.w150").eq(index).val("");
                bindWordIcon();
            }
        });
    }

    //增值费
    function priini() {
        var price = $("input[name='sk_clinch_price']").val() - 0;
        if (100 <= price) {
            $(".sevice-price").html(0);
        } else {
            var arr = $(".sevice-price");
            for (var i = 0; i < arr.length; i++) {
                arr.eq(i).html(arr.eq(i).data("num"));
            }
        }
        if (300 <= price) {
            $(".sevice-ask").html(0);
        } else {
            $(".sevice-ask").html(2);
        }
    }

   

    $(".jp-num").on("blur", function () {
        if ($(this).val() > 100) {
            layer.msg("占比不能大于100");
        }
    });

    $(".jp-link").on("change", function () {
        $("#sk-change").val(true);
    });

    //添加关键词
    function addValueIcon() {
        $(".add-value .iconfont").off("click");
        $(".add-value .iconfont").on("click", function () {
            if ($(this).hasClass("icon-add")) {
                if ($(this).parents(".item-con").children(".add-value").length >= 5) {
                    alert("设置评价关键词最多不能超过5个");
                    return false;
                }
                var html = '<div class="add-value ">' + $(this).parent().html().replace("icon-add", "icon-remove") + "</div>";
                $(this).parents(".item-con").append(html);
                addValueIcon();
            } else {
                $(this).parent().remove();
            }
        });
    }

    $(".setValue").on("click", function () {
            $("#tuoguan").removeAttr("checked");
            SetValueIcon();
    });

    //爆款复制关键词
    function SetValueIcon() {
        var ptArr = $("input[name='ptlei']:checked").val() == "0" ? ["综合", "销量", "人气", "信用", "价格"] : ["综合排序","新品优先","评论数从高到低","销量","价格从高到低","价格从高到低"];
        console.log(ptArr)
        var keyArr = paramObj.sk_app_search_keys.split(",");
        var sortArr = paramObj.sk_app_sort_claim.split(",");
        for (var i = 0; i < keyArr.length; i++) {
            var html = "";
            html += '<div class="item-con mb10 add-key"><span class="label"><span>*</span>搜索关键词：</span>';
            html += ' <input type="text" name="app_search_keys" class="w150" datatype="*" placeholder="精确词相对权重较高"> ';
            html += '<span class="label ml30"> <span>*</span>排序方式：</span> <select name="app_sort_claim" datatype="*" nullmsg="请选择！">';
            html += '<option value="">请选择</option>';
            for (var j = 0; j < ptArr.length; j++) {
                if (ptArr[j] == sortArr[i]) {
                    console.log(i)
                }
                html += '<option value="' + ptArr[j] + '">' + ptArr[j] + '</option>';
            }
            html += ' </select> <i class="iconfont ' + (i == 0 ? "icon-add" : "icon-remove") + ' key-word-icon"></i></div>';
            if (i == 0) {
                console.log(1);
                $("#key-list").html(html);
            } else {
                $("#key-list").append(html);
            }
            $("#key-list input").eq(i).val(keyArr[i]);
            $("#key-list select").eq(i).val(sortArr[i]);
        }
        
        
        $(".key-word-icon").off("click");
        $(".key-word-icon").on("click", function () {
            var flag = $(this).hasClass("icon-remove");
            if (flag) {
                $(this).parents(".item-con").remove();
            } else {
                if (vipType == '-1') {
                    if ($(this).parents(".key-word").find(".add-key").length >= 5) {
                        alert("关键词最多只能有5个");
                        return false;
                    }
                }
                if (vipType == '0') {
                    if ($(this).parents(".key-word").find(".add-key").length >= 5) {
                        alert("关键词最多只能有5个");
                        return false;
                    }
                } else if (vipType == '2') {
                    if ($(this).parents(".key-word").find(".add-key").length >=8) {
                        alert("关键词最多只能有8个");
                        return false;
                    }
                } else {
                    if ($(this).parents(".key-word").find(".add-key").length >= 10) {
                        alert("关键词最多只能有10个");
                        return false;
                    }
                }
                var html = $(this).parents(".item-con").html();
                html = html.replace("icon-add", "icon-remove");
                html = '<div class="item-con mb10 add-key">' + html + '</div>';
                $("#key-list").append(html);
                var index = $("#key-list").find("input.w150") - 2;
                $("#key-list").find("input.w150").eq(index).val("");
                bindWordIcon();
            }
        });
    }

})

//计算运营计划份数
function advise(param1, param2) {
    var price = $("#sk_clinch_price").val() - 0;
   
    var actCat = $(".jp-watch dt.act").index();
    if (actCat < 3) {
        var numArr = $(".jp-watch dd:eq(" + actCat + ") .alt-num");
        if (0 < price && price < 50) {
            adviceAllNum = numArr.eq(0).html();
        }
        if (50 <= price && price < 100) {
            adviceAllNum = numArr.eq(1).html();
        }
        if (100 <= price && price < 300) {
            adviceAllNum = numArr.eq(2).html();
        }
        if (price >= 300) {
            adviceAllNum = numArr.eq(3).html();
        }
    }
    if (actCat == 3) {
        var numArr = $(".jp-watch dd:eq(" + actCat + ") .alt-num");
        if (100 <= price && price < 300) {
            adviceAllNum = numArr.eq(0).html();
        } else {
            adviceAllNum = numArr.eq(1).html();
        }
    }
    if (actCat == 4) {
        adviceAllNum = 1000;
    }
   
    if (param1) {
        return false;
    }
    if (param2) {
        var jpdayStr1 = [];
        for (var j = 0; j < $(".Date .day-num").length; j++) {
            var indexDay = $(".Date .day-num1").eq(j).val() - 0;
            jpdayStr1.push(indexDay);
        }
        timeChange(false, jpdayStr1);
        return false;

    }
    timeChange();
}

function adviseNum() {
    var price = $("#sk_clinch_price").val() - 0;
    var typeArrPrcie = 0;
    if (0 < price && price < 50) {
        typeArrPrcie = 12;
    }
    if (50 <= price && price < 100) {
       typeArrPrcie = 8;
    }
    if (100 <= price && price < 300) {
        typeArrPrcie = 6;
    }
    if (300 <= price) {
        typeArrPrcie = 0;
    }
    return typeArrPrcie;
}



function iniAllNum() {
    var day_count = $("#sk_day_count").val();//初始化总分数
    var activity_days = $("#sk_activity_days").val();
    $("em.all-count").html(day_count * activity_days);
}



function getImg() {
    console.log(1)
    var doubleImg = false;

        var url = $("#sk-link").val();
        if (!url) {
            myAlert("请填写链接地址");
            return false;
        }
        
        if (url.indexOf("#detail") > 0)
            url = url.split('#d')[0];
        if (url.indexOf("item.taobao.com") < 0 && url.indexOf("detail.tmall.com") < 0 && url.indexOf("item.jd.com") < 0 && url.indexOf("detail.tmall.hk") < 0 && url.indexOf("traveldetail.fliggy.com") < 0 && url.indexOf("traveldetail.taobao.com") < 0) {
            myAlert("宝贝地址填写有误");
            return false;
        }
        var ctype = url.indexOf("item.taobao.com") >= 0 ? 0 : url.indexOf("detail.tmall.com") >= 0 ? 1 : url.indexOf("detail.tmall.hk") >= 0 ? 1 : url.indexOf("traveldetail.fliggy.com") >= 0 ? 4 : url.indexOf("traveldetail.taobao.com") >= 0 ? 4 : 2;

        $.post('/shike/baobei/addfile.do', { url: url, ctype: ctype }, function (d) {
            if (d.Result) {
                doubleImg = false;
                var strjson = eval('(' + d.Message + ')');
                var arr = strjson.ThumImg.split("|");
                var pic_log = '';
                for (var i = 0; i < 4; i++) {
                    $("#img-con img").eq(i).attr("src", arr[i]);
                    pic_log += arr[i] + (i == 3 ? "" : "|");
                }
                $("#sk_logo_pic").val(pic_log);
                $("#tbshopname").val(strjson.Title);
                get_data = false;
                if (linkImgFlag) {
                    return false;
                }
                linkImgFlag = true;
                console.log($("#sk-link").val());
                $('#qrcodeTable').qrcode({
                    render: "canvas",
                    text: $("#sk-link").val(),
                    width: "160",               //二维码的宽度
                    height: "160",              //二维码的高度
                    background: "#ffffff",       //二维码的后景色
                    foreground: "#000000",        //二维码的前景色
                });
            } else {
                myAlert(d.Message);
            }
        });
        if ($("#queryType").val() != "1" && $("#queryType").val() != "2") {
            $.post('/JPinShopissueBis/GetTKL', { url: url }, function (d) {
                if (d.Result) {
                    $("input[name='sk_taokouling']").val(d.Message);
                }
                if (url.indexOf("traveldetail.fliggy.com") >= 0) {
                    $("input[name='sk_taokouling']").val("0");
                    $("#txt_taokoulingBz").val("0");
                }
            });
        }
}

function checkForm(node,param2) {//第二个参数用来判断是否是第一页全局折起来
    var checkFlag = true;
    return checkFlag;
}

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}



//把搜索关键词里面的值整合一下
function setData() {
    var index = $("#img-con img.act").index();
    var currentImg = $("#currentImg").val();
    if ((index - 0) == (currentImg - 0)) {
        $("#currentImg").val(0);
    }
    if ((index - 0) > (currentImg - 0)) {
        currentImg++;
        $("#currentImg").val(currentImg);
    }

    var keyAppArr = $("#app-key input[name='app_search_keys']");
    var appKey = "";
    var appClaim = "";
    //var appPosition = "";


    for (var i = 0; i < keyAppArr.length; i++) {
        var key_B = (i == 0 ? "" : ",");
        appKey += key_B + $("#app-key input[name='app_search_keys']").eq(i).val();
        appClaim += key_B + $("#app-key select[name='app_sort_claim']").eq(i).val();
        //appPosition += key_B + $("#app-key input[name='app_position']").eq(2 * i).val() + "-" + $("#app-key input[name='app_position']").eq(2 * i + 1).val();
    }

    



    $("#app-key #sk_app_search_keys").val(appKey);
    $("#app-key #sk_app_sort_claim").val(appClaim);
    //$("#app-key #sk_app_position").val(appPosition);

    var keyArr = $("#word1 .add-value input");
    var access_keyword = "";
    for (var j = 0; j < keyArr.length; j++) {
        if (keyArr.eq(j).val()) {
            access_keyword += (j == 0 ? "" : "♑") + keyArr.eq(j).val();
        }
    }
    $("#access-keyword").val(access_keyword);

    var keyArr1 = $("#word2 .add-value input");
    var access_keyword1 = "";
    for (var j = 0; j < keyArr1.length; j++) {
        if (keyArr1.eq(j).val()) {
            access_keyword1 += (j == 0 ? "" : "♑") + keyArr1.eq(j).val();
        }
    }
    $("#rated_addkw").val(access_keyword1);

    var jobArr = $(".zt-job");
    var jobstr = "";
    for (var j = 0; j < jobArr.length; j++) {
        if (jobArr.eq(j).is(":checked")) {
            jobstr += (j + 1) + ",";
        }
    }
    jobstr = jobstr.substring(0, jobstr.length - 1); 

    var tqArr = $(".people-tq");
    var tqstr = "";
    for (var j = 0; j < tqArr.length; j++) {
        if (tqArr.eq(j).is(":checked")) {
            tqstr += (j + 1) + ",";
        }
    }
    tqstr = tqstr.substring(0, tqstr.length - 1);
    $("#sk_tag_popularity").val(tqstr);




    $("#sk_occupation").val(jobstr);

    $("#sk_age").val($("#sk_age0").val() + "," + $("#sk_age1").val());
    if ($("#sk_sex3").is(":checked")) {
        $("#sk_sex2").val("");
    } else {
        $("#sk_sex2").val($("#sk_sexstr1").val() + "," + $("#sk_sexstr2").val());
    }
    //份数
    var Allnum = 0;
    var jpdayStr = '';
    var jpdayStr1 = '';
    var watchIndex = $(".jp-watch dt.act").index();
    for (var j = 0; j < $(".Date .day-num").length; j++) {
        var indexPrice = $(".Date .day-num").eq(j).val() - 0;
        var indexDay = $(".Date .day-num1").eq(j).val() - 0;
        Allnum += indexPrice;
        jpdayStr += indexPrice + ",";
        jpdayStr1 += indexDay + ",";
    }

    $("#sk_tryout_count").val(Allnum);
    $("#sk_day_count_list").val(jpdayStr);
    $("#sk_take_rates_list").val(jpdayStr1);
}

function timeChange(param1, param2) {//第一个参数是否编辑，第二参数组团
    var time1 = $("#begindate").val().replace(/-/g,"/");
    var time2 = $("#enddate").val().replace(/-/g, "/");
    if (!time1) {
        $("#all-num").text(0);
        return false;
        
    }
    var timeAll = ((new Date(time2) - new Date(time1)) / 1000 / 60 / 60 / 24).toFixed(0);
    

    timeAll = (timeAll - 0) + 1;
    $("#Date-num").text(timeAll);
    $(".Date td").html("");
    if (timeAll > 15) {
        $("#data-warn").fadeIn().html("活动天数不能大于15天");
        $(".Date table").removeClass("gray");
        $("#all-num").text(0);
        return false;
    } else {
        $(".Date table").addClass("gray");
        $("#data-warn").fadeOut();
    }
    var price = $("#sk_clinch_price").val() - 0;
    if (price <= 0) {
        return false;
    }

    var timeZ = new Date(time1).getDay();
    var Data1Num = new Date(time1) - 0;

    timeZ = (timeZ == 7 ? 0 : timeZ);
    if (price < 100) {
        var planNum = 1;
    } else if (price >= 300) {
        var planNum = 3;
    } else {
        var planNum = 2;
    }
    if ($("#sk_lottery_mode1").is(":checked")) {
        var planNum = 1;
    }
    
    if ($(".jp-watch dt.act").index() == 2) {
        var planNum = 0;
    }
    var kjTime = new Date((new Date(time1).valueOf() + (planNum * 24 * 3600 * 1000)));
    $("#showtime").show();
    $("#showtime label").text(kjTime.getFullYear() + "年" + (kjTime.getMonth()+1) + "月" + kjTime.getDate() + "开始开奖")

    if (timeAll <= planNum) {
        $("#data-warn").fadeIn().html("活动时间不能小于预热时间");
    }
    var copyDay = 7;
    if (paramObj) {
        copyDay = (parseInt(paramObj.activityDay) + planNum);
        if ($(".lst.act").data("type") == "4") {
            copyDay += 1;
        }
        if (timeAll > copyDay && timeAll > 7) {
            layer.msg("该爆款复制活动天数不能大于" + (copyDay < 7 ? 7 : copyDay) + "天");
            $("#all-num").text(0);
            return false;
        }
    }

    var daynum = Math.ceil(adviceAllNum / (timeAll - planNum));



    var showNumArr = JPinNumArr.split(',') || [];
    var showDayArr = JPinDayArr.split(',') || []; 
    var watchIndex = $(".jp-watch dt.act").index();
    for (var i = 0; i < timeAll; i++) {
        var html = '<div class="date-con"><h3>' + new Date(Data1Num + (i) * 60 * 60 * 1000 * 24).getDate() + '</h3>';
        if (i < planNum) {
            html += '<i class="iconfont icon-going"></i><h2>活动预热</h2></div >';
        } else {
            daynum = param1 ? showNumArr[i - planNum] : daynum;
            if (paramObj) {
                daynum = parseInt(paramObj.activityCount) < adviceAllNum ? Math.ceil(adviceAllNum / (timeAll - planNum)) : Math.ceil(parseInt(paramObj.tryoutCount) / (timeAll - planNum));
            }
            if (paramObj && (!getUrlParam("fromid"))) {
                daynum = showNumArr[i - planNum];
            }
            var daynum1 = param1 ? showDayArr[i - planNum] : 0;
            if (param2) {
                daynum1 = param2 ? param2[i - planNum] : 0;
            } else {
                if (watchIndex == 2 && !param1) {
                    daynum1 = 50;
                }
            }
            html += '<p><label>发放份数：</label><input type="text" name="name" class="day-num" value="' + daynum + '" onkeyup="this.value=this.value.replace(/\\D/g,\'\');countAll();" onafterpaste="this.value=this.value.replace(/\\D/g,\'\')"></p>';
            if (watchIndex == 4) {
                html += '<p><label>日转化率：</label><input type="text" name="name" class="day-num1" readonly="readonly" value="100" maxlength="2"><span>%</span></p></div >';
            } else {
                html += '<p><label>日转化率：</label><input type="text" name="name" class="day-num1" value="' + (parseInt(daynum1)||0) + '" onkeyup="this.value=this.value.replace(/\\D/g,\'\')" onafterpaste="this.value=this.value.replace(/\\D/g,\'\')" maxlength="2"><span>%</span></p></div >';
            }
            
        }
        $(".Date tbody td").eq(timeZ + i).html(html);
    }
    countAll();
}

function countAll() {
    var Allnum = 0;
    for (var j = 0; j < $(".Date .day-num").length; j++) {
        var indexPrice = $(".Date .day-num").eq(j).val() - 0;
        if (indexPrice <= 0) {
            layer.msg("每日发放份数不能小于0");
            return false;
        }
        Allnum += indexPrice;
    }
    $("#all-num").text(Allnum);
}