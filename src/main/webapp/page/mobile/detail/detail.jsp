<%@page import="com.kensure.shike.baobei.model.SKBaobeiTP"%>
<%@page import="com.kensure.shike.baobei.model.SKBaobei"%>
<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = BusiConstant.shikemobilepath;
	SKBaobei baobei = (SKBaobei)request.getAttribute("baobei");
	String[] details = baobei.getXiangqing().getContent().split("sktag");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%=BusiConstant.name %> 商品详情</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="<%=BusiConstant.shikemobilepath %>/detail/css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/tab.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/layer.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.shikemobilepath %>/detail/js/touchSlider.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
        <script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    </head>

    <body>

  

        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="javascript:history.go(-1);" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                   
                </a>
            </header>
          
            <section class="aui-scrollView">
                <div class="img_gallery" id="commodity">
                    <div class="main_img">
                        <ul>
                       		<%
                       		List<SKBaobeiTP> tplist = baobei.getTplist();
                       		for(SKBaobeiTP tp:tplist){ %>
                            <li>
                                <img src="<%=tp.getUrl()%>" alt="">
                            </li>
                            <%} %>
                        </ul>
                    </div>
                    <div class="img_font">
                    		<%
                       		int size = tplist.size();
                       		for(int i=1;i<=size;i++){ %>
                            <span><%=i %>/<%=size %></span>
                            <%} %>
                    </div>
                </div>
                <div class="aui-product-head aui-footer-flex">
                    
                    <span>￥<%=baobei.getSalePrice() %></span>
                    <em>剩余 <%= baobei.getBbnum()-baobei.getYzj()%>/<%=baobei.getBbnum() %>份</em>
                </div>
                <div class="aui-product-title">
                    <h2><%=baobei.getTitle() %></h2>
                </div>
              
                <div class="aui-tag-info clearfix">
                    <img src="images/icon-rb.png" alt="">
                    <span><%=baobei.getSqnum() %>人 已申请</span>
					<img src="images/icon-rb.png" alt="">
					<span><%=baobei.getYzj() %>人 已中奖</span>
                </div>
               
                <div class="aui-introduce">
                    <div class="aui-tab" data-ydui-tab>
                        <ul class="tab-nav">
                            <li class="tab-nav-item tab-active">
                                <a href="javascript:;">图文详情</a>
                            </li>
                            <li class="tab-nav-item">
                                <a href="javascript:;">问题答疑</a>
                            </li>
                        </ul>
                        <div class="tab-panel">
                            <div class="tab-panel-item tab-active">
                                <div class="tab-item">
                                    <div class="aui-page-img">
                                    <%for(String img:details){ %>
                                        <img src="<%=img %>" alt="">          
                                     <%} %>
                                    </div>                         
                                </div>
                            </div>                    
                        </div>
                    </div>
                </div>
            </section>
            <footer class="aui-footer-button aui-footer-flex aui-footer-fixed">
                <div class="aui-footer-wrap" onclick="history.go(-1);">
                    <i class="icon-shop"></i>
                    <span>返回</span>
                </div>
                <div class="aui-footer-wrap">
                    <i class="icon-car"></i>
                    <span>流程</span>
                </div>
                <div class="aui-footer-group aui-footer-flex1">
                    <div class="aui-footer-flex">
                        <div class="aui-btn aui-btn-gray">
                            <span>3888金币兑换</span>
                        </div>
                        <div class="aui-btn aui-btn-red">
                            <span onclick="shenqin();">立即申请</span>
                        </div>
                    </div>
                </div>
            </footer>
        </section>
       
        <script type="text/javascript">
            $(document).ready(function() {

                $(".main_img").touchSlider({
                    flexible: true,
                    speed: 200,
                    btn_prev: $("#btn_prev"),
                    btn_next: $("#btn_next"),
                    paging: $(".point a"),
                    counter: function(e) {
                        $(".point a").removeClass("on").eq(e.current - 1).addClass("on");
                        $(".img_font span").hide().eq(e.current - 1).show();
                    }
                });

            });
            $(function() {
                $(window).bind("scroll", function() {
                    var sTop = $(window).scrollTop();
                    var sTop = parseInt(sTop);
                    if (sTop >= 44) {
                        if (!$("#scrollBg").is(":visible")) {
                            try {
                                $("#scrollBg").slideDown();
                            } catch (e) {
                                $("#scrollBg").show();
                            }
                        }
                    } else {
                        if ($("#scrollBg").is(":visible")) {
                            try {
                                $("#scrollBg").slideUp();
                            } catch (e) {
                                $("#scrollBg").hide();
                            }
                        }
                    }
                });
            });

        </script>
    </body>
</html>
 
<script>

function dictsucdo(data){
	window.location.href="<%=BusiConstant.shike_gouwuche.getKey()%>?id=<%=baobei.getId()%>";
}
function shenqin(){
   var data = {id:<%=baobei.getId()%>};
   checkuser(); 
   var url = "<%=BusiConstant.shike_shenqing_do.getKey()%>";
   postdo(url, data, dictsucdo,null, null);
}

function checkuser(){
	   var mdtype = $.cookie("mdtype");
	   if(!mdtype || mdtype != 1){
		   window.location.href="<%=BusiConstant.shike_login.getKey()%>";
	   }
	}

</script>
