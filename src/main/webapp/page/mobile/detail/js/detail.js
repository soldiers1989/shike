
    //获取详情
    function getDetail(id) {
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
            $("#realPrice").html( "¥" + row.realPrice); // 价值
            $("#salePrice").html( "¥" + row.salePrice); // 返还
        
            if(row.jiangli > 0){
            	$("#jiangli").html("奖励¥" + row.jiangli+"元"); // 奖励
            } 
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

           
            $("#applyText").removeClass("w12");
            var mySwiper1 = new Swiper('#swiper2', {
                autoplay: 5000,
                pagination: '.swiper-pagination',
            });
           

            if(row.xiangqing) {
                var rows = row.xiangqing.content.split("sktag");
                for (var i = 0; i < rows.length; i++) {
                    var img = "<img src=\"" + rows[i] + "\">";
                    $("#detail .intro").append(img)
                }
            }         
        });

        $("#detail #list-apply1").html("");
        $("#detail #guss-like").hide();
    }
    
    window.toIndex = function toIndex() {
    	window.history.go(-1);
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
