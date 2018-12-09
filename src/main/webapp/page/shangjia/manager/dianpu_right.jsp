<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                
<style>

    .btn {
        display: inline-block;
        width: 80px;
        height: 30px;
        background-color: #f7a500;
        border: 1px solid #e87d00;
        border-radius: 2px;
        color: #fff;
        text-align: center;
        line-height: 30px;
        cursor: pointer;
        font-size: 14px;
        margin-left: 20px;
    }

    .btn-red {
        background-color: #ff464e;
    }
  .trhead{
     	position: relative; 
		top:expression(this.offsetParent.scrollTop-2);  
    }
    .trhead td{
     	height:33px;
		vertical-align:top:middle;
		bgcolor:#f5f5f5;
    }
    .trbody td{
     	height:30px;
		vertical-align:top:middle;
    }
</style>
<div style="padding: 0 30px;">
    <h1 style="font-size: 16px; font-weight: normal; padding: 25px 0; border-bottom: 1px dashed #ddd;">
        <span class="btn btn-red"><a href="<%=ApiUtil.getUrl("/shangjia/addDianPu")%>">绑定店铺</a></span><em style="font-size: 12px;color: #ff464e;">（绑定店铺已达上限，如仍需添加店铺请联系客服）</em>
    </h1>
    <table width="996" cellspacing="0" cellpadding="0" id="listtable">
              <thead>
      
  		 	</thead>
            <tbody>
               
         	</tbody>
     </table>
    
</div>

            </div>



<script>
var table = createtable("listtable");
var optfun = function(row){
	var tdinner = "";
    if (row.jihuo == 0) {
    	tdinner+= " <a href='<%=ApiUtil.getUrl("/shangjia/jihuoDianPu")%>?id="+row.id+"'>激活店铺</a>";
	}
	return tdinner;
}

table.th = [{w:100,na:"店铺类型",colname:"typeidStr"}
,{w:100,na:"店铺信息",colname:"name"}
,{w:200,na:"店铺首页网址",colname:"url"}
,{w:200,na:"添加时间",colname:"createdTimeStr"}
,{w:100,na:"旺旺",colname:"wangwang"}
,{w:100,na:"负责人QQ",colname:"qq"}
,{w:100,na:"负责人微信",colname:"weixin"}
,{w:100,na:"负责人电话",colname:"phone"}
,{w:100,na:"状态",colname:"jihuoStr"}
,{w:100,na:"操作",callfun:optfun}];

table.thinit();




	function sucdo(data){
		var rows = data.resultData.rows;
		table.data = rows;
		table.tdinit();
	}

   function dianpulist(){
	   var data = {};
	   var url = "<%=BusiConstant.shangjia_dianpualist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   dianpulist();
      
</script>