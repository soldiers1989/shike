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
        <link href="<%=BusiConstant.shikemobilepath %>/haohuo/css/style4.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/haohuo/js/slider.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/common/js/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>
    <body>
       
        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
             
                <div class="aui-center">
                    <span class="aui-center-title">我的</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                    <i class="icon icon-more"></i>
                </a>
            </header>
            <section class="aui-scrollView">
                <div class="aui-auction-flex">
                    <a href="javascript:;" class="aui-auction-item"></a>
                    <div class="aui-auction-user">
                        <img src="<%=BusiConstant.shikemobilepath %>/haohuo/images/user-004.png" alt="">
                    </div>
                    <a href="javascript:;" class="aui-auction-item aui-auction-item-fr">
                        
                    </a>
                </div>
                <div class="aui-layout-list">
                    <a href="javascript:;" class="aui-layout-list-item">
                        <div class="aui-layout-list-text" id="zhanghuye">0</div>
                        <div>余额</div>
                    </a>
                    <a href="javascript:;" class="aui-layout-list-item">
                        <div class="aui-layout-list-text">0</div>
                        <div>金币</div>
                    </a>
                </div>
                <div class="divHeight"></div>
                <div class="aui-flex b-line">
                    <div class="aui-flex-box">我的账单</div>
                </div>
                <div class="aui-layout-list aui-layout-clear">
                    <a href="<%=BusiConstant.shike_tixian.getKey() %>" class="aui-layout-list-item">
                        <div class="aui-layout-list-text">
                            <img src="<%=BusiConstant.shikemobilepath %>/haohuo/images/icon-head-1.png" alt="">
                        </div>
                        <div>提现</div>
                    </a>         
                    <a href="<%=BusiConstant.shike_mingxi.getKey() %>" class="aui-layout-list-item">
                        <div class="aui-layout-list-text">
                            <img src="<%=BusiConstant.shikemobilepath %>/haohuo/images/icon-head-3.png" alt="">
                        </div>
                        <div>明细</div>
                    </a>
					<a href="<%=BusiConstant.shike_jjdz.getKey() %>" class="aui-layout-list-item">
                        <div class="aui-layout-list-text">
                            <img src="<%=BusiConstant.shikemobilepath %>/haohuo/images/icon-head-2.png" alt="">
                        </div>
                        <div>即将到账</div>
                    </a>
                </div>
                <div class="divHeight"></div>
                <div class="aui-flex b-line">
                    <div class="aui-flex-box">我的工具</div>
                </div>
                <div class="aui-layout-list aui-layout-clear aui-layout-two">
                    <a href="javascript:;" class="aui-layout-list-item b-line">
                        <div class="aui-layout-list-text">
                            <img src="<%=BusiConstant.shikemobilepath %>/haohuo/images/icon-item-003.png" alt="">
                        </div>
                        <div>联系我们</div>
                        
                    </a>
                   <div style="padding-top:20px;">QQ :<%=BusiConstant.gsqq %><br><%=BusiConstant.gsname %></div>
                </div>
            </section>
         <jsp:include page="./footer.jsp" flush="true"/> 
        </section>
       
    </body>
</html>

<script>
function sucdo(data){
	var row = data.resultData.row;
	if(row && row.yue){
		$("#zhanghuye").html(row.yue);
	}	
}
function zhanghuye(){
   var data = {};
   var url = "<%=BusiConstant.userzhyue_do.getKey()%>";
   postdo(url, data, sucdo,null, null);
}
zhanghuye();


</script>
