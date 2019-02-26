var basecontext = '/shike';

//根据相对路径获取完整路径
function getbaseurl(url){
	return basecontext+url;
}

//获取时间的string
function getdatestr(myDate){
	//获取当前年
	var year=myDate.getFullYear();
	//获取当前月
	var month=myDate.getMonth()+1;
	//获取当前日
	var day=myDate.getDate(); 
	var now=year+'-'+month+"-"+day;
	return now
}

