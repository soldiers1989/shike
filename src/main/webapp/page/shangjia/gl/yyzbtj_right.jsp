<%@page import="co.kensure.http.RequestUtils"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@page import="co.kensure.api.ApiUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;

	String startCreatedTime = RequestUtils.getStringIfNullBlank(request, "startCreatedTime");
	String endCreatedTime = RequestUtils.getStringIfNullBlank(request, "endCreatedTime");
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

	<div class="clearfix right_bottom">
	    <div class="shiy_ti">
	        <form id="userListchaxun">
	        <span style="float:none;margin-right:5px;">查询时间</span>
	        <input name="startCreatedTime" id="startCreatedTime" type="text" value="<%=startCreatedTime%>">至
	        <input name="endCreatedTime" id="endCreatedTime" type="text" value="<%=endCreatedTime%>" >
	         <input onclick="shangjiatj()" type="button" value="查询">
	        </form>       
	    </div>
	
	    <div class="huodong">
	        <div class="glht_contant">
	        
	            <table border="1" cellpadding="0" id="listtable1" cellspacing="0" bordercolor="#dadada">
	                <thead>
	        
	   		 		</thead>
	             <tbody>
	                
	          	</tbody>
	          	</table>
	          	
	        </div>    
	    </div>
	</div>
</div>
<script type="text/javascript" src="<%=BusiConstant.context%>/page/shangjia/gl/js/yyzbtj.js?ver=<%=BusiConstant.version%>"></script>
<script></script>