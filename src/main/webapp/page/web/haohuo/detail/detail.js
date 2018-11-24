


$(function () {

    getDetail($("#id").val());
});

function getDetail(id) {
    var data = { id: id };
    var url = "/shike/baobei/detail.do";
    postdo(url, data, huodongDetailCallBack,null, null);
}


function huodongDetailCallBack(data){
    if(data.type != 'success') {
        return;
    }

    var row = data.resultData.row;

    $("#title").html(row.title)
    $("#price").html(row.salePrice)
    $("#price2").html(row.salePrice)
    $("#syNum").html((row.bbnum - row.ysqnum) + "/" + row.bbnum)
    $("#sqNum").html(row.sqnum)
    $("#yzjNum").html(row.ysqnum)

    for (var i = 0; i < row.tplist.length; i++) {
        // alert(console.log(row.tplist[i].url))
        $("#img"+i).attr("src", row.tplist[i].url);
    }

    if(row.xiangqing) {
        var rows = row.xiangqing.content.split("sktag");
        if (rows != null && rows.length > 0) {
            $("#frameorderlist").css("height", 650*rows.length + "px");
        }
    }

}