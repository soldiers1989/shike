<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=BusiConstant.name %></title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/haohuo/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/slider.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>
    <body>
        <section class="aui-flexView">
             <header class="aui-navBar aui-navBar-fixed">
             
                <div class="aui-center">
                    <span class="aui-center-title">我的活动</span>
                </div>

            </header>
            <section class="aui-scrollView">
             
                <div class="n-tabs">
                    <ul class="n-tabContainer" id="auto-id-1509603311057">
                    </ul>
                </div>
                <div class="aui-list-product-box" id="huoping">
                   
                </div>
            </section>
          	<jsp:include page="./footer.jsp" flush="true"/> 
        </section>
    </body>
</html>

<script>
function dictsucdo(data){
	var rows = data.resultData.rows;
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		var html = " <li class=\"n-tabItem\">"
        +"<a href=\"#\" onclick='changetype("+row.code+")' id=\"type"+row.code+"\" ";
        if(i==0){
        	html += "class=\"current\"";
        }      
        html += " >"+row.name+"</a>"
        +"</li>";
		$("#auto-id-1509603311057").append(html);
	}	
}
function dictlist(){
   var data = {typeid:2};
   var url = "<%=BusiConstant.sys_dictlist_do.getKey()%>";
   postdo(url, data, dictsucdo,null, null);
}
dictlist();
function changetype(typecode){
	var clist = $("#auto-id-1509603311057").children();
	for(var i=0;clist.length>i;i++){
		var ad = clist[i].firstChild;
		$("#"+ad.id).removeClass("current");
	}
	$("#type"+typecode).addClass("current");
	huodonglist(typecode);
}


function huodongsucdo(data){
	var rows = data.resultData.rows;
	$("#huoping").html("");
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		var html = "<div class=\"aui-flex aui-flex-lag\">"
        +"<div class=\"aui-aircraft-img\">"
        +"    <img src=\""+row.baobei.zturl+"\" >"
        +"</div>"
        +"<div class=\"aui-flex-box\">"
        +" 	<h2><em>"+row.baobei.title+"</em></h2>"
        +"    <h2>价值：<em>"+row.baobei.salePrice+"</em></h2>"
        +"	<h2>规格：<em>"+row.baobei.guige+"</em></h2>"
        +"</div>"
        +" </div>";
        var metname = "dothing("+row.baobei.id+","+row.status+")";
        if(row.status<21){     	
             var btname = "继续申请";
        	 html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
        }else if(row.status == 51){
             var btname = "提交订单";
        	 html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
        }else if(row.status == 61){
             var btname = "等待收货";
       	 	 html+="<div class='aui-artificial5' >"+btname+"</div>";
       	}else if(row.status == 71){
            var btname = "提交好评";
       	 	html+="<div class='aui-artificial4' onclick='"+metname+"' >"+btname+"</div>";
       	} else if(row.status == 81){
           var btname = "等待返款";
     	 	 html+="<div class='aui-artificial5' >"+btname+"</div>";
     	}     
		$("#huoping").append(html);
	}	
}

function dothing(id,status){
	  if(status == 51){
		  window.location.href="<%=BusiConstant.shike_ddan.getKey()%>?id="+id;
	  }else if(status == 71){
		  window.location.href="<%=BusiConstant.shike_haop.getKey()%>?id="+id;
	  }
}

function huodonglist(status){
   var data = {status:status};
   var url = "<%=BusiConstant.shike_wdhd_do.getKey()%>";
   postdo(url, data, huodongsucdo,null, null);
}
huodonglist(1);



</script>
