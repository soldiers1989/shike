<%@page import="com.kensure.shike.constant.BusiConstant"%>
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
    
    .trhead td{
     	height:33px;
		vertical-align:top:middle;
		bgcolor:#f5f5f5;
		text-align: center;
    }
    .trbody td{
     	height:100px;
		vertical-align:top:middle;
		text-align: center;
    }
</style>

<div class="clearfix fabushiyong" style="padding-bottom: 0;">
    <div class="shiy_ti">
        <span style="float:none;margin-right:5px;">活动管理</span>
        <input id="key" type="text" placeholder="请输入活动名称" style="width: 200px" class="shou">
        <span style="float:none;">活动类型</span>
        <select id="sktype" style="width:auto;">
            <option value="" selected="selected">全部</option>
                <option value="1">爆款打造/维护</option>
                <option value="2"> 新品提升综合权重</option>
                <option value="3">高客单精准打造爆款</option>
                <option value="4">新人必中</option>
        </select>
        <input onclick="dianpulist(1)" type="button" value="搜索">
    </div>
    <div class="shiy_tl">
        <a class="<%=status==null?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>">全部<i>|</i></a>
        <a class="<%="0".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=0">待支付</a>
        <a class="<%="1".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=1">待审核</a>
        <a class="<%="9".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=9">进行中</a>
        <a class="<%="10".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=10">已结束</a>
        <a class="<%="2".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=2">已驳回</a>
        <a class="<%="-1".equalsIgnoreCase(status)?"shiy":""%>" href="<%=BusiConstant.ht_huodonglist.getKey()%>?status=-1">已下线</a>
    </div>
    <div class="clearfix right_g">
        <div class="right_contant table-style">
         <div style="width:1000px; overflow-y:scroll;">
            <table width="2000" cellspacing="0" style="table-layout:fixed;" cellpadding="0" id="listtable">
                <tbody>
                  
            	</tbody>
            </table>
            </div>
        </div>
        <div id="fanye">

		</div>
    </div>
</div>
            </div>



<script>
	var theadtds = [{w:270,na:"活动名称"},{w:100,na:"开始时间"},{w:100,na:"结束时间"},{w:100,na:"商家名称"}
	,{w:100,na:"店铺名称"},{w:100,na:"宝贝单价"},{w:100,na:"产品数量"},{w:100,na:"中奖数量"},{w:100,na:"申请数量"},{w:100,na:"活动进度"},{w:100,na:"活动操作"}];
	function sucdo(data){
		$("#listtable").html("");
		var theadhtml = "<tr class='trhead'>";     
		for(var i=0;i<theadtds.length;i++){
			var row = theadtds[i];
			theadhtml += "<td width='"+row.w+"'>";
			theadhtml += "<strong>"+row.na+"</strong>";
			theadhtml += "</td>";      
		}
		theadhtml += "</tr>";
		$("#listtable").append(theadhtml);
		
		var rows = data.resultData.rows;
		fanye.init(data.resultData.total);	
		if(rows){		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html =   "<tr class='trbody'> "       
                +"<td width='"+theadtds[0].w+"'>"
                +"<div class=\"xi_lt clearfix\" style=\"margin-right: 0\">"
                +"<a style='width: 60px; height: 60px;' href='"+row.url+"' target='_blank'>"
                +"<img src='"+row.zturl+"'  height='60' width='60'> </a>"
                +"    <div class=\"cd_lxq cm_cd_lxq\">"
                +"            <span style=\"margin-left: 0px; width: 170px; line-height: 12px;\">" 
                +"                <em class=\"iconfont icon-tb\" style=\"font-weight:500;font-size:15px;\">" 
                +"                </em>"+row.title 
                +"            </span>"       
                +"        <input style=\"height: 15px; background: transparent; margin: 10px 0;\" type=\"text\" placeholder=\"备注\" class=\"beizhu\" id=\"sk_note_83882\" onblur=\"SetNoet(83882, 7, '') \">" 
                +"    </div>" 
                +" </div>" 
                +"</td>" 
                +"<td width='"+theadtds[1].w+"'>" 
                +" <em style=\"color: #a9a9a9;\">"+row.startTimeStr+"</em>" 
                +"</td>" 
                +"<td width='"+theadtds[2].w+"'>" 
                +" <em style=\"color: #a9a9a9;\">"+row.endTimeStr+"</em>" 
                +"</td>"   
                +"<td width='"+theadtds[3].w+"'>" 
                +" <em style=\"color: #a9a9a9;\">"+row.userName+"</em>" 
                +"</td>"
                +"<td width='"+theadtds[4].w+"'>" 
                +" <em style=\"color: #a9a9a9;\">"+row.dpname+"</em>" 
                +"</td>"
                +"<td width='"+theadtds[5].w+"'>" 
                +"     <em style=\"color: #f25f55\">"+row.salePrice+"</em>" 
                +"  </td>" 
                +"<td width='"+theadtds[6].w+"'>" 
                +"     <em style=\"color: #f25f55\">"+row.bbnum+"</em>" 
                +"</td>"  
                +"<td width='"+theadtds[7].w+"'>" 
                +"     <em style=\"color: #f25f55\">"+row.zjnum+"</em>" 
                +"</td>" 
                +"<td width='"+theadtds[8].w+"'>" 
                +"     <em style=\"color: #f25f55\">"+row.ysqnum+"</em>" 
                +"</td>" 
                +"<td width='"+theadtds[9].w+"'>" 
                +"     <em style=\"color: #f25f55\">"+row.statusStr+"</em>" 
                +"  </td>" 
                +"<td width='"+theadtds[10].w+"'>";
                html+="    <div class=\"wae_cer\">" 
                if(row.status == 1){              	
                      +"        <input type='button' value='审核通过' onclick='tongguo("+row.id+")'/>"                              
                }
                html+= "        <input type='button' value='宝贝下线' onclick='xiaxian("+row.id+")'/>"
                +"   </div>" 
                html+="</td>" 
                +" </tr>" 
				$("#listtable").append(html);
			}
		}
		
	}

	var fanye = new FanYe("fanye","dianpulist",0,20,1);
	
   function dianpulist(current){
	   if(!fanye.setpage(current)){
			return;
		}
	   var data = {status:<%=status%>,title:$("#key").val(),hdtypeid:$("#sktype option:selected").val(),pageNo:fanye.current,pageSize:fanye.limit};
	   var url = "<%=BusiConstant.shangjia_baobeilist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   dianpulist(1);
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_baobeitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   
   function xiaxian(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_baobeixiaxiando.getKey()%>";
	   postdo(url, data, null,null, null);
   }
      
</script>