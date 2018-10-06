<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.sys.model.SKCMS"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	SKCMS obj = (SKCMS)request.getAttribute("obj");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="contant">

    <!--help_header-->
    <div class="clearfix main">
        
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shangjiacss%>/base1.css">
<link rel="stylesheet" type="text/css" href="<%=BusiConstant.shangjiacss%>/help.css">


        <!--mian_left-->
        <div class="mian_right1">
            <div class="clearfix zhu_ces" id="contentid">
                <div class="rh_z">
                    <%=obj.getTitle() %>
                </div>
             	<%=obj.getContent() %>
            </div>
            <!--zhu_ces-->
        </div>
        <!--mian_right-->
    </div>
    <!--main-->
</div>


<script>
	
function check(index){
	$("#id1").removeClass("seled");
	$("#id2").removeClass("seled");
	$("#id"+index).addClass("seled");
	$("#list1").css("display","none");
	$("#list2").css("display","none");
	$("#list"+index).css("display","block");
}


   
</script>