<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
	SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=BusiConstant.name %> 试用流程</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>

    <body>

        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed b-line">
                <a href="javascript:history.go(-1);" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">试用流程</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-more"></i>
                </a>
            </header>
            <section class="aui-scrollView">
                <div class="aui-flex aui-flex-lag">
                    <div class="aui-aircraft-img">
                        <img src="<%=baobei.getZturl() %>" alt="">
                    </div>
                    <div class="aui-flex-box">
                    <h2>
                            <em><%=baobei.getTitle() %></em>
                        </h2>
                        <h2>
                            店铺名称：<em><%=baobei.getDpnameS() %></em>
                        </h2>
                        <h2>
                            价格：<em><%=baobei.getSalePrice() %></em>
                        </h2>
                    
                     <h2>
                            规格：<em><%=baobei.getGuige()%></em>
                        </h2>
                    </div>
                   
                </div>
                <div class="divHeight"></div>
                <div class="aui-flex aui-flex-lag">
                    <div class="aui-flex-box">
                        <h2 style="color:#333">收藏关注流程</h2>
                    </div>
                </div>
                <div class="aui-timeLine b-line">
                    <ul class="aui-timeLine-content">
                        <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>找到宝贝</p>
    					    <p style="margin-top: 10px;">打开手机淘宝APP</p>
                            <p style="margin-top: 10px;">购物车中，找到宝贝</p>
                          
                        </li>
                        <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>收藏宝贝</p>
                            <p style="margin-top: 10px;">示例：<img src="<%=BusiConstant.shikemobilepath %>/lc/images/sc1.png" alt="" style="width:220px;"></p>
                            <form id="infoLogoForm1" enctype='multipart/form-data'>
                            <p style="margin-top: 10px;"><input accept="image/*" name="file" id="scbaobei" type="file"/></p>
                            <p style="margin-top: 10px;">收藏：<img src="" id="logo1" alt="" style="width:220px;"></p>
                            </form>
                        </li>
                         <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>关注宝贝</p>
                            <p style="margin-top: 10px;">示例：<img src="<%=BusiConstant.shikemobilepath %>/lc/images/gz1.png" alt="" style="width:220px;"></p>
                            <form id="infoLogoForm2" enctype='multipart/form-data'>
                            <p style="margin-top: 10px;"><input accept="image/*" name="file" id="gzbaobei" type="file"/></p>
                            <p style="margin-top: 10px;">提交：<img src="" id="logo2" alt="" style="width:220px;"></p>
                            </form>
                        </li>
                       
             
                    </ul>
                </div>
                
            </section>
            <footer class="aui-footer aui-footer-fixed">
                <div class="aui-artificial" onclick="add()" >
                  		提交
                </div>
            </footer>
        </section>
       
       
    </body>
</html>
 
<script>
var logo1 = "";
var logo2 = "";
var uploading = false;
$("#scbaobei").on("change", function(){
    if(uploading){
        alert("文件正在上传中，请稍候");
        return false;
    }
    $.ajax({
        url: "<%=BusiConstant.shike_addfile_do.getKey()%>",
        type: 'POST',
        cache: false,
        data: new FormData($('#infoLogoForm1')[0]),
        processData: false,
        contentType: false,
        dataType:"json",
        beforeSend: function(){
            uploading = true;
        },
        success : function(data) {
            if (data.type == 'success') {
            	var d = "<%=BusiConstant.context%>"+data.resultData.row;
            	logo1 = d;
                $("#logo1").attr("src", d );
            } else {
                showError(data.msg);
            }
            uploading = false;
        }
    });
});

var uploading1 = false;
$("#gzbaobei").on("change", function(){
    if(uploading){
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
            	$("#logo2").attr("src", d );
            } else {
                showError(data.msg);
            }
            uploading1 = false;
        }
    });
});

function dictsucdo(data){
	alert("提交成功，等待抽奖");
	window.location.href="<%=BusiConstant.shike_haohuo.getKey()%>?id=<%=baobei.getId()%>";
}
function add(){
   var ds = [{content:logo1,busitype:"sc"},{content:logo2,busitype:"gz"}];
   var data = {id:<%=baobei.getId()%>,status:21,datas:JSON.stringify(ds)};
   var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
   postdo(url, data, dictsucdo,null, null);
}


</script>
