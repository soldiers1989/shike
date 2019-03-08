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

        var rows = data.resultData.rows.length > 12 ? 12 : data.resultData.rows.length;

        for (var i = 0; i < rows; i++) {
            var row = data.resultData.rows[i];
            var html = "<li>" +
                "                            <a href=\"/shike/skm/haohuo?order=1\">" +
                "                                <img src=\""+ row.zturl +"!200\">" +
                "                                <span class=\"t-price\">¥"+ row.salePrice +"</span>" +
                "                                <span class=\"t-btn\">免费申请</span>" +
                "                            </a>" +
                "                        </li>";

            $("#jinrilist").append(html);
        }
        $("#jinrilist").append("<li></li><li></li><li></li><li></li>");
    }
    
    jinrilist();

  //主页swiper
    var mySwiper = new Swiper('#swiper', {
        autoplay: 5000,
        pagination: '.swiper-pagination',
    });

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
                "                                    <img src=\""+ row.zturl +"!200\">\n" +
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
    
    //播报
    setInterval('autoScroll();', 3000);
    

    $(".info-cat span").on("click", function () {
        $(this).addClass("act").siblings().removeClass("act");
    });

   
    //初始化数据
    var lingaSort = {};
    lingaSort.page = getQueryString("page") || 1;
    lingaSort.order = getQueryString("order");
    lingaSort.key = getQueryString("key") || "";
    lingaSort.type = getQueryString("type") || -1;
   

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
        lingaSort.order=1;
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

                    var html = "<li><a href='"+detailurl+"'  class=\"tod\"><img\n" +
                        "                    src=\"" + row.zturl + "!200\"\n" +
                        "                    data-original=\"" + row.zturl + "!200\"\n" +
                        "                    class=\"lazy\" style=\"display: inline;\">\n" +
                        highPrice +
                        "            </a>\n" +
                        "                <p><span class=\"iconfont icon-tb\"></span> " + row.title + "</p>\n" +
                        "                <div class=\"jp-num\"><span>¥" + row.salePrice+"</span>";
                    if(row.jiangli > 0){
                    	html+="（奖¥"+row.jiangli+"元）";
                    }
                    html += " <span>" + row.ysqnum + "人申请</span></div>\n" +
                        "                <div class=\"jp-btn\"><a '"+detailurl+"' class=\"btn tod\">免费申请</a></div>\n" +
                        "            </li>";

                    $("#list").append(html);
                }
            },
            error: function () {
                listFlag = false;
            }
        });

       
    }

  
  
  
});




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