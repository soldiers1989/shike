<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String id = (String)request.getAttribute("id");
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
       
    </div>
</div>
            </div>



<script>
	
	var table = createtable("headtable");
	
	
	table.th = [{w:100,na:"日期",colname:"daydes"}
	,{w:100,na:"宝贝数量",colname:"bbnum"}
	,{w:150,na:"已申请数量",colname:"ysqnum"}
	,{w:150,na:"已中奖数量",colname:"yzj"}];
	
	table.thinit();
	
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){	
			table.data = rows;
			table.tdinit();
		}	
	}

   function huodonglist(){
	   var data ={id:<%=id%>};
	   var url = "<%=ApiUtil.getUrl("/skqk/getbbrw.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   huodonglist();
   
   

  
      
</script>