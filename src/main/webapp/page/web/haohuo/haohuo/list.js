var lingaSort = {};
lingaSort.typeid = '';
lingaSort.hdtypeid = '';
lingaSort.title = '';
lingaSort.jiangli = '';
lingaSort.sort = '1';
lingaSort.order = '';
lingaSort.minprice = '';
lingaSort.maxprice = '';

$(function () {
    getList();

    dictlist();
    
    initTypeBanging();

    iniPrice();

    jinrilist();
});


function initTypeBanging() {
    //平台类型
    $(".jp-plat-con a").on("click", function () {
        $(".jp-plat-con a").removeClass("act");
        $(this).addClass("act");
        var numtype = $(this).attr("gid");
        if(numtype == 5){
            lingaSort.jiangli  = 1;
        }else{
            lingaSort.hdtypeid  = numtype;
            lingaSort.jiangli = 0;
        }
        lingaSort.sort = 1;
        getList(1);
    });
}


// 分类
function dictlist(){
    var data = {typeid:1};
    var url = "/shike/sys/dictlist.do";
    postdo(url, data, dictsucdo,null, null);
}

// 好货列表
function getList() {

    var data = lingaSort;
    var url = "/shike/baobei/sklist.do";
    postdo(url, data, listCallBack,null, null);
}

// 今日上新列表
function jinrilist() {
    var data = {order:1, sort: 1};
    var url = "/shike/baobei/sklist.do";
    postdo(url, data, jinrilistCallback,null, null);
}

function dictsucdo(data) {
    var rows = data.resultData.rows;
    for(var i=0;i<rows.length;i++){
        var row = rows[i];
        // var html = "<li><a id='type"+ row.code +"' data-href=\""+ row.code +"\" class=\"\">"+ row.simpleName +"</a></li>";
        var html = '<a href="javascript:void(0);" gid="'+ row.code +'" class=""><span id="seleted_0">'+ row.simpleName +'</span></a>';
        $("#dictlist").append(html);
    }
    initCatBinding();
}


//type搜索
function initCatBinding() {
    $(".jp-sort-con a").on("click", function () {
        $(".jp-sort-con a").removeClass("act");
        $(this).addClass("act");
        lingaSort.typeid = $(this).attr("gid");
        getList(1);
    });
}

function listCallBack(data) {
    $("#list").html('');

    for (var i = 0; i < data.resultData.rows.length; i++) {
        var row = data.resultData.rows[i];
        // 高价值
        var highPrice = "";
        if (row.hdtypeid == 3) {
            highPrice = "<span class=\"high-tag\">高价值</span>"
        }

        // 详情页连接
        var detailUrl = "/shike/skw/detail?id="+ row.id;

        var html = '<li class="pitem ">\n' +
            '                    <a href="'+detailUrl+'" target="_blank">\n' +
            '                        <img class="tryimg dbdl lazy" src="'+ row.zturl +'" data-original="'+ row.zturl +'" alt="'+ row.title +'" style="display: block;">\n' +
             highPrice +
            '                                                                            <div>\n' +
           // '                                <span class="bg1">首单99%中奖率</span>\n' +
            '                            </div>\n' +
            '                                            </a>\n' +
            '                    <h4>\n' +
            '                        <a href="'+detailUrl+'" target="_blank"><span class="iconfont icon-tb" style=" margin-right:3px;"></span>'+ row.title +'</a>\n' +
            '                    </h4>\n' +
            '                    <div class="num">\n' +
            '                        <span class="price">￥'+ row.salePrice +'</span>\n' +
            '                            <span class="r"><em>'+ row.ysqnum +'</em>人已申请</span>\n' +
            '\n' +
            '                    </div>\n' +
            '                    <div class="btn">\n' +
            '                                <a class="apply-btn" href="'+detailUrl+'" target="_blank">免费申请</a>\n' +
            '\n' +
            '                    </div>\n' +
            '                </li>';

        $("#list").append(html);
    }
}

function jinrilistCallback(data) {
    var rows = data.resultData.rows.length > 7 ? 7 : data.resultData.rows.length;

    for (var i = 0; i < rows; i++) {
        var row = data.resultData.rows[i];

        // 详情页连接
        var detailUrl = "/shike/skw/detail?id="+ row.id;

        var html = '<li style="float: left; width: 198px;">\n' +
            '                    <a href="'+detailUrl+'" target="_blank">\n' +
            '                        <img class="tryimg " src="'+ row.zturl +'" alt="'+ row.title +'">\n' +
            '                    </a><h4 class="yhuahs">\n' +
            '                    <a href="'+detailUrl+'" target="_blank">\n' +
            '                    </a><a style="display: none" href="'+detailUrl+'">'+ row.title +'</a>\n' +
            '                    <a href="'+detailUrl+'" target="_blank"><span class="iconfont icon-tb" style="margin-right:3px;"></span><span>'+ row.title +'</span></a>\n' +
            '                </h4>\n' +
            '\n' +
            '                    <p class="yhdp">\n' +
            '                        <span class="price">￥'+ row.salePrice  +'</span>\n' +
            '                        <span class="r"><em>'+ row.ysqnum +'</em>人已申请</span>\n' +
            '                    </p>\n' +
            '                    <a href="'+detailUrl+'" target="_blank" class="ontrial">免费试用</a>\n' +
            '                </li>';

        $("#jinrilist").append(html);
    }
}

function search() {
    lingaSort.title = $("#ck").val();
    getList(1)
}


function PXsearch(p) {
    $(".all-goods-select ul li a").removeClass("act");

    if(!$("#seleted_0" + p).hasClass('sorrowsel1') && !$("#seleted_0" + p).hasClass('sorrowsel2') ){
        $(".all-goods-select ul li a span").removeClass("sorrowsel1");
        $(".all-goods-select ul li a span").removeClass("sorrowsel2");
    }

    var sort = '';

    $("#seleted_0" + p).parent().addClass("act");
    if($("#seleted_0" + p).hasClass('sorrowsel1')){
        $("#seleted_0" + p).removeClass("sorrowsel1");
        $("#seleted_0" + p).addClass("sorrowsel2");
        sort = 0;
    } else if($("#seleted_0" + p).hasClass('sorrowsel2')){
        $("#seleted_0" + p).removeClass("sorrowsel2");
        $("#seleted_0" + p).addClass("sorrowsel1");
        sort = 1;
    } else {
        $("#seleted_0" + p).addClass("sorrowsel1");
        sort = 1;
    }

    lingaSort.order = p == '0' ? '' : p;
    lingaSort.sort = sort;
    getList(1);
}


function iniPrice() {
    $("input.price1").val(getQueryString('price1'));
    $("input.price2").val(getQueryString('price2'));
    $(".price-btn").on("click", function () {
        var min = parseInt($(this).siblings(".price1").val());
        var max = parseInt($(this).siblings(".price2").val());
        //var price_falg = /^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]{1,2})?$/.test(price1) && /^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]{1,2})?$/.test(price2);
        //if (!(price_falg && price2 - 0 >= price1 - 0)) {
        //    myAlert("输入格式有误");
        //    return false;
        //}
        if (min < 0 || max < 0) {
            alert("筛选值不能小于0");
            return false;
        }
        if (min && max && (min >= max)) {
            alert("筛选最小值不能大于等于筛选最大值", function () {

            });
            return;
        }
        min = !!min ? min : '';
        max = !!max ? max : '';

        lingaSort.minprice = min;
        lingaSort.maxprice = max;

        getList(1)
    });
}