<%@page import="co.kensure.http.RequestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
if(RequestUtils.isMobileAgent(request)){
	response.sendRedirect("skm/index");
}else{
	response.sendRedirect("page/shangjia/ruzhu/ruzhu.html");
}
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="format-detection" content="telephone=no">
    <title>线上贷</title>
</head>
<body>
</body></html>
