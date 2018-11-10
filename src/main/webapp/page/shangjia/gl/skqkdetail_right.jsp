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
    .wez{
     	font-size:20px;
     	 color: #0094ff;
    }
    .pics{
     	font-size:20px;
     	 color: #0094ff;
    }
    .pics img{
     	width:300px;
    }
    .pics li{
    	width:310px;
    	float:left;
    	margin-right:10px;
     	 border: 1px solid #ff464e;
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
        	<div id="zt"  class="wez">
         	
            </div>
         	<div id="headtable" class="pics">
         	
            </div>
         
        </div>
     
    </div>
</div>
            </div>



<script>

	
	function sucdo(data){
		var row = data.resultData.row;
		var html = "<ul>";
		html += "<li>当前状态"+row.statusStr+"</li>";
		 html += "</ul>";
		$("#zt").append(html);	
		
		html = "<ul>";
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
		html += "<li>收藏图:<br><img src='"+sc213 +"'></li>";
		
		var gz213 = "";
		if(jymap["21-3-gz"]){
			gz213 =  jymap["21-3-gz"].content
		}
		html += "<li>关注图:<br><img src='"+gz213 +"'></li>";
		
		var ddh612 = "";
		if(jymap["61-2-ddh"]){
			ddh612 =  jymap["61-2-ddh"].content
		}
	
		var dd613 = "";
		if(jymap["61-3-dd"]){
			dd613 =  jymap["61-3-dd"].content
		}
		html += "<li>订单号："+ddh612+"<br>订单图:<br><img src='"+dd613 +"'></li>";
		
		var hpy812 = "";
		if(jymap["81-2-hpy"]){
			hpy812 =  jymap["81-2-hpy"].content
		}
		
		var hp813 = "";
		if(jymap["81-3-hp"]){
			hp813 =  jymap["81-3-hp"].content
		}
		html += "<li>好评语:"+hpy812+"<br>好评图:<br><img src='"+hp813 +"'></li>";
		 html += "</ul>";
		$("#headtable").append(html);		
	}

	
   function xiangqing(){
	   var data = {id:<%=id%>};
	   var url = "<%=ApiUtil.getUrl("/skqk/getdetail.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   xiangqing();
   
      
</script>