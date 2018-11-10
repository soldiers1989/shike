<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String status = (String)request.getAttribute("status");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="hxt">
    </div>
    <!--zh_title-->
    <div class="shiy_tl" id="shiyall">
        <a class="<%=status==null?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>">全部<i>|</i></a>
        <a class="<%="0".equalsIgnoreCase(status)?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>?status=0">待审核</a>
        <a class="<%="9".equalsIgnoreCase(status)?"shiy":""%>" href="<%=ApiUtil.getUrl("/gl/dplist")%>?status=9">已审核</a>

    </div>
    <div class="huodong">
        
            <table width="100%" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                	<td width="100" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>序列</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>店铺名</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>连接</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>商家姓名</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>注册时间</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>图片</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>旺旺</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>QQ</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>微信</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>电话</strong>
                    </td>
                     <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>操作</strong>
                    </td>
                </tr>
            </tbody></table>
 
    </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
	function sucdo(data){
		var rows = data.resultData.rows;
		$("#listtable").html("");
		if(rows){
		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html = "<tr><td height='30'>"+row.id+"</td>";
				html+="<td>"+row.name+"</td>";
				html+="<td>"+row.url+"</td>";
				html+="<td>"+row.userName+"</td>";
				html+="<td>"+row.createdTimeStr+"</td>";
				html+="<td><a href='"+row.mjtp+"' target='_blank'><img src='"+row.mjtp+"' width='200'/></td>";
				html+="<td>"+row.wangwang+"</td>";
				html+="<td>"+row.qq+"</td>";
				html+="<td>"+row.weixin+"</td>";
				html+="<td>"+row.phone+"</td>";
				html+="<td><input onclick='tongguo("+row.id+")' value='通过' type='button'>";
				html+="</td>";		
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(){
	   var data = {status:<%=status%>};
	   var url = "<%=ApiUtil.getUrl("/dianpu/list.do")%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   if(confirm('确认通过？')){
		   var data = {id:id};
		   var url = "<%=ApiUtil.getUrl("/dianpu/gongguo.do")%>";
		   postdo(url, data, tongguosuc,null, null);
	   }
   }
   
   function tongguosuc(data){
	   chongzhilist();
   }
   
   chongzhilist();
   
</script>