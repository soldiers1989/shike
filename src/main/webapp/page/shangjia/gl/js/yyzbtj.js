//第一张表
var table1 = createtable("listtable1");	

table1.th = [{w:50,na:"编号",colname:"refereeId"}
	,{w:80,na:"手机号",colname:"user.phone"}
	,{w:80,na:"qq账号",colname:"user.noQq"}
	,{w:80,na:"创建时间",colname:"user.createdTimeStr"}
	,{w:100,na:"推荐人员数",colname:"cnt"}];	
table1.thinit();

function sucdo(data){
	var rows = data.resultData.rows;
	table1.data = rows == null ? [] : rows;
	table1.tdinit();
}

function shangjiatj(){
   var data = {startCreatedTime:$('#startCreatedTime').val(),"endCreatedTime":$('#endCreatedTime').val()};
   var url = getbaseurl("/user/tjtj.do");
   postdo(url, data, sucdo,null, null);
}
   
  
   //时间控件
laydate.render({
	elem: '#startCreatedTime' //指定元素
	,type: 'datetime'
});
laydate.render({
	elem: '#endCreatedTime' //指定元素
	,type: 'datetime'
});
   
function searchtj(){
	shangjiatj();
}
searchtj();