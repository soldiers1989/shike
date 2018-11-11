<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="right_contant" style="text-align: center">
            <table  border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <thead>
        
   		 	</thead>
             <tbody>
                
          	</tbody>
          	</table>
        </div>
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
	var table = createtable("listtable");
	
	var optfun = function(row){
		var tdinner = ""; 
		return tdinner;
	}
	
	var xinyongfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.buyerTotalPoint){
			f =  row.sKTaobao.buyerTotalPoint+"单，平均每周："+row.sKTaobao.weekAvg+",好评率:"+row.sKTaobao.sellerGoodRate;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var huiyuanfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.vip){
			f =  row.sKTaobao.vip+"级";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	
	var huoyuefun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.activePoint){
			f =  row.sKTaobao.activePoint+"点，"+row.sKTaobao.activeLevel+"级";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var shimingfun = function(row){
		var f = "否";
		if(row.sKTaobao && row.sKTaobao.shiming == '1'){
			f = "是";
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var zhucefun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.regTime){
			f =  row.sKTaobao.regTime;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	var nannvfun = function(row){
		var f = "";
		if(row.sKTaobao && row.sKTaobao.sex){
			f =  row.sKTaobao.sex;
		}
		var tdinner = " <em style=\"color: #a9a9a9;\">"+f+"</em>";
		return tdinner;
	}
	
	table.th = [{w:50,na:"编号",colname:"id"}
	,{w:100,na:"真实姓名",colname:"realname"}
	,{w:100,na:"手机号",colname:"phone"}
	,{w:100,na:"qq账号",colname:"noQq"}
	,{w:100,na:"余额",colname:"yue"}
	,{w:100,na:"创建时间",colname:"createdTimeStr"}
	,{w:100,na:"支付宝",colname:"noAlipay"}
	,{w:80,na:"实名认证",callfun:shimingfun}
	,{w:100,na:"淘宝账号",colname:"noTaobao"}
	,{w:100,na:"注册时间",callfun:zhucefun}
	,{w:200,na:"买家信用",callfun:xinyongfun}
	,{w:80,na:"男号女号",callfun:nannvfun}
	,{w:80,na:"淘宝会员等级",callfun:huiyuanfun}
	,{w:100,na:"活跃度",callfun:huoyuefun}
	,{w:200,na:"操作",callfun:optfun}];
	
	table.thinit();
	
	function sucdo(data){
		var rows = data.resultData.rows;
		fanye.init(data.resultData.total);	
		table.data = rows;
		table.tdinit();
	}
	
	var fanye = new FanYe("fanye","chongzhilist",0,20,1);

   function chongzhilist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	   var data = {type:1,pageNo:fanye.current,pageSize:fanye.limit};
	   var url = "<%=ApiUtil.getUrl("/user/userlist.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_chongzhitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   chongzhilist();
   
</script>