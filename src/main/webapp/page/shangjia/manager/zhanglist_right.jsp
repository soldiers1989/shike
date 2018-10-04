<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="account">
        <a href="<%=BusiConstant.shangjia_tixian.getKey()%>">账户提现</a>
        <a class="seled" style="margin-left:-5px;">账户明细</a>
    </div>
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>发生时间</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>业务类型</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>金额</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>状态</strong>
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
				var html = "<tr><td height='30'>"+row.createdTimeStr+"</td>";
				html+="<td>"+row.busitypeidStr+"</td>";
				html+="<td>"+row.yue*row.inorout+"</td>";
				html+="<td>"+row.statusStr+"</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {};
	   var url = "<%=BusiConstant.shangjia_zhanglist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   chongzhilist();
   
</script>