<%@page import="com.kensure.shike.baobei.model.SKWord"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
	SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
	List<SKWord> words = (List<SKWord>)request.getAttribute("words");
	SKWord word = null;
	if(words != null){
		word = words.get(0);
	}
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
                <a href="javascript:;" class="aui-navBar-item">
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
                        <h2 style="color:#333">搜索流程</h2>
                    </div>
                </div>
                <div class="aui-timeLine b-line">
                    <ul class="aui-timeLine-content">
                        <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>找到宝贝</p>
    					    <p style="margin-top: 10px;">打开手机淘宝APP</p>
                            <p style="margin-top: 10px;">搜索商品：<%=word.getWord() %></p>
                            <p style="margin-top: 10px;">排序方式：<%=word.getOrdermethodStr() %></p>
                         
                        </li>
                        <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>核对宝贝</p>
                            <p style="margin-top: 10px;">验证店铺</p>
                            <p style="margin-top: 10px;">请进入详情页，浏览商品详情不少于3分钟，复制并核对目标宝贝店铺名称</p>
                            <p style="margin-top: 10px;">店铺名称:<input type="text" value="" id="dpmc" placeholder="请输入店铺名称验证宝贝"></p>
                            <p style="margin-top: 10px;">示例：<img src="<%=BusiConstant.shikemobilepath %>/lc/images/dp1.png" alt="" style="width:220px;"></p>
                            <p style="margin-top: 10px;"><input type="button" onclick="checkName()" id="hedui" value="点击核对"></p>
                        </li>
                        <li class="aui-timeLine-content-item">
                            <em class="aui-timeLine-content-icon"></em>
                            <p>加入购物车</p>
                            <p style="margin-top: 10px;">找到宝贝后必须加购物车，被通过后从购物车里找到宝贝下单</p>
                        </li>
             
                    </ul>
                </div>
                
            </section>
            <footer class="aui-footer aui-footer-fixed">
                <div class="aui-artificial" onclick="addgouwuche()" >
                  		加入购物车
                </div>
            </footer>
        </section>
       
       
    </body>
</html>
 
<script>

function dictsucdo(data){
	window.location.href="<%=BusiConstant.shike_scgz.getKey()%>?id=<%=baobei.getId()%>";
}
function addgouwuche(){
   var dpmc = $("#dpmc").val();
   var ds = [{content:dpmc}];
   var data = {id:<%=baobei.getId()%>,status:18,datas:JSON.stringify(ds)};
   var url = "<%=BusiConstant.shike_liucheng_do.getKey()%>";
   postdo(url, data, dictsucdo,null, null);
}

function checkName(){
	   var dpmc = $("#dpmc").val();
	   if(dpmc=="<%=baobei.getDpname()%>"){
		   alert("核对通过");
		   $("#hedui").val("核对通过");	   
	   }else{
		   alert("核对不通过");
	   }
	}

</script>
