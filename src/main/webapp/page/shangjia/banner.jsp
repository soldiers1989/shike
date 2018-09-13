<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>


<div class="yonghu_top">
    <div id="header" class="header">
        <div class="header_main">
            <!--header_top-->
            <div class="header_center">
                    <div class="qn-logo">
                    </div>  
            </div>
            <!--header_center-->
            <!--nav-->
        </div>
   
    </div>
    <!--header-->
</div>

<script>
    var jpSwip = 0;
    setInterval(function () {
        jpSwip++;
        jpSwip = jpSwip == 22 ? 0 : jpSwip;
        $(".jpSwip").css("background-position", "center -" + jpSwip * 45 + "px");
    }, 100);
</script>
