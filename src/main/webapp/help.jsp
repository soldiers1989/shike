<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="format-detection" content="telephone=no">
	<script type="text/javascript" src="<%=context%>/jqtable/jquery.min.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.context%>/jqtable/jquery.cookie.js"></script>
	<script type="text/javascript" src="<%=BusiConstant.context%>/common/http.js?ver=<%=BusiConstant.version%>"></script>
    <title>抽奖管理</title>
</head>
<body>
<div id="fanye">
<table>
<tr><th>编号</th> <th>名称</th><th>操作</th></tr>
<tr><td>1</td> <td>抽奖</td><td><input type="button" value="抽奖" onclick="dosomething('cjtest.do')"/></td></tr>
<tr><td>2</td> <td>应收设置</td><td><input type="button" value="应收设置" onclick="dosomething('yingshou.do')"/></td></tr>
<tr><td>3</td> <td>查看数据源</td><td><a href="<%=context%>/druid/index.html" target="_blank">查看</a></td></tr>
<tr><td>4</td> <td><a href="https://www.taodaxiang.com/credit2/" target="_blank">获取淘宝账号信息</a></td><td><input type="text" id="sid" value=""/><input type="button" value="获取" onclick="doother('/user/flash.do')"/></td></tr>
</table>
</div>
</body>
</html>

<script>  
	function dosomething(action) {
		var url = "<%=context%>/baobei/"+action;
		dourl(url);
	}
	
	function doother(action) {		
		var url = "<%=context%>"+action;
		var data = {sid:$("#sid").val()};
		 postdo(url, data, null,null, null);
	}
	function dourl(url){
	   var data = {};	   
	   postdo(url, data, null,null, null);
	}
</script>