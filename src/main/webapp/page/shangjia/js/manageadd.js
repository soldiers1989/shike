var today = getdatestr(new Date());
//时间控件
laydate.render({
 elem: '#begindate'
,type: 'date'
,min:today
,done:function(value,date){
	getDays();
}
});
//时间控件
laydate.render({
 elem: '#enddate'
,type: 'date'
,min:today
,done:function(value,date){
	getDays();
}
});


//根据时间，设置任务日期
function getDays(){ 
	   var begindateStr = $("#begindate").val();
	   var enddateStr = $("#enddate").val();
	   var begindate = convertDateFromString(begindateStr);
	   var enddate = convertDateFromString(enddateStr);
	   if(begindate>enddate){
		   alert("开始时间不能大于结束时间");
		   return;
	   }
	   
	   var days = parseInt(enddate.getTime()/ (1000 * 60 * 60 * 24)) -  parseInt(begindate.getTime()/ (1000 * 60 * 60 * 24))+1;
	   if(days > 15){
		   alert("活动不能超过15天");
		   return;
	   }
	   $("#Date-num").html(days);
	   for(var i=0;i<21;i++){
		   $("#week"+""+i).html("");
	   }
	   var hdtypeid = $(".jp-watch dt.act").index()+1;
	   var bday = begindate.getDay();
	   for(var i=0;i<days;i++){
		  var tempday = dayadd(begindate,i);
		  var daystr = tempday.Format("yyyy-MM-dd");
		  var dd = tempday.Format("dd");
		  var dayhtml = "<input type='hidden' id='shijian"+i+"' value='"+daystr+"'/>";
		  var fenshu = "<input type='text' id='fenshu"+i+"' name='name' class='day-num' onchange='countAll();' value='1'>";
		  var zhuanhua = "<input type='text' id='zhuanhua"+i+"' name='name' class='day-num1' value='0'  maxlength='2'>";
		  var html = "<div class='date-con'><h3>"+dd+dayhtml+"</h3><i class='iconfont icon-going'></i><h2>活动预热</h2></div>";
		  var html1 = "<div class='date-con'><h3>"+dd+dayhtml+"</h3><p><label>发放份数：</label>"+fenshu+"</p><p><label>日转化率：</label>"+zhuanhua+"<span>%</span></p></div>";
		  if(i == 0){
			  if(hdtypeid == 4){
				  $("#week"+bday).html(html1);
			  }else{
				  $("#week"+bday).html(html);
			  }		  
		  }else{
			  $("#week"+bday).html(html1);
		  }		  
		  bday++;
	   }  
	   countAll();
}
getDays();