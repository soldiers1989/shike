<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>


<link rel="stylesheet" type="text/css" href="<%=context%>/base.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/pagination.css">
<link rel="stylesheet" type="text/css" href="<%=context%>/shangjia_index.css">

    <!--shangjia_top-->
    <div class="clearfix contant">
        <div class="main clearfix" style="width:1195px; margin-bottom:30px;overflow: hidden;">
 
 	<jsp:include page="../index_left.jsp" flush="true"/> 
 	<jsp:include page="index_right.jsp" flush="true"/> 

        </div>
    </div>
    