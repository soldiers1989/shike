<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">
<style>  
    .trhead td{
     	height:33px;
		vertical-align:top:middle;
		bgcolor:#f5f5f5;
		text-align: center;
    }
    .trbody td{
     	height:30px;
		vertical-align:top:middle;
		text-align: center;
    }
</style>

<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="shiy_ti">
  
        <span style="float:none;">流程状态</span>
        <select id="sktype" style="width:auto;">
            <option value="" selected="selected">全部</option>
                <option value="1">未审核</option>
                <option value="9">已审核</option>
        </select>
        <input onclick="chongzhilist()" type="button" value="搜索">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
               
            </tbody></table>
        </div>
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
var theadtds = [{w:50,na:"序号"},{w:200,na:"提现时间"},{w:100,na:"提现支付宝"},{w:100,na:"提现金额"},{w:100,na:"提现手续费"}
,{w:100,na:"到账金额"},{w:100,na:"提现状态"},{w:100,na:"用户手机"},{w:100,na:"用户类型"},{w:100,na:"真实姓名"},{w:100,na:"操作"}];

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
		if(rows){
		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var bei = 6;
				if(row.user.type == 2){
					bei = 1;
				}
			
				var shouxufei = (row.jine*bei/100).toFixed(2);
			    if(shouxufei<1){
				   shouxufei = 1;
			    }
			   var daozhang = row.jine-shouxufei;
				var html = "<tr class='trbody'><td>"+row.id+"</td>";
				html+="<td>"+row.createdTimeStr+"</td>";
				html+="<td>"+row.jiaoyihao+"</td>";
				html+="<td>"+row.jine+"</td>";
				html+="<td>"+shouxufei+"</td>";
				html+="<td>"+daozhang+"</td>";
				html+="<td>"+row.statusStr+"</td>";
				html+="<td>"+row.user.phone+"</td>";
				html+="<td>"+row.user.typeStr+"</td>";
				html+="<td>"+row.realname+"</td>";
				html+="<td><input type='button' value='通过' onclick='tongguo("+row.id+")'</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {status:$("#sktype option:selected").val()};
	   var url = "<%=BusiConstant.shangjia_tixianlist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=BusiConstant.ht_tongguoout_do.getKey()%>";
		   postdo(url, data, null,null, null);
	   }
   }
   chongzhilist();
   
</script>