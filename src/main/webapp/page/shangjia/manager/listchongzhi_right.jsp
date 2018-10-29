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
        <a href="<%=BusiConstant.shangjia_chongzhi.getKey()%>">账户充值</a>
        <a class="seled" style="margin-left:-5px;">充值记录</a>
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
                        <strong>充值时间</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>交易号</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>充值金额</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>充值状态</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>描述</strong>
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
				html+="<td>"+row.jiaoyihao+"</td>";
				html+="<td>"+row.jine+"</td>";
				html+="<td>"+row.statusStr+"</td>";
				html+="<td>"+row.remark+"</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {};
	   var url = "<%=BusiConstant.shangjia_chongzhilist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   chongzhilist();
   
</script>