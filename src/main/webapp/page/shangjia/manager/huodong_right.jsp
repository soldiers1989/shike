<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String status = (String)request.getAttribute("status");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                

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
</style>
<script language="javascript" type="text/javascript">
    var count=3;
    var size=10;
    var page=1;
    var status=-1;
    var orderType=0;
    var skType = -1;
    
</script>
<div class="clearfix fabushiyong" style="padding-bottom: 0;">
    <div class="shiy_ti">
        
        <span style="float:none;margin-right:5px;">活动管理</span>
        <input id="key" type="text" placeholder="请输入活动名称" style="width: 200px" class="shou">
        <input onclick="dianpulist(1)" type="button" style="background: url('<%=context%>/se.gif') no-repeat scroll -1px center transparent; border: 0px none; cursor: pointer; height: 28px; width: 101px; outline: none; position: relative; margin-left: 0px;">
    </div>
    <div class="shiy_tl" id="shiyall">
        <a class="<%=status==null?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>">全部<i>|</i></a>
        <a class="<%="0".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=0">待支付</a>
        <a class="<%="1".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=1">待审核</a>
        <a class="<%="9".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=9">进行中</a>
        <a class="<%="10".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=10">已结束</a>
        <a class="<%="20".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=20">已结算</a>
        <a class="<%="2".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.shangjia_huodonglist.getKey()%>?status=2">已驳回</a>
    </div>
    <div class="clearfix right_g">
        <div class="right_contant table-style">
         
            <table width="996" cellspacing="0" cellpadding="0" id="listtable">
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
	var table = createtable("listtable");
	var titlefun = function(row){
			var html = "<div class=\"xi_lt clearfix\" style=\"margin-right: 0\">"
            +"<a style='width: 60px; height: 60px;'>"
            +"<img src='"+row.zturl+"'  height='60' width='60'> </a>"
            +"    <div class=\"cd_lxq cm_cd_lxq\">"                       
            +"            <span style=\"margin-left: 0px; width: 230px; line-height: 12px;\">" 
            +"                <em class=\"iconfont icon-tb\" style=\"font-weight:500;font-size:15px;\">" 
            +"                </em>"+row.title         
            +"            </span>" 
            +"【活动编号："+row.id+"】"
            +"<br>【创建时间："+row.createdTimeStr+"】"       
            +"    </div>" 
            +" </div>";
		return html;
	}
	
	var optfun = function(row){
		var tdinner = "";
	    if (row.status == 0 || row.status == 2) {
	    	tdinner = "<a href='<%=BusiConstant.shangjia_activity_edit.getKey()%>?id="+row.id+"' target='_blank'>修改活动</a>";
		}
        if(row.status == 0){
        	tdinner+="    <div class=\"wae_cer\">";
        	tdinner+="        <a href=\"<%=BusiConstant.shangjia_payinfo.getKey()%>?id="+row.id+"\" href=\"_blank\" class=\"dv_psdb\">交保证金</a>";
        	tdinner+="   </div>";
        }
		return tdinner;
	}
	
	var jindufun = function(row){
		var tdinner = "<a href='<%=ApiUtil.getUrl("/shangjia/skqklist")%>?bbid="+row.id+"' target='_blank'>"          
	    +row.statusStr          
	    +"</a>";
		return tdinner;
	}
	var qingkuangfun = function(row){
		var tdinner = "担保金:￥"+row.yingshou+"<br>(共"+row.bbnum+",剩"+(row.bbnum-row.zjnum)+") "+row.ysqnum+"人申请";
		return tdinner;
	}
	
	table.th = [{w:300,na:"活动名称",callfun:titlefun}
	,{w:100,na:"开始时间",colname:"startTimeStr"}
	,{w:100,na:"活动进度",callfun:jindufun}
	,{w:200,na:"活动情况",callfun:qingkuangfun}
	,{w:200,na:"活动操作",callfun:optfun}];
	
	table.thinit();


	function sucdo(data){
		var rows = data.resultData.rows;
		table.data = rows;
		fanye.init(data.resultData.total);	
		table.tdinit();		
	}

	var fanye = new FanYe("fanye","dianpulist",0,20,1);
   function dianpulist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	    var title = $("#key").val()
	   
	   var data = {status:<%=status%>,title:title};	   
	   var url = "<%=BusiConstant.shangjia_baobeilist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   dianpulist(1);
      
</script>