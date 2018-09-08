<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String path = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/base.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/pagination.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/shangjia_index.css">

<div class="clearfix contant">
	<div class="main clearfix" style="width:1195px; margin-bottom:30px;overflow: hidden;">
		<%
		List<String> list = (List<String>)request.getAttribute("bodypage");
		for(String u:list){
		%>
		<jsp:include page="<%=u%>" flush="true"/> 
		<%} %>
	</div>
</div>
    