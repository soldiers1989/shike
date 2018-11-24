


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

    if(row.xiangqing) {
        var rows = row.xiangqing.content.split("sktag");
        for (var i = 0; i < rows.length; i++) {
            var img = '<img src="'+ rows[i] +'" align="absmiddle" >';
            $("#deatilpic").append(img)
        }
    }

}