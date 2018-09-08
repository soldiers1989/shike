<%@page import="java.util.List"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" flush="true"/> 
<body>
<%
List<String> list = (List<String>)request.getAttribute("index");
for(String u:list){
%>
<jsp:include page="<%=u%>" flush="true"/> 
<%} %>
</body>
</html>