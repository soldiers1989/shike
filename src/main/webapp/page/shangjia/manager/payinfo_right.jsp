<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String id = (String)request.getAttribute("id");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                

<div class="clearfix right_bottom">
    
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>费用名称</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>费用明细</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>小计</strong>
                    </td>
                </tr>
            </tbody></table>
        </div>
        <div>
        <input type="button" value="确认付款" onclick="pay()"/>
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
				var html = "<tr><td>"+row.name+"</td>";
				html+="<td>"+row.detail+"</td>";
				html+="<td>"+row.xiaoji+"</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {id:<%=id%>};
	   var url = "<%=BusiConstant.shangjia_payinfo_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   chongzhilist();

   function pay(){
	   if(window.confirm('你确认要付款吗？')){
		   var data = {id:<%=id%>};
		   var url = "<%=BusiConstant.shangjia_payinfo_do.getKey()%>";
		   postdo(url, data, null,null, null);
        }
   }
   
</script>