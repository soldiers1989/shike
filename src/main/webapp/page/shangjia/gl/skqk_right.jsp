<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String status = (String)request.getAttribute("status");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<style>
    .tc-em em {
        display: inline-block;
        width: 80px;
        text-align: right;
    }

        .tc-em em#input-num-all {
            display: inline;
        }

    .tc-em p {
        display: inline-block;
        width: 130px;
        text-align: left;
    }

    .payList {
        width: 580px;
        margin: 0 auto;
    }

        .payList td, .payList th {
            border-bottom: 1px solid #dedede;
            padding: 8px 0;
            line-height: 21px;
            font-size: 14px;
        }

        .payList table {
            width: 100%;
        }

            .payList table tr td, .payList table tr th {
                width: 50%;
            }

                .payList table tr td:first-child, .payList .tl {
                    text-align: left !important;
                    width: 25%;
                }

                .payList table tr td:last-child, .payList .tr {
                    text-align: right !important;
                    width: 25%;
                }

    .tc {
        text-align: center;
    }

    .payList b {
        color: #ff464e;
    }

    .payList .input {
        text-align: center;
    }

        .payList .input * {
            display: inline-block;
            vertical-align: middle;
            margin-top: 20px;
        }

        .payList .input input {
            width: 300px;
            height: 28px;
            border: 1px solid #ddd;
            outline: none;
            text-indent: 1em;
        }

            .payList .input input:focus {
                border: 1px solid #ff464e;
                box-shadow: 0 0 5px #ff464e;
            }

    .payList span.blue {
        color: #0094ff;
        cursor: pointer;
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
    .table-style table tr {
    margin-bottom: 2px;
    border: 1px solid #e8e8e8;
    background: #f9f9f9;
    display: block;
	}
</style>

<div class="clearfix glhoutai" style="padding-bottom: 0;">
    <div class="shiy_ti">
    <form id="skqkchaxun">
        <span style="float:none;margin-right:5px;">试客账号</span>
        <input name="skphone" type="text" style="width:80px" >
        
        <span style="float:none;margin-right:5px;">试客id</span>
        <input name="userid" type="text" style="width:80px" >
        
        <span style="float:none;margin-right:5px;">商家账号</span>
        <input name="sjname" type="text" style="width:80px" >
        
        <span style="float:none;margin-right:5px;">活动id</span>
        <input name="bbid" type="text" style="width:80px" >
        
        <span style="float:none;margin-right:5px;">生成时间</span>
        <input name="aa" type="text" style="width:80px" >至
        <input name="bb" type="text" style="width:80px" >
     </form>
        <input onclick="huodonglist(1)" type="button" value="搜索">
    </div>
   
    <div class="clearfix right_g">
        <div class="right_contant table-style">
        	
         	<table  cellspacing="0" style="table-layout:fixed;" cellpadding="0" id="headtable">
         	<thead>
        
   		 	</thead>
             <tbody>
                
          	</tbody>
            </table>
         
        </div>
        <div id="fanye">

		</div>
    </div>
</div>
            </div>



<script>
	$.fn.serializeObject = function(){  
	    var o = {};  
	    var a = this.serializeArray();  
	    $.each(a, function() {  
	        if (o[this.name]) {  
	            if (!o[this.name].push) {  
	                o[this.name] = [o[this.name]];  
	            }  
	            o[this.name].push(this.value || '');  
	        } else {  
	            o[this.name] = this.value || '';  
	        }  
	    });  
	    return o;  
	 }

	var table = createtable("headtable");
	var urlfun = function(row){
		var tdinner = "<a href='"+row.url+"' target='_blank'>查看</a>";
		return tdinner;
	}
	var xiangqingfun = function(row){
		var tdinner = "<a href='<%=BusiConstant.shangjia_activity_edit.getKey()%>?id="+row.bbid+"' target='_blank'>查看</a>"
		return tdinner;
	}
	
	var syqkfun = function(row){
		var tdinner = "<a href='<%=ApiUtil.getUrl("/gl/skqkdetail")%>?id="+row.id+"' target='_blank'>查看</a>"
		return tdinner;
	}
	
	table.th = [{w:50,na:"订单id",colname:"id"}
	,{w:50,na:"活动id",colname:"bbid"}
	,{w:150,na:"创建时间",colname:"createdTimeStr"}
	,{w:50,na:"试客id",colname:"userid"}
	,{w:100,na:"试客账号",colname:"skphone"}
	,{w:100,na:"淘宝账号",colname:"noTaobao"}
	,{w:100,na:"商家账号",colname:"sjname"}
	,{w:100,na:"商品名称",colname:"title"}
	,{w:100,na:"店铺名称",colname:"dpname"}
	,{w:100,na:"商品链接",callfun:urlfun}
	,{w:100,na:"详情链接",callfun:xiangqingfun}
	,{w:100,na:"状态",colname:"statusStr"}
	,{w:100,na:"试用详情",callfun:syqkfun}];
	
	table.thinit();
	
	function sucdo(data){
		var rows = data.resultData.rows;
		fanye.init(data.resultData.total);	
		if(rows){	
			table.data = rows;
			table.tdinit();
		}	
	}

	var fanye = new FanYe("fanye","huodonglist",0,20,1);
	
   function huodonglist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	   var data = $('#skqkchaxun').serializeObject();
	   data.pageNo = fanye.current;
	   var url = "<%=ApiUtil.getUrl("/skqk/list.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   huodonglist(1);
   
   

  
      
</script>