<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String typeid = (String)request.getAttribute("typeid");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="hxt">
    <a href="<%=BusiConstant.shangjia_cmsedit.getKey()%>?typeid=<%=typeid %>" target="_blank">新增</a>
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>标题</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>url</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>排序</strong>
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
				var html = "<tr><td height='30'>"+row.title+"</td>";
				html+="<td>"+row.url+"</td>";
				html+="<td>"+row.disorder+"</td>";
				html+="<td><a href='<%=BusiConstant.shangjia_cmsedit.getKey()%>?typeid=<%=typeid %>&id="+row.id+"' target='_blank'>编辑</a>";
				html+="</td>";		
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {typeid:<%=typeid %>};
	   var url = "<%=BusiConstant.sys_cmslist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   chongzhilist();
   
  
   
</script>