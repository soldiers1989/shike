<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="shangjia_right elg-width">
                
<style>

    .btn {
        display: inline-block;
        width: 80px;
        height: 30px;
        background-color: #f7a500;
        border: 1px solid #e87d00;
        border-radius: 2px;
        color: #fff;
        text-align: center;
        line-height: 30px;
        cursor: pointer;
        font-size: 14px;
        margin-left: 20px;
    }

    .btn-red {
        background-color: #ff464e;
    }
</style>
<div style="width: 755px;padding: 0 30px;">
    <h1 style="font-size: 16px; font-weight: normal; padding: 25px 0; border-bottom: 1px dashed #ddd;">
        <span class="btn btn-red" onclick="adddianpu()">绑定店铺</span>
                <span class="btn btn-red" onclick="addshop(2)">购买店铺</span> <em style="font-size: 12px;color: #ff464e;">（绑定店铺已达上限，如仍需添加店铺请点击购买店铺后，联系您的专属对接专员）</em>
    </h1>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="color: #666;line-height: 18px;font-size: 14px;">
        <tbody><tr style="background-color: #f9f9f9;line-height: 30px;">
            <th width="10%">店铺类型</th>
            <th width="20%">店铺信息</th>
            <th width="20%">店铺旺旺/咚咚</th>
            <th width="30%">店铺首页网址</th>
            <th width="20%">添加时间</th>
        </tr>
            <tr style="border-bottom: 1px solid #eff1f0">
                <td style="text-align: center">
                    <p style="width: 100.5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break: break-all">天猫/淘宝</p>
                </td>
                <td style="padding: 10px 0;text-align: center">
                    <p style="width: 126.5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break: break-all">右手大咖</p>
                </td>
                <td style="text-align: center">
                    <p style="width: 151px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break: break-all">右手大咖</p>
                </td>
                <td style="text-align: center">
                    <p style="width: 226.5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break: break-all">https://shop150398614.taobao.com</p>
                </td>
                <td style="text-align: center">
                    <p style="width: 151px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break: break-all">2018/8/29 11:13:56</p>
                </td>
            </tr>
            </tbody></table>
</div>

            </div>



<script>
	function sucdo(data){
		var rows = data.resultData.rows;
		if(rows){
		
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				var html = "<tr><td>"+row.createdTimeStr+"</td>";
				html+="<td>"+row.jiaoyihao+"</td>";
				html+="<td>"+row.jine+"</td>";
				html+="<td>"+row.statusStr+"</td>";
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
   
   function adddianpu(message, callback) {
		message = "绑定店铺"
	    $('#linglamsg').remove();
	    var html = '<div class="tchs" id="linglamsg">' +
	                    '<div style="position:relative;width:100%;height:100%">' +
	                    '<div id="msgbox" class="lila_index" style="position:absolute;top:50%;left:50%;">' +
	                        '<div class="ling">' +
	                            '<strong>试呗</strong> ' +
	                            '<a onclick="$(\'#linglamsg\').remove()" style="cursor: pointer"><img src="//www.meilipa.com/Content/images/xx.jpg" /></a>' +
	                        '</div>' +
	                        '<div class="ling_mian">' +
	                            '<div class="sy_cgt">' + message + '</div>' +
	                            '<div class="sy_cgt">店铺名称：<input name="shopname" id="shopname" value=""></div>' +
	                            '<div class="sy_cgt">店铺链接：<input name="shopurl" id="shopurl" value=""></div>' +
	                            '<a href="javascript:" class="qdingann qdingann_a" >确定</a>' +
	                            '<a href="javascript:" class="qdingann qdingann_b" style="background-color:#999;">取消</a>' +
	                        '</div>' +
	                    '</div>' +
	                '</div>' +
	                '</div>';
	    $('body').append(html);
	    $('#msgbox').css("margin-top", -$('#msgbox').height() / 2);
	    $('#msgbox').css("margin-left", -$('#msgbox').width() / 2);
	    $('.qdingann_a').bind('click', function () {
	        if (callback != null)
	            callback();
	    });
	    $('.qdingann_b').bind('click', function () {
	        $('#linglamsg').remove();
	    });

	}

  
   
</script>