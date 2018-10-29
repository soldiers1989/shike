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
   
    <div class="clearfix right_g">
        <div class="right_contant table-style">
        	
         	<table  cellspacing="0" style="table-layout:fixed;" cellpadding="0" id="headtable">
         	
            </table>
         
        </div>
     
    </div>
</div>
            </div>



<script>

	
	function sucdo(data){
		var row = data.resultData.row;
		var html = "";
		html = "<tr><td width=150>状态</td><td width=500>"+row.statusStr+"</td></tr>";
		var jys = row.jylist;
		var jymap = {};
		for(var j=0;jys && j<jys.length;j++){
			var jy = jys[j];
			var key = jy.status+"-"+jy.typeid+"-"+jy.busitype;
			jymap[key] = jy;
		}
		var sc213 = "";
		if(jymap["21-3-gz"]){
			sc213 =  jymap["21-3-sc"].content
		}
		html += "<tr><td>收藏图</td><td><img src='"+sc213 +"' width='500'></td></tr>";
		
		var gz213 = "";
		if(jymap["21-3-gz"]){
			gz213 =  jymap["21-3-gz"].content
		}
		html += "<tr><td>关注图</td><td><img src='"+gz213 +"' width='500'></td></tr>";
		
		var ddh612 = "";
		if(jymap["61-2-ddh"]){
			ddh612 =  jymap["61-2-ddh"].content
		}
		html += "<tr><td>订单号</td><td>"+ddh612+"</td></tr>";
		
		var dd613 = "";
		if(jymap["61-3-dd"]){
			dd613 =  jymap["61-3-dd"].content
		}
		html += "<tr><td>订单图</td><td><img src='"+dd613 +"' width='500'></td></tr>";
		
		var hpy812 = "";
		if(jymap["81-2-hpy"]){
			hpy812 =  jymap["81-2-hpy"].content
		}
		html += "<tr><td>好评语</td><td>"+hpy812+"</td></tr>";
		
		var hp813 = "";
		if(jymap["81-3-hp"]){
			hp813 =  jymap["81-3-hp"].content
		}
		html += "<tr><td>好评图</td><td><img src='"+hp813 +"' width='500'></td></tr>";
		
		$("#headtable").append(html);		
	}

	
   function xiangqing(){
	   var data = {id:<%=id%>};
	   var url = "<%=ApiUtil.getUrl("/skqk/getdetail.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   xiangqing();
   
      
</script>