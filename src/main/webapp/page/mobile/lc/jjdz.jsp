<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
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
        <title><%=BusiConstant.name %> 明细</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=BusiConstant.shikemobilepath %>/lc/css/style2.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>

    <body>

        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed b-line">
                <a href="javascript:history.go(-1);" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">即将到账</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-more"></i>
                </a>
            </header>
           
            <section class="aui-scrollView" >          
              <div class="aui-order-title" id="mingxi">    
                    
    			</div>
            </section>
            
        </section>
       
       
    </body>
</html>
 
<script>

function huodongsucdo(data){
	var rows = data.resultData.rows;
	for(var i=0;i<rows.length;i++){
		var row = rows[i];
		var html = "<div class='aui-order-box'>"
        +"<a class='aui-well-item'>"
        +"    <div class='aui-well-item-bd'>"
        +"        <h3>"+row.busitypeidStr+"</h3>"
        +"   </div>"
        +"    <span class='aui-well-item-fr'>2019-09-09</span>"
        +"</a>"
        +"<p class='aui-order-fl aui-order-time'>￥"+(row.yue*row.inorout)+"</p>"
        +"<p class='aui-order-fl aui-order-address'>"+row.statusStr+"</p>"
        +"</div>";   
		$("#mingxi").append(html);
	}	
}
function huodonglist(){
   var data = {status:0};
   var url = "<%=BusiConstant.shangjia_zhanglist_do.getKey()%>";
   postdo(url, data, huodongsucdo,null, null);
}
huodonglist();


</script>
