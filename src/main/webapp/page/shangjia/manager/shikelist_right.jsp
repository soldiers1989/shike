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
 
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="huodong">
        <div class="huodong_main" style="text-align: center">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>下单时间</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>进度</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>淘宝账号</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea" style="text-align: center;">
                        <strong>订单编号</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea" style="text-align: center;">
                        <strong>订单图片</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea" style="text-align: center;">
                        <strong>好评内容</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea" style="text-align: center;">
                        <strong>好评图片</strong>
                    </td>      
                   
                     <td width="200" height="30" valign="middle" bgcolor="#eaeaea" style="text-align: center;">
                        <strong>操作</strong>
                    </td>
                  
                </tr>
            </tbody></table>
        </div>
    </div>
    <!--page-->
</div>

<!--right_bottom-->
            </div>

<script>
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){	
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html = "<tr><td height='30'>"+row.createdTimeStr+"</td>";
				html+="<td>"+row.statusStr+"</td>";
				html+="<td>"+row.noTaobao+"</td>";				
				var jys = row.jylist;
				var jymap = {};
				for(var j=0;j<jys.length;j++){
					var jy = jys[j];
					var key = jy.status+"-"+jy.typeid+"-"+jy.busitype;
					jymap[key] = jy;
				}
				
				
				var ddh612 = "";
				if(jymap["61-2-ddh"]){
					ddh612 =  jymap["61-2-ddh"].content
				}
				var hp613 = "";
				if(jymap["61-3-dd"]){
					hp613 =  jymap["61-3-dd"].content
				}
				
				var hpy812 = "";
				if(jymap["81-2-hpy"]){
					hpy812 =  jymap["81-2-hpy"].content
				}
				var hp813 = "";
				if(jymap["81-3-hp"]){
					hp813 =  jymap["81-3-hp"].content
				}
				
				html+="<td>"+ddh612+"</td>";
				html+="<td><img src='"+hp613 +"'  height='60' width='60'></td>";
				html+="<td>"+hpy812+"</td>";
				html+="<td><img src='"+hp813 +"'  height='60' width='60'></td>";
				if(row.status == 81){
					html+="<td><input type='button' value='同意返款' onclick='fankuan("+row.id+")'</td>";
				}else{
					html+="<td></td>";
				}	
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {id:<%=id%>};
	   var url = "<%=BusiConstant.shike_skqklist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   chongzhilist();
   
   function fankuan(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.shike_fankuan_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   
</script>