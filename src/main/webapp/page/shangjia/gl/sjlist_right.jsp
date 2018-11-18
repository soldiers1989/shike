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
        <div class="huodong_main">
            <table width="1000" border="1" cellpadding="0" id="listtable" cellspacing="0" bordercolor="#dadada">
                <tbody>
                <tr>
                	<td width="100" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>序列</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>商家姓名</strong>
                    </td>
                    <td width="300" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>手机号</strong>
                    </td>
                    <td width="134" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>qq账号</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>余额</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>注册时间</strong>
                    </td>
                    <td width="200" height="30" valign="middle" bgcolor="#eaeaea">
                        <strong>商家来源</strong>
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
				var source = row.source == null ? '' : row.source;

				var html = "<tr><td height='30'>"+row.id+"</td>";
				html+="<td>"+row.name+"</td>";
				html+="<td>"+row.phone+"</td>";
				html+="<td>"+row.noQq+"</td>";
				html+="<td>"+row.yue+"</td>";
				html+="<td>"+row.createdTimeStr+"</td>";
                html+="<td>"+source+"</td>";
                html+="<td><a onclick='edit("+row.id+")'>修改</a></td>";
				// html+="<td>";
				// html+="</td>";
				html+="</tr>";
				$("#listtable").append(html);
			}
		}
		
	}

   function chongzhilist(flag){
	    if (flag) {
            window.location.reload();
        }

	   var data = {type:2};
	   var url = "<%=BusiConstant.shike_userlist_do.getKey()%>";
	   postdo(url, data, sucdo,null, null);
   }
   
   function tongguo(id){
	   var data = {id:id};
	   var url = "<%=BusiConstant.ht_chongzhitongguo_do.getKey()%>";
	   postdo(url, data, null,null, null);
   }
   chongzhilist();
	
	function edit(id) {
        var source = prompt("请输入商家来源","")
        if (source!=null && source!="") {
            var data = {id:id, source: source};
            var url = "<%=BusiConstant.shike_update_source_do.getKey()%>";
            postdo(url, data, editCallBack,null, null);
        }
    }

    function editCallBack(data) {
        chongzhilist(true);
    }
   
</script>