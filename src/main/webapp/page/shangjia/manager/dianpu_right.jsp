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
     	word-break:break-all;
		vertical-align:top:middle;
		overflow:hidden;
    }
    .trbody td em{
     	height:30px;
     	word-break:break-all;
		vertical-align:top:middle;
    }
    .table-style table tr {
    margin-bottom: 2px;
    border: 1px solid #e8e8e8;
    background: #f9f9f9;
    display: block;
	}
</style>
<div class="clearfix right_bottom">
    <h1 style="font-size: 16px; font-weight: normal; padding: 25px 0; border-bottom: 1px dashed #ddd;">
        <span class="btn btn-red"><a href="<%=ApiUtil.getUrl("/shangjia/addDianPu")%>">绑定店铺</a></span><em style="font-size: 12px;color: #ff464e;">（绑定店铺已达上限，如仍需添加店铺请联系客服）</em>
    </h1>
     <table width="100%" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
              <thead>
        
   		 	</thead>
             <tbody>
                
          	</tbody>
          	</table>
  		<div id="fanye">

        </div>
    
</div>

            </div>



<script>

function shanchu(id){
	   if(confirm('确认删除店铺？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/dianpu/delete.do")%>";
		   postdo(url, data, tongguosuc,null, null);
	   }
}
function tongguosuc(data){
	dianpulist(1);
}

var table = createtable("listtable");
var optfun = function(row){
	var tdinner = "";
    if (row.jihuo == 0) {
    	tdinner+= " <a href='<%=ApiUtil.getUrl("/shangjia/jihuoDianPu")%>?id="+row.id+"'>激活店铺</a>";
	}
    tdinner+="<input onclick='shanchu("+row.id+")' value='删除' type='button'>";
	return tdinner;
}

var imgfun = function(row){
	var tdinner = "<a href='"+row.mjtp+"' target='_blank'><img src='"+row.mjtp+"' width='200'/>";
	return tdinner;
}


table.th = [{w:80,na:"店铺编号",colname:"id"}
,{w:100,na:"店铺信息",colname:"name"}
,{w:100,na:"店铺网址",colname:"url"}
,{w:200,na:"图片",callfun:imgfun}
,{w:90,na:"添加时间",colname:"createdTimeStr"}
,{w:100,na:"旺旺",colname:"wangwang"}
,{w:80,na:"负责人QQ",colname:"qq"}
,{w:80,na:"负责人微信",colname:"weixin"}
,{w:80,na:"负责人电话",colname:"phone"}
,{w:40,na:"状态",colname:"jihuoStr"}
,{w:100,na:"操作",callfun:optfun}];

table.thinit();

	var fanye = new FanYe("fanye","dianpulist",0,20,1);
	function sucdo(data){
		var rows = data.resultData.rows;
		fanye.init(data.resultData.total);	
		table.data = rows;
		table.tdinit();
	}

   function dianpulist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	   var data = {pageNo:fanye.current,pageSize:fanye.limit};
	   var url = "<%=ApiUtil.getUrl("/dianpu/sjlist.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   dianpulist(1);
      
</script>