$(function () {
    //initGoodsType();
    // initPage(index, count, size, wq, fl, ck, px);

    
    var $window = $(window);
    var $document = $(document);
   
    $window.scroll(function () {
        if (parseInt($(window).scrollTop()) > 950) {
            $("#slide-cat").addClass("act");
        } else {
            $("#slide-cat").removeClass("act");
        }

    });

    // $(".shopcat").on("click", function () {
    //     $(this).addClass("red").siblings().removeClass("red");
    //     window.location.href =
    //    "/?wq=" + wq + "&sort=" + sort + "&fl=" + fl + "&price1=" + price1 + "&price2=" + price2 +  "&ck=" + $('#ck').val() + "&px=" + px + "&noApply=" + noApply + "&shopActType=" + $('.shopcat.red').data("num") + "#trygoodstype";
    // });
    //
    // $(".noapply").on("click", function () {
    //
    //     $(this).toggleClass("act");
    //     if ($(this).hasClass("act")) {
    //         window.location.href =
    //         "/?wq=" + wq + "&sort=" + sort + "&fl=" + fl + "&price1=" + price1 + "&price2=" + price2 + "&ck=" + $('#ck').val() + "&px=" + px + "&shopActType=" + $('.shopcat.red').data("num") + "&noapply=1" + "#trygoodstype";
    //     } else {
    //         window.location.href =
    //        "/?wq=" + wq + "&sort=" + sort + "&fl=" + fl + "&price1=" + price1 + "&price2=" + price2 + "&ck=" + $('#ck').val() + "&px=" + px + "&shopActType=" + $('.shopcat.red').data("num") + "&noapply=0" + "#trygoodstype";
    //     }
    // })
});
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}


// function search() {
//     window.location.href = "/?wq=" + wq + "&fl=" + fl + "&px=" + px + "&ck=" + $('#ck').val() + "&noApply=" + noApply + "&shopActType=" + $('.shopcat.red').data("num") + "#trygoodstype";
// // }
// function PXsearch(p) {
//     var sort = 1;
//     if(px == '3' && p == '3' && st ==1) {
//         return;
//     }
//     if (p == px && st != 2) {
//         sort = 2;
//     }
//     // window.location.href =
//     //     "/?wq=" + wq + "&sort=" + sort + "&fl=" + fl + "&ck=" + $('#ck').val() + "&px=" + p + "&noApply=" + noApply + "&price1=" + price1 + "&price2=" + price2 + "&shopActType=" + $('.shopcat.red').data("num") + "#trygoodstype";
// }



function initPage(index, count, size, wq, fl, ck, px) {
    $(".pagination").pagination(count, {
        items_per_page: size,
        current_page: index - 1,
        isshowclickme: true,
        link_to: "/?wq=" + wq + "&sort=" + sort + "&fl=" + fl + "&ck=" + ck + "&px=" + px + "&noApply=" + noApply + "&price1=" + price1 + "&price2=" + price2 + "&shopActType=" + $('.shopcat.red').data("num") + "&pg=__id__#trygoodstype",
    });
}


function initReportStyle() {
    setReportInterval();
    $('#reporttitle').mouseover(function () {
        $('#reporttitle').addClass('zxinsxi');
        $('#commtitle').removeClass('zxinsxi');
        $('#report').show();
        $('#comm').hide();
        clearInterval(reportInter);
    });
    $('#commtitle').mouseover(function () {
        $('#reporttitle').removeClass('zxinsxi');
        $('#commtitle').addClass('zxinsxi');
        $('#report').hide();
        $('#comm').show();
        clearInterval(reportInter);
    });
    $('.right_nav').mouseover(function () { clearInterval(reportInter); });
    $('.right_nav').mouseout(function () { setReportInterval(); });
}

function setReportInterval() {
    reportInter = setInterval(function () {
        if ($('#reporttitle').hasClass('zxinsxi')) {
            $('#reporttitle').removeClass('zxinsxi');
            $('#commtitle').addClass('zxinsxi');
            $('#report').hide();
            $('#comm').show();
        } else {
            $('#reporttitle').addClass('zxinsxi');
            $('#commtitle').removeClass('zxinsxi');
            $('#report').show();
            $('#comm').hide();
        }
    }, 5000);
}



