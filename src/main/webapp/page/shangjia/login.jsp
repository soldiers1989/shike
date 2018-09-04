<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" flush="true"/> 
<body>
<style>
    .header_top{width: 1075px;}
</style>

<jsp:include page="top1.jsp" flush="true"/> 

<jsp:include page="banner.jsp" flush="true"/> 

<jsp:include page="login_content.jsp" flush="true"/> 

<jsp:include page="footer.jsp" flush="true"/> 

</body>
</html>