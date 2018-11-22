<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String status = (String)request.getAttribute("status");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">
 <style>   
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

<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="shiy_tl" id="shiyall">
        <a class="<%=status==null?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>">全部<i>|</i></a>
        <a class="<%="0".equalsIgnoreCase(status)?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>?status=0">待审核</a>
        <a class="<%="9".equalsIgnoreCase(status)?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>?status=9">已审核</a>

    </div>
    <div class="huodong">
        
            <table width="100%" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
              <thead>
        
   		 	</thead>
             <tbody>
                
          	</tbody>
          	</table>
 
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
	var table = createtable("listtable");
	var imgfun = function(row){
		var tdinner = "<a href='"+row.mjtp+"' target='_blank'><img src='"+row.mjtp+"' width='200'/>";
		return tdinner;
	}
	
	var optfun = function(row){
		var tdinner = "";   
	    if(row.status == 0){
	    	tdinner+="<input onclick='tongguo("+row.id+")' value='通过' type='button'>";
		}
		return tdinner;
	}
	

	
	
	table.th = [{w:50,na:"编号",colname:"id"}
	,{w:120,na:"店铺名",colname:"name"}
	,{w:270,na:"连接",colname:"url"}
	,{w:100,na:"商家名称",colname:"userName"}
	,{w:100,na:"注册时间",colname:"createdTimeStr"}
	,{w:100,na:"图片",callfun:imgfun}
	,{w:100,na:"旺旺",colname:"wangwang"}
	,{w:100,na:"QQ",colname:"qq"}
	,{w:100,na:"微信",colname:"weixin"}
	,{w:100,na:"电话",colname:"phone"}
	,{w:200,na:"操作",callfun:optfun}];
	
	table.thinit();
	var fanye = new FanYe("fanye","chongzhilist",0,20,1);
	function sucdo(data){	
		var rows = data.resultData.rows;
		fanye.init(data.resultData.total);	
		table.data = rows;
		table.tdinit();	
	}

   function chongzhilist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	   var data = {status:<%=status%>,pageNo:fanye.current,pageSize:fanye.limit};
	   var url = "<%=ApiUtil.getUrl("/dianpu/list.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/dianpu/gongguo.do")%>";
		   postdo(url, data, tongguosuc,null, null);
	   }
   }
   
   function tongguosuc(data){
	   chongzhilist(1);
   }
   
   chongzhilist(1);
   
</script>