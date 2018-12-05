<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="com.kensure.mycom.config.service.MyConfigService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">
<style>  
    .trhead td{
     	height:33px;
		vertical-align:top:middle;
		bgcolor:#f5f5f5;
		text-align: center;
    }
    .trbody td{
     	height:30px;
		vertical-align:top:middle;
		text-align: center;
    }
</style>

<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="shiy_ti">
  
        <span style="float:none;">流程状态</span>
        <select id="sktype" style="width:auto;">
                <option value="" >全部</option>
                <option value="1" selected="selected">未审核</option>
                <option value="9">已审核</option>
        </select>
        <input onclick="chongzhilist()" type="button" value="搜索">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
               <thead>
        
   		 	</thead>
             <tbody>
                
          	</tbody></table>
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
    if(row.status == 1){              	
    	tdinner+="<input type='button' value='通过' onclick='tongguo("+row.id+")'";  
    }
	return tdinner;
}

table.th =  [{w:100,na:"提款编号",colname:"id"}
,{w:200,na:"提现时间",colname:"createdTimeStr"}
,{w:100,na:"提现支付宝",colname:"jiaoyihao"}
,{w:100,na:"提现金额",colname:"jine"}
,{w:100,na:"提现手续费",colname:"shouxufei"}
,{w:100,na:"到账金额",colname:"daozhang"}
,{w:100,na:"提现状态",colname:"statusStr"}
,{w:100,na:"用户手机",colname:"user.phone"}
,{w:100,na:"用户类型",colname:"user.typeStr"}
,{w:100,na:"真实姓名",colname:"realname"}
,{w:100,na:"操作",callfun:optfun}];
table.thinit();
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){	
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var bei = <%=MyConfigService.getMyConfig("shike_shouxu").getVal()%>;
				if(row.user.type == 2){
					bei = 1;
				}		
				var shouxufei = (row.jine*bei/100).toFixed(2);
			    if(shouxufei >0 && shouxufei<1){
				   shouxufei = 1;
			    }
			   var daozhang = row.jine-shouxufei;
			   row.shouxufei = shouxufei;
			   row.daozhang = daozhang;
			}		
		}
		table.data = rows;
		table.tdinit();		
		
	}

   function chongzhilist(){
	   var data = {status:$("#sktype option:selected").val()};
	   var url = "<%=BusiConstant.shangjia_tixianlist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=BusiConstant.ht_tongguoout_do.getKey()%>";
		   postdo(url, data, tgsucdo,null, null);
	   }
   }
   function tgsucdo(data){
	   chongzhilist();
   }
   
   chongzhilist();
   
</script>