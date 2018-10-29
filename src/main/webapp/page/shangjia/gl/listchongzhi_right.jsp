<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
 
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                	<td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>序列</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>充值时间</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>交易号</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>充值金额</strong>
                    </td>
                     <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>商家账号</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>充值状态</strong>
                    </td>
                     <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>操作</strong>
                    </td>
                </tr>
            </tbody></table>
        </div>
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html = "<tr><td height='30'>"+row.id+"</td>";
				html+="<td>"+row.createdTimeStr+"</td>"
				html+="<td>"+row.jiaoyihao+"</td>";
				html+="<td>"+row.jine+"</td>";
				html+="<td>"+row.user.name+"</td>";
				html+="<td>"+row.statusStr+"</td>";
				html+="<td>";
				if(row.status == 1){
					html+="<input type='button' value='通过' onclick='tongguo("+row.id+")'/>";
					html+="&nbsp;<input type='button' value='不通过' onclick='untongguo("+row.id+")'/>";
				}
				html+="</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {};
	   var url = "<%=ApiUtil.getUrl("/inout/chongzhilist.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/inout/tongguo.do")%>";
		   postdo(url, data, null,null, null);
	   }
   }
   
   function untongguo(id){
	   if(confirm('确认不通过？')){
		   var str = window.prompt("请输入拒绝原因","钱没到账");
		   if(str){
			   var data = {id:id,remark:str};
			   var url = "<%=ApiUtil.getUrl("/inout/untongguo.do")%>";
			   postdo(url, data, null,null, null);
		   }
	   }
   }
   chongzhilist();
   
</script>