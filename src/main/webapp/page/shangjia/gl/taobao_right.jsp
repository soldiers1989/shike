<%@page import="co.kensure.api.ApiUtil"%>
<%@page import="com.kensure.shike.constant.BusiConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
	String context = BusiConstant.shangjiapath;
	String name = BusiConstant.name;
	String id = (String)request.getAttribute("id");
	String itemid = (String)request.getAttribute("itemid");	
%>
                
<link rel="stylesheet" type="text/css" href="<%=context%>/addJPinShop.css">


<div class="gl_right elg-width">
                

<div class="clearfix right_bottom">
    <div class="hxt">
    <a href="http://hws.m.taobao.com/cache/wdesc/5.0/?id=<%=itemid%>" target="_blank">访问这个url，并且把整个页面内容拷贝出来http://hws.m.taobao.com/cache/wdesc/5.0/?id=<%=itemid%></a>
    </div>
    <!--zh_title-->
    <div class="shiy_tl">
    <input type='button' value='保存详情' onclick='tongguo()'/>
        <textarea id="taobao" style="width:1000px;height:600px;"></textarea>
        </div>
    <!--page-->
</div>
<!--huodong-->
<!--right_bottom-->
            </div>

<script>
	
   
   function tongguo(){
	   var data = {id:<%=id%>,body:$("#taobao").val()};
	   var url = "<%=ApiUtil.getUrl("/baobei/savebody.do")%>";
	   postdo(url, data, null,null, null);
   }
 
   
</script>