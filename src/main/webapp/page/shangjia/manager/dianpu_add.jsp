<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String shangjiacss = BusiConstant.shangjiacss;
	String name = BusiConstant.name;
%>
                
<link rel="stylesheet" type="text/css" href="<%=shangjiacss%>/zhanghuanquan.css">

<div class="shangjia_right elg-width">
	
	<div class="clearfix acco_center">
            <div class="modify_mian">
                
            
                <!--modify_top-->
                <div class="modify_bottom">
                    <div class="mod_tv" >
                        <span class="mod_cs">店铺首页地址：</span>
                        <input id="shopurl" name="shopurl" type="text" class="nat_ttv" style="width:500px;">      
                    </div>
                   
                    <div>
                        <span class="mod_cs">卖家中心截图：</span><img src="" id="mjtp" width="200"/>
                       <div class="mod_cs" style="width:250px;">  <form id="infoLogoForm2" enctype='multipart/form-data' >
                        	<input id="gzbaobei" name="file" type="file" >
                         </form></div>
                        
                        <span class="mod_cs">点击放大看图</span>
                        <img src="<%=BusiConstant.shangjiapath%>/mjht.jpg" width="200" id="tempimgid"  />
                    </div>
                    
                    <div class="mod_tv" name="paw">
                        <span class="mod_cs">店铺名称：</span><input id="shopname" name="shopname" type="text" class="nat_ttv">
                        <span class="mod_cs">店主旺旺ID：</span><input id="wangwang" name="wangwang" type="text" class="nat_ttv">
                    </div>
                    
                    
                    <div class="mod_tv" name="paw">
                        <span class="mod_cs">负责人QQ：</span><input id="qqid" name="qqid" type="text" class="nat_ttv">
                        <span class="mod_cs">负责人微信：</span><input id="weixinid" name="weixinid" type="text" class="nat_ttv">
                    </div>
                    
                    <div class="mod_tv" name="paw"> 
                        <span class="mod_cs">负责人电话：</span><input id="phone" name="phone" type="text" class="nat_ttv">
                    </div>
                    <!--mod_tv-->
                    <div class="mer_pct">
                        <a href="#" onclick="savedianpu();">提交</a>
                    </div>
                    <!--mer_pct-->
                </div>
                <!--modify_bottom-->
            </div>
            <!--modify_mian-->
        </div>                
</div>
<script>
var flag = true,//状态true为正常的状态,false为放大的状态
        imgH = 137,//图片的高度
        imgW = 200,//图片的宽度
        img = document.getElementById('tempimgid');//图片元素
	img.onclick =  function(){
	   //图片点击事件
	    if(flag){
	        //图片为正常状态,设置图片宽高为现在宽高的2倍
	        flag = false;//把状态设为放大状态
	        img.height = 500;
	        img.width = 800;
	    }else{
	        //图片为放大状态,设置图片宽高为现在宽高的二分之一
	        flag = true;//把状态设为正常状态
	        img.height = imgH;
	        img.width = imgW;
	    }
	
	}

function savedianpu(){
	   var data = {name:$("#shopname").val(),url:$("#shopurl").val(),mjtp:$("#mjtp")[0].src,wangwang:$("#wangwang").val(),qq:$("#qqid").val(),weixin:$("#weixinid").val(),phone:$("#phone").val()};
	   var url = "<%=BusiConstant.shangjia_dianpuadd_do.getKey()%>";
	   postdo(url, data, savesucdo,null, null);
}
function savesucdo(data){
	   location.href = "<%=BusiConstant.shangjia_dianpulist.getKey()%>";
}
 

var uploading1 = false;
$("#gzbaobei").on("change", function(){
    if(uploading1){
        alert("文件正在上传中，请稍候");
        return false;
    }
    $.ajax({
        url: "<%=BusiConstant.shike_addfile_do.getKey()%>",
        type: 'POST',
        cache: false,
        data: new FormData($('#infoLogoForm2')[0]),
        processData: false,
        contentType: false,
        dataType:"json",
        beforeSend: function(){
        	uploading1 = true;
        },
        success : function(data) {
            if (data.type == 'success') {
            	var d = "<%=BusiConstant.context%>"+data.resultData.row
            	logo2 = d;
            	$("#mjtp").attr("src", d );
            } else {
                showError(data.msg);
            }
            uploading1 = false;
        }
    });
});

</script>