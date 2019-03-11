   //时间控件
laydate.render({
	elem: '#startCreatedTime' //指定元素
	,type: 'datetime'
});
laydate.render({
	elem: '#endCreatedTime' //指定元素
	,type: 'datetime'
});

function showtable(obj){
	var tableid = $(obj).parent().parent().parent().parent()[0].id;
	$("#"+tableid+" tr").css("display","block");
	$(obj).attr("onclick","shoulongtable(this)");
	$(obj).attr("value","--");
}

function shoulongtable(obj){
	var tableid = $(obj).parent().parent().parent().parent()[0].id;
	$("#"+tableid+" tr").not(':eq(0)').not(':eq(0)').css("display","none");
	$(obj).attr("onclick","showtable(this)");
	$(obj).attr("value","+");
}

function hidentable(tableid){
	$("#"+tableid+" tr").not(':eq(0)').not(':eq(0)').css("display","none");
}

function dayfun(row){
	var tdinner = row.day;   
    if(tdinner == "合计"){
    	tdinner+="<input onclick='showtable(this)' value='+' type='button'>";
	}
	return tdinner;
}



//第一张表
var table1 = createtable("listtable1");	
table1.th = [{w:80,na:"日期",callfun:dayfun}
	,{w:80,na:"商家注册数",colname:"zc"}
	,{w:100,na:"已绑店铺商家数",colname:"bddpsj"}
	,{w:80,na:"绑定店铺数",colname:"dp"}
	,{w:100,na:"今日登陆商家数",colname:"dlsj"}
	,{w:120,na:"今日编辑活动商家数",colname:"bjhdsj"}
	,{w:120,na:"今日发布活动商家数",colname:"fbhdsj"}
	];	
table1.thinit();
function sucdo(data){
	var rows = data.resultData.rows;
	table1.data = rows == null ? [] : rows;
	table1.tdinit();
	hidentable(table1.tableid);
}
function shangjiatj(){
   var data = {startTime:$('#startCreatedTime').val(),"endTime":$('#endCreatedTime').val()};
   var url = getbaseurl("/yyzb/sjzb.do");
   postdo(url, data, sucdo,null, null);
}
  

//第二张表
var table2 = createtable("listtable2");	
table2.th = [{w:80,na:"日期",callfun:dayfun}
	,{w:80,na:"发布活动数",colname:"fbhd"}
	,{w:80,na:"发布商品份数",colname:"fbspfs"}
	,{w:100,na:"新增服务费收入",colname:"fwfsr"}
	,{w:100,na:"服务费结算收入",colname:"fwfjs"}
	,{w:120,na:"服务费结算退款",colname:"fwftk"}
	,{w:120,na:"冻结押金",colname:"yjdj"}
	];	
table2.thinit();
function sucdo2(data){
	var rows = data.resultData.rows;
	table2.data = rows;
	table2.tdinit();
	hidentable(table2.tableid);
}
function huodongtj(){
   var data = {startTime:$('#startCreatedTime').val(),"endTime":$('#endCreatedTime').val()};
   var url = getbaseurl("/yyzb/hdzb.do");
   postdo(url, data, sucdo2,null, null);
}
  

   
function searchtj(){
	shangjiatj();
	huodongtj();
}
searchtj();