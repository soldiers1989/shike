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
        <span style="float:none;margin-right:5px;">活动管理</span>
        <input id="key" type="text" placeholder="请输入活动名称" style="width: 200px" class="shou">
        <span style="float:none;">活动类型</span>
        <select id="sktype" style="width:auto;">
            <option value="" selected="selected">全部</option>
                <option value="1">爆款打造/维护</option>
                <option value="2"> 新品提升综合权重</option>
                <option value="3">高客单精准打造爆款</option>
                <option value="4">必中任务</option>
                <option value="6">拼团</option>
        </select>
        <input onclick="huodonglist(1)" type="button" value="搜索">
    </div>
    <div class="shiy_tl">
        <a class="<%=status==null?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>">全部<i>|</i></a>
        <a class="<%="0".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=0">待支付</a>
        <a class="<%="1".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=1">待审核</a>
        <a class="<%="9".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=9">进行中</a>
        <a class="<%="10".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=10">已结束</a>
        <a class="<%="20".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=20">已结算</a>
        <a class="<%="2".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=2">已驳回</a>
        <a class="<%="-1".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=-1">已下线</a>
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
	var table = createtable("headtable");
	var titlefun = function(row){
		var tdinner = "<a href='"+row.url+"' target='_blank'>"          
        +row.title          
        +"</a>" 	
        +"   <a href='<%=BusiConstant.shangjia_activity_edit.getKey()%>?id="+row.id+"' target='_blank'>编辑</a>"
        +"   <a href='<%=ApiUtil.getUrl("/gl/xiangqing")%>?id="+row.id+"' target='_blank'>淘宝详情</a>";
		return tdinner;
	}
	
	var optfun = function(row){
		var tdinner = "    <div class=\"wae_cer\">";
        if(row.status == 1){              	
        	tdinner+="        <input type='button' value='通过' onclick='tongguo("+row.id+")'/>";
        	tdinner+="        <input type='button' value='拒绝' onclick='untongguo("+row.id+")'/>";  
        }else if(row.status == 9){
        	tdinner+= "        <input type='button' value='下线' onclick='xiaxian("+row.id+")'/>";
        	tdinner+= "        <input type='button' value='不限中奖' onclick='buxian("+row.id+")'/>";
        	tdinner+= "        <input type='button' value='增加申请' onclick='addsq("+row.id+")'/>";
        }else if(row.status == -1){
        	tdinner+="        <input type='button' value='结算' onclick='jiesuan("+row.id+")'/>";
        }
    
        tdinner+= "        <input type='button' value='排序设置' onclick='paixu("+row.id+")'/>";
        
        if(row.isXuni == 0){  
        	tdinner+= "        <input type='button' value='虚拟商品' onclick='xuni("+row.id+")'/>";
        }else{
        	tdinner+= "        <input type='button' value='增加中奖数' onclick='addzj("+row.id+")'/>";
        }

        if (row.hdtypeid == 6) {
            tdinner+= "<a href='<%=ApiUtil.getUrl("/gl/zdzj")%>?id="+row.id+"' target='_blank'>指定中奖</a>";
        }
        
    	tdinner += "<a href='<%=ApiUtil.getUrl("/gl/zjqk")%>?id="+row.id+"' target='_blank'>中奖概览</a>";
        tdinner += "    </div>";
		return tdinner;
	}
	
	var jindufun = function(row){
		var tdinner = "<a href='<%=ApiUtil.getUrl("/gl/skqklist")%>?bbid="+row.id+"' target='_blank'>"          
        +row.statusStr          
        +"</a>";
		return tdinner;
	}
	
	var dianpufun = function(row){
		var tdinner = "无";
		if(row.dianpu){
			tdinner = row.dianpu.name+"("+row.dianpu.statusStr+")";
		}	
		return tdinner;
	}
	
	var pricefun = function(row){
		var tdinner = "返款："+row.salePrice + "<br>价值："+row.realPrice+ "<br>比例："+row.fankuanlv;
		return tdinner;
	}

	function hdtypeidfun(row) {
        var hdtypeid= row.hdtypeid;
        var tdinner = '';
        if (hdtypeid == 1) {
            tdinner = "爆款打造/维护";
        } else if (hdtypeid == 2) {
            tdinner = "新品提升/综合权重";
        } else if (hdtypeid == 3) {
            tdinner = "高客单精准打造爆款";
        }  else if (hdtypeid == 4) {
            tdinner = "必中任务";
        }  else if (hdtypeid == 6) {
            tdinner = "拼团";
        } else if (hdtypeid == 7) {
            tdinner = "折扣试用";
        } else {
            tdinner = hdtypeid;
        }
        return tdinner;
    }
	
	table.th = [{w:50,na:"编号",colname:"id"}
	,{w:120,na:"活动类型",callfun:hdtypeidfun}
	,{w:270,na:"活动名称",callfun:titlefun}
	,{w:100,na:"开始时间",colname:"startTimeStr"}
	,{w:100,na:"结束时间",colname:"endTimeStr"}
	,{w:100,na:"商家名称",colname:"userName"}
	,{w:100,na:"店铺名称",callfun:dianpufun}
	,{w:100,na:"宝贝单价",callfun:pricefun}
	,{w:100,na:"产品数量",colname:"bbnum"}
	,{w:100,na:"中奖数量",colname:"zjnum"}
	,{w:100,na:"申请数量",colname:"ysqnum"}
	,{w:100,na:"排序",colname:"disorder"}
	,{w:100,na:"活动进度",callfun:jindufun}
	,{w:200,na:"活动操作",callfun:optfun}];
	
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
	   var data = {status:<%=status%>,title:$("#key").val(),hdtypeid:$("#sktype option:selected").val(),pageNo:fanye.current,pageSize:fanye.limit};
	   var url = "<%=ApiUtil.getUrl("/baobei/list.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   huodonglist(1);
   
   function tongguo(id){	  
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=BusiConstant.ht_baobeitongguo_do.getKey()%>";
		   postdo(url, data, null,null, null);
	   }	  
   }
   
   function jiesuan(id){	  
	   if(confirm('确认结算？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/baobei/jiesuan.do")%>";
		   postdo(url, data, null,null, null);
	   }	  
   }
   
   
   function addsq(id){	  
	   if(confirm('确认增加？')){
		   var str = window.prompt("请输入增加数量","10");
		   if(str){
			   var data = {id:id,sqs:str};
			   var url = "<%=ApiUtil.getUrl("/baobei/sqs.do")%>";
			   var s = function(redata){
				   var row = table.getrow(id);
				   row.ysqnum =row.ysqnum+parseInt(str);
				   table.tdinit();
			   }
			   postdo(url, data,s,null, null);
		   }	  
	   }	  
   }
   
   function paixu(id){	    
		   var str = window.prompt("请设置排序","1000");
		   if(str){
			   var data = {id:id,disorder:str};
			   var url = "<%=ApiUtil.getUrl("/baobei/paixu.do")%>";
			   var s = function(redata){
				   var row = table.getrow(id);
				   row.disorder =parseInt(str);
				   table.tdinit();
			   }
			   postdo(url, data,s,null, null);
		   }	  
   }
   
   function addzj(id){	  
	   if(confirm('确认增加？')){
		   var str = window.prompt("请输入增加数量","10");
		   if(str){
			   var data = {id:id,zjs:str};
			   var url = "<%=ApiUtil.getUrl("/baobei/zjs.do")%>";
			   var s = function(redata){
				   var row = table.getrow(id);
				   row.zjnum =row.zjnum+parseInt(str);
				   table.tdinit();
			   }
			   postdo(url, data,s,null, null);
		   }	  
	   }	  
   }

   
   function untongguo(id){
	   if(confirm('确认拒绝？')){
		   var data = {id:id};
		   var url = "<%=BusiConstant.ht_baobeiuntongguo_do.getKey()%>";
		   postdo(url, data, null,null, null);
	   }	
   }
   
   function xiaxian(id){
	   if(confirm('确认下线？')){
		   var data = {id:id};
		   var url = "<%=BusiConstant.ht_baobeixiaxiando.getKey()%>";
		   postdo(url, data, null,null, null);
	   }	
   }
   
   function buxian(id){
	   if(confirm('确认不限制中奖？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/baobei/cancellimit.do")%>";
		   postdo(url, data, null,null, null);
	   }	
   }
   
      
   function xuni(id){
	   if(confirm('设置为虚拟商品？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/baobei/xuni.do")%>";
		   postdo(url, data, null,null, null);
	   }	
   }
      
</script>